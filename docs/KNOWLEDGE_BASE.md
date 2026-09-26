# KNOWLEDGE_BASE.md · 课程知识库

> 用途：本文件抽自原始 22000 字课程 prompt 的「知识清单」部分，去重但保留充分讲解，内容与原意不丢。
> 分工：本文件管「学什么」（协议/角色/强化/补丁/机制），调节器管「开课怎么走」（读哪些文件/开课动作/自检/触发词），桥梁管「上次到哪」（进度）。三者解耦，互不替代。
> 怎么拿到开课资料，分环境（口径同调节器 A 节）：
> - 网页版读不了盘，请学生贴进来。顺序：本文件、调节器、桥梁。
> - Claude Code 能读盘，直接读项目里的文件。
> 第八块 TaskFlow 规格仅为知识点参考，非新项目要求（新项目由第 1 课推导，依据规则 81）。

---

## 一、学生背景（讲 Level 1 对应时用这个，不要瞎猜）

全栈技能（分三档）：
- 熟练：React / Node.js / TypeScript / MySQL。
- 有基础：Next.js / NestJS / Prisma / Redis / Docker / Nginx / Linux / CI/CD。
- 有基础：Git / Git Flow / Conventional Commits（feat / fix / docs / style / refactor / test / chore）。
- 入门：PostgreSQL。

Web 基础（已掌握）：
- HTTP / HTTPS / DNS / Cookie / Session / Token。
- 前后端分离 / RESTful API。
- 浏览器到服务器的请求流转 9 步。

Level 1 阶段（在 Claude 网页版）已学完：本文件第二到第六块的全部内容，加上 Anthropic 官方课程（DeepLearning.AI × Anthropic，Elie Schoppik 11 节课）。

学生画像：
- 强项：批判性强，会主动抓老师的漏洞和设计问题。
- 弱项：文字太密会看不懂；编号代号反复出现会忘记指什么。
- 当前水平：初级的 AI 工作流工程师，能看出 prompt 设计的毛病。

为什么记这些：老师讲「Level 1 对应」时（这是双修的核心），必须用学生真实学过的东西做对比，不能凭空假设他会什么或不会什么。

---

## 二、14 个 Vibe Coding 协议（Level 1 已学，本课要练成肌肉记忆）

> 每条含：核心一句、为什么需要、不做会怎样、对错范例。

### 协议 1 · Prompt Pack（GCCOP）
核心：一套结构化的提问范式，把目标、约束、上下文、输出格式打包写清。
为什么需要：散文式提问 AI 容易抓不住重点，列表式硬规则比散文式期望有效 10 倍。
不做会怎样：随口一句「帮我写个登录」，AI 不知道用什么技术栈、什么约束、要什么格式，来回返工。
范例：
- 对：「目标：写登录接口。约束：NestJS + Passport-JWT，不碰数据库迁移。上下文：参考 auth.module.ts。输出：controller + service 两个文件 + 一句说明。」
- 错：「帮我搞个登录功能。」

### 协议 2 · Bounded Recon（有预算的代码侦察）
核心：AI 读代码前，先声明要读哪几个文件，最多 5 个，读完即停。
为什么需要：AI 看代码容易一直读下去，从一个文件跳到下一个，token 烧光还没说清现状。
不做会怎样：让 AI「了解一下这个模块」，它可能 grep 整个项目读了 30 个文件，上下文塞满，真正要改的地方反而没空间。
范例：
- 对：「我要读这 5 个文件了解 auth 现状：auth.controller.ts、auth.service.ts、auth.guard.ts、user.entity.ts、auth.dto.ts，读完汇报。」
- 错：「看一下 auth 模块怎么实现的。」

### 协议 3 · Evidence Contract（证据契约）
核心：AI 引用任何代码或文档，必须给出处，写成 文件路径:行号。
为什么需要：AI 会「凭印象」描述代码，说得头头是道其实记错了。给出处能当场核对。
不做会怎样：AI 说「你的 service 里已经处理了空值」，你信了，实际没有，上线才发现。
范例：
- 对：「空值在 task.service.ts:42 已处理。」
- 错：「这个逻辑应该已经处理了空值。」

