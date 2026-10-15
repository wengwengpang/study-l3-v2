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
职责：注册、登录、登出与会话生命周期；会话有效性校验（AuthGuard，见第二节）。
拥有表：sessions
覆盖：US-A01、US-A02、US-A03
依赖：users（建账号、校验凭据）
决策 1：users 与 auth 拆开，auth 不直接写 users 表，注册时调用 users 建账号。
理由：保住「一表一主」；projects 按邮箱找被邀请人时直接查 users，不绕认证模块；顺 NestJS 惯用结构（AuthModule imports UsersModule）。

#### 3. authz（横切，不拥有表）
职责：把「谁在哪个项目是什么角色」翻译成放行或拒绝，落在 AuthzGuard。会话有效性不归本模块，归 auth 的 AuthGuard（T12）。
拥有表：无。只读 project_memberships。
覆盖：US-R01
依赖：projects（经 ProjectsService 读 project_memberships 取角色）。不依赖 auth：当前用户 id 经请求上下文取得（同第三节决策 A 的传递方式）。
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
依赖：projects（校验 assignee 是本项目成员，第三节 T5）、users（负责人显示 email，第三节 R2-8；取数方式待 05-API 决策 C）
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
口径：本图只记业务依赖，即一个模块的代码调用另一模块暴露的 Service。Guard 等横切件挂在路由上，挂载关系不计入本图（T13）：某模块路由挂上 AuthGuard / AuthzGuard，不因此形成对 auth / authz 的依赖。横切件自身调用别的模块 Service 照常计入，如 authz → projects。

auth → users
projects → users
authz → projects
tasks → projects、users
notifications → tasks、users
users 不依赖任何模块，是依赖图的地基。

### 本版范围裁决
- US-05 跨项目总览：本版延后，与 US-02b 口径拉齐（决策 5，D1 范围取舍）。tasks 模块本版不建跨项目查询路径。
- users 表不加 name 列，界面显示 email（决策 2，D2）。PRD 需补澄清注记。
- notifications 模块本版空壳（决策 4）。
- US-04 第三条验收（依赖项目级 deadline）：本版延后（决策 6，PRD.md:295-299）。

### 待定
- 无。决策 6 已裁决，见上方「本版范围裁决」；决策 7 已解决，措辞修订见 TECH_STACK.md 扩展点 4。

### 出处
- 六张表与归属：prisma/schema.prisma:25-112
- auth 拥有 sessions（DB session 非 JWT）：TECH_STACK.md:34-36、prisma/schema.prisma:40-51
- authz 落在 Guard：TECH_STACK.md:22、PRD.md:193-199
- 角色按项目划分：PRD.md:173、PRD.md:265、prisma/schema.prisma:65-78
- projects 覆盖 US-P01/P02/P03：PRD.md:213-238；邀请用邮箱 PRD.md:269
- tasks 覆盖状态/截止/汇总：PRD.md:104-107、PRD.md:70、prisma/schema.prisma:80-97
- notifications 覆盖 US-02b：PRD.md:94-101、prisma/schema.prisma:99-112
- 「读不算拥有」原则、汇总并入 tasks：推导，无直接出处
- 模块依赖方向：推导；依赖图只记业务依赖的口径、authz 不依赖 auth：T13 主人拍板


## 二、分层架构

### 后端分层（NestJS，以 tasks 模块走通）

层序按 NestJS 请求生命周期排，即请求实际经过的顺序：
Guard → Pipe → Controller → Service → Repository → Prisma
守卫在 Controller 之前执行。被 Guard 拒绝的请求，Controller 方法根本不会被调用。
出错另有一个统一出口，不在上面这条调用链里：全局异常过滤器，见下方第 6 条。任何一层出的错，都由它收成同一形状再发出（API-17、API-23）。

