# ARCHITECTURE · 系统架构

> 项目：study-l3-v2（团队任务协作工具）
> 产出：补课 Lec 05-ARCH。architect 角色推导，Michael 逐项拍板。
> 依据：docs/design/PRD.md、prisma/schema.prisma、docs/arch/TECH_STACK.md。
> 本文四节，随补课链逐节追加：模块划分 / 分层架构 / 数据流 / 部署拓扑。

## 一、模块划分

### 划分原则
1. 按业务域切，不按技术层切。一个功能的代码集中在一个模块内。
2. 一张表有且只有一个拥有者。拥有 = 唯一写入者。其他模块要改这张表的数据，必须调用拥有者提供的方法。
3. 读不算拥有。跨模块读表不改变归属。
4. 依赖单向，不成环。

### 模块清单

#### 1. users
职责：用户账号实体的唯一写入者与查询源。
拥有表：users
覆盖：US-A01、US-A02
依赖：无

#### 2. auth
职责：注册、登录、登出与会话生命周期。
拥有表：sessions
覆盖：US-A01、US-A02、US-A03
依赖：users（建账号、校验凭据）
决策 1：users 与 auth 拆开，auth 不直接写 users 表，注册时调用 users 建账号。
理由：保住「一表一主」；projects 按邮箱找被邀请人时直接查 users，不绕认证模块；顺 NestJS 惯用结构（AuthModule imports UsersModule）。

#### 3. authz（横切，不拥有表）
职责：把「谁在哪个项目是什么角色」翻译成放行或拒绝，落在 NestJS Guard。
拥有表：无。只读 project_memberships。
覆盖：US-R01
依赖：auth（当前会话）、projects（读角色）
决策 3：authz 独立成模块，不并入 projects。
理由：D3 定权限为安全边界，口径必须集中，加角色改权限只动一处；authz 横切，不属于任何单一业务域。
代价：读 project_memberships 与写 project_memberships 分处两个模块，authz 需 import projects。

#### 4. projects
职责：项目容器 + 成员与角色的唯一写入者。
拥有表：projects、project_memberships
覆盖：US-P01、US-P02、US-P03、US-R02
依赖：users（按邮箱找被邀请人）

#### 5. tasks
职责：任务的创建、分配、状态流转、截止日期、列表与项目内汇总。
拥有表：tasks
覆盖：US-03、US-06、US-07、US-01、US-02a、US-04、US-08
依赖：projects（校验成员身份与角色）、users（assignee 存在性）、authz
决策 5：US-04 项目汇总并入 tasks，不单开 reporting 模块。
理由：汇总数据全部来自 tasks，单开只增加一层调用，不增加边界价值。
备注：本模块覆盖 7 条用户故事，其余五个模块合计 6 条。工作量最重，Lec 10 排期时注意。

#### 6. notifications
职责：站内通知的写入与已读标记。
拥有表：notifications
覆盖：US-02b（P2 延后）
依赖：tasks、users
决策 4：本版保留模块位，标注为空壳，不写实现。
状态：表已建，MVP 内无生产者。唯一通知类型 stuck_task 依赖 US-02b，P2 延后。Lec 13 上 WebSocket 时填充。
理由：写没人调用的代码违反 TECH_STACK「MVP 先跑通，不为以后可能用提前堆」；但表已在 schema 内，架构图不列会造成归属缺口。

### 归属自检
users → users
auth → sessions
projects → projects、project_memberships
tasks → tasks
notifications → notifications
6 张表全部有主。无孤儿表，无一表两主。

### 依赖方向（单向，无环）
auth → users
projects → users
authz → auth、projects
tasks → projects、users、authz
notifications → tasks、users
users 不依赖任何模块，是依赖图的地基。

### 本版范围裁决
- US-05 跨项目总览：本版延后，与 US-02b 口径拉齐（决策 5，D1 范围取舍）。tasks 模块本版不建跨项目查询路径。
- users 表不加 name 列，界面显示 email（决策 2，D2）。PRD 需补澄清注记。
- notifications 模块本版空壳（决策 4）。