### 协议 4 · Assumption Ledger（假设账本）
核心：AI 提出的、未经真人确认的设想，先记进账本标「未验证」，真人确认后才升级为「已验证」。
为什么需要：AI 没有真实信号时会编「听起来合理」的需求，幻觉被当成洞察。
不做会怎样：AI 扮用户发出的需求被直接写进 PRD 当事实，整个产品建在幻觉上（这就是反模式 19）。
范例：
- 对：账本里「用户可能想要导出功能 —— 未验证（AI 假设）」，等真人拍板再进正式列表。
- 错：把 AI 编的需求直接写进 PRD「已确认需求」。

### 协议 5 · ≤3 Clarify（最多三个澄清）
核心：开工前若有疑问，最多问三个最关键的澄清问题，用选择题形式。
为什么需要：问太多拖慢节奏，问太少方向跑偏。三个是平衡点。
不做会怎样：要么不问就猛干、方向全错；要么问个没完、学生烦。
范例：
- 对：「开工前确认三件事：1. 数据库用 PG 还是 MySQL？2. 要不要软删除？3. 时间字段带时区吗？」
- 错：一口气问十五个细节，或一个不问直接动手。

### 协议 6 · Impact Analysis（影响分析）
核心：改动前，先分析这一改会波及哪些文件、哪些功能。
为什么需要：一个改动常常牵连别处，不先看清就改，会撞坏没注意到的地方。
不做会怎样：改了一个共享类型，三个用它的模块全编译失败，才回头补。
范例：
- 对：「改 User 类型会影响 auth.service、user.controller、shared-types 三处，我逐个核对。」
- 错：直接改类型，等报错了再说。

### 协议 7 · Stage Gates（阶段关卡）
核心：项目分阶段，每个阶段设一道关卡，达标才准进下一阶段。
为什么需要：防止地基没打好就盖楼，半成品堆到后面集中爆雷。
不做会怎样：环境还没跑通就写业务代码，写到一半发现数据库连不上，前面全白做。
范例：
- 对：SG-1「前后端 hello world 能在浏览器看到」过了，才进 MVP 开发。
- 错：环境、后端、前端一起上，最后联调时各种对不上。

### 协议 8 · Verification + Fail Loop E1-E4（验证 + 四类根因排错）
核心：出错时按四类根因定位——E1 环境、E2 工具、E3 逻辑、E4 架构——再对症修。
为什么需要：不分类乱试，同一个错反复撞。分类后能快速锁定真正的源头。
不做会怎样：明明是环境问题（E1），却一直改业务代码（当成 E3），越改越乱。
四类的意思：
- E1 环境错：网络、版本、工具没装对。
- E2 工具错：命令报错、语法写错。
- E3 逻辑错：跑通了但结果不对。
- E4 架构错：设计层面的问题。
范例：
- 对：「报错是 connection refused，归 E1 环境，先查 docker 起没起，不是改代码。」
- 错：看到报错直接改业务逻辑，不分类。

### 协议 9 · Consistency Report（一致性报告）
核心：联调或 PR 前，检查前后端、类型、契约是否一致，出一份报告。
为什么需要：前后端各写各的，字段名、类型、状态码很容易对不上。
不做会怎样：前端拿 userId，后端返回 user_id，联调时一片红。
范例：
- 对：报告列「shared-types 的 Task 与后端 entity 字段逐一核对，发现 dueDate 类型不一致」。
- 错：直接联调，错了再一个个找。

### 协议 10 · HANDOFF PACK（交接包）
核心：一个工作段落结束，打包交接信息给下一段：做了什么、到哪了、下一步、注意事项。
为什么需要：跨会话或跨人接手时，没有交接就得重新摸索。
不做会怎样：新会话从零问起，浪费大量来回。
范例：本课程的「桥梁 prompt」就是 HANDOFF PACK 的实例。

### 协议 11 · SESSION_BRIEF + Anchor + /compact（会话简报 + 锚定 + 压缩）
核心：用一份简报维持会话主线；每轮用锚定块提醒当前位置；上下文满了用 /compact 压缩。
为什么需要：长会话里 AI 会忘掉主线、角色设定漂移。
不做会怎样：聊到后面 AI 忘了项目约束，输出降质（反模式 17 角色漂移）。
范例：每段开头三行锚点（分工 / 红线 / 这步我可能犯的错）就是 Anchor。

### 协议 12 · CONFIRM-RISK 双确认
核心：高风险、不可逆的操作（删库、删文件、迁移、上线），执行前两次确认，先列影响和回滚方案。
为什么需要：不可逆操作错一次就没法挽回。
不做会怎样：一条命令把生产库删了，没有回滚方案，数据全没。
范例：
- 对：「这步要 drop 表，影响 X，回滚方案是先备份。确认要执行吗？」等回「确认」再做。
- 错：直接执行删除，不确认不备份。

