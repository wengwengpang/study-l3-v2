# PENDING-REWRITES · 待执行回写清单

> 产出：补课 05-ARCH 第三个窗口（第四节部署拓扑）。
> 执行时机：05-API 开课第一件事，执行完再开 05-API 正文。
> 执行完毕后本文件删除或清空，不要留着当历史。

## 执行铁律（三条，违反会打偏）

1. 不许按行号改。改一处后面行号全漂，24 处连改必打偏。
   一律按内容匹配改，每处一条独立命令。
2. 一处一改一验。改完立刻验证那一处，确认了再下一处。
3. 没有权限护栏兜底。settings.json 的 Edit(docs/arch/**) 是 ask 档，
   但 sed / heredoc 走 Bash 不走 Edit 工具，不会弹窗。方向写错没人拦。

## 执行顺序（按风险排，先事实后措辞）

第一批 · 第一节（10 处）
  T13 依赖图口径定义新增、authz 依赖行、依赖方向清单 authz 行、
  出处行、删 tasks→authz 两处（:51 行末 + :77）、
  决策 6 待定块、本版范围裁决追加一行、
  auth 职责补 AuthGuard（:25）、authz 职责精确成 AuthzGuard（:33）

第二批 · 第二节（10 处）
  Guard 块整块（:109-112）、ValidationPipe 两处（:114 / :179）、
  Pipe 校验范围（:115）、:166 措辞、两级权限界线（:170-174）、
  tasks 依赖行理由（:51 已在第一批）、只能调那行（:126）、
  依赖图指路句（:133）、例子缺 T2 一步（:176-182）、重定向措辞（:177）

第三批 · 第三节（2 处）
  :259「第二节原文尚未回写」已过时
  :421 把决策 6 位置标成第二节，实际在第一节

第四批 · TECH_STACK.md（2 处）
  :29 按 T23 加澄清句
  :30 Nginx 三职责改两职责（T9）

## 全部改完后的验证

  grep -c "^## " docs/arch/ARCHITECTURE.md        应为 4
  grep -n "ValidationPipe" docs/arch/ARCHITECTURE.md   应为空
  grep -n "authz" docs/arch/ARCHITECTURE.md       逐条核对无残留旧口径
  grep -n "静态托管" docs/arch/TECH_STACK.md       应为空

## 以下为 architect 第二轮产出的回写文本原文
===== 区块二：第二节回写文本（七处）=====

第 1 处 · Guard 块（T12）

原文 ARCHITECTURE.md:109-112：

#### 1. Guard（AuthGuard → AuthzGuard）
负责：会话有效性；项目内角色级放行判定（authz 模块，落在 Guard）。
不做：查业务表、判记录归属、解析请求体。
只能调：authz 模块暴露的能力。

改为：

#### 1. Guard（AuthGuard → AuthzGuard）
AuthGuard 属 auth 模块，负责会话有效性，只能调 auth 模块暴露的能力读 sessions，并把当前用户 id 放入请求上下文。
AuthzGuard 属 authz 模块，负责项目内角色级放行判定，只能调 authz 模块暴露的能力读 project_memberships（经 ProjectsService，表仍归 projects），并把角色放入请求上下文（第三节决策 A）。
两个 Guard 都不做：读 tasks 等业务记录、判记录归属、解析请求体。

说明：
- 改为覆盖了整个原块，原 :112 那个罩住全块的"只能调"已拆进两句，各自限定。
- "当前用户 id 放入请求上下文"依据 T13 和本文:280。
- 原 :111"查业务表"改成"读 tasks 等业务记录"。原因是两个 Guard 本来就读表，原措辞和走查对不上。这一改同时牵动第 4 处。

第 2 处 · ValidationPipe 措辞（T1）

本处只改 :114 和 :179。:166 的 ValidationPipe 和第 3 处的范围问题在同一行，并到第 3 处一起改，避免两段改为互相覆盖。

原文 ARCHITECTURE.md:114：

#### 2. Pipe（ValidationPipe + 共享 Zod schema）

改为：

#### 2. Pipe（项目自写 Zod 管道 + 共享 Zod schema）

原文 ARCHITECTURE.md:179：

3. ValidationPipe：请求体形状合法吗？

改为：

3. Zod 管道：请求体形状合法吗？

第 3 处 · Pipe 校验范围（T3），含 :166 的 ValidationPipe 措辞（T1）

原文 ARCHITECTURE.md:115：

负责：请求体的形状与类型校验。这是服务端唯一可信的形状校验点。

改为：

负责：请求体与查询参数的形状与类型校验。这是服务端唯一可信的形状校验点。
不经过管道：路径参数。路径参数不做格式校验，非法值落入鉴权失败（第三节 T3）；查库前转数字的容错见第三节决策 B。

原文 ARCHITECTURE.md:166：

2. 服务端 ValidationPipe —— 拦形状与类型错。这是唯一可信的一道。

改为：

2. 服务端 Zod 管道（项目自写，实现 PipeTransform 调共享 schema，不用内置 ValidationPipe，第三节 T1）—— 拦请求体与查询参数的形状与类型错。这是唯一可信的一道。

第 4 处 · 两级权限的界线（T6）【待核 T6 原文】

T6 原文不在我这次读的文件里。以下是根据本文:364"该判断需读请求体内容，按 T6 归 Service"和 :420 倒推出来的草稿。请您拿 T6 原文核对，不一致以原文为准。

原文 ARCHITECTURE.md:170-174：

两级权限的界线（决策 Q2）：
- 角色级 → Guard。只看「当前会话 + 路由 + 项目内角色」就能判，数据只需 project_memberships。
- 数据级 → Service。必须先取到那条记录才能判，归属信息在 tasks.assigneeUserId，Guard 阶段还没查库。
- 界线一句话：不查业务表就能判的归 Guard，必须先拿到记录才能判的归 Service。
- 不选「查库 Guard」的理由：同一条记录会被查两遍，且 Guard 里做 IO 会让请求管道变重。

改为（草稿，待核 T6）：

两级权限的界线（决策 Q2，按第三节 T6 回写）：
- 角色级 → Guard。只凭「会话凭据 + 路径项目 id」就能判。AuthGuard 读 sessions，AuthzGuard 读 project_memberships。
- 数据级 → Service。要读请求体内容才能判的（如 assignee 是否本项目成员），或者要先取到业务记录才能判的（如 tasks.projectId、tasks.assigneeUserId），都归 Service。
- 界线一句话：只凭会话和路径就能判的归 Guard；要读请求体或业务记录才能判的归 Service。
- 界线不按「查不查库」划：两个 Guard 本来就读表。不在 Guard 里取业务记录的理由：同一条记录会被 Guard 和 Service 各查一遍。

说明：删掉了假理由"Guard 里做 IO 会让请求管道变重"。保留的"同一条记录查两遍"来自原文，T6 有没有保留这条理由，请一并核对。

第 5 处 · 决策 6 仍列待定（位置实际在第一节）

原文 ARCHITECTURE.md:86-88：

### 待定（第 2 段前补齐）
- 决策 6：US-04 第三条验收依赖项目级 deadline，projects 表无此字段。
- 决策 7：已解决。措辞修订见 TECH_STACK.md 扩展点 4。

改为：

### 待定
- 无。决策 6 已裁决，见上方「本版范围裁决」；决策 7 已解决，措辞修订见 TECH_STACK.md 扩展点 4。

同时在 ARCHITECTURE.md:84 之后追加一行（归入"本版范围裁决"）：

- US-04 第三条验收（依赖项目级 deadline）：本版延后（决策 6，PRD.md:295-299）。

说明：
- PRD.md:295-299 是转引自本文:421，本轮没读 PRD 核实。
- projects 表以后加不加 deadline 字段，我没写。那是取舍，归主人（D2、D7）。
- 第三节 :421 把位置记成"第二节"，是标错了，需另行更正。

第 6 处 · tasks 依赖 users 的理由、assignee 校验路径（T5）

原文 ARCHITECTURE.md:51：

依赖：projects（校验成员身份与角色）、users（assignee 存在性）、authz

改为：

依赖：projects（校验 assignee 是本项目成员，第三节 T5）、users（负责人显示 email，第三节 R2-8；取数方式待 05-API 决策 C）、authz

原文 ARCHITECTURE.md:126：

只能调：本模块 Repository；别的模块的 Service（如 ProjectsService 校验成员、UsersService 校验 assignee）。

改为：

只能调：本模块 Repository；别的模块的 Service（如 ProjectsService 校验 assignee 是本项目成员，第三节 T5）。

说明：
- :51 行在第一节，因为和 :126 同属 T5 口径，放在这里一起给。
- projects 那一项原写"校验成员身份与角色"。按决策 A，当前用户的角色由 AuthzGuard 经请求上下文传入，TasksService 不再查。所以一并改成 assignee 成员校验。这一改超出了任务原文点名的范围，请确认。
- tasks → users 这条边保留，符合 T13"依赖清单不改"。但它的成立有前提：决策 C 选 UsersService。如果 05-API 定成 Prisma 关联查询，就不是 Service 调 Service，按 T13 口径要复核。
- 行末的 authz 牵涉区块三的冲突，本处原样保留。

第 7 处 · 依赖图口径定义（T13）

我建议主体写在第一节，第二节只加一句指路。理由有三：
1. 依赖图本身在第一节 ARCHITECTURE.md:73-79，定义要和它放在一起，读图的人才能当场看到口径。
2. T13 裁决原文就写了"第一节须补一句定义"。
3. 第二节 :133"依赖方向单向不回头"讲的是层间调用方向，是另一张图。定义放第二节容易让人把两者混淆，所以只在那里指一句。

在 ARCHITECTURE.md:73 标题下新增：

口径：本图只记业务依赖，即一个模块的代码调用另一模块暴露的 Service。Guard 等横切件挂在路由上，挂载关系不计入本图（T13）：某模块路由挂上 AuthGuard / AuthzGuard，不因此形成对 auth / authz 的依赖。横切件自身调用别的模块 Service 照常计入，如 authz → projects。

原文 ARCHITECTURE.md:133：

依赖方向单向不回头。跨模块只走对方 Service，不许直接调对方 Repository。

改为：

依赖方向单向不回头。跨模块只走对方 Service，不许直接调对方 Repository。此处指层间调用方向；模块之间的依赖图及其口径见第一节「依赖方向」。

七处以外顺带发现的问题，只报，不给改写文本：
- ARCHITECTURE.md:176-182 的例子少了第三节 T2 的"比对任务所属项目"一步（对应 R2-6）。
- :177 写"重定向登录页"，这是前端行为，不是后端 Guard 做的事。

===== 区块二结束 =====

---

===== 区块三：第一节回写文本（T13）=====

第 1 处 · authz 模块依赖行

原文 ARCHITECTURE.md:36：

依赖：auth（当前会话）、projects（读角色）

改为：

依赖：projects（经 ProjectsService 读 project_memberships 取角色）。不依赖 auth：当前用户 id 经请求上下文取得（同第三节决策 A 的传递方式）。

第 2 处 · 依赖方向清单中的 authz 行

原文 ARCHITECTURE.md:76：

authz → auth、projects

改为：

authz → projects

第 3 处 · 依赖图口径定义

在 ARCHITECTURE.md:73 下新增。文本同区块二第 7 处，这里不重复。

第 4 处 · 出处行

原文 ARCHITECTURE.md:98：

- 模块依赖方向、「读不算拥有」原则、汇总并入 tasks：推导，无直接出处

改为：

- 「读不算拥有」原则、汇总并入 tasks：推导，无直接出处
- 模块依赖方向：推导；依赖图只记业务依赖的口径、authz 不依赖 auth：T13 主人拍板

T13 牵出的冲突（只报不改，请您裁决）

- 冲突点：ARCHITECTURE.md:51 和 :77 都记着 tasks → authz。
- 按第 3 处的口径，这条边只是 tasks 路由挂了 AuthzGuard。TasksService 不调 authz，角色从请求上下文拿（ARCHITECTURE.md:271 决策 A）。
- projects 路由同样挂 AuthzGuard，:75 却没记 projects → authz。
- 结果是："依赖清单不改"和 T13 的定义在这一条边上互相矛盾。

候选方案：
- A. 删掉 tasks → authz（:51 行末的 authz，以及 :77）。与 T13 口径完全一致，但会动依赖清单。
- B. 保留，在定义里给 tasks 开例外。清单不动，但同一种挂载关系 projects 不记、tasks 记，口径不自洽。
- C. 保留，把定义改成"挂载关系也计入"。清单不动，但冲突 3（tasks 缺 auth）和冲突 4（projects 与 authz 成环）会重新成立，等于推翻 T13。

推荐 A。T13 已经把"Guard 不计入"定为口径，只删这一条边就能让 tasks 和 projects 对齐。authz 被哪些路由挂载，可以用第二节路由层面的说明表达，不需要占依赖图的边。

T12 顺带牵动第一节（不属 T13，供参考）

- ARCHITECTURE.md:25 auth 职责"注册、登录、登出与会话生命周期"：可以补上"会话有效性校验（AuthGuard，第二节）"，和 T12"AuthGuard 属 auth 模块"对齐。
- ARCHITECTURE.md:33 authz 职责"落在 NestJS Guard"：可以精确成"落在 AuthzGuard"，免得读成两个 Guard 都归 authz。

===== 区块三结束 =====