### 待定（第 2 段前补齐）
- 决策 6：US-04 第三条验收依赖项目级 deadline，projects 表无此字段。
- 决策 7：已解决。措辞修订见 TECH_STACK.md 扩展点 4。

### 出处
- 六张表与归属：prisma/schema.prisma:25-112
- auth 拥有 sessions（DB session 非 JWT）：TECH_STACK.md:34-36、prisma/schema.prisma:40-51
- authz 落在 Guard：TECH_STACK.md:22、PRD.md:193-199
- 角色按项目划分：PRD.md:173、PRD.md:265、prisma/schema.prisma:65-78
- projects 覆盖 US-P01/P02/P03：PRD.md:213-238；邀请用邮箱 PRD.md:269
- tasks 覆盖状态/截止/汇总：PRD.md:104-107、PRD.md:70、prisma/schema.prisma:80-97
- notifications 覆盖 US-02b：PRD.md:94-101、prisma/schema.prisma:99-112
- 模块依赖方向、「读不算拥有」原则、汇总并入 tasks：推导，无直接出处


## 二、分层架构

### 后端分层（NestJS，以 tasks 模块走通）

层序按 NestJS 请求生命周期排，即请求实际经过的顺序：
Guard → Pipe → Controller → Service → Repository → Prisma
守卫在 Controller 之前执行。被 Guard 拒绝的请求，Controller 方法根本不会被调用。

#### 1. Guard（AuthGuard → AuthzGuard）
负责：会话有效性；项目内角色级放行判定（authz 模块，落在 Guard）。
不做：查业务表、判记录归属、解析请求体。
只能调：authz 模块暴露的能力。

#### 2. Pipe（ValidationPipe + 共享 Zod schema）
负责：请求体的形状与类型校验。这是服务端唯一可信的形状校验点。
不做：业务规则、权限判断。

#### 3. Controller（TasksController）
负责：取参、调本模块 Service、返回 DTO。
不做：业务判断、碰 Prisma、判数据归属。
只能调：本模块 Service。

#### 4. Service（TasksService）
负责：业务规则（状态流转、未认领判定、项目内汇总）；数据级权限判定（这条记录归不归当前用户）。
不做：解析 HTTP、直接写 Prisma 查询、伸手进别的模块的 Repository。
只能调：本模块 Repository；别的模块的 Service（如 ProjectsService 校验成员、UsersService 校验 assignee）。

#### 5. Repository（TasksRepository）
负责：tasks 表的唯一读写出口，对应第一节「一表一主」。
不做：任何业务规则、任何权限判断。
只能调：Prisma。

依赖方向单向不回头。跨模块只走对方 Service，不许直接调对方 Repository。

决策 Q3：Repository 层每个模块都写，不按模块复杂度区分。
理由：一，给「一表一主」一个文件级落点，Lec 8 加 lint 限制跨模块 import 时有具体路径可约束；二，Service 抽离后可脱离数据库单独测试；三，「只在复杂模块写」没有判据，会退化成随意。
代价：users / auth / notifications 三个 Repository 会很薄，基本是转发。
注意：Repository 是语义层约定，不是机械层的墙。别的模块技术上仍可直接注入 Prisma 绕过它。要变成墙需靠 lint 限制 import（Lec 8）。

### 共享层边界（packages/shared）

允许进：
- Zod schema —— 前后端共享一份，写一次两端复用（TECH_STACK.md:15）。
- 由 z.infer 从 Zod schema 推导出的请求/响应类型（TECH_STACK.md:57）。
- 枚举 MemberRole / TaskStatus / NotificationType —— 两端都要渲染和判断。
- 无 IO 的纯常量与纯函数（如状态展示顺序）。