### 协议 13 · Expand-Migrate-Contract（演进式改造三步）
核心：改数据结构时分三步——先扩展（加新的，旧的留着）、再迁移（数据搬过去）、后收缩（删旧的）。
为什么需要：直接改会让正在运行的系统瞬间不兼容。三步走全程可回滚。
不做会怎样：直接改字段名，老代码和老数据全部失效，线上崩。
范例：
- 对：先加 dueDate 新字段（保留旧 due），迁移数据，确认无误，再删旧 due。
- 错：直接把 due 改名成 dueDate。

### 协议 14 · 自动化守门（make verify / Hook / CI）
核心：把检查交给机器自动跑——lint、类型检查、测试、构建一键全过才算数。
为什么需要：人会忘记检查，机器不会。AI 或人说「完成」不算，机器全绿才算（验证先于信任）。
不做会怎样：靠人工记得跑测试，总有几次忘了，坏代码混进主干。
范例：
- 对：CC 改完代码自动跑 make verify，红了自己修，重试不超过 2 次。
- 错：CC 说「应该能工作」就提交，没跑任何验证。

---

## 三、9 个 AI 角色（分阶段激活，每个角色一个独立 subagent 文件）

> 每个角色含：身份信念、核心职责、边界（不做什么）、激活课。
> 建角色文件的标准见项目 docs/AGENT_SPEC.md，不在本文件。
> 通用边界原则：文档类角色（client/persona/pm/designer/architect）只给 Read 权限，只产出内容、不碰文件系统，落盘交给主对话或 cat；写码类角色（backend/frontend 等）给 Read/Write/Edit。

### 角色 1 · client（客户 + 用户研究双重身份）
身份：10 年用户研究经验，精通 JTBD（Jobs To Be Done）框架。
双重身份是核心：身份 A 是被访谈的真客户（会情绪化表达痛点），身份 B 是做分析的研究员（结构化整理）。
职责：做用户研究，产出画像、JTBD、痛点分级（P0-P2）、竞品根因分析、给 pm 的输入清单。
边界：只做研究，不定义产品需求（那是 pm 的活）。AI 扮演用户发出的需求必须标「假设」，不得当成已验证事实（防反模式 19）。
激活：Lec 1。

### 角色 2 · pm（产品经理 / 边界守护者）
身份：10 年 SaaS 产品经验，核心职责是守住产品边界、防止需求蔓延。
职责：把用户研究转成用户故事（作为谁 / 想做什么 / 以便什么）和验收标准（给定 / 当 / 则，必须可测）；划定 In Scope 和 Out of Scope；维护假设账本。
边界：不做设计（designer 的活），不做技术选型（architect 的活）。需求来源要标清——真人确认的和 AI 假设的物理分开。
激活：Lec 2。

### 角色 3 · designer（产品设计师）
身份：8 年 SaaS 设计经验，极简主义，信奉「好设计是减法」。
核心专长：三态 UI——任何加载数据的界面，都先想清楚加载态、空态、错误态三个样子。
职责：页面结构、主流程、异常流程、三态 UI、视觉规范方向（配合 Tailwind + shadcn）。每条设计决策注明服务于哪条用户故事。
边界：不定义需求（client/pm 的活），不写代码、不选技术实现（architect/frontend 的活），不发明数据库字段或 API。
激活：Lec 3。

### 角色 4 · architect（架构师）
身份：12 年架构经验，做任何决策前先问 6 个必问问题，重要决策写成 ADR（架构决策记录）。
职责：技术选型（用四象限决策法）、系统架构、数据库设计、API 契约、共享类型、环境设计。产出 TECH_STACK、DECISIONS、ARCHITECTURE、DATABASE、API_CONTRACT、SHARED_TYPES、ENV_DESIGN 等文件。
边界：不写业务代码（backend/frontend 的活），不定义需求。做权衡是重思考活，这个角色可标 model: opus。
激活：Lec 4-5。

### 角色 5 · backend（后端工程师）
身份：NestJS + Prisma 专精，特别重视异常路径（7 大异常路径思维）。
职责：实现后端模块、API、JWT 鉴权、数据校验（class-validator）、异常处理。
边界：不改前端，不擅自改数据库设计（要改先回 architect 确认）。属写码类角色，给 Read/Write/Edit 权限。
激活：Lec 10。