#### 1. Guard（AuthGuard → AuthzGuard）
AuthGuard 属 auth 模块，负责会话有效性，只能调 auth 模块暴露的能力读 sessions，并把当前用户 id 放入请求上下文。
AuthzGuard 属 authz 模块，负责项目内角色级放行判定，只能调 authz 模块暴露的能力读 project_memberships（经 ProjectsService，表仍归 projects），并把角色放入请求上下文（第三节决策 A）。
两个 Guard 都不做：读 tasks 等业务记录、判记录归属、解析请求体。

#### 2. Pipe（项目自写 Zod 管道 + 共享 Zod schema）
负责：请求体与查询参数的形状与类型校验。这是服务端唯一可信的形状校验点。
不经过管道：路径参数。路径参数不做格式校验，非法值落入鉴权失败（第三节 T3）；查库前转数字的容错见第三节决策 B。
不做：业务规则、权限判断。

#### 3. Controller（TasksController）
负责：取参、调本模块 Service、返回 DTO。
不做：业务判断、碰 Prisma、判数据归属。
只能调：本模块 Service。

#### 4. Service（TasksService）
负责：业务规则（状态流转、未认领判定、项目内汇总）；数据级权限判定（这条记录归不归当前用户）。
不做：解析 HTTP、直接写 Prisma 查询、伸手进别的模块的 Repository。
只能调：本模块 Repository；别的模块的 Service（如 ProjectsService 校验 assignee 是本项目成员，第三节 T5）。

#### 5. Repository（TasksRepository）
负责：tasks 表的唯一读写出口，对应第一节「一表一主」。
不做：任何业务规则、任何权限判断。
只能调：Prisma。

#### 6. Exception Filter（全局异常过滤器）
负责：所有接口出错的唯一出口。按 API 契约第一节的映射把退回性质翻成状态码，收成 RFC 9457 形状；401 时补 WWW-Authenticate（API-20）；每次出错生成一个 instance 编号，同一编号写进服务端日志（API-26）。
不做：决定退回什么性质。性质由出错的那一层定，本层只翻译。
接法：Guard、Pipe、Service 出错时抛退回性质，不直接写状态码。Guard 拒绝时必须抛错，不得只返回 false，否则框架固定回 403。框架自带的退回保留标准码，只改形状（API-14）。认不出的错误一律按内部错误处理，不暴露堆栈（API-17）。
注册：只注册一处，挂在全局。跨站请求伪造检查排在中间件与 Guard 之前，被拒的请求只有全局过滤器接得到。
位置：错误类型与过滤器放在后端一个横切目录，名字建后端骨架时定（API-23）。

依赖方向单向不回头。跨模块只走对方 Service，不许直接调对方 Repository。此处指层间调用方向；模块之间的依赖图及其口径见第一节「依赖方向」。

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
2. 服务端 Zod 管道（项目自写，实现 PipeTransform 调共享 schema，不用内置 ValidationPipe，第三节 T1）—— 拦请求体与查询参数的形状与类型错。这是唯一可信的一道。
3. Service 内业务不变量 —— 如状态流转的合法性。
为什么不能只在一处：只在前端，绕过界面直接打接口就穿了（US-R01 要求强制触发被拒）；只在后端，用户每个错字都要一次往返，且做不到「阻止提交」。

两级权限的界线（决策 Q2，按第三节 T6 回写）：
- 角色级 → Guard。只凭「会话凭据 + 路径项目 id」就能判。AuthGuard 读 sessions，AuthzGuard 读 project_memberships。
- 数据级 → Service。要读请求体内容才能判的（如 assignee 是否本项目成员），或者要先取到业务记录才能判的（如 tasks.projectId、tasks.assigneeUserId），都归 Service。
- 界线一句话：只凭会话和路径就能判的归 Guard；要读请求体或业务记录才能判的归 Service。
- 界线不按「查不查库」划：两个 Guard 本来就读表。不在 Guard 里取业务记录的理由：同一条记录会被 Guard 和 Service 各查一遍。

