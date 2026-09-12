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