### 角色 6 · frontend（前端工程师）
身份：Next.js + Tailwind + shadcn 专精，落实三态 UI。
职责：实现页面、组件、状态管理（Zustand）、接口封装（Axios）、拖拽（dnd-kit）等。严格按 designer 的设计和 architect 的 API 契约来。
边界：不改后端，不发明设计（照 designer 的 UI_DESIGN 来）。属写码类角色。
激活：Lec 11。

### 角色 7 · tester（测试工程师）
身份：「找漏洞」心态，熟悉 OWASP Top 10，写 4 类测试用例（正常 / 边界 / 异常 / 安全）。
职责：单元测试、集成测试、安全测试，追求覆盖率达标 + 安全通过。
边界：不改业务实现（发现 bug 报给对应角色），只负责测和报。
激活：Lec 14。

### 角色 8 · devops（运维工程师）
身份：Docker + Nginx + 灾备专精，对高风险操作严格执行 CONFIRM-RISK 双确认。
职责：生产部署、容器编排、SSL、灾备演练（RPO/RTO）、CI/CD、监控。
边界：碰生产环境的操作必须双确认 + 回滚方案，不冒进。
激活：Lec 15-17。

### 角色 9 · reviewer（代码审查者）
身份：「挑错」心态，每次 PR 前出一致性报告。
职责：审查代码与契约一致性、命名规范、潜在问题，把关质量。
边界：只审不改（问题报给作者改）。
激活：每次 PR 前。

补充：除九角色外，Lec 1 还会建一个 persona 角色（AI 设定的假设目标用户，未经真人验证），配合 client 做用户研究。persona 发出的需求一律标「假设」。

---

## 四、23 项强化（Level 1 已学的体系性增强）

> 这些是在基础协议之上叠加的体系化要求。编号 + 名称 + 必要时一句说明。

1. 9 角色分阶段激活：不一次全开，按课程进度逐个激活。
2. UI/UX 设计师课程：designer 角色配套的设计方法。
3. 选择题 + AI 推荐格式：决策给 A/B/C + 推荐 + 一句理由，不替学生拍板。
4. <important if=""> 条件触发：满足条件才触发的重要指令。
5. 单一信息源原则：同一信息只存一处，别处指向它，不重复。
6. IDE / Lint 工具优先：能用工具自动查的，不靠人肉。
7. 演进式架构（EMC）：Expand-Migrate-Contract 三步走。
8. 性能优化整合各阶段：性能不是最后才管，每阶段都考虑。
9. MCP / Skills 实战：Claude Code 的 MCP 服务和 Skill 机制实战。
10. Web 基础回顾：HTTP / 请求流转等回顾。
11. 操作标注规范：哪步学生做、哪步老师讲、哪步要决策，标清楚。
12. 信息分层规则：信息按层级和寿命分类存放。
13. client.md 双重身份：client 角色同时是被访谈客户 + 研究员。
14. Decision Boundary D1-D7：七类决策边界，触发时由学生拍板。
15. Self-Doubt Protocol：AI 主动自我怀疑，不盲目自信。
16. Decision Ownership：决策权属学生，AI 不越权拍板。
17. Tiered Review Protocol：分级审查机制。
18. Session Lifecycle 4 阶段：会话生命周期分四阶段管理。
19. Negative Path Thinking：主动想失败路径、异常情况。
20. Observability 三支柱：日志 Logs + 指标 Metrics + 链路 Traces。
21. Disaster Recovery：灾备，RPO（数据丢失上限）/ RTO（恢复时间上限）。
22. Prompt Library 版本化：prompt 当资产，版本化管理、可复用。
23. Bounded Recon + Token 经济：侦察有预算，省 token。

---

## 五、30 项补丁（Level 1 已学的精细化修补）

> 这些是实践中打的补丁，更细颗粒度。编号 + 名称 + 必要时一句说明。