例子 · 执行者尝试修改不属于自己的任务：
1. AuthGuard：会话有效吗？无效 → 退回「未登录」。跳转登录页是前端收到该响应后的行为，不由 Guard 执行。
2. AuthzGuard：他是本项目成员吗？不是 → 看不见。是执行者 → 放行，因为执行者本来就能更新自己任务的状态。
3. Zod 管道：请求体形状合法吗？
4. Controller：调 TasksService。
5. TasksService：取任务，先比对记录的 projectId 与路径项目 id（第三节 T2）。不等 → 看不见。
6. TasksService：再比对 assigneeUserId 与当前用户 id（第三节 R2-7）。不等 → 看不见。
拦在第 5、6 步 Service。Guard 拦不住，它既不知道那条任务属于哪个项目，也不知道 assignee 是谁。

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
本版不在 Next.js 写 Route Handler，接口都在 NestJS；将来要写，不得用 /api 前缀（API-7）。

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
- 单实体界面（任务详情）无空态。任务不存在、不属于自己按权限态处理（PRD 错误 / 边界规则回填，API-4）；网络或服务出错按错误态处理。
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
- API 请求与响应字段、查询参数名：camelCase。与 Prisma 和共享层一致，全链路不做命名转换。
依据：prisma/schema.prisma 全表使用 @map / @@map，snake_case 被封闭在数据库层。
偏离：主参考 Zalando 要求字段名与查询参数名用 snake_case（第 118、130 条）。本项目保留 camelCase，理由登记在 docs/arch/STANDARDS.md「偏离登记」（API-22）。
后果：字段名不一致（前端 userId / 后端 user_id）这类联调错误在本项目结构上不会发生。协议 9 一致性报告在字段名这一层由 schema 写法保证。

### 共享类型推导方式（取舍 4）
决策：类型由 z.infer 从 Zod schema 推导，不手写 DTO。
理由：手写等于两份真相（schema 一份、类型一份），改一处忘一处，违反单一信息源。
代价：z.infer 的类型报错信息可读性差，必要时给关键类型起别名缓解。
落点：本条是 05-类型（共享类型）那节的直接依据。同时也是 API_CONTRACT 的依据——契约文档只写接口层与全局约定，不写字段本体（API-1）。

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
- Guard 返回 false 时框架回 403、中间件与 Guard 抛的错都走异常层、跨站请求伪造检查排在 Guard 之前且只有全局过滤器接得到：NestJS 官方文档 Guards、Exception filters、CSRF 三页，2026-10-15 核。


## 三、数据流

> 性质：纸上走查。目的是验证第一、二节的设计能不能走通，不是测试方案。真跑是 Lec 14 tester 的活。
> 口径：按项目主人裁决 T1-T7 与决策 A-E 写。第一、二节原文已按本节口径回写完毕（05-ARCH 第四窗口执行），原差异记录保留在本节末「本节暴露的问题」。
> 浏览器与后端服务之间经过什么，见第四节部署拓扑。本节从请求进入 NestJS 开始。
> 退回结果只写性质。状态码与路径字符串属 API 契约，本节不定。

### 走查公共约定

- 层序：Guard → Pipe → Controller → Service → Repository → Prisma（本文第二节）。
- 被 Guard 拒绝时后面各层都不执行。Pipe 拒绝后 Controller 不执行（文件外知识）。
- 「无权限」与「不存在」返回同一响应（本文第二节取舍 5、PRD.md:311）。
- 「看不见」与「不许做」是两种退回性质（API-21）：「看不见」是查不到，或不让对方知道它存在；「不许做」是看得见但动作不许做。界面上两者都显示「权限不足」（API-4）。各对应哪个状态码属 API 契约。
- 路径参数不做格式校验，非法值落入鉴权失败（T3）。查询参数走 Zod 管道。
- 非法路径 id 的容错（决策 B）：Guard 查库前先把路径 id 转为数字，转不动即视为查不到，按「看不见」退回。这是容错，不是格式校验，不改变 T3。
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
- 退回：查不到记录（含项目不存在、项目 id 非法），本步退回「看不见」。
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
- 退回：按任务 id 查不到（含任务 id 非法），结果交回 Service，由 Service 退回「看不见」（PRD.md:311）。
- 表：读 tasks