明确不许进：
- Prisma Client / PrismaService —— 会把数据库驱动打进前端 bundle，并把表结构泄露到浏览器。
- 读 env 或做 IO 的代码 —— 前端没有那些环境变量，运行时直接失败。
- React 组件 / NestJS 装饰器 —— 单侧框架依赖，另一侧装不上。
- Prisma 生成的 model 类型 —— 表结构一变前端跟着碎，会拖住 EMC 演进。
- 唯一的授权判定实现 —— 见判据第 4 问。

判据（四问全过才进）：
1. 前后端是不是都真的用它？只有一端用 → 不进。
2. 它有没有运行时依赖（IO / env / 单侧框架）？有 → 不进。
3. 它变的时候，前后端是不是必须同时变？是 → 该进；否则各自维护更省事。
4. 它是不是安全边界的执行点？是 → 规则本身可以共享作为单一信息源，但后端必须独立实现强制，前端那份仅供呈现。绝不允许共享层成为唯一执行点。
第 4 问的由来：权限矩阵能通过前三问（两端都用、无 IO、必须同时变），但「共享规则」与「共享执行」是两件事。前三问只问技术上能不能共用，不问共用后安全边界会不会被削弱。

### 校验与权限的落点

Zod 执行三处，各拦不同的东西：
1. 前端提交前 —— 拦格式错，给即时反馈。UI_DESIGN 要求「阻止提交」，阻止只能发生在前端。
2. 服务端 ValidationPipe —— 拦形状与类型错。这是唯一可信的一道。
3. Service 内业务不变量 —— 如状态流转的合法性。
为什么不能只在一处：只在前端，绕过界面直接打接口就穿了（US-R01 要求强制触发被拒）；只在后端，用户每个错字都要一次往返，且做不到「阻止提交」。

两级权限的界线（决策 Q2）：
- 角色级 → Guard。只看「当前会话 + 路由 + 项目内角色」就能判，数据只需 project_memberships。
- 数据级 → Service。必须先取到那条记录才能判，归属信息在 tasks.assigneeUserId，Guard 阶段还没查库。
- 界线一句话：不查业务表就能判的归 Guard，必须先拿到记录才能判的归 Service。
- 不选「查库 Guard」的理由：同一条记录会被查两遍，且 Guard 里做 IO 会让请求管道变重。

例子 · 执行者尝试修改不属于自己的任务：
1. AuthGuard：会话有效吗？无效 → 未登录处理，重定向登录页。
2. AuthzGuard：他是本项目成员吗？不是 → 权限不足。是执行者 → 放行，因为执行者本来就能更新自己任务的状态。
3. ValidationPipe：请求体形状合法吗？
4. Controller：调 TasksService。
5. TasksService：取任务，比对 assigneeUserId 与当前用户 id。不等 → 拒绝。
拦在第 5 步 Service。Guard 拦不住，它不知道那条任务的 assignee 是谁。

决策（取舍 5，属 D3 权限与安全口径）：
「无权限」与「不存在」合并为同一响应，不区分。
理由：对执行者而言两者语义等价（他只能看自己的任务）；Service 少一次分支；与 PRD 登录失败统一提示同思路。
注意：PRD 对邀请邮箱不存在是分开提示的（内部操作不构成枚举风险）。故本项目两种做法按场景选，不是一条铁律。
落点：本条须回填 PRD 的错误 / 边界规则（规则 64 B 类裁决）。

### 前端分层（Next.js App Router）

1. 路由层（Server Component / layout / page）
负责：路由、登录态重定向、首屏取数、loading.tsx 挂骨架。
不做：业务规则、交互状态。

2. 数据访问层（api client）
负责：唯一发 HTTP 的地方，出入参走 packages/shared 的 Zod schema。
不做：渲染、判权限。

3. 视图组件层（Client Component）
负责：渲染、交互、按角色条件渲染入口。
不做：直接 fetch、直接碰后端。

4. UI 基础层（shadcn/ui + Tailwind）
负责：无业务语义的原子组件。
不做：任何业务判断。