1. Token Budget Contract：每个任务声明 token 预算。
2. Diff 粒度约束（<100 行）：一次改动不超过 100 行，超了先停下汇报。
3. Reversibility Contract：可逆性契约，操作前想清楚怎么撤销。
4. Compatibility Contract：兼容性契约，改动不破坏现有的。
5. Anchor 锚定块（每轮 3 行）：每轮回复开头三行锚点。
6. COMPACT_BRIEF：压缩版会话简报。
7. ADR-Lite 三行格式：轻量架构决策记录，三行写完（背景 / 决策 / 后果）。
8. Diff-First Self Review：改完先自审 diff 再交。
9. Risk Review：风险审查。
10. Output Contract（3 件套）：输出契约，规定交付格式。
11. 约束三件套（Scope / Don't / Stop）：范围 / 禁止项 / 停止条件。
12. Decision Log 分级：决策日志分级记录。
13. Pre-check / Post-check：动手前检查 + 动手后检查。
14. 传播矩阵 5 项：一个改动要同步传播到哪 5 处。
15. CLAUDE.md 三大原则：项目宪法的三条核心原则。
16. 技术选型四象限决策法：用四象限做选型权衡。
17. 会话喂养 3 层原则：给 AI 喂上下文分三层。
18. 喂养判断公式：判断该喂什么、不喂什么。
19. 竞品对标方法论：分析竞品的方法。
20. 5 大通用 UI 模式：常见界面的五种通用模式。
21. UI 设计 5 大信仰：设计的五条核心信念。
22. HANDOFF Future Context 4 项：交接时要带的四类未来上下文。
23. Bounded Recon 5 边界：侦察的五个边界（范围 / 文件数 / 深度 / 时间 / 停止）。
24. 工程化 5 层防御：五层质量防御体系。
25. 教授提问机制：老师主动提问检验学生。
26. Stage Gate 精确定义：每个关卡的明确达标标准。
27. 错误日志习惯：踩坑记进错误日志。
28. 选择题完整格式：决策选择题的标准格式。
29. 决策权属反例对比：用反例说明决策该归谁。
30. 前瞻性思维（5 年后）：做决策时想 5 年后的影响。

---

## 六、Claude Code CLI 全部机制（Level 1 已学）

- Plan Mode：计划模式，用键盘切换（Shift+Tab 两次 / 部分环境 Alt+M / 打 /plan）。切了之后先列计划再动手。什么时候切，见 COURSE_RULES 规则 28。注意：模式是键盘控制的状态，不是 prompt 文字能切的（反模式 15）。
- Skills：技能，放在 .claude/skills/<name>/SKILL.md，封装可复用的能力。
- Subagents：子代理，放在 .claude/agents/<name>.md，每个是一个独立 context 的角色。本课程九角色就是用它实现。
- Hooks：钩子，放在 .claude/hooks/，在特定事件触发时自动跑脚本。
- MCP servers：外部服务接入，配在 .claude/mcp.json（如 Postgres、Playwright、Sentry）。
- Permissions：权限，配在 .claude/settings.json，分 allow / ask / deny 三档。
- Output Styles：输出风格，如 learning / explanatory。
- 思考预算：think / think hard / think harder / ultrathink，按需调用更多推理。
- Slash 命令：/clear、/compact、/cost、/init、/resume 等。
- Rewind / Resume：回退 / 续接（Esc Esc 双击回退）。
- Worktrees：多工作树，并行开发。
- Memory 系统三层：项目级 ./CLAUDE.md、全局级 ~/.claude/CLAUDE.md、临时级 .claude/memory/<topic>.md。

---

## 七、19 课大纲骨架（5 阶段 + 6 过关点）

> 这是固定骨架（规则 49：5 阶段 + 6 过关点不变，单课可弹性拆增）。
> 各课的具体例子用新项目，不用 TaskFlow。

Phase 0 · 立项准备（不写代码）· Lec 0-6
- Lec 0：项目介绍 + 流程总览 + Web 9 步回顾 + 三大信仰。
- Lec 1：client 角色，用户研究（画像 / JTBD / 痛点分级 / 竞品根因 / 给 pm 输入清单）。
- Lec 2：pm 角色，PRD（用户故事 / 验收标准 / Out of Scope / 假设账本）。
- Lec 3：designer 角色，UI 设计（页面结构 / 主流程 / 异常流程 / 三态 UI / 视觉规范）。
- Lec 4：architect 角色，技术选型 + 决策（约束分析 / 6 必问 / 四象限 / ADR）。
- Lec 5：architect 角色，架构 + 数据库 + API 契约 + 共享类型 + 环境设计。
- Lec 6：CLAUDE.md 宪法（灵魂课）+ 会话简报 + prompt 模板 + 剩余五角色。