#### R2-6 比对任务所属项目（T2 硬要求）
- 层：Service
- 校验：无
- 鉴权：取记录的 projectId（prisma/schema.prisma:82）与路径项目 id 比对，不相等即拒绝。防的是：用自己有权限的项目 id，去访问别的项目的任务 id。
- 退回：不相等时本步退回「看不见」，不带任何任务数据。
- 表：无新读

#### R2-7 判断任务归属
- 层：Service
- 校验：无
- 鉴权：从请求上下文取角色（决策 A）。角色为执行者时，比对 assigneeUserId（prisma/schema.prisma:85）与当前用户 id；该字段为空（任务未分配）也算不相等。负责人不做此比对（PRD.md:181）。
- 退回：不相等时本步退回「看不见」（本文第二节）。
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
- 退回：查不到记录退回「看不见」；角色为执行者退回「不许做」。
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
- T6 两级权限界线：只用「会话 + 路径参数 + project_memberships」能判的归 Guard；需读业务表记录或读请求体内容才能判的归 Service。
- T7 决策 6（US-04 第三条验收依赖项目级 deadline）已裁决本版延后，依据 PRD.md:295-299。
- 决策 A 角色经请求上下文由 Guard 传给 Service，Service 不重复查询。
- 决策 B 路径 id 查库前转数字，转不动视为查不到。
- 决策 C R2-8 保留，取数方式留给 05-API。
- 决策 D projectId 只从路径取，禁止从请求体取。
- 决策 E W1-5 退回「参数不合法」。

### 本节暴露的问题

> 状态：以下 1-6 条已于 05-ARCH 第四窗口全部回写完毕，原文保留作为演进记录，不再是待办。
> 更正：第 5 条说「第二节仍把决策 6 列为待定」，位置记错。该待定块实际在第一节。

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

## 四、部署拓扑

▎ 性质：只讲拓扑结构。compose 文件和 Nginx 配置怎么写属 Lec 9，本节不写。
▎ 口径：按项目主人裁决 T8-T23 写。主拓扑以生产为准（T11），本地差异另列清单。
▎ 衔接：第三节从请求进入 NestJS 开始走查（本文:260）。本节补上浏览器到 NestJS 之间经过什么。
▎ 环境变量与密钥不在本节，见 ENV_DESIGN（T18）。ENV_DESIGN 须反向指回本节。
▎ 端口数值和路径前缀字符串本节不定。前缀以 05-API 的 API 契约为准（T14）。

生产拓扑总图

[浏览器]
  |  公网，仅 80/443
  v
== 宿主机（单 VPS）==================================================
  |
  +--> [nginx 容器] 反向代理 + TLS 终止
          ^ 挂载：宿主机上的 TLS 证书
          |
          +-- 根路径 ------> [frontend 容器] Next.js 服务进程（SSR + 静态资源）
          |                        |
          |                        | SSR 取数：容器内网直连，不经 nginx
          |                        v
          +-- API 前缀 ----> [backend 容器] NestJS
                                   |
                                   v
                             [postgres 容器]
                                   |
                                   +== 挂载：数据卷（数据库数据目录）

  容器内网：四个容器互通。除 nginx 的 80/443 外，不向宿主机外暴露端口。
====================================================================

图外说明（T19）：图上只画本版组件。将来的接入点只在这里用文字注明，均非本版已定选型。
- Redis：接在 backend 的内网一侧，替换会话存储的实现（TECH_STACK.md:39-42、:54）。
- WebSocket：接入时要核对 nginx 的分流能不能承载长连接（TECH_STACK.md:44-47；分流影响为推导）。
- 定时任务（如过期会话清理）：接入形态未定（推导，无直接出处）。

容器职责清单