三态落点：
- 骨架屏：路由层用 loading.tsx / Suspense 承载，骨架本体是视图组件。
- 空态：视图组件层，必须按角色分支 —— 负责人给行动引导，执行者只说明（UI_DESIGN.md:139-140）。
- 错误态 / 权限态：视图组件层的局部错误块，不崩成空白页；权限态只显示「权限不足」，不带被访问数据。
- 单实体界面（任务详情）无空态，缺数据按错误态或权限态处理。
- 前端三态是呈现，不是安全边界。真正的拒绝在后端 Guard 与 Service。

决策 Q1：前端角色来源 —— 进入项目时后端在项目上下文里一并返回角色。
三条硬约束，缺一不可：
1. 前端缓存的角色仅用于渲染入口，不构成授权。
2. 每个受限接口的授权由后端 Guard 独立查 project_memberships 判定，不信任前端传来的任何角色信息。
3. 角色随每次进入项目时的后端响应取得，仅在本次页面上下文内使用，不做跨页面长缓存；角色未确认前，角色专属入口不渲染（UI_DESIGN.md:138 加载态要求）。
第 3 条的由来：US-R02（P0）要求角色改后立即生效、不等重新登录。拿陈旧缓存渲染入口会与该验收冲突。
未覆盖：角色变更后主动通知前端刷新，属 Lec 13，已进 BACKLOG。

### 命名规范（三层，边界在 Prisma 的 @map 上）

- 数据库列名：snake_case（如 assignee_user_id、created_at）。仅存在于 Postgres 内部。
- Prisma 字段名与 TypeScript：camelCase（如 assigneeUserId、createdAt）。写代码用这一套。
- API 请求与响应字段：camelCase。与 Prisma 和共享层一致，全链路不做命名转换。
依据：prisma/schema.prisma 全表使用 @map / @@map，snake_case 被封闭在数据库层。
后果：字段名不一致（前端 userId / 后端 user_id）这类联调错误在本项目结构上不会发生。协议 9 一致性报告在字段名这一层由 schema 写法保证。

### 共享类型推导方式（取舍 4）
决策：类型由 z.infer 从 Zod schema 推导，不手写 DTO。
理由：手写等于两份真相（schema 一份、类型一份），改一处忘一处，违反单一信息源。
代价：z.infer 的类型报错信息可读性差，必要时给关键类型起别名缓解。
落点：本条是 05-类型（共享类型）那节的直接依据。

### 本节待定
- Q1 未覆盖项：角色变更主动通知前端刷新（Lec 13）。
- 「一表一主」的机械层强制：lint 限制跨模块 import Repository（Lec 8）。
- UI_DESIGN 页 3 的跨项目总览措辞待补澄清注记（US-05 本版延后，页 3 保留，页面数仍为 10）。

### 出处
- 分层依据模块划分：本文第一节。
- Zod 前后端共享一份、packages/shared 承载共享类型：TECH_STACK.md:15、TECH_STACK.md:57。
- authz 落在 Guard：TECH_STACK.md:22。
- 受保护路由与登录态重定向：TECH_STACK.md:18。
- 角色改后即时生效：TECH_STACK.md:36 引 PRD US-R02。
- 加载态角色专属入口在权限确认后再显示：UI_DESIGN.md:138。
- 空态按角色分支：UI_DESIGN.md:139-140。
- 组件栈 Tailwind + shadcn/ui：UI_DESIGN.md:165-166。
- assignee 字段与列名映射：prisma/schema.prisma:85。
- 全表 @map / @@map：prisma/schema.prisma:28-112。
- NestJS 请求生命周期层序、跨模块只走 Service、共享层判据四问、命名三层的推论：推导，无直接出处。


## 三、数据流