Phase 1 · 环境搭建 · Lec 7-9 —— SG-1 在 Lec 7
- Lec 7：Monorepo 初始化（前端 + 后端 + 共享类型 + workspace + Makefile + 首次 commit / SG-1）。
- Lec 8：IDE + Husky + Lint（故意写错代码被拦）。
- Lec 9：Docker + 数据库 + ORM + Seed（能连库 + Seed 成功）。

Phase 2 · MVP 开发 · Lec 10-12 —— SG-2 在 Lec 12
- Lec 10：后端 MVP，backend 角色（模块 + API + JWT + 校验 + 异常路径）。
- Lec 11：前端 MVP，frontend 角色（核心页面 + 三态 UI + 状态 + 拖拽）。
- Lec 12：联调 + SG-2，reviewer 角色（契约先行 / 类型同步 / 一致性报告 / 交接包）。

Phase 3 · 功能扩展 · Lec 13-14 —— SG-3 在 Lec 14
- Lec 13：完整功能迭代（多角色轮转 / 权限 / 实时通知 / 会话简报 + 锚点 + /compact 实战 / Worktrees 并行）。
- Lec 14：测试体系 + 安全，tester 角色（单元 + 集成 + 4 类用例 + OWASP / SG-3 / TDD 实战）。

Phase 4 · 部署上线 · Lec 15-17 —— SG-4/5/6
- Lec 15：部署 + 灾备，devops 角色（生产镜像 / VPS / SSL / RPO+RTO / 灾备演练 / SG-4）。
- Lec 16：CI/CD + Hook 自动化（工作流 + PR 模板 + make verify + 5 层防御 / SG-5）。
- Lec 17：监控可观测性三支柱（日志 + 指标 + 链路 + 告警 / SG-6）。

Phase 5 · 演进考核 · Lec 18-19
- Lec 18：演进式架构 + Migration 实战（Expand-Migrate-Contract / 真实演进 PR + 回滚脚本）。
- Lec 19：独立考核 + 终极复盘（三道题：新需求独立做 PRD 骨架 / bug 报告独立用 Fail Loop / 架构改动独立做 Impact + Migration。2/3 通过 = 真正掌握）。

六个 Stage Gate 的定位：
- SG-1（Lec 7）：前后端 hello world，浏览器能看到。
- SG-2（Lec 12）：MVP 端到端能跑。
- SG-3（Lec 14）：测试覆盖率达标 + OWASP 通过。
- SG-4（Lec 15）：生产域名 + HTTPS + 灾备演练。
- SG-5（Lec 16）：CI 故意挂能拦 + 自动部署。
- SG-6（Lec 17）：监控三支柱 + 告警到达。

三大工程信仰（每课贯穿）：
1. 宪法先于代码：规则书先于代码，没有规则就没有秩序。
2. 验证先于信任：AI 或人说「完成」不算，机器自动验证全绿才算。
3. 演进先于完美：求「能改」不求完美，先加新的兼容老的，数据迁完再删老的。

---

## 八、TaskFlow 旧项目规格（知识点参考，非新项目要求）

> 重要：以下是上一个练习项目 TaskFlow 的规格，已作废为项目。
> 保留它只为一个目的：让新窗口知道「一个完整项目的规格长什么样」，当结构参考。
> 新项目由第 1 课推导，规模可大可小（接口可能 15 个或 28 个，表可能 5 张或 8 张，都没关系）。
> 只要每课教会了对应的「方法」（如「用 NestJS 写一组接口的标准流程」），知识点就算覆盖（依据规则 81）。
> 严禁把以下内容当成新项目的硬性要求。

TaskFlow 是什么：最小化的 Jira / Trello 风格任务协作平台，目标用户 5-50 人研发团队。

旧的 8 个 P0 用户故事（参考）：用户注册、登录（含 JWT）、创建项目、查看项目列表、邀请成员、创建任务、任务状态流转（含通知）、看板视图（含拖拽）。

旧的业务硬限（参考）：团队 50 人/项目，项目 20 个/用户，任务 500 个/项目；4 状态（待办/进行中/待审核/完成，支持回退）；4 优先级（低/中/高/紧急）；通知仅站内；不做游客权限。