1. nginx
   - 负责：对外唯一入口。终止 TLS，按路径前缀把请求转给 frontend 或 backend（T9、T14）。
   - 不做：不托管静态资源（T9），不做鉴权判定，不连数据库（后两条为推导）。
2. frontend
   - 负责：运行 Next.js 服务进程，承担 SSR 和服务端重定向，静态资源也由它发出（T8、T9）。
   - 不做：不连数据库（本文:149），不做权威授权判定（本文:213、:218）。
3. backend
   - 负责：运行 NestJS 全部业务模块和两个 Guard（本文第一、二节）。它是唯一连数据库的服务（推导）。
   - 不做：不终止 TLS，不直接对公网暴露端口（T16），启动时不自动执行数据库迁移（T21）。
4. postgres
   - 负责：持久化六张表，数据落在数据卷（T22）。
   - 不做：生产环境不向宿主机暴露端口（T10）。

网络与端口

- 对外暴露：只有 nginx 的 80 和 443（T16）。80 端口承载什么行为属 Lec 9 配置，本节不定。
- 只在容器内网：frontend、backend、postgres 的端口（T10、T16）。
- 内网里的访问方向（推导，依据本文第二节分层）：
  - nginx 访问 frontend。
  - nginx 访问 backend。
  - frontend 访问 backend（仅 SSR 取数，T15）。
  - backend 访问 postgres。
  - frontend 不访问 postgres。
- TLS 在 nginx 终止。nginx 到 frontend、backend 这一段在容器内网里走，不再加密（推导，TLS 终止的直接含义）。

请求路径

路径一：浏览器访问
1. 浏览器用 HTTPS 访问公网域名，到宿主机 443，进入 nginx。
2. nginx 终止 TLS。
3. nginx 看路径前缀分流（T14）。
   - 根路径转给 frontend。
   - API 前缀转给 backend。
4. 页面和静态资源由 frontend 返回（T9）。页面渲染要取数时，走路径二。
5. API 请求进入 NestJS，从 AuthGuard 开始，后续见第三节。
6. 响应原路返回，由 nginx 加密后发回浏览器。
- 浏览器侧用相对路径（/api/...），不写域名（API-13；T15 原写公网后端地址）。

路径二：服务端渲染取数
1. 浏览器请求页面，经路径一第 1-3 步到达 frontend。
2. frontend 服务端代码用内网后端地址直连 backend。不回 nginx，不走公网（T15）。
3. 浏览器带来的会话凭据，不会自动跟着这次服务端请求走。frontend 必须手工转发（T15）。凭据载体属 API 契约（本文:275）。
4. backend 对这次请求的处理和浏览器直连完全一样：从 AuthGuard 开始，不因为请求来自内网就放宽鉴权（本文:218）。
5. 已知代价：服务端渲染要配后端的内网地址；浏览器侧用相对路径，不另配（API-13；T15 原写两套地址）。变量名见 ENV_DESIGN（T18）。

数据持久化

- postgres 的数据目录挂数据卷，容器重建数据不丢（T22）。
- TLS 证书放在宿主机，挂载进 nginx 容器（T20）。签发与续期留 Lec 15。理由：引入签发组件属 D4 技术选型。
- frontend、backend 不挂数据卷。会话存在 PostgreSQL（TECH_STACK.md:34-36），这两个服务不在本地落状态（推导）。
- 数据库迁移是人工触发的独立步骤，不随容器启动自动执行（T21）。
  - 理由：迁移不可逆，CLAUDE.md 第三层 D5 要求喊主人并双重确认。藏进容器启动就绕过了 D5。
- 备份方案本节不定，进 BACKLOG，留 Lec 15 灾备（T22）。
- 显式记录（T22）： DECISIONS.md:41 ADR-DB-002 的后果写的是"恢复误删需靠备份或迁移"。备份方案未定前，这条恢复路径暂无落地方案。
  - 数据卷只防容器重建，不防误删，也不防宿主机磁盘损坏（推导）。
  - 本版上线后如果发生误删，没有已定的恢复手段。