> 性质：纸上走查。目的是验证第一、二节的设计能不能走通，不是测试方案。真跑是 Lec 14 tester 的活。
> 口径：按项目主人裁决 T1-T7 与决策 A-E 写。第二节原文尚未回写，差异见本节末「本节暴露的问题」。
> 浏览器与后端服务之间经过什么，见第四节部署拓扑。本节从请求进入 NestJS 开始。
> 退回结果只写性质。状态码与路径字符串属 API 契约，本节不定。

### 走查公共约定

- 层序：Guard → Pipe → Controller → Service → Repository → Prisma（本文第二节）。
- 被 Guard 拒绝时后面各层都不执行。Pipe 拒绝后 Controller 不执行（文件外知识）。
- 「无权限」与「不存在」返回同一响应（本文第二节取舍 5、PRD.md:311）。
- 路径参数不做格式校验，非法值落入鉴权失败（T3）。查询参数走 Zod 管道。
- 非法路径 id 的容错（决策 B）：Guard 查库前先把路径 id 转为数字，转不动即视为查不到，按「权限不足」退回。这是容错，不是格式校验，不改变 T3。
- 会话固定 30 天，不续期，纯读请求不写 sessions（T4、PRD.md:160、PRD.md:271）。
- 角色传递（决策 A）：AuthzGuard 查到的项目内角色放入请求上下文，供 Service 取用。Service 不再重复查询 project_memberships。此约定是 Guard 与 Service 之间的显性契约，实现时须有具体落点。

### R2 读路径：执行者查看一条任务的详情

输入：路径里的项目 id 与任务 id，加请求携带的会话凭据（凭据载体属 API 契约）。无请求体。

#### R2-1 AuthGuard 确认会话
- 层：Guard
- 校验：无
- 鉴权：用凭据哈希查 sessions.token_hash（prisma/schema.prisma:43），要求记录存在且 expires_at 晚于当前时间（:44）。查到后得到当前用户 id。不写回，不续期（T4）。
- 退回：凭据缺失、查不到、已过期，均在本步退回「未登录」。
- 表：读 sessions

#### R2-2 AuthzGuard 确认项目成员身份
- 层：Guard
- 校验：无。路径项目 id 不做格式校验（T3），但先转数字，转不动视为查不到（决策 B）。
- 鉴权：用「当前用户 id + 路径项目 id」查 project_memberships（prisma/schema.prisma:65-78，唯一键 :76）。有记录即放行，负责人与执行者都能看任务详情（PRD.md:181）。查到的角色放入请求上下文（决策 A）。
- 退回：查不到记录（含项目不存在、项目 id 非法），本步退回「权限不足」。
- 表：读 project_memberships

#### R2-3 Zod 管道
- 层：Pipe（T1 项目自写管道）
- 校验：无。无请求体。本路径不设查询参数（假设，以 API 契约为准）。路径 id 不经过管道（T3）。
- 鉴权：无
- 退回：无
- 表：无

#### R2-4 TasksController 取参调 Service
- 层：Controller
- 校验：无
- 鉴权：无。将路径项目 id、任务 id、当前用户 id 与请求上下文中的角色传给 TasksService。
- 退回：无
- 表：无

#### R2-5 取任务记录
- 层：Service → Repository → Prisma
- 校验：无。路径任务 id 不做格式校验（T3），转数字规则同 R2-2。
- 鉴权：无。本步只取数据。
- 退回：按任务 id 查不到（含任务 id 非法），结果交回 Service，由 Service 退回「权限不足」（PRD.md:311）。
- 表：读 tasks

#### R2-6 比对任务所属项目（T2 硬要求）
- 层：Service
- 校验：无
- 鉴权：取记录的 projectId（prisma/schema.prisma:82）与路径项目 id 比对，不相等即拒绝。防的是：用自己有权限的项目 id，去访问别的项目的任务 id。
- 退回：不相等时本步退回「权限不足」，不带任何任务数据。
- 表：无新读