旧的技术栈（参考，新项目可沿用或调整）：
- 语言：TypeScript 前后端统一。结构：Monorepo + pnpm workspace。架构：模块化单体。
- 前端：Next.js 14（App Router）/ Tailwind / shadcn / Zustand / Axios / dnd-kit / React Hook Form + Zod。
- 后端：NestJS / Passport-JWT / Swagger / class-validator + class-transformer。
- 数据：PostgreSQL 16 / Prisma 5 / Redis 7。
- 工程：pnpm workspace / Docker / Husky + lint-staged / ESLint + Prettier / GitHub Actions / Nginx / VPS。

旧的 14 项 Out of Scope（参考）：AI 智能化、移动端、邮件通知、第三方登录、第三方集成、子任务、文件附件、评论区、自定义字段、工时记录、统计报表、搜索、自定义工作流、游客只读权限。

旧的数据库 6 表（参考）：users、projects、project_members、tasks、task_history、notifications（都含审计字段）。
旧的 3 个数据库决策（参考）：UUID v4 主键、软删除（is_deleted + deleted_at）、timestamptz 带时区。

旧的 21 个 API（参考）：认证 3 + 用户 1 + 项目 5 + 成员 3 + 任务 6 + 通知 3。
旧的双层状态码（参考）：HTTP 200/201/400/401/403/404/500；业务码 0 成功 / 10001-10099 认证 / 10101-10199 权限 / 10201-10299 业务 / 50000-59999 系统。
旧的统一响应格式（参考）：{ code, message, data, timestamp }。

---


## 九、Harness Engineering 认知定位（这门课到底在学什么）

> 这是整门课的认知坐标。学生的终极目标（规则 59）是把本项目沉淀成通用 harness 框架，这一块说明为什么。

### 三层工程演化（学生在第三层）
- Prompt Engineering（2024）：「怎么问 AI」，作用在单条消息。
- Context Engineering（2025）：「给 AI 看什么」，作用在单次会话。
- Harness Engineering（2026）：「设计 AI 的工作环境」，作用在整个系统。学生学的就是这第三层，最前沿。

### 课程内容 = Harness 组件（对照表）
学生这门课的产出，用 2026 年业界术语说，就是一套完整的 Harness。对照关系：
- CLAUDE.md 宪法  = AGENTS.md（项目宪法）
- D1-D7 决策边界   = Permissions Manifest（权限清单）
- .claude/settings.json = Permission System（权限系统）
- make verify      = Feedback Loop（反馈回路）
- Verification + Fail Loop = Self-Correction（自我纠错）
- CONFIRM-RISK 双确认 = High-Stakes Approval（高风险审批）
- Diff 粒度 <100 行 = Change Discipline（变更纪律）
- Forbidden 清单    = Guardrails（护栏）
- 监控三支柱        = Observability Layer（可观测层）
- 9 角色 + Subagent = Multi-Agent Architecture（多代理架构）
- /compact 协议     = Context Compaction（上下文压缩）
- Skills 系统       = Tool Orchestration（工具编排）
结论：19 课的产出合起来 = 一套完整的 Harness。

### 4 个 Harness 核心概念（课程显式补强）
- 补强 1（Lec 0）：开课就画「Prompt → Context → Harness」三层演化图，让学生知道自己站在哪。
- 补强 2（Lec 13）：双 Agent 架构。Agent 1 Builder 写代码，Agent 2 Tracker 维护 feature list，防止长任务做到一半忘了原任务。
- 补强 3（Lec 13）：五阶段压缩。/compact 只是最后一步，完整五阶段是 Budget Reduction（省 token）→ Snip（裁剪）→ Microcompact（微压缩）→ Context Collapse（强制收缩）→ Auto-compact（自动压缩）。教学生何时用哪阶段。
- 补强 4（Lec 8）：Hooks 共 27 个事件类型，重点教其中主要 5 个的实战用法。

### 学完后学生能说的话
- 「我能设计 Agentic Coding Harness 用于生产级项目。」
- 「我熟悉 Anthropic 2026 年的 Harness Engineering 最佳实践。」
- 「我能独立搭建 Permission 系统 + Hooks + Feedback Loop。」
这是 2026 年最稀缺的工程能力之一。

---

## 文件尾 · 给新窗口老师的话

本文件只是「课本」。开课的完整动作（自检、问候、样板、术语规则）在调节器，上节课进度在桥梁。
读完本文件，你应该知道：学生会什么、19 课要教什么、每个协议/角色/机制是什么。
但「这节课具体怎么上」要看调节器 + 桥梁。这三份（本文件、调节器、桥梁）之外，开课前还要读七个必读文件，见调节器 A 节。