本地与生产的差异清单

只列拓扑层面的差异。环境变量差异见 ENV_DESIGN（T18）。

1. 前后端在哪跑：生产在容器里。本地日常在宿主机上直接跑，只有数据库进容器（T17）。
2. Nginx：生产有。本地日常没有。本地完整四容器配置有（T17）。
3. TLS：生产启用。本地不启用（T20）。
4. 数据库端口：生产不暴露。开发环境暴露到宿主机（T10）。
5. 前后端端口：生产不暴露。开发环境暴露（T16）。本地日常形态下，前后端本来就直接监听宿主机端口（推导）。
6. SSR 取数地址：生产是容器内网里的 backend。本地日常指向宿主机上的后端进程（推导，T15 在本地的对应）。
7. 上线前验证：本地用完整四容器配置跑一次（T17）。配置写法属 Lec 9。
8. 一致性口径：镜像与运行时一致，配置按环境不同（T23）。第 4、5 条的端口差异属"配置不同"，不违反 TECH_STACK.md:29 的"环境一致"。
9. 本地同源：本地开发由 Next.js rewrites 把 /api 转给本地后端，浏览器只访问前端端口，与生产同源，路径形状同生产（API-12、API-6）。只在开发环境打开（T23）。Set-Cookie 与 Sec-Fetch-Site 经转发是否原样，Lec 9 实测。

本节裁决汇总

- T8 四个容器：Nginx、前端（Next.js 服务进程）、后端（NestJS）、PostgreSQL。
- T9 Nginx 只做反向代理和 TLS 终止，不托管静态资源。
- T10 数据库端口：开发暴露到宿主机，生产不暴露。
- T11 主拓扑按生产画一套，另附本地与生产的差异清单。
- T12 AuthGuard 属 auth、读 sessions；AuthzGuard 属 authz、读 project_memberships。归属不变（回写第二节）。
- T13 依赖图只记业务依赖，Guard 等横切件不计入。authz 不再依赖 auth，authz 依赖 projects 保留（回写第一节）。
- T14 Nginx 同域名按路径前缀分流：根路径到前端，API 前缀到后端。
- T15 SSR 取数走容器内网直连后端。代价是两套后端地址，加上手工转发会话凭据。
- T16 生产只暴露 Nginx 的 80/443。开发额外暴露前后端端口。
- T17 本地日常只有数据库进容器，另留完整四容器配置，上线前验证一次。
- T18 本节只写拓扑差异。环境变量与密钥归 ENV_DESIGN，两份文件互相指路。
- T19 图上不画将来的组件，只在文字注明接入点，并标"非本版已定选型"。
- T20 TLS 证书从宿主机挂载进 Nginx。签发续期留 Lec 15。本地不启用 TLS。
- T21 数据库迁移人工触发，不随容器启动执行。
- T22 画出数据卷。备份进 BACKLOG 留 Lec 15。显式记录 ADR-DB-002 恢复前提暂无落地方案。
- T23 TECH_STACK.md:29"环境一致"读作镜像与运行时一致、配置按环境不同。
- T24 删掉依赖图里 tasks → authz 这条边。TasksService 不调 authz，该边仅因路由挂 AuthzGuard 而存在，按 T13 口径不计入。
- T25 tasks 依赖行两处理由改写：projects 改为「校验 assignee 是本项目成员」（T5），users 改为「负责人显示 email」（R2-8）。原措辞与第三节走查对不上。
- T27 architect 顺带报出的四处一并回写，不进 BACKLOG：例子块缺 T2 比对项目一步、重定向措辞属前端行为、第一节 auth 职责补 AuthGuard、第一节 authz 职责精确成 AuthzGuard。
- T26 不在本序列。该编号拍的是课程规则决定（规则 69 追加段），不是本项目架构裁决，已落在 docs/COURSE_RULES.md。此处仅作编号去向登记。

本节暴露的问题

