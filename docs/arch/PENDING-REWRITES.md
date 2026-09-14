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

# PENDING-REWRITES 补丁包 · 05-ARCH 第三窗口结课后补

## 一、这份补丁是什么

原 PENDING-REWRITES.md 由两半拼成：前半执行清单（老师写）、后半回写文本（architect 产）。
两半没做覆盖核对就交了出去，导致清单里有 10 处只有「要改」没有「改成什么」。
本补丁补齐那 10 处，并修正清单本身的三个缺陷。

修正一：处数由 24 改为 23。
  原清单把 ARCHITECTURE.md:51 算了两次（第一批删 authz、第二批改理由）。
  这两个动作落在同一行且方向不同，必须合并为一次改。合并后少一个动作。

修正二：architect 原文有三段作废，见第四节。照原样执行会与后续裁决撞车。

修正三：末尾验证命令有一条是错的，见第六节。原来那条会误判失败。

本补丁与原文件的关系：叠加。原文件的执行铁律不变，回写文本除第四节列出的三段外全部有效。

## 二、覆盖核对表（23 处，逐条标状态）

状态说明：
  [A] = architect 原文已有定稿文本，照用
  [B] = 本补丁新补文本，见第三节

第一节 ARCHITECTURE.md（10 处）
 1. :25   auth 职责补 AuthGuard                          [B] 见 B-1
 2. :33   authz 职责精确成 AuthzGuard                    [B] 见 B-2
 3. :36   authz 依赖行                                   [A] 区块三第 1 处
 4. :51   tasks 依赖行（T24 删 authz + T25 改理由，合并）[B] 见 B-3
 5. :73   依赖图口径定义新增                             [A] 区块二第 7 处
 6. :76   依赖方向清单 authz 行                          [A] 区块三第 2 处
 7. :77   依赖方向清单 tasks 行                          [B] 见 B-4
 8. :84   本版范围裁决追加一行（决策 6）                 [A] 区块二第 5 处
 9. :86-88 待定块                                        [A] 区块二第 5 处
10. :98   出处行                                         [A] 区块三第 4 处

第二节 ARCHITECTURE.md（8 处）
11. :109-112 Guard 块整块                                [A] 区块二第 1 处
12. :114  Pipe 小节标题                                  [A] 区块二第 2 处
13. :115  Pipe 负责行（校验范围）                        [A] 区块二第 3 处
14. :126  Service 只能调那行                             [A] 区块二第 6 处
15. :133  依赖图指路句                                   [A] 区块二第 7 处
16. :166  Zod 三处落点第 2 条                            [A] 区块二第 3 处
17. :170-174 两级权限界线                                [A] 区块二第 4 处，草稿已转定稿，见第四节作废三
18. :176-182 例子块（合并三个动作）                      [B] 见 B-5

第三节 ARCHITECTURE.md（3 处）
19. :259  口径行「第二节原文尚未回写」已过时             [B] 见 B-6
20. 「本节暴露的问题」标题下加状态行（含 :421 位置更正） [B] 见 B-7
21. 裁决汇总补 T6、T7 两条                               [B] 见 B-8

TECH_STACK.md（2 处）
22. :29   「环境一致」按 T23 加澄清                       [B] 见 B-9
23. :30   Nginx 三职责改两职责（T9）                      [B] 见 B-10

小计：[A] 13 处，[B] 10 处，合计 23 处。

## 三、新补的 10 处文本

### B-1 · ARCHITECTURE.md:25 auth 职责（T27）

原文：
职责：注册、登录、登出与会话生命周期。

改为：
职责：注册、登录、登出与会话生命周期；会话有效性校验（AuthGuard，见第二节）。

依据：T12 定 AuthGuard 属 auth 模块。原职责行没提这件事，读的人会以为两个 Guard 都归 authz。

### B-2 · ARCHITECTURE.md:33 authz 职责（T27）

原文：
职责：把「谁在哪个项目是什么角色」翻译成放行或拒绝，落在 NestJS Guard。

改为：
职责：把「谁在哪个项目是什么角色」翻译成放行或拒绝，落在 AuthzGuard。会话有效性不归本模块，归 auth 的 AuthGuard（T12）。

依据：原文「落在 NestJS Guard」笼统，T12 拆开后须指明是哪个 Guard。