#### R2-7 判断任务归属
- 层：Service
- 校验：无
- 鉴权：从请求上下文取角色（决策 A）。角色为执行者时，比对 assigneeUserId（prisma/schema.prisma:85）与当前用户 id；该字段为空（任务未分配）也算不相等。负责人不做此比对（PRD.md:181）。
- 退回：不相等时本步退回「权限不足」（本文第二节）。
- 表：无新读

#### R2-8 组装负责人显示信息
- 层：Service
- 校验：无
- 鉴权：无。一律显示 email（PRD.md:290 注记 4）。
- 取数方式未定：走 UsersService 还是 Prisma 关联查询，留给 05-API 定（决策 C）。
- 退回：无
- 表：读 users

#### R2-9 返回详情
- 层：Controller
- 校验：无
- 鉴权：无。返回任务详情 DTO，类型由共享 Zod schema 推导（本文第二节）。
- 退回：无
- 表：无

小结：四道拦截。会话拦在 R2-1，成员身份拦在 R2-2，所属项目拦在 R2-6，任务归属拦在 R2-7。全程只读，不写任何表。

### W1 写路径：负责人创建任务并分配给执行者

输入：路径里的项目 id，加会话凭据。请求体含标题、描述、可空 assignee、可空截止日期（prisma/schema.prisma:83-88）。

#### W1-1 AuthGuard 确认会话
- 层：Guard
- 校验：无
- 鉴权：同 R2-1。本路径写 tasks，但同样不写 sessions（T4）。
- 退回：凭据缺失、查不到、已过期，均在本步退回「未登录」。
- 表：读 sessions

#### W1-2 AuthzGuard 确认是本项目负责人
- 层：Guard
- 校验：无。路径项目 id 转数字规则同 R2-2（决策 B）。
- 鉴权：同 R2-2 查成员记录，并要求角色为负责人。创建与分配任务仅负责人可做（PRD.md:182-183、PRD.md:266），设置截止日期亦然（PRD.md:185），本步一并覆盖。角色放入请求上下文（决策 A）。
- 退回：查不到记录退回「权限不足」；角色为执行者同样退回「权限不足」。
- 表：读 project_memberships

#### W1-3 Zod 管道校验请求体
- 层：Pipe（T1 项目自写管道，内部调用共享 Zod schema）
- 校验：请求体形状与类型。标题、描述为字符串（prisma/schema.prisma:83-84），assignee 为整数或空（:85），截止日期为时间或空（:88）。本路径不设查询参数（假设，以 API 契约为准）。路径 id 不经过管道（T3）。
- 鉴权：无。assignee 是否本项目成员不在此判：该判断需读请求体内容，按 T6 归 Service。
- 退回：形状或类型不符，本步退回「参数不合法」。
- 表：无

#### W1-4 TasksController 取参调 Service
- 层：Controller
- 校验：无
- 鉴权：无。将路径项目 id、校验过的请求体、当前用户 id 传给 TasksService。
- 退回：无
- 表：无

#### W1-5 校验 assignee 是本项目成员（T5）
- 层：Service，跨模块调 ProjectsService（本文第二节：跨模块只走对方 Service）
- 校验：业务规则。assignee 非空时必须是路径项目的成员，仅为系统用户不足。允许分配给负责人自己（T5）。assignee 为空则跳过，任务进入未认领状态（PRD.md:255）。
- 鉴权：无。角色已在 W1-2 判过。
- 退回：assignee 不是本项目成员（含该用户不存在）时，本步退回「参数不合法」（决策 E）。理由：项目成员名单本就是负责人可见信息，不构成枚举风险，与 PRD 对邀请邮箱的处理同思路。
- 表：读 project_memberships