> 状态（05-ARCH 第四窗口核定）：第 1、2、8 条已完成——第 1、2 条的 TECH_STACK 回写与第 8 条的第三节同步，均于本窗口 24 处回写中执行完毕。
> 第 3-7 条未完，各有去向：第 3 条本地不同源（BACKLOG 23）、第 4 条 Nginx 前缀保留（BACKLOG 24，指向 05-API）、第 5 条人工迁移流程（BACKLOG 25）、第 6 条 ADR-DB-002 恢复前提（BACKLOG 22，留 Lec 15）、第 7 条 SSR 转发凭据（待 05-API 定凭据载体）。
> 第 8 条原文引用了第三节旧措辞「尚未回写」，保留不改：该句是演进记录，不是待办。
> 状态（05-API 第二窗口）：第 4 条规则已定，见 API-6（docs/arch/API_CONTRACT.md「本节裁决汇总」）；Nginx 配置写法留 Lec 9。第 3 条规则已定，见 API-12，Lec 9 实测与配置。第 7 条载体已定，见 API-8：服务端渲染把浏览器带来的 Cookie 原样转发。

1. TECH_STACK.md:30 写 Nginx 负责"静态托管"，和 T9 冲突。T23 只覆盖 :29，:30 的回写尚未指派。按 D8 只报不改，以谁为准待主人确认。
2. TECH_STACK.md:29 要按 T23 加一句澄清，回写文本本轮未要求出。
3. 本地日常形态没有 Nginx，浏览器分别访问前端端口和后端端口，两者不同源。这种形态下跨源请求怎么放行、会话凭据怎么带，都没定义。按 T18 分别牵涉 ENV_DESIGN、API 契约和 Lec 9（推导，待确认）。
4. Nginx 转发 API 请求时保不保留前缀，要和三处对齐：后端路由前缀、SSR 内网地址的写法（推导）。由 05-API 与 Lec 9 一起定。
5. 人工迁移的具体流程没定义：谁执行、在哪执行、和上线怎么排先后。落在哪节课待主人定，执行时走 D5 双重确认。
6. ADR-DB-002 的恢复前提暂无落地方案（T22）。备份条目进 BACKLOG，编号待主人落。
7. SSR 手工转发凭据要以凭据载体为前提，而载体属 API 契约还没定（本文:275）。转发细节待 05-API。
8. 第二节有七处回写、第一节有 authz 依赖行回写，见本轮配套回写文本。回写完后，第三节 :259"第二节原文尚未回写"就过时了，要同步。

出处

- 第三节衔接和"本节从请求进入 NestJS 开始"：本文:260。
- 状态码与路径字符串属 API 契约：本文:261。凭据载体属 API 契约：本文:275。
- 单 VPS + Docker Compose、"环境一致"：TECH_STACK.md:29。
- Nginx 原定职责（与 T9 冲突）：TECH_STACK.md:30。
- Next.js SSR、受保护路由：TECH_STACK.md:18。
- Prisma 不进前端：本文:149。前端不是安全边界：本文:213、:218。
- 会话存 PostgreSQL：TECH_STACK.md:34-36。
- Redis 留接口：TECH_STACK.md:39-42、:54。WebSocket 留 Lec 13：TECH_STACK.md:44-47。
- ADR-DB-002"恢复误删需靠备份或迁移"：DECISIONS.md:41。转引自主人裁决 T22，本轮没读该文件核实。
- D5 不可逆操作双重确认、MVP 硬删除：CLAUDE.md 第三层 A D5、第二层 E。本轮没读该文件，行号未核。
- T8-T23 的具体裁决：Michael 本节拍板，无文件出处。
- 以下为推导，无直接出处：
  - TLS 终止后内网段不加密。
  - backend 是唯一连数据库的服务。
  - frontend、backend 不挂数据卷。
  - 内网访问方向。
  - 本地日常形态的端口与 SSR 地址。
  - 本地不同源问题。
  - 前缀一致性问题。
  - WebSocket 与定时任务的接入点描述。