### B-3 · ARCHITECTURE.md:51 tasks 依赖行（T24 + T25 合并）

这一处是 T24 与 T25 两个动作的合并，必须一次改完。

原文：
依赖：projects（校验成员身份与角色）、users（assignee 存在性）、authz

改为：
依赖：projects（校验 assignee 是本项目成员，第三节 T5）、users（负责人显示 email，第三节 R2-8；取数方式待 05-API 决策 C）

三处变动：
一，projects 那项的理由改了。原写「校验成员身份与角色」，但按决策 A，当前用户角色由
    AuthzGuard 经请求上下文传入，TasksService 不再查角色。实际要 projects 做的是
    assignee 成员校验（T5）。
二，users 那项的理由改了。原写「assignee 存在性」，按 T5 改由 projects 校验成员身份，
    users 剩下的用途是 R2-8 显示负责人 email。
三，行末 authz 删除（T24）。TasksService 不调 authz，这条边只是路由挂了 AuthzGuard，
    按 T13 口径不计入依赖图。

遗留提醒：tasks → users 这条边的成立有前提，取决于 05-API 决策 C。
若定成 Prisma 关联查询而非走 UsersService，就不是 Service 调 Service，按 T13 要复核这条边。

### B-4 · ARCHITECTURE.md:77 依赖方向清单 tasks 行（T24）

原文：
tasks → projects、users、authz

改为：
tasks → projects、users

依据：同 B-3 第三点。与 :51 保持一致，两处必须同时改。

### B-5 · ARCHITECTURE.md:176-182 例子块（三个动作合并）

这一块叠了三个动作，必须一次改完：
  一，:177 重定向措辞（T27）
  二，:179 ValidationPipe 改 Zod 管道（原区块二第 2 处的一半，见第四节作废一）
  三，补上第三节 T2 的比对项目一步（T27）

原文：
例子 · 执行者尝试修改不属于自己的任务：
1. AuthGuard：会话有效吗？无效 → 未登录处理，重定向登录页。
2. AuthzGuard：他是本项目成员吗？不是 → 权限不足。是执行者 → 放行，因为执行者本来就能更新自己任务的状态。
3. ValidationPipe：请求体形状合法吗？
4. Controller：调 TasksService。
5. TasksService：取任务，比对 assigneeUserId 与当前用户 id。不等 → 拒绝。
拦在第 5 步 Service。Guard 拦不住，它不知道那条任务的 assignee 是谁。

改为：
例子 · 执行者尝试修改不属于自己的任务：
1. AuthGuard：会话有效吗？无效 → 退回「未登录」。跳转登录页是前端收到该响应后的行为，不由 Guard 执行。
2. AuthzGuard：他是本项目成员吗？不是 → 权限不足。是执行者 → 放行，因为执行者本来就能更新自己任务的状态。
3. Zod 管道：请求体形状合法吗？
4. Controller：调 TasksService。
5. TasksService：取任务，先比对记录的 projectId 与路径项目 id（第三节 T2）。不等 → 权限不足。
6. TasksService：再比对 assigneeUserId 与当前用户 id（第三节 R2-7）。不等 → 权限不足。
拦在第 5、6 步 Service。Guard 拦不住，它既不知道那条任务属于哪个项目，也不知道 assignee 是谁。

依据：
  第 1 步 —— 重定向是前端行为，后端 Guard 只能返回响应。原措辞把两层混了。
  第 3 步 —— T1 定服务端校验用项目自写 Zod 管道，不用内置 ValidationPipe。
  第 5 步 —— 第三节 T2 要求 Service 取到记录后必须比对 projectId 与路径项目 id。
             原例子跳过了这一步，与第三节 R2-6 走查不符。

### B-6 · ARCHITECTURE.md:259 第三节口径行

原文：
> 口径：按项目主人裁决 T1-T7 与决策 A-E 写。第二节原文尚未回写，差异见本节末「本节暴露的问题」。

改为：
> 口径：按项目主人裁决 T1-T7 与决策 A-E 写。第一、二节原文已按本节口径回写完毕（05-API 开课时执行），原差异记录保留在本节末「本节暴露的问题」。

依据：回写完成后原句过时，留着会让下游以为还没回写。

### B-7 · ARCHITECTURE.md「本节暴露的问题」标题下加状态行

在 ### 本节暴露的问题 这一行下方、第 1 条之前，插入两行：