#### W1-6 写入任务
- 层：Service → Repository → Prisma
- 校验：无
- 鉴权：T2 的项目比对针对「已取到的记录」，创建时无旧记录可比。
- 规则（决策 D，明文）：新任务的 projectId 只从路径参数取，禁止从请求体取。理由：W1-2 的角色鉴权依据的是路径项目 id，若写入时改用请求体中的 projectId，鉴权对象与写入对象将不一致，负责人可借此在自己无权限的项目中创建任务。鉴权用哪个 id 判，写入就必须用哪个 id。
- 其他：status 用默认值 not_started，statusUpdatedAt 用默认值当前时间（prisma/schema.prisma:86-87）。
- 退回：写入出错属内部错误，不暴露内部信息（PRD.md:199 同一思路）。对外形态属 API 契约。
- 表：写 tasks。不写 notifications，该模块本版为空壳（本文第一节决策 4）。

#### W1-7 返回新任务
- 层：Controller
- 校验：无
- 鉴权：无。返回新建任务 DTO。
- 退回：无
- 表：无

小结：角色拦在 W1-2（Guard），形状拦在 W1-3（Pipe），assignee 成员身份拦在 W1-5（Service）。唯一写的表是 W1-6 的 tasks。

### 本节裁决汇总

- T1 服务端校验用项目自写 Zod 管道（实现 PipeTransform 调共享 schema），不用内置 ValidationPipe，不引第三方集成库。
- T2 任务类接口路由嵌套项目 id；Service 取到记录后必须比对 projectId 与路径项目 id。
- T3 路径参数不做格式校验，非法值落入鉴权失败；查询参数走 Zod 管道。两类分开处理。
- T4 会话固定 30 天，不滑动续期，纯读不写 sessions。
- T5 assignee 必须是本项目成员，允许分配给负责人自己。
- 决策 A 角色经请求上下文由 Guard 传给 Service，Service 不重复查询。
- 决策 B 路径 id 查库前转数字，转不动视为查不到。
- 决策 C R2-8 保留，取数方式留给 05-API。
- 决策 D projectId 只从路径取，禁止从请求体取。
- 决策 E W1-5 退回「参数不合法」。

### 本节暴露的问题

以下为走查过程中发现、第二节文字尚未跟上的差异。回写动作见结课清单。

1. 第二节写 Guard「只能调 authz 模块暴露的能力」，但 AuthGuard 读的 sessions 表归 auth 模块所有，authz 职责仅写「只读 project_memberships」。按现措辞 AuthGuard 读 sessions 无合规出口。措辞待修订。
2. 第二节仍写 ValidationPipe，与 T1 不符，待回写。
3. 第二节写 Pipe 只管「请求体」，未提查询参数，也未写路径参数不经过管道，与 T3 不符，待回写。
4. 第二节「两级权限的界线」仍为旧措辞，且理由「Guard 里做 IO 会让请求管道变重」与走查不符（两个 Guard 本就读表），待按 T6 回写。
5. 第二节仍把决策 6 列为待定，而 PRD.md:295-299 已裁决本版延后，待回写。
6. 第二节写 tasks 依赖 users 用于「assignee 存在性」、举例用 UsersService 校验 assignee；按 T5 实际走 ProjectsService 的成员校验，措辞待回写。

以下问题不属本节范围，已进 BACKLOG：任务标题描述的必填与空值规则未定义；请求体多余字段剔除或拒绝未定义；sessions.token_hash 无索引；过期会话清理未定义。

### 出处
- 层序、跨模块只走 Service、取舍 5 合并响应：本文第二节。
- 会话表结构与 token_hash、expires_at：prisma/schema.prisma:40-51。
- 成员表与唯一键：prisma/schema.prisma:65-78。
- tasks 字段与默认值：prisma/schema.prisma:82-88。
- 角色可见范围：PRD.md:181-185、PRD.md:266。
- 未认领任务：PRD.md:255。
- 显示 email：PRD.md:290。
- 合并响应与不暴露内部错误：PRD.md:311、PRD.md:199。
- 会话有效期：PRD.md:160、PRD.md:271。
- Pipe 拒绝后 Controller 不执行、路径参数原始类型、Prisma 类型不符抛异常：文件外知识（NestJS / Prisma 框架行为）。
- 决策 A-E、T1-T7 的具体裁决：Michael 本节拍板，无文件外出处。