> 状态：以下 1-6 条已于 05-API 开课时全部回写完毕，原文保留作为演进记录，不再是待办。
> 更正：第 5 条说「第二节仍把决策 6 列为待定」，位置记错。该待定块实际在第一节。

依据：一次解决整块的过时状态与第 5 条的位置错误，不必逐条改六次。
      位置记错这件事也是 BACKLOG 第 21 条原文「第二节六处」不准的来源。

### B-8 · ARCHITECTURE.md 第三节裁决汇总补 T6、T7

在 - T5 assignee 必须是本项目成员，允许分配给负责人自己。 这一行后面，插入两行：

- T6 两级权限界线：只用「会话 + 路径参数 + project_memberships」能判的归 Guard；需读业务表记录或读请求体内容才能判的归 Service。
- T7 决策 6（US-04 第三条验收依赖项目级 deadline）已裁决本版延后，依据 PRD.md:295-299。

依据：第三节开头口径行写「按裁决 T1-T7 写」，W1-3 也引用「按 T6 归 Service」，
      但裁决汇总只记到 T5。文档引用了自己没记的东西。
      T6、T7 原文此前只活在桥梁里，桥梁用完即弃，属反模式 24。补进正文后不再依赖桥梁。

### B-9 · TECH_STACK.md:29 环境一致（T23）

原文：
- Docker + Docker Compose —— 甜区。单 VPS 多服务编排，环境一致。

改为：
- Docker + Docker Compose —— 甜区。单 VPS 多服务编排，环境一致。此处「环境一致」指镜像与运行时一致，配置按环境不同（05-ARCH T23）。

依据：原措辞有歧义，可读成「配置也该一致」，会与 T10「数据库端口开发暴露、生产不暴露」冲突。

### B-10 · TECH_STACK.md:30 Nginx 职责（T9）

原文：
- Nginx —— 甜区。反向代理 + 静态托管 + TLS 终止。

改为：
- Nginx —— 甜区。反向代理 + TLS 终止。不托管静态资源，静态资源由前端 Next.js 服务进程自身发出（05-ARCH T9，原定三职责已收窄为两项）。

裁决状态说明：这一处已裁决，不是待定。
  ARCHITECTURE.md 第四节的问题清单第 1 条写着「按 D8 只报不改，以谁为准待主人确认」，
  那是 architect 的过度谨慎。项目主人在 05-ARCH 第三窗口第 1 段拍 T9 时，
  已明确知道并接受「要回写 TECH_STACK 这一行」这个代价。T9 原文本身也写了这句。
  执行时不必再问，照改。

## 四、三处作废（照原样执行会撞车）

### 作废一 · 区块二第 2 处中 :179 那一半

原内容：把 :179「3. ValidationPipe：请求体形状合法吗？」改成「3. Zod 管道：……」。
作废原因：:179 在例子块内部，该块另有两个动作要改（见 B-5）。分开改会导致
          第二次按内容匹配失败（铁律 1、2）。
处置：:179 的改动已并入 B-5，区块二第 2 处只执行 :114 那一半。

### 作废二 · 区块二第 6 处中 :51 那一半

原内容：architect 给的 :51 改为，保留了行末的 authz，并注明「牵涉区块三的冲突，本处原样保留」。
作废原因：T24 已裁决删掉 tasks → authz。architect 交稿时主人尚未拍板。
处置：:51 用 B-3 的文本。区块二第 6 处只执行 :126 那一半。

### 作废三 · 区块二第 4 处的「待核 T6」标记

原内容：architect 在两级权限界线那处标了「草稿，待核 T6 原文，请您拿原文核对」。
作废原因：T6 原文已于 05-ARCH 第三窗口第 6 段核对完毕，三条口径与草稿完全一致。
处置：正文照用，把「（草稿，待核 T6）」这个标记去掉，写成「（决策 Q2，按第三节 T6 回写）」。
      T6 原文见 B-8。

## 五、给新窗口结课时入库的两条（本窗口只出文本，不代记）

### 反模式 42 号（建议文本）

## 42 号 · 交接包由两方拼成，没做覆盖核对就宣告可执行
现象：05-ARCH 第三窗口产出 PENDING-REWRITES.md，前半执行清单由老师写，后半回写文本由 architect 产。
      两半各自都无错，但从未对起来核。实际 24 项清单里有 10 项只有「要改」没有「改成什么」，
      另有 3 段文本已被后续裁决盖掉却仍留在包里，且清单与文本的计数粒度不同（逻辑处 vs 编辑动作），
      数字本身对不齐。下一窗口开课核对时才发现，桥梁里「回写是纯执行」的判断不成立。
根因：E4 架构错。交接物由两方拼成时，接缝处没有任何人负责核。
      老师检查了「产物有没有落点」（规则 61），没检查「落点里的东西全不全」。
修复：交出待执行文件前，逐条核对清单每一项有没有对应的成文内容，
      逐条标「有定稿文本」或「缺文本待补」，两者都要显式写出。
      清单与内容的计数粒度必须统一，并在文件里写明按哪种粒度计数。
      落成规则 70 追加段。
教训：文本多不等于决策全做完了。41 号说「产出短不等于决策少」，本条是它的镜像面。
抽象模式：与 41 号（用体量估工作量）同族但不同环节。41 是估算问题，42 是交付问题。
          与 3 号（表象成功≠实质生效）同源：文件在、内容多，都是表象，可执行才是实质。

### 规则 70 追加段（建议文本）

### 规则 70 追加（05-API 加）
交出待执行文件前，必须做一次覆盖核对，结果写进文件本身：
一，逐条核对清单每一项有没有对应的成文内容，逐条标「有定稿文本」或「缺文本待补」，
    两者都要显式写出，不许留空。
二，清单与内容的计数粒度必须统一，并在文件里写明按哪种粒度计数
    （逻辑处 vs 编辑动作，同一处改两行算一个还是两个）。
三，凡文本产出时间早于某条裁决的，核对时须确认该文本有没有被裁决盖掉，被盖掉的显式标作废。
背景：05-ARCH 第三窗口交出的 PENDING-REWRITES.md 三样都给了（执行时机、执行铁律、验证命令），
      仍然出事，因为规则只管了「文件里要有什么」，没管「清单和内容对不对得上」。
与规则 70 原文关系：叠加。原文管文件结构，本条管文件内容的完整性。
与反模式关系：42 号的药方。

## 六、全部改完后的验证命令（修订版，取代原文件末尾那份）

原文件那份有一条是错的：grep -n "ValidationPipe" 应为空。
这条会误判失败——回写后第二节仍会出现「不用内置 ValidationPipe」这类否定式表述，是正常的。

修订版，逐条跑：

grep -c "^## " docs/arch/ARCHITECTURE.md
  应为 4

grep -n "ValidationPipe" docs/arch/ARCHITECTURE.md
  应只剩否定式表述（如「不用内置 ValidationPipe」）。
  不得出现把它当成在用的句子，如小节标题、例子里的步骤名。

grep -n "authz" docs/arch/ARCHITECTURE.md
  逐行看，以下三种旧口径不得残留：
    tasks 依赖行末尾的 authz
    依赖方向清单里的 tasks → ...authz
    依赖方向清单里的 authz → auth

grep -n "tasks →" docs/arch/ARCHITECTURE.md
  应为 tasks → projects、users

grep -n "尚未回写" docs/arch/ARCHITECTURE.md
  应为空

grep -n "T6 \|T7 " docs/arch/ARCHITECTURE.md
  第三节裁决汇总应能看到 T6、T7 两条

grep -n "静态托管" docs/arch/TECH_STACK.md
  应为空

grep -n "环境一致" docs/arch/TECH_STACK.md
  应带有 T23 的澄清句

七条全过，才算回写完成。
之后删除 docs/arch/PENDING-REWRITES.md（规则 70：执行完即删），
并更新 PROJECT_STRUCTURE.md 与 BACKLOG 第 21 条。

## 七、执行铁律（原文件已有，此处重申，不变）

1. 不许按行号改。改一处后面行号全漂，23 处连改必打偏。一律按内容匹配。
   本补丁里的行号只用于定位查看，不作为改动依据。
2. 一处一改一验。改完立刻验证那一处，确认了再下一处。
3. 没有权限护栏兜底。settings.json 的 Edit(docs/arch/**) 是 ask 档，
   但 sed / heredoc 走 Bash 不走 Edit 工具，不会弹窗。方向写错没人拦。
4. 本补丁第四节的三处作废，执行到对应位置时先确认已按作废说明处理，别照 architect 原文改。