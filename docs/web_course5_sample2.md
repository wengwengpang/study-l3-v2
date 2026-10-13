Title: my_taskflow_less05_arch_01/04
Exported: Oct 13, 2026, 10:21 AM
URL: https://claude.ai/chat/e141eecd-0e38-4adf-8ed9-b40a6e102454
Messages: 26

my_taskflow_less05_arch_01/04

Human (Sep 7, 2026, 10:49 AM):
think harder. 补充：记得课程讲述需要详细易懂，学生也就是我能够看的懂，内容说的够直白。

Claude:
[updated: 2026-08-21T21:14:25.938368+00:00] [size: 4244 of 49152 bytes — 44908 free] [version: a869bf3fe2d5] (pass as if_version on your next write or edit of this path)
---
name: study-l3-v2
description: Self-directed AI engineering curriculum Michael is designing and working through; read for context on his learning project structure and progress
sources: [backfill]
aliases: [study-l3-v2, TaskFlow Level 3, TaskFlow L3]
---
- [stated] Self-designed AI engineering curriculum called "study-l3-v2"
- [stated] Uses Claude as a teacher/planner instance; executes locally via Claude Code CLI on WSL2 Ubuntu with VS Code
- [stated] Working discipline: Claude provides prompts and diagnosis; Michael executes and decides
- [stated] Core principles established: verification before trust, constitution before code
- [stated] Unifying concept identified as "harness engineering"
- [stated] Three-layer engineering evolution model: Prompt Engineering → Context Engineering → Harness Engineering

Recent progress
- [stated] Recently completed Lectures 5 and 6: database schema design, CLAUDE.md constitutional framework, decision boundaries (D1-D7), permissions system
- [stated] Identified a curriculum continuity gap requiring four supplementary lessons (Lec 05-ARCH, 05-API, 05-类型, 05-环境) before reopening Lec 7 (monorepo initialization)

Infrastructure built
- [stated] Multi-document harness system: KNOWLEDGE_BASE.md, regulator, bridge prompts, six living constitution files
- [stated] Subagent role files (client, persona, pm, designer, architect) with strict permission and responsibility boundaries
- [stated] Completed Lectures 0–6: user research, PRD development, UI design, database schema (six Prisma tables: users, sessions, projects, project_memberships, tasks, notifications), ADR-Lite documentation, CLAUDE.md layered constitution
- [stated] Accumulated 60+ rules and 30+ anti-patterns with institutional propagation discipline

Earlier context
- [stated] Completed foundational TaskFlow Level 3 course design: dual-mode collaboration model (Claude.ai as teacher/planner, Claude Code CLI as executor)
- [stated] Worked through Lectures 0–3 of the original curriculum before restarting as study-l3-v2
- [stated] Built KNOWLEDGE_BASE.md from the original 22,000-character prompt
- [stated] Studied the DeepLearning.AI × Anthropic Claude Code course in full; integrated Skills, Hooks, Subagents, MCP, Permissions, Plan Mode into curriculum design
- [stated] Completed Lecture 11 frontend MVP work on TaskFlow: kanban drag-and-drop, optimistic UI, notification system, task detail views

Long-term background
- [stated] Systematically pursuing mastery of AI-assisted development through structured self-designed curricula, progressing from Level 1 (web interface, manual execution) through Level 3 (Claude Code CLI, agentic execution)
- [stated] Learning goal: muscle-memory mastery of Vibe Coding protocols, AI role frameworks, and production engineering practices using real projects as vehicles
- [stated] Consistent patterns: catching instructor errors, identifying systemic gaps over one-off fixes, institutionalizing corrections into persistent rules rather than accepting verbal assurances
- [stated] Lecture 5 detail: database schema design for TaskFlow using an architect agent, resulting in a full Prisma schema with six tables and documented ADRs (ADR-DB-001 through 004)
- [stated] Technology selection used constraint-driven decision frameworks: sessions in PostgreSQL, Redis deferred, WebSocket deferred, Zod for validation
- [stated] Constitution work: CLAUDE.md decision boundaries D1–D7 and permissions system via settings.json
- [stated] Maintains persistent curriculum files: COURSE_RULES.md, anti-patterns.md, TEACHING_STYLE.md, PROJECT_STRUCTURE.md, AGENT_SPEC.md, LESSON_TEMPLATE.md, BACKLOG.md
- [stated] Anti-pattern library grown through Anti-pattern 34
- [stated] Recurring themes: verification before trust, surface success ≠ actual completion, strict separation of semantic vs. mechanical permission layers
- [stated] Core engineering philosophy from earlier TaskFlow curriculum: Constitution-First, Verify-Before-Trust, Evolve-Before-Perfect
- [stated] Developed comprehensive methodology: 14 Vibe Coding protocols, 9 AI roles, CLAUDE.md three-tier architecture, D1–D7 decision boundaries, Skills/Hooks/Subagents, Harness Engineering as unifying framework**老师锚点（3 行）**

- 分工：我出知识、出 prompt、出命令、出诊断。你在 Claude Code 里执行，所有决策由你拍板。
- 红线：不替你改文件；不让 CC 编课程知识；没读过的文件，我不凭印象说里面写了什么。
- 这一步我最可能犯的错：七个课程文件我还没读到，却按印象背规则 57/60/62 的内容。那就是"假设别人知道我没说的事"的老师版本（反模式 1 号）。

---

## 一、这节课是什么：补课，不是往前推

Michael 你好。先把背景摆清楚，三五句话。

Lec 5 当时只做了数据库 schema，把 architect 该产的另外四件东西拆出去延后了：系统架构、API 契约、共享类型、环境设计。**这是有意拆的，不是漏掉的。**

延后之后没有马上补，而是先上了 Lec 6 宪法灵魂课。宪法三层现在已经封顶了。

所以今天是**回头补 architect 的架构收尾**，拆成四小节走：05-ARCH → 05-API → 05-类型 → 05-环境。今天上第一节，05-ARCH 系统架构。

### 逻辑顺序 vs 实际执行顺序

这两个必须分清，分不清就会重蹈反模式 34 号（把落点锁死在某个课号上，却没核对骨架）。

**逻辑顺序**（按开发依赖排的理想顺序）：
Lec 05 schema → 05-ARCH → 05-API → 05-类型 → 05-环境 → Lec 06 宪法 → Lec 07 Monorepo。

**实际执行顺序**（你真实经历的）：
Lec 05 → Lec 06（已上完，宪法三层已封顶）→ 现在补 05-ARCH / API / 类型 / 环境 → 再重开 Lec 07。

打个比方。

就像盖房子。你已经把"家规"贴在墙上了（CLAUDE.md 宪法），现在回头补"户型平面图"（系统架构）。

按道理平面图应该先画、家规后贴。但你实际是反着来的。这不影响，只要我别把你当成"没贴过家规的人"就行。

**所以：我知道你已经掌握 D1-D7 决策边界、settings.json 三档权限、可逆性 × 影响判据。这些我不会重讲。**

### 我们在哪（地图）

- 阶段：Phase 0 立项准备，还不写业务代码。
- 已完成：Lec 0 到 Lec 6（需求、UI、选型、数据建模、宪法三层）。
- 现在：补课链第 1 节，05-ARCH。
- 之后：05-API → 05-类型 → 05-环境 → 重开 Lec 07 Monorepo（那节有 SG-1 第一个过关点）。

---

## 二、确认接续：我们俩怎么配合

**我负责：** 讲解、写 CC 的 prompt、写终端命令、诊断你贴回来的输出、记录新规则和新反模式。

**你负责：** 在 Claude Code 里真实执行、做所有决策、把输出贴回来给我看。

两条要点：

一，**审 CC 输出的人是你，不是我审你。** 我给你审查清单，你对着清单一条条核。

二，**architect 是 Read-only 角色。** 它只产出文本，不碰文件系统。今天的 ARCHITECTURE.md 是它给内容、你 `cat` 落盘。这是 AGENT_SPEC 权限表定死的，不是今天临时决定的。

---

## 三、七个文件我没有，需要你贴回来

这七个文件在你机器上，不在我的上下文里。我一个字都没读过。

**任何关于它们内容的话，我现在都不能说。** 说了就是编（反模式 1 号）。

### 3.1 先办一件事：反模式 34 的提交

桥梁第 8 节说，反模式 34 已经写进 anti-patterns.md，但可能还没提交。开课前先确认。

先跑这三条：

```
cd ~/projects/study-l3-v2
git status
git log --oneline -3
```

预期看到：最近一条提交是 `2ce5304 feat(lec6): CLAUDE.md 第三层决策边界 D1-D7 + settings.json 权限系统`。

**接下来分两种情况，你自己判断：**

情况一，`git status` 里只有 `docs/lessons/anti-patterns.md` 一个改动。那就直接跑：

```
git add docs/lessons/anti-patterns.md
git commit -m "docs: 新增反模式 34 落点锁死课号未核骨架"
```

情况二，`git status` 里还有别的改动。**先别 add，先贴给我看。** 免得把不相干的改动一起提交进去。

情况三，已经提交过了。跳过。

不要回滚任何东西。

### 3.2 七个文件的读取命令

用普通 `cat`，不要用 `cat -A`。

`cat -A` 会把每个不可见字符都显示成转义符号，中文会变成一堆 `M-xM-yM-z` 的乱码，根本看不出内容。这是反模式 22 号。

```
cd ~/projects/study-l3-v2
cat docs/COURSE_RULES.md
cat docs/lessons/anti-patterns.md
cat docs/TEACHING_STYLE.md
cat docs/PROJECT_STRUCTURE.md
cat docs/AGENT_SPEC.md
cat docs/LESSON_TEMPLATE.md
cat docs/BACKLOG.md
```

七个一起贴可能很长。**可以分两批，按这个优先级：**

第一批（我做自检和定讲课手感必须要的）：COURSE_RULES.md、anti-patterns.md、TEACHING_STYLE.md、LESSON_TEMPLATE.md。

第二批（我写 architect 的 prompt 时要用的）：AGENT_SPEC.md、PROJECT_STRUCTURE.md、BACKLOG.md。

我特别需要从 PROJECT_STRUCTURE.md 里确认一件事：**architect 角色定义文件的真实路径**（大概率是 `.claude/agents/architect.md`，但我不确定）。

这个路径我必须拿到真的，因为待会儿给 architect 的 prompt 第一句就是让它读自己的定义文件。路径写错，它读不到，人设就不生效。这是反模式 7 号（不给具体路径，AI 就满项目扫）叠加反模式 3 号（角色出现在列表里，不等于人设进了脑子）。

---

## 四、漂移自检：能过的现在过，过不了的我明说

### 4.1 调节器 K 节 8 项（这份我手上有，现在逐条过）

**第 1 项，每步开头出老师锚点。**
通过。本条回复开头已经出了，后面每一步都会有。

**第 2 项，样板 A 和样板 B 会切换。**
通过。样板 A 用在"让你动手做事"的步骤，有命令、有 prompt、有审查清单。样板 B 用在"你质疑我或者讨论架构"的时候，要认错、拆根因、入库、给选择。今天讲架构，两个都会用上。

**第 3 项，你质疑我时认错而不辩解。**
通过。就在这条课程链上你已经抓过我一次：Lec 5 的落点被顺口写成"留 Lec 6"，那次直接催生了反模式 34。同样的处理方式继续。

**第 4 项，给 CC 的 prompt 指定具体文件路径。**
通过。今天所有 prompt 里的路径都会写死，比如 `docs/arch/TECH_STACK.md`、`prisma/schema.prisma`。不会出现"你去项目里找找 PRD"这种话。

**第 5 项，角色干活前先读自己的定义文件。**
通过。architect 是复用，不是新建，跨会话之后人设一定要重新加载（规则 27）。prompt 第一句就是这个。

**第 6 项，所有问题给填空或选择模板。**
通过。本条回复末尾就是模板。但按 TEACHING_STYLE 第八节：**模板只用来接你的回话，不能拿来代替我的讲解。** 该讲透的我照样讲透。

**第 7 项，Level 1 对应用你真实学过的东西。**
通过。会拿你在网页版时期怎么做架构来对比，不瞎猜你会什么。

**第 8 项，该入库的主动编号。**
通过。新规则从 67 起，新反模式从 35 起。

### 4.2 这几项我现在过不了，如实说

桥梁要求我还要过：规则 57 第 9-11 项、规则 60 开课闸、规则 62 讲解骨架。

**这三条都在 docs/COURSE_RULES.md 里，我没读过。**

我不知道它们具体要求什么。现在报"通过"就是假的，那正好撞上反模式 3 号——表面看起来过了，实质没生效。

你把 COURSE_RULES.md 贴回来，我逐条过完再补一份自检报告给你。

### 4.3 复述规则 61：七文件维护

桥梁让我复述「七文件维护：开课读全、结课逐查、harness 产物往上沉淀」。

我的理解是这样：

**开课读全。** 七个文件开课时全部读一遍，不挑着读。因为规则之间会互相牵制，只读一半容易踩到没读那半里的坑。

**结课逐查。** 结课时七个文件一个一个回头查，看这节课有没有产生要更新的东西。今天至少三处要动：PROJECT_STRUCTURE.md 要记进补课链和 ARCHITECTURE.md；如果冒出新规则要进 COURSE_RULES.md；如果踩了新坑要进 anti-patterns.md。

**harness 产物往上沉淀。** 这门课产出的东西不只服务 study-l3-v2 这一个项目。宪法、权限清单、契约这些，要往上抽成通用的 harness 框架（KNOWLEDGE_BASE 第九块讲的那个终极目标）。

**声明一句：** 以上是我按桥梁第 7 节和第 9 节的措辞复述的。规则 61 的原文我还没读到。你贴回来之后如果有出入，以原文为准，我当场改口。

---

## 五、05-ARCH 大纲（先跟你确认，别急着开工）

### 5.1 一句话目标

用 architect 把"系统架构"落成一份文档：模块怎么划分、前后端怎么分层、数据怎么流、部署拓扑长什么样。

### 5.2 学完这节你会做什么

你会产出 `docs/arch/ARCHITECTURE.md`。

里面每一个架构决策，都能往回追到 PRD、schema 或者技术栈的某一行。追不到的，就是 architect 自己编的，当场打回。

### 5.3 为什么先做架构、再做 API 契约

打个比方。

`prisma/schema.prisma`（Lec 5 已经做完的）是"仓库里有哪些货架"。六张表就是六排货架。

`ARCHITECTURE.md`（今天要做的）是"整个厂区的平面图"。哪个车间干什么活、货从大门怎么走到货架再走回来、门卫和大门摆在哪儿。

`API_CONTRACT.md`（下一节做的）是"车间之间的交接单"。谁给谁递什么、递的时候单子上写什么字段。

**顺序不能反。** 平面图没画，你不知道有几个车间，就不知道要开几种交接单。这就是为什么 05-ARCH 排在 05-API 前面。

### 5.4 建议分五段

第 1 段，**模块划分。** 按 PRD 的业务域切，切出几个模块，每个模块管什么。

第 2 段，**分层架构。** 前端一层、后端一层、共享类型一层，各层的职责边界在哪。

第 3 段，**数据流。** 一个请求从浏览器出发，怎么走到数据库，再怎么走回来。你 Level 1 学过的"浏览器到服务器 9 步"在这里会用上，但这次是你自己项目的具体路径。

第 4 段，**部署拓扑。** Docker 起几个容器、Nginx 摆在哪、谁跟谁通。

第 5 段，**落盘 + 结课挂账。** 把 ARCHITECTURE.md 写进去，然后办第 5.6 节说的三件挂账。

课数弹性（规则 49）：讲到一半发现某段太重，可以拆到下次。不硬赶。

### 5.5 今天的产物清单

一份文件：`docs/arch/ARCHITECTURE.md`。

含四块内容：模块划分、分层架构、数据流、部署拓扑。

配套：这节课的完整版笔记 + 800 字以内速查卡（规则 19）。

### 5.6 结课挂账三件（现在先说，免得结课时漏）

**第一件，settings.json 补规则。**
今天新产生的架构文件属于该守护的产物。要给 ARCHITECTURE / API_CONTRACT / SHARED_TYPES / ENV_DESIGN 这四个在 ask 档补上 Write 和 Edit 规则，写法参照现有的 `Write(prisma/**)`。

Lec 6 建 settings.json 的时候这四个文件还不存在，所以当时没配。现在补。

**第二件，检查是否要推翻 Lec 6 的 D 判断。**
如果架构推导过程中暴露出"某类决策其实该进 D1-D7，但当时没进"，就要回头改 CLAUDE.md 第三层。

宪法先建、细节后填。细节反噬宪法的时候，宪法要回改。这是正常的，不是当初建错了。

**第三件，更新 PROJECT_STRUCTURE.md。**
它现在还不知道有补课这条链。结课更新目录树的时候，顺手把补课计划和 ARCHITECTURE.md 记进去。

### 5.7 这节课对应 KNOWLEDGE_BASE 哪些知识

**角色：** 角色 4 architect（6 必问、四象限决策法、ADR-Lite）。

**协议：** 协议 2 有预算的侦察（让它只读指定的几个文件）、协议 3 证据契约（引用要给"文件:行号"）、协议 5 最多三个澄清、协议 6 影响分析。

**补丁：** 补丁 7 ADR-Lite 三行格式、补丁 11 约束三件套、补丁 16 技术选型四象限。

**强化：** 强化 3 选择题加推荐、强化 16 决策权属归你、强化 5 单一信息源。

**Claude Code 机制：** Subagents（架构师角色）、Permissions（结课挂账要用）。

### 5.8 今天要盯的五个反模式

一条一行，每条我用大白话说一遍它是什么。

**1 号，我凭印象编。** 我没读过的文件，绝不说里面有什么，一律请你贴回。

**3 号，看起来生效不等于真生效。** architect 出现在角色列表里，不代表它的人设进脑子了。要让它先读自己的定义文件才算数。

**7 号，不给路径 AI 就满项目扫。** 所有参考文件必须写死绝对路径，不许说"你找找看"。

**22 号，读中文别用 cat -A。** 会变成一堆乱码。

**34 号，落点别锁死课号。** 说"这个留到第几课"之前，先核对那节课的骨架里有没有这个位置。

### 5.9 第一步会是什么

复用 architect 角色。prompt 第一句让它 `cat` 自己的定义文件，第二句给它 schema、TECH_STACK、PRD 的具体路径，让它基于这三份推导系统架构。

**它做的第一件事应该是提澄清问题（最多三个），不是直接给你架构图。** 上来就给完整架构的，多半是编的。

### 5.10 分段方式请你选一个

**A.** 就按上面五段走。（我推荐这个）

**B.** 把第 1 段和第 2 段合并，模块划分和分层一起讲，四段走完。

**C.** 拆得更细，把第 3 段数据流拆成"读路径"和"写路径"两段。

**我推荐 A。** 理由：五段正好对上 ARCHITECTURE.md 的四个章节加一次落盘，每段一个产出块，节奏有呼吸感，也不至于把架构和分层挤在一起讲糊。

---

## 六、1 分钟复习：两道 Lec 6 的题

不用长篇大论，一两句话说清就行。

**题 1：** D1-D7 是什么？它到底解决什么问题？随便举两个具体的 D 出来。

**题 2：** 语义层和机械层的区别是什么？为什么光有 CLAUDE.md 里的 D1-D7 还不够，还要配 settings.json？

---

## 七、现在请你做三件事

按这个顺序：

**第一，** 跑 git 那三条命令，按情况处理反模式 34 的提交。把 `git status` 和 `git log --oneline -3` 的输出贴回来。

**第二，** 贴回七个文件（可以分两批）。

**第三，** 回答下面的模板。

```
【git】
git status 属于：情况一 / 情况二 / 情况三
git log 最近三条：____

【复习】
题1 D1-D7 是：____
    它解决的问题是：____
    举例：D__ 是____ ；D__ 是____
题2 语义层是：____ ，靠____生效
    机械层是：____ ，靠____生效
    只有语义层的漏洞是：____

【今天的安排】
分段方式我选：A / B / C
精力：A 充沛，可以多推几段
      B 正常，按大纲走
      C 一般，讲慢点讲细点
      D 不足，只讲核心，今天只做第 1 段

【补充/质疑】
____
```

等你回应，我再正式开课。

Human (Sep 7, 2026, 11:18 AM):
think harder。分段方式我选：A 。精力：A 充沛，可以多推几段。补充：不做复习题，直接给我答案。

Claude:
**老师锚点（3 行）**

- 分工：我出讲解和 prompt，CC 执行，你拍板。
- 红线：七个文件我已读到原文，但 CLAUDE.md 和 settings.json 我**没读过**，涉及它们的内容我一律不编。
- 这一步我最可能犯的错：你让我"直接给答案"，我为了给得漂亮，把没读过的 D1-D7 具体内容顺口编出来。下面我不会这么干。

---

# 一、开课自检：读完七文件后的完整汇报

## 1.1 git 那件事：已确认，不是听你说的，是看输出确认的

`534c6f8 docs: 新增反模式 34 落点锁死课号未核骨架` 已在 HEAD。working tree clean。

反模式 34 的提交这件事，属于规则 57 第 11 项要求的"拿真实输出核对"。**我是看到 git log 才确认的，不是你说一句"提交了"我就信。** 这条自检当场就走了一遍实战。

## 1.2 调节器 K 节 1-8

上一轮已逐条报过。读完七个文件后，没有一项需要翻案。不重复占篇幅。

## 1.3 规则 57 第 9-11 项（现在能报了）

**第 9 项，必读文件读全了吗。**
读全了。七个：COURSE_RULES、anti-patterns、TEACHING_STYLE、PROJECT_STRUCTURE、AGENT_SPEC、LESSON_TEMPLATE、BACKLOG。
特别没漏 PROJECT_STRUCTURE——规则 57 专门点名它最容易漏。

**第 10 项，结课会按规则 54 逐条走吗。**
会。今天的结课清单我在第三节写死了，六步加挂账，到时候逐条向你报。

**第 11 项，会拿真实输出核对吗。**
已经在做，见 1.1。

## 1.4 规则 60 开课闸

问："六文件读全了吗"——是。加 BACKLOG（规则 65）共七个，全读。

## 1.5 规则 62 讲解骨架

我清楚 LESSON_TEMPLATE 第 3 块的 3a-3d：
3a 原理（为什么要有这东西）→ 3b 操作（怎么做）→ 3c 复杂产物拆段逐段讲 → 3d 该联动就联动。

今天每个复杂步骤按这个走。下面第四节就是照它写的。

## 1.6 规则 61 复述 + 一处自我更正

上一轮我按桥梁的措辞复述了「开课读全、结课逐查、harness 产物往上沉淀」。

现在读到原文，**我漏了半句，补上：**

> 若发现某类新产物没有任何持久文件接得住，当场新建标准文件或新增规则，不许让它只活在桥梁或对话里。

这半句是规则 61 的牙齿。前面三句只是流程，这半句才是"发现漏洞当场补洞"。上一轮我复述的是无牙版本。

---

# 二、开课体检：读文件读出三处不一致

这不是找茬，是规则 60 要求的"逐个文件问一遍本课有没有该更新它的内容"。开课就能看出来的，现在说，别拖到结课。

## 问题一：PROJECT_STRUCTURE.md 说反模式库是 1-33，实际已到 34

两处写错，都在同一个文件里：

- 目录树里：`anti-patterns.md 反模式库，1-33 号`
- 课程标准文件清单里：`docs/lessons/anti-patterns.md 反模式库 1-33`

实际是 1-34。34 号昨天刚提交（534c6f8）。

**为什么会漏：** 34 号是在补课桥梁产出的过程中记的，不是在某节课的结课流程里记的。规则 54 的结课清单没被触发，所以第 4 步"更新目录树"没跑。

这是反模式 21（立了规则却不执行）的一次轻微复发，但根子不同——21 号是忘了执行，这次是**根本没进结课流程**。补课链游离在结课流程之外。这一点值得留意，后面三节补课同样有风险。

## 问题二：BACKLOG.md 第 9 条重复了两行

文件末尾，两行内容完全相同，都是编号 9、都是"配置文件是攻击面"。

桥梁第 8 节写着「BACKLOG 第 9 条已 amend 并入」。amend 的时候大概率把整行贴了两遍。

不影响使用，但 BACKLOG 是开课必读文件，重复项会让下一个老师以为有两条不同待办。结课顺手删一行。

## 问题三：我上一轮出的复习题，撞了规则 44

规则 44 白纸黑字：

> 本课程取消费曼复述环节（针对该学生节奏）。概念检验改用轻量方式：必要时老师出一道选择题确认，**不让学生写长答案**。

我上一轮给了两道填空题，让你写"D1-D7 是____，语义层是____"。**那就是长答案。**

你回我"不做复习题，直接给我答案"，等于把我拽回了规则 44。你是对的，不是偷懒。

### 拆根因

E4 架构错，不是我一时疏忽。

桥梁第 1 节写了冲突优先级：**本桥梁 > 调节器 > KNOWLEDGE_BASE。**

看出问题了吗——**这条链里没有 COURSE_RULES.md。**

桥梁的启动指令让我"抽 2 道 Lec 6 的题"，COURSE_RULES 44 说"不让学生写长答案"。两边冲突时听谁的，**没有任何文件定义过。** 我在没读到 44 的情况下照桥梁做，做出来就是违规。

这跟反模式 34 是一家的：都是"引用了某个指令，但没对权威源核实"。区别是 34 号讲落点课号，这次讲**优先级链本身缺了一环**。

### 给你选（我不替你拍板）

**A.** 立规则 67，定义桥梁与持久文件的优先级。大意：桥梁只在"本课临时状态和安排"上优先；凡涉及讲课方式、协作规矩、角色标准这类持久规则，以七文件为准。老师读完七文件后，须回头核一遍桥梁启动指令有没有和持久规则打架。

**B.** 只记成反模式 35，不立规则。

**C.** 两个都做：规则 67 定机制，反模式 35 记案例。

**D.** 不记，当一次性失误。

**我推荐 A。** 理由：这是机制上的洞（优先级链少了一环），不是踩坑故事。规则会被"开课必读"自动传给下一个老师，正好是规则 61 说的"没有持久文件接得住就当场补"。

**不阻塞。** 你现在选也行，结课前定下也行。我先记进挂账。

---

# 三、两道题的答案（你要的直给版）

## 题 2 先答，因为这题我答得了

### 语义层和机械层的区别

先打个比方。

你家墙上贴了一张家规：「动到钱的事，先问我。」

这是**语义层**。它管得宽，什么叫"动到钱的事"，人自己会判断。买菜不算，卖房算。它靠的是**看的人读了、懂了、也愿意守**。

你家金库还装了一把锁，刷卡才开。

这是**机械层**。它不理解什么叫"动到钱"，它只认一件事：这扇门，卡对了才开。**不管你想不想守，物理上就是拦住。**

### 对应到你项目里

**语义层 = CLAUDE.md 里的 D1-D7 决策边界。**
它用人话写"哪几类决策必须由项目主人拍板"。CC 读了 CLAUDE.md，理解了，才生效。

**机械层 = .claude/settings.json 的 allow / ask / deny 三档。**
它按文件路径和命令模式匹配。比如 `Write(prisma/**)` 落在 ask 档，CC 想写 prisma 目录就必须先弹窗问你。它不理解"这是不是重要决策"，它只认路径。

### 为什么光有 D1-D7 不够

两个洞。

**洞一：语义层会漂移。**
反模式 17 号写得很清楚——会话一长，CC 就忘了角色设定和规矩。家规还贴在墙上，但它不看了。这时候只有门锁还在工作。

**洞二：语义层没有强制力。**
CC 说"我记得要问你"，跟它真的问你，是两件事。这就是反模式 3 号：**表象成功不等于实质生效。**

### 反过来，为什么光有 settings.json 也不够

机械层只能匹配**可枚举的东西**：文件路径、命令名字。

它表达不了"这个改动里藏着一个该你拍板的取舍"。

反模式 33 号就是活例子——architect 写 ADR 的时候，把「MVP 不做删除功能」（事实）和「连 deleted_at 字段都不预留」（取舍）合成了一条，理由写得特别顺。settings.json 拦不住这个，因为它写的是允许写的文件，路径完全合法。**能拦住它的只有语义层的一句"含取舍的先指出再执行"。**

### 所以 PROJECT_STRUCTURE 那句"两轴垂直"是什么意思

一个管**范围**（哪些事该问），一个管**执行**（问不问得成）。

两者不是上下级，是横竖两根轴。缺哪根都漏。

**今天的结课挂账第一件，干的正是这个：** 四个新架构文件已经在语义层受管（它们是重要产物），但机械层还没给它们配锁。补上 ask 档规则，就是给语义层配机械层。

## 题 1：我答不了全，只能答一半

**我没读过你的 CLAUDE.md。**

D1 到 D7 具体是哪七类决策，我不知道。KNOWLEDGE_BASE 强化 14 只写了一句"七类决策边界，触发时由学生拍板"，没有内容。PROJECT_STRUCTURE 只记了"第三层 A 决策边界 D1-D7（Lec 6 建）✓"，也没有内容。

**我现在如果给你举"D3 是数据库删除策略"这种例子，那是编的。** 反模式 1 号，当场发作。

### 我能答的部分：决策边界解决什么问题

它解决一个很具体的病：**AI 会替你做决定，而且做得看起来很有道理。**

不是它坏。是它被训练成"给出自洽的答案"。碰到一个岔路口，它不会停下来说"这里有两条路，你选"，它会挑一条，然后把理由写得让你觉得没别的选项。

反模式 33 号就是这个病的标本。你上 Lec 5 的时候亲手抓出来过一次。

**决策边界的做法：** 提前把"哪几类岔路口必须停下来问人"写死。不靠 AI 临场判断这件事重不重要，而是事先枚举。

**为什么是七类不是三类或三十类：** 太少覆盖不全，太多等于没有——每步都要问，人就开始无脑点同意，边界就废了。七类是"能记住、且覆盖主要风险面"的量级。

### 需要你补给我

请把这两个文件贴回来。今天要用，理由有三个：

1. 今天的结课挂账要改 settings.json，我得看现在的写法才能给你补规则的模板（**不看就是照记忆编，反模式 1**）。
2. 挂账第二件是"检查架构有没有暴露出该进 D1-D7 却没进的决策"，不知道 D1-D7 是什么，这条根本没法执行。
3. 第 2 段讲分层架构时，CLAUDE.md 第二层 D/E（选型结论、数据模型结论）是依据。

```
cd ~/projects/study-l3-v2
cat CLAUDE.md
cat .claude/settings.json
```

CLAUDE.md 如果很长，只贴**第二层 D、E** 和**第三层全部**就够。

---

# 四、第 1 段 · 模块划分

## 4.1 段落定位

补课 05-ARCH，第 1 段，共 5 段。

整个课程大约走到三分之一（19 课骨架 + 4 节补课，已完成 Lec 0-6）。

上一步：Lec 6 建完宪法三层 + settings.json。
这一步：让 architect 把项目切成几个模块。

## 4.2 这段为什么这么做

**因为不先分模块，后面每一步都没有落脚点。**

API 契约要按模块分组接口。Monorepo 目录要按模块建。NestJS 的 module 要按模块写。三节课都要用这个划分。

## 4.3 核心讲解

### 3a 原理：为什么要有"模块"这个东西

打个比方，这个比方我撑完整段。

你开了一家公司，20 个人。

**不分部门的样子：** 谁都能碰所有事。客户打电话来问退款，接电话的人自己去改账、自己去改库存、自己去发通知。三个月后你想改一下退款规则，发现改不动了——因为改退款的代码散在七个人手里，你不知道漏了哪个。

**分了部门的样子：** 财务管钱，仓储管货，客服管沟通。客服接到退款请求，不自己改账，而是**去找财务**。财务是唯一能动账的人。

你要改退款规则，只需要动财务这一个部门。其他部门是通过"找财务"这个动作连过去的，接口没变，它们不用动。

**模块就是部门。**

分模块真正解决的问题不是"整齐"，是**改动的波及范围可控**。

### 不分会怎样，说具体点

到了 Lec 10 你写后端接口，会遇到一个非常实际的问题：**这个文件放哪个目录？**

没有模块划分的项目，通常会按"技术种类"分目录：所有 controller 一个目录，所有 service 一个目录，所有 model 一个目录。

看起来很整齐。**但你改一个功能，要在三个目录之间来回跳。** 一个功能的代码被拆散在三处，你永远不知道改全了没有。

而按业务域分模块，一个功能的所有代码在一个目录里。改它，只动那一个文件夹。

**所以模块要按"业务域"切，不按"技术层"切。** 这是这一段最重要的一句话。

### 3b 操作：怎么切，靠什么切

依据有三份，都在磁盘上：

- `docs/design/PRD.md` —— 用户故事在这里。故事天然按业务成组（登录相关的、任务相关的、通知相关的），这就是模块的雏形。
- `prisma/schema.prisma` —— 六张表在这里。表和模块要有归属关系。
- `docs/arch/TECH_STACK.md` —— 技术栈决定了模块能怎么组织（monorepo、NestJS 的 module 机制）。

### 一个关键概念：什么叫模块"拥有"一张表

这个概念今天第一次出现，我讲清楚。

**"拥有"的意思是：只有这个模块能写这张表。别的模块想改这张表的数据，必须调用拥有者提供的方法，不能自己直接写。**

回到公司比方：只有财务能动账本。客服想改一笔账，得走财务的流程，不能自己翻账本改数字。

**为什么要有这条：** 如果两个模块都能写同一张表，那么关于"这张表的数据什么时候能改、改成什么样才合法"的规则，就会散在两个地方。两边写得不一样的那天，数据就烂了。而且你排查问题时，永远要同时看两个模块。

**所以今天的硬要求：六张表，每张表有且只有一个归属模块。没人管的表不行，两个主人的表也不行。**

### 3c 拆段讲：这条我先记账

规则 51 和 62 要求复杂产物拆段逐段讲。architect 的输出现在还不存在，等你贴回来，**我会把它的模块清单一个模块一个模块地过**，每个说清"它是什么、为什么要有它、它跟别的模块什么关系"，讲透一个再下一个。

不会整块甩给你说"看一下没问题就落盘"。

### 3d 联动讲解：这个产物被三节课用

规则 16 的触发条件命中了——**产物被 2 节以上后续课用到**，所以这里必须做联动。

模块划分定下来之后：

- **05-API（下一节）：** API 契约按模块分组。有几个模块，接口清单就有几组。模块切错，接口分组跟着错。
- **Lec 7 Monorepo：** 后端目录结构按模块建文件夹。这是模块划分第一次变成真实目录。
- **Lec 10 后端 MVP：** 每个模块对应一个 NestJS module。

**所以今天这一步的返工成本，是三节课。** 现在多花十分钟核对，比 Lec 10 才发现切错了划算得多。

### Level 1 对应

**网页版时代你怎么做这件事：**

Claude 网页版读不到你的仓库。你要讨论架构，得把 PRD、schema 手动复制粘贴进对话框。

三个痛点：

一，喂进去的是**快照**。你贴的时候是什么样就是什么样，文件后来改了它不知道。
二，架构结论**只活在那个对话窗口里**。换个窗口，重新粘贴，重新讨论。
三，它引用你的东西时**给不出出处**。它只能说"根据你提供的 schema"，没法说"schema.prisma 第 42 行"。协议 3 证据契约在网页版是**没法真正执行的**，因为双方看的不是同一份磁盘文件。

**现在升级成什么：**

architect 是独立 context 的 subagent，**直接读磁盘上的真文件**。

- 它读的是当前版本，不是你三天前贴的快照。
- 它的输出你 `cat` 落盘成 ARCHITECTURE.md，后面每节课都能引用。
- 它能给出 `文件:行号`，**你能当场翻开核对**。协议 3 到这一层才真正落地。

这就是 Level 1 到 Level 3 的差别：**从"给 AI 看东西"变成"AI 住在你的项目里"。**

### 对应 KNOWLEDGE_BASE 哪些知识

- 角色 4 · architect（Read-only、先读定义文件）
- 协议 2 · 有预算的侦察（限定读三个文件，读完即停）
- 协议 3 · 证据契约（结论给 文件:行号）
- 协议 5 · 最多三个澄清（下面 prompt 第一部分）
- 强化 3 · 选择题 + 推荐（澄清问题要给 A/B/C）
- 强化 16 · 决策权属（取舍抛回给你，不许它自己咽）
- CC 机制 · Subagents

## 4.4 模式归属

**这步不切 Plan Mode。**

理由：architect 只有 Read 权限，不改任何已有文件，只产文本。规则 28 说的"改已有代码才切 Plan Mode"不适用。

切了反而多一轮无谓确认，浪费你一次回车。

**Plan Mode 是键盘状态，要切也是你按键盘（Shift+Tab 两次 / Alt+M），不是 prompt 里写字能切的（反模式 15）。** 下面的 prompt 正文里一个字都不会提模式。

## 4.5 建议模型

**Opus。**

理由：模块划分是权衡活，不是执行活，值得多花推理。

补一句：`.claude/agents/architect.md` 的 YAML 头里已经标了 `model: opus`（PROJECT_STRUCTURE 记着的）。子代理按自己的 model 跑，**你不用手动切**，主对话在 Sonnet 也不影响。

## 4.6 CC 的 prompt

调用方式沿用你 Lec 4/5 调 architect 的老办法（`@architect` 还是让主对话委派）。**这块你比我清楚你那边的手感，我不编。**

```
读 .claude/agents/architect.md，按里面的定义激活自己，然后开始下面的任务。

任务：产出【系统架构的第一块：模块划分】。只做模块划分。不做分层，不做数据流，不做部署拓扑，不设计 API。

只读这三个文件，读完即停，不要再读别的，也不要 grep 全项目：
docs/design/PRD.md
prisma/schema.prisma
docs/arch/TECH_STACK.md
如果你认为还需要别的文件才能下判断，不要自己去找。在输出里写明「需要哪个文件、为什么需要」，然后停下。

输出四个部分，按顺序：

第一部分 · 澄清问题
最多 3 个，只问不问就无法下判断的。每个问题给 A/B/C 选项，写出你推荐哪个和一句话理由。决定权在项目主人，你不许自己拍板。没有必须问的就写「无」。

第二部分 · 模块划分建议
列出你建议的模块。每个模块交代五件事，缺一不可：
1. 模块名（英文小写）
2. 一句话职责
3. 覆盖 PRD 里哪些用户故事（给编号）
4. 拥有哪些数据表（拥有 = 只有这个模块能写这张表）
5. 依赖哪些别的模块（谁调谁）
schema 里的每一张表都必须有且只有一个归属模块。不许有没人管的表，也不许两个模块同时拥有一张表。确实难归属的，单独列出来说明理由，不要强行塞。

第三部分 · 需要项目主人拍板的取舍
凡是「可以这样也可以那样，选哪个取决于偏好或长期打算」的地方，单独列出来，写清两边各自的代价。不要把取舍藏进论证里直接给结论。

第四部分 · 出处
第二部分每条关键结论，标明依据哪个文件的哪一行，写成 文件路径:行号。凭推理得出、文件里没有直接依据的，明确标「推导，无直接出处」。

其他要求：
发现 PRD、schema、技术栈三者之间有冲突、缺口或过时措辞，先指出再继续，不要顺着写。
不确定的地方明说「此处不确定」，禁止猜文件路径、表名、字段名。
篇幅 800 到 1200 字左右，不必精确，差不多即可。
不要创建或修改任何文件。
输出完这四部分就停下，等项目主人回应。
```

## 4.7 prompt 关键点（配反例）

**第一句为什么是"读你自己的定义文件"。**

反例：直接写"你是架构师，请划分模块"。
后果：它确实会给你一份模块清单，看着还挺像样。但它没读过 `architect.md`，所以不知道自己是 Read-only、不知道 6 必问、不知道要写 ADR。**角色出现在列表里，不等于人设进了脑子**（反模式 3 号）。

**为什么把可读文件写死成三个。**

反例：写"参考项目里的需求文档和数据模型"。
后果：它开始 grep 整个项目，翻 docs 下十几个文件，token 烧掉一大半（反模式 7 号）。而且它可能读到 `docs/lessons/` 下的课程笔记，把讲课内容当成项目需求。

**为什么写"发现冲突先指出再继续"。**

反例：不写这句。
后果：CC 会顺着你给的材料写，哪怕材料自相矛盾（反模式 16 号，谄媚式同意）。而你的 PRD 里**确实有已知的口径冲突**——反模式 31 号记着，早期宽口径故事和后补的权限矩阵字面打架，靠澄清注记对齐的。architect 撞上这个的概率不低。**它撞上时应该指出来，不是替你圆过去。**

**为什么第三部分要单独列取舍。**

这是反模式 33 号的解药，你上 Lec 5 亲手用过一次。

AI 做权衡时倾向给"自洽且合理"的单一结论，把决策点藏进论证里。模块划分里必然有取舍——比如通知功能是独立模块还是挂在任务模块下，两种都能跑，选哪个取决于你打算不打算把通知做重。

**这类决定归你，不归它（强化 16）。** 不逼它单独列，它就自己咽了。

**为什么结尾写"输出完就停下"。**

反例：不写停止条件。
后果：它做完模块划分，觉得"顺手把 API 也设计了吧"，一路冲到接口清单（规则 43，防无终点指令）。今天只要模块划分，冲过头的部分你还得回头验，反而更慢。

## 4.8 审查清单

它输出后，对着这九条逐条核。**审 CC 输出的是你，不是我审你。**

- [ ] 开头有没有实际读 `architect.md` 的动作，而不是只回一句"好的"
- [ ] 每个模块是否都给齐了五件事，有没有哪个模块漏了"拥有哪些表"
- [ ] schema 里六张表**是否全部有归属**，有没有孤儿表
- [ ] 有没有出现两个模块共同拥有一张表
- [ ] 出处随机抽 1-2 条，**真的翻开文件对一下行号**，不要只看它写了就信（反模式 4 号）
- [ ] 第三部分是不是真的列了取舍，还是写了"无"糊弄过去
- [ ] 澄清问题是否 ≤3 个，且是 A/B/C 选择题形式
- [ ] 有没有越界创建或修改文件（它只有 Read，一旦动了文件就是异常，立刻告诉我）
- [ ] 有没有越过模块划分冲到 API 设计

**第五条我单独强调一句。** 出处这东西，AI 最容易给一个格式正确但行号错误的引用。**格式对不代表内容对。** 抽查两条，二十秒的事。

## 4.9 反馈模板

```
【architect 输出】
（整段贴回）

【审查清单】
读定义文件：有 / 无
五件事齐全：齐 / 缺（缺哪个模块的哪一项：____）
六表全有归属：是 / 否（孤儿表：____）
一表两主：有 / 无
出处抽查：抽了____，对得上 / 对不上
第三部分取舍：有 / 写了"无"
澄清问题：__ 个，选择题形式 是 / 否
越界改文件：有 / 无
冲到 API：有 / 无

【我的判断】
____
```

---

# 五、你现在做三件事

一，跑 4.6 的 prompt，输出贴回来。

二，贴 CLAUDE.md（第二层 D/E + 第三层）和 settings.json。这两个跟第一件是并行的，不用等。

三，第二节问题三的 A/B/C/D 选一个，或者说"结课再定"。

---

# 六、结课挂账（滚动清单，结课时我逐条报）

1. settings.json 补 ask 档规则，覆盖四个新架构文件
2. 检查架构有没有暴露出该进 D1-D7 却没进的决策，有就回改 CLAUDE.md 第三层
3. PROJECT_STRUCTURE.md 把"反模式库 1-33"改成 1-34
4. PROJECT_STRUCTURE.md 记入补课链和 ARCHITECTURE.md（规则 52，排最后一个文件动作）
5. BACKLOG.md 删掉重复的第 9 条
6. 规则 67 / 反模式 35 的入库（等你选）
7. 两份笔记：`docs/lessons/05-arch-full.md` + `05-arch-cheatsheet.md`
8. git 提交 → 发桥梁（规则 45，桥梁必须是最后一个产出）

---

**窗口体感（规则 38）：** 现在很宽裕。这一段吃掉的主要是七个文件的阅读量，后面四段都是增量。按目前节奏，五段走完再出桥梁，撑得住，不用中途换窗口。

Human (Sep 8, 2026, 9:41 AM):
第二节问题三的 A/B/C/D 选一个：A

Claude:
**老师锚点（3 行）**

- 分工：架构师给了选项，我给分析和推荐，**八个决定全归你拍板**。
- 红线：PRD.md 我仍然没读过。架构师引的 PRD 行号我一条都没核过，下面凡是依赖它的地方我会标出来。
- 这一步我最可能犯的错：架构师这份输出写得很漂亮、逻辑很顺，我顺着它讲一遍就完事，不去核那个对不上的地方。

---

# 一、规则 67 定稿（你选了 A）

文本定了，结课和其他文件一起落盘。

```
## 67 · 桥梁与持久文件的优先级
桥梁只在「本课临时状态」上优先：进度、接续、本课安排、git 状态、待办交接。
凡涉及讲课方式、协作规矩、角色标准、段落骨架、结课流程这类持久规则，以开课必读七文件为准，桥梁无权覆盖。
老师读完七文件后，须回头核一遍桥梁的启动指令与持久规则有没有打架。发现打架，当场向学生说明，按持久文件执行，并记进本课挂账。
与调节器第 1 节「桥梁 > 调节器 > KNOWLEDGE_BASE」的关系：叠加限定，不替代。那条链解决的是「三份开课资料之间」的冲突；本条解决的是「桥梁 vs 学生机器上的七文件」，是原链没覆盖的一环。
案例：05-ARCH 桥梁启动指令要求「抽 2 道题让学生口答」，撞规则 44「不让学生写长答案」。老师在未读 COURSE_RULES 时照桥梁做，做出来就违规。
```

---

# 二、审查诊断：九条逐条报

规则 26 要求逐条对，不许"没问题"一句带过。

**读定义文件：** 声称有。**但这里对不上，见 2.1。**

**五件事齐全：** 齐。六个模块每个都给了名字、职责、覆盖故事、拥有表、依赖。

**六表全有归属：** 我自己数了一遍。users→users，sessions→auth，projects+project_memberships→projects，tasks→tasks，notifications→notifications。六张全有主。✓

**一表两主：** 无。✓

**第三部分取舍：** 真的列了四项，没写"无"糊弄。**这条我要单独夸一句，见 2.2。**

**澄清问题：** 3 个，全是 A/B/C + 推荐 + 一句理由，格式合规。✓

**越界改文件：** 声称未创建或修改。**但见 2.1。**

**冲到 API：** 没有。严格停在模块划分，一个接口都没设计。✓

**出处抽查：** **我没法替你查。** 我没有 PRD.md 和 TECH_STACK.md，行号全是二手转述。命令在第四节。

**我额外补了一条它自己没自检的：依赖有没有成环。** 见 2.3。

## 2.1 头一行和正文对不上

看输出最上面那行：

> Read 3 files, ran 1 shell command

再看正文第三行：

> 已读 4 个文件（含角色定义）

**读了 3 个还是 4 个？多出来的那次 shell command 是什么？**

最可能的解释是：有一个文件是用 `cat` 命令读的，不是用 Read 工具读的。所以工具计数器记成"3 次 Read + 1 次 shell"。

**为什么这件事值得停下来查。**

AGENT_SPEC.md 的权限表写得很死：

> 文档类角色（client / persona / pm / designer / architect）：只给 Read。
> 任何角色都不默认给 Bash，需要才显式加并说明理由。

如果 `architect.md` 的 YAML 头里 `tools` 含 Bash，那这个角色文件**偏离了标准图纸**。这是反模式 23 的家族（有样品无标准，或有标准没照着做）。

如果不含 Bash，那这条 shell command 是主对话跑的，架构师本身干净，虚惊一场。

**两种情况处理方式完全不同，所以必须先看，不能猜。**

这也是规则 57 第 11 项的实战：拿真实输出核对，不轻信"未 grep，未超预算"这句自我声明。**它说它没越界，跟它真没越界，是两件事。**（反模式 4：AI 出错后编理由；反模式 3：表象成功不等于实质生效。）

## 2.2 一个真该夸的地方：第三部分没被咽下去

架构师给出了四项取舍，一项都没藏进论证里。

**对比一下 Lec 5。** 那次它把「MVP 不做删除功能」和「所以连 deleted_at 都不预留」合成一条 ADR，理由写得特别顺，你亲手把它拆开的，才有了反模式 33。

这次它主动拆了。而且第三部分第 1 条明确写"独立：符合 D3 安全边界；并入：调用链短"——**两边的代价都写出来了，没有偏袒。**

**这是宪法在起作用，不是运气。** 具体是哪一条起的作用，第五节讲。

## 2.3 我补的自检：依赖无环

模块划分有一条硬标准，架构师没自检，我替你核了。

**为什么这条重要。** 打个比方。

A 部门办事要先问 B 部门，B 部门要先问 C 部门，C 部门又要先问 A 部门。三个部门互相等，谁都动不了。

代码里也一样。模块循环依赖，NestJS 启动时会直接报循环引用错误，或者要用一堆 `forwardRef` 绕，绕出来的代码谁都不敢碰。

**核的结果：**

- users 不依赖任何人
- auth → users
- projects → users
- authz → auth、projects
- tasks → projects、users、authz
- notifications → tasks、users

箭头全部指向"更基础"的方向，**没有一条回头箭头。无环。** ✓

顺带一个观察，对后面排课有用：**tasks 模块背了 8 条用户故事，其他五个模块加起来 6 条。** Lec 10 写后端时，tasks 一个模块的工作量约等于其余五个之和。心里有个数。

---

# 三、六个模块逐个过

规则 51 要求复杂产物拆段讲，一个讲透再下一个。不整块甩给你说"看着行就落盘"。

**1. users —— 拥有 users 表**

用户档案的唯一写入者。别人想查人（比如按邮箱找被邀请的同事），来这里查。
我的看法：**站得住。** 它不依赖任何模块，是整张依赖图的地基。

**2. auth —— 拥有 sessions 表**

管注册、登录、登出、会话生命周期。
我的看法：**站得住，而且和你的选型咬合得很好。** CLAUDE.md 第二层 D 写了「鉴权 = DB session，不是 JWT」。用 JWT 的话根本没有 sessions 表，也就没有这个模块该拥有的东西。**你在 Lec 4 选了 DB session，Lec 5 建了 sessions 表，今天这个模块自然长出来。这条链是通的。**

**3. authz —— 不拥有任何表**

把"谁在哪个项目是什么角色"翻译成放行或拒绝，落在 NestJS 的 Guard 上。
我的看法：**这是六个里最需要你注意的一个**，因为它不拥有表。它只读 project_memberships，写权在 projects。读写分家，是取舍 1 要你拍的。

**4. projects —— 拥有 projects + project_memberships**

项目容器，加成员和角色的唯一写入者。
我的看法：**站得住。** 一个模块拥有两张表不违规，规矩是"一张表只能有一个主人"，不是"一个主人只能有一张表"。project_memberships 是项目和成员的中间表，跟着 projects 走很自然。

**5. tasks —— 拥有 tasks 表**

创建、分配、状态流转、截止日期、列表、汇总。
我的看法：**最重的模块**，见 2.3。汇总要不要留在这儿，是决策 5。

**6. notifications —— 拥有 notifications 表**

站内通知的写入和已读。
我的看法：**本版是个空壳。** 唯一的通知类型是 stuck_task，而卡点预警 US-02b 是 P2 延后。这是决策 4。

---

# 四、先跑这一段（四件事一次核完）

```
cd ~/projects/study-l3-v2
head -10 .claude/agents/architect.md
sed -n '155,162p' docs/design/PRD.md
sed -n '68,76p' docs/design/PRD.md
sed -n '52,60p' docs/arch/TECH_STACK.md
```

四件事分别核什么：

**第一条**，architect 的 YAML 头。看 `tools` 有没有 Bash，顺带确认 `model: opus`。对应 2.1。

**第二条**，PRD.md:158 附近。架构师说这里写着"姓名或邮箱"，**决策 2 的推荐整个建立在这句话上。** 如果原文其实是硬要求姓名，推荐就得翻。

**第三条**，PRD.md:72 附近。架构师说 US-04 验收要"距 deadline 不足设定天数"。**决策 6 完全取决于这句原话是硬验收还是描述性文字，我不看到原文不给推荐。**

**第四条**，TECH_STACK.md:56 附近。架构师说这里写着"任务表预留外键挂载位"，但 schema 里没有。对应决策 7。

---

# 五、八个决策，你来拍板

架构师给的三个澄清问题和四项取舍，有重叠，我合并重排了。合并逻辑写在每条里。

## 决策 1 · users 和 auth 拆还是合

合并了架构师的 Q1 和取舍 3。同一个问题问了两遍。

打个比方。

**合并（A）= 人事部和门禁室合成一个部门。** 门禁室管刷卡进出，人事部管员工档案。合并之后，别的部门想查一个人的档案，得去门禁室问。

**拆开（B）= 人事部管档案，门禁室管进出。** 门禁室要给新人发卡，先去人事部核对这人是不是员工。别的部门查档案直接找人事部，不绕门禁室。

**选项：**
A. 合并成一个 auth 模块，同时拥有 users + sessions
B. 拆成 users + auth，注册时 auth 调 users 建账号
C. 拆开但 auth 直接写 users 表

**C 先排除。** 架构师说得对：auth 和 users 都能写 users 表，就破了"一张表一个写入者"。这条铁律今天已经用了六次，不能第一天就破例。

**我推荐 B。** 三条理由：

一，**projects 模块要按邮箱找被邀请人。** 选 A 的话，"邀请同事"这个动作要去调"认证模块"。语义上很别扭，Lec 10 写代码时你每次都得在脑子里翻译一次。

二，**这是 NestJS 的惯用结构。** 官方 auth 教程就是 UsersModule + AuthModule，AuthModule imports UsersModule。顺着框架的纹理走，Lec 10 少一层自创约定。

三，一表一主保住了。

**诚实说代价：** 六个模块里有两个围着"用户"转，看着有点碎。而且本版的 auth 模块很薄，就注册登录登出三个接口。**如果你觉得碎，A 也不算错，只是要接受邀请功能绕道认证模块。**

## 决策 2 · 要不要给 users 加 name 列

合并了 Q2 和冲突 1。**依赖第四节第二条命令的结果。**

**先讲一个判断方法，这个方法后面会反复用。**

你可能会想：这不就是反模式 33 吗？「本版不做姓名功能」是事实，「所以不加 name 列」是取舍，取舍归我。

**形状确实一样，但答案不一样。** 关键在一把尺子：**将来补的时候，贵不贵。**

对比一下软删除那件事（BACKLOG 第 8 条）。将来加 deleted_at，你要做三件事：加列、改掉所有查询让它们过滤已删除的、处理软删除和 email 唯一约束的冲突。**这是砸墙，很贵。所以当初不预留是个真取舍。**

再看 name。将来加 name，你要做：加一个可空列，UI 显示的地方做个兜底（有 name 显示 name，没有显示 email）。**没有数据迁移，没有约束冲突。这是加个挂钩，很便宜。**

CLAUDE.md 的 D2 就是这么写的：可空加列可自行处理，drop 有数据的表才必喊主人。**它已经把"可空加列"划进便宜那一档了。**

**所以：同样是"现在不做所以不预留"，软删除该慎重，name 可以放心推迟。判据不是形状，是将来补贵不贵。**

**选项：**
A. 本版不加，界面一律显示 email
B. 现在就加可空 name 列
C. 暂缓，等 API 契约阶段再定

**我推荐 A。** 理由：将来补的成本约等于现在做的成本，而现在加了，就要连带做注册表单收姓名、个人设置改姓名、所有显示位置兜底——**它不是一个字段，是一整条 UI 链路。** MVP 少一条是一条。

**C 排除。** 反模式 9 号：一部分没好就把整件事推迟。这件事现在就能定，没有任何信息缺口，推到下一节只是把决定往后挪。

**但这条有前提：PRD.md:158 原文得真的允许显示邮箱。** 命令跑完你看一眼再定。

## 决策 3 · authz 独立还是并进 projects

**选项：**
A. authz 独立成模块
B. 并进 projects 模块

**我推荐 A 独立。** 两条理由：

一，**D3 把权限口径定为安全边界。** 安全边界的规则一旦散开就会漏。加一个角色、改一条权限，你希望只改一个地方，而不是在 projects 模块里翻三个文件找权限判断散在哪。

二，**authz 不拥有表，它天生就不该住在某个业务模块里。** 它是横切的，NestJS 的 Guard 本来也是横切注册。硬塞进 projects，等于让一个管全项目的东西住在一个业务域里。

**诚实说代价：** authz 要读 project_memberships，而写权在 projects。读和写分在两个模块，Lec 10 写代码时 authz 要 import projects。多一次跨模块调用。

架构师自己在"难归属项"里也提了另一条路：**把 project_memberships 直接划给 authz。** 我不推荐——邀请成员、分配角色这些**写**操作明显属于项目管理，不属于鉴权。硬划过去反而是为了让边界好看而扭曲语义。

## 决策 4 · notifications 本版落不落地

合并了取舍 2 和冲突 3。

**先把三件事分清，这三件经常被混成一件：**

一，**表已经建了。** schema.prisma 里有 notifications。既成事实，今天不动。
二，**模块要不要出现在架构图里。** 这是现在问的。
三，**通知功能什么时候真写。** 那是 Lec 13 的事。

**选项：**
A. 架构图里保留 notifications 模块，明确标"本版空壳，Lec 13 填充"
B. 架构图本版不列它，Lec 13 再加
C. 本版就把通知写入和已读接口写出来

**我推荐 A。**

**C 先排除。** 写没人调用的代码，直接违反 CLAUDE.md 第二层 D 的选型方针：「MVP 先跑通，扩展留接口；不为以后可能用提前堆」。

**B 的问题在于**：表已经在 schema 里了。架构图不提这个模块，"六张表全部有归属"这条自检当场就挂。而且下一节做 API 契约时，会有人问"notifications 表归谁管"，又要回头补。

**A 背后有个概念值得记住：架构文档里的模块，不等于本版要写的代码。**

**架构图是地图，地图上可以标"此处将建"。** 空着不画，和画出来标明状态，对后面的人是两种体验。后者告诉他"这里有个位置，已经想过了"；前者让他以为"这里没人想过"。

## 决策 5 · US-05 进不进本版（连带决定汇总放哪）

合并了 Q3 和取舍 4。**这两个是同一个决定的两半，架构师把它们拆在第一部分和第三部分，容易让人分开答。**

**为什么是一半：** Q3 问的是"US-04 项目汇总、US-05 跨项目总览放哪"。但如果 US-05 根本不进本版，Q3 就只剩 US-04 单项目汇总——**并进 tasks 毫无争议，根本不用讨论。**

所以正确顺序是：先定 US-05 进不进，Q3 自动有答案。

**这里有个 PRD 口径不一致值得指出。**

CLAUDE.md 第二层 B 里，两条 P2：

- US-05 跨项目总览 —— P2
- US-02b 卡点主动预警 —— P2（延后）

**同样是 P2，一个标了延后，一个没标。** 而 PRD 里 US-05 写的是"资源允许时做"，是句没结论的话。

反模式 31 讲过：PRD 里的模糊措辞会一路传到下游，直到 designer 或 architect 撞上才发现。**今天就是撞上了。**

**选项：**
A. US-05 明确延后，和 US-02b 口径拉齐。汇总只做 US-04，并进 tasks
B. US-05 进本版。tasks 模块需要一条绕过单项目边界的跨项目查询路径
C. 保持"资源允许时做"不表态

**我推荐 A。** 四条理由：

一，**模块边界干净。** 跨项目查询要绕开 authz 的项目级权限模型，那是本版最不想碰的地方。
二，**两条 P2 口径拉齐**，PRD 里少一句模糊话。
三，**Lec 13 是功能迭代课，US-05 正是那节的料。** 不是砍掉，是排期。
四，**C 等于把今天的问题原样传给下一节。** 反模式 9 号，该现在做的现在做。

## 决策 6 · projects 表要不要加 deadline —— 我先不给推荐

架构师指出：US-04 的验收标准里有"距 deadline 不足设定天数"（PRD.md:72），但 Project 表只有 name，没有 deadline。deadline 只存在于任务级的 dueAt。

**这条我不给推荐，因为我在做一件我刚批评过的事的边上。**

我手上关于 PRD.md:72 的全部信息，是架构师的一句转述。**我要是基于转述给你推荐，就是拿二手信息替你做决策。**

协议 3 证据契约要求给行号，图的就是这个——**行号是给你去翻的，不是给你看格式对不对的。**

先看第四节第三条命令的输出，然后从下面选：

A. 给 projects 加可空 deadline 列（D2 说可空加列可自行处理，但会连带影响 UI 和 PRD 口径）
B. US-04 的这一条验收降级，跟 US-02b 一起延后
C. 不加字段，用任务级数据聚合出项目风险信号（比如逾期任务数），满足"进度视图"的实质

**我唯一现在能说的一句提醒：C 有个陷阱。** "项目 deadline"是人设定的目标日期，"最早的任务 dueAt"是子项的推导值。**两者语义不同。** 用后者顶替前者，界面上写着"项目截止"，底下其实是"最早那个任务的截止"，日后一定出问题。

C 要成立，得改成"用逾期任务数当风险信号"，而不是"用 dueAt 冒充 deadline"。

## 决策 7 · TECH_STACK.md 措辞过时 —— 建议记账不阻塞

架构师说 TECH_STACK.md:56 写着"任务表预留外键挂载位"，但 tasks 表实际没有任何预留外键。

**这不是今天的决定，但它可能比看上去严重。**

TECH_STACK 是 Lec 4 定的，schema 是 Lec 5 建的。如果原文真是那个意思，**那 Lec 4 定下的一条设计，在 Lec 5 建表时被静默丢掉了，没人发现。**

也可能只是措辞模糊，"预留挂载位"指的是别的东西。

**建议：** 记进挂账，结课时对着第四节第四条命令的输出，看原文再定改哪边。今天不阻塞模块划分。

## 决策 8 · 宪法层的发现：D1-D7 缺一条

这是结课挂账第二件（检查架构有没有暴露出该进 D1-D7 却没进的决策）。**我提前做了，因为今天的证据够足。**

**先说好消息：D1-D7 今天基本全部经受住了。**

- 模块边界 → D4 架构
- 加 name / 加 deadline → D2 数据结构演进
- US-05 进不进 → D1 范围取舍
- authz 独立与否 → D3 权限口径
- notifications 落不落地 → D1 范围
- 第三部分那四项取舍能被抛出来 → **D7 元触发器**

**特别说一句 D7。** 第三部分之所以存在，就是 D7 那句口令在起作用：

> 这里面有没有藏着一个该我拍的取舍？

Lec 6 你建这条的时候，它还只是一句写在文件里的话。今天它第一次产生了看得见的产出。

**现在说缺口。**

架构师一口气指出了四处冲突：PRD 要姓名但 schema 没有、US-04 要 deadline 但 projects 没有、notifications 表无生产者、TECH_STACK 措辞和 schema 对不上。

**"两份已定的文档互相打架，改哪一份、以谁为准"——这类决定，D1 到 D7 里没有任何一条管。**

D6 管的是需求来源验货（已验证 / AI 假设 / 教学驱动），管的是**一条需求的出身**，不管**两份已决文档之间的矛盾**。

**关键论据在这里：今天没漏，是因为我在 prompt 里补了一句"发现冲突先指出再继续"。**

**是 prompt 兜住的，不是宪法兜住的。**

下次换个老师、换个 prompt，不写这句，CC 就会顺着写下去，或者自己挑一边改了。这正是反模式 25：**制度只保证本次执行，不保证传承延续。**

而且这个坑你们已经踩过三次了——反模式 26（新旧制度没说清衔接）、31（新旧措辞不对齐）、34（落点没对权威源核实）。**同一个家族，三条案例，宪法层一直是空的。**

**选项：**

A. 新增 D8 文档口径冲突：CC 发现两份已决文档或措辞互相矛盾时，只报不改，由主人裁决以谁为准
B. 并进 D7 元触发器，认为"文档冲突"算"缺上下文"
C. 不进宪法，继续当反模式家族处理

**我推荐 A。**

**为什么不选 B。** D7 的触发条件是"没把握、缺上下文、藏着取舍"。**但 CC 发现文档冲突时，它往往很有把握**——它一眼就能看出哪份更新。有把握，就不触发 D7，它就直接挑一边改了。今天它没这么干，是因为 prompt 逼它。

**诚实说代价：** D1-D7 变 D1-D8，你要多记一条。但这一条是"发现矛盾时的动作"，形状简单，好记。

**这一条你也可以说"结课再定"，不阻塞。**

---

# 六、你现在做两件事

**一，** 跑第四节那段命令，四个输出贴回来。

**二，** 回下面的模板。**决策 6 你可以看完 PRD 原文再答，其余六个现在就能定。**

```
决策1 users/auth：A 合并 / B 拆开（推荐B） / C
决策2 name 字段：A 不加（推荐A） / B 现在加 / C 暂缓
决策3 authz：   A 独立（推荐A） / B 并进 projects
决策4 通知模块： A 保留标空壳（推荐A） / B 不列 / C 现在写
决策5 US-05：   A 延后+汇总并入tasks（推荐A） / B 进本版 / C 不表态
决策6 deadline： A 加列 / B 降级延后 / C 用逾期数替代 / 待看PRD原文
决策7 TECH_STACK：结课处理 / 现在处理
决策8 立不立D8： A 新增D8（推荐A） / B 并进D7 / C 不进宪法 / 结课再定

补充或质疑：____
```

---

# 七、挂账更新

1. settings.json 补 ask 档规则，覆盖四个新架构文件
2. **规则 67 落盘**（文本已定稿，见第一节）
3. **D8 落盘**（若决策 8 选 A）
4. 决策 7：按原文修 TECH_STACK.md:56
5. PROJECT_STRUCTURE.md：反模式库 1-33 → 1-34
6. PROJECT_STRUCTURE.md：记入补课链和 ARCHITECTURE.md（规则 52，排最后）
7. BACKLOG.md：删掉重复的第 9 条
8. **architect.md 的 tools 字段**（若含 Bash 且无理由，按 AGENT_SPEC 处理）
9. 两份笔记 → git 提交 → 发桥梁（规则 45，桥梁最后）

---

**窗口体感（规则 38）：** 第 1 段的重量超出预期——架构师一次抛回八个决定。但都是真问题，不是它话多。你这一轮回完，第 1 段就能收，然后进第 2 段分层架构。**五段走完再出桥梁，仍然撑得住。**

Human (Sep 8, 2026, 3:20 PM):
我重启了VS code。里面的Claude产出的内容不见了

Claude:
**老师锚点（3 行）**

- 分工：先确认损失范围，再谈恢复。恢复方式我给命令，你跑。
- 红线：会话恢复这件事我给的是操作路径，**不保证一定找得回**。找不回也不影响今天的进度，理由见下。
- 这一步我最可能犯的错：为了让你安心，把"应该能恢复"说成"一定能恢复"。

---

# 一、先说结论：真正重要的东西一样没丢

三条，一条一条说。

## 1.1 磁盘上什么都没变

架构师是 Read-only 角色。它自己在输出末尾写着「未创建或修改任何文件」。

**所以你重启前后，项目文件是一模一样的。** 没有半成品文件，没有写坏的文件，没有需要清理的残留。

git 停在 `534c6f8`，working tree clean。跟你上一次贴给我的时候完全一致。

## 1.2 架构师那份输出，完整地在这个聊天里

你上一轮把它整段贴回来给我了。

**那 1 分 11 秒的 opus 推理，全文都在我们这个对话里。** 包括：

- 四处冲突（姓名字段、项目 deadline、通知表空转、TECH_STACK 措辞过时）
- 三个澄清问题
- 六个模块的完整划分
- 四项取舍
- 全部出处行号

一个字都没少。**你贴回来这个动作，无意中救了它。**

## 1.3 下一步本来就不需要那个会话

这条是最实在的。

第 1 段接下来要做两件事：**跑四条终端命令** 和 **你拍板八个决定**。

四条命令是普通的 `head` / `sed`，在任何终端里都能跑，不需要 Claude Code。八个决定在你脑子里，不在 CC 的上下文里。

**架构师下一次登场是第 2 段（分层架构）。到那时候它本来也要重新读一遍自己的定义文件。**

这是规则 27 定死的：跨会话、压缩后、长会话后，角色必须重读定义。反模式 17（长会话角色漂移）就是这么防的。

打个比方。

那位架构师顾问回家了。你重启，等于他今天下班早了点。**但他交上来的那份报告在你桌上，一页没少。** 明天他来上班，进门第一件事本来也是重新翻一遍自己的职责说明书。

**所以：损失是零。** 不是"损失可以忽略"，是真的零。

---

# 二、别信我说的，自己验一遍

验证先于信任。这是三大信仰第二条，用在我身上也一样。

这段命令做两件事：确认磁盘没变，顺带把上一轮欠的四条核对一起跑了。一次贴回来就行。

```
cd ~/projects/study-l3-v2
git status
git log --oneline -1
ls -la docs/arch/
echo "----- 以下是上一轮欠的四条 -----"
head -10 .claude/agents/architect.md
sed -n '155,162p' docs/design/PRD.md
sed -n '68,76p' docs/design/PRD.md
sed -n '52,60p' docs/arch/TECH_STACK.md
```

**前三条预期看到什么：**

- `git status` → nothing to commit, working tree clean
- `git log` → 534c6f8
- `ls docs/arch/` → **只有 DECISIONS.md 和 TECH_STACK.md 两个文件。ARCHITECTURE.md 不该存在。**

第三条是关键。如果 `docs/arch/` 里冒出了 ARCHITECTURE.md 或别的什么，说明架构师那句"未创建或修改任何文件"是假的（反模式 4：AI 出错后编理由）。那就是另一件事了，立刻告诉我。

后四条的作用不变，见上一轮第四节。

---

# 三、想找回会话的话

**先说清楚：这一步是可选的。** 不做也不影响今天。

## 3.1 会话记录不在项目目录里

Claude Code 的会话记录存在 `~/.claude/projects/` 下面，不在 `~/projects/study-l3-v2/` 里。

**所以它跟你的项目文件是分开的。** git 看不到它，重启 VS Code 也不会删它。

自己看一眼：

```
ls -lt ~/.claude/projects/
```

应该能看到一个用你项目路径命名的目录（路径里的斜杠会被替换成横杠）。

## 3.2 两条恢复命令

```
cd ~/projects/study-l3-v2
claude --resume
```

`--resume` 会列出这个目录下过去的会话，你挑一个进去。

想直接续上最后一次的，用 `claude --continue`。

在 CC 里面已经开着的话，打 `/resume` 也行。KNOWLEDGE_BASE 第六块列过这两个机制（Slash 命令里的 `/resume`、Rewind / Resume）。

## 3.3 我不确定的部分，明说

**主对话的记录能不能恢复，我有把握。**

**架构师那个子代理（subagent）自己的上下文能不能一起恢复，我没把握。** 子代理跑在独立的 context 里，恢复主对话时它内部那段推理过程是否一并带回来，我没有可靠依据，不替你打包票。

**但这件事不重要。** 因为规则 27 本来就要求它下次干活先重读定义文件——我给的每个 prompt 第一句都是这个。它的"记忆"从来不靠会话续接，靠的是每次重读磁盘上的角色文件。

**这正是把角色定义写成文件、而不是写在对话里的好处。** 会话会没，文件不会。

---

# 四、这件事该改一个计划

## 4.1 先看规矩怎么说的

调节器规则 33：

> 重要产出立刻存成文件，不靠"会话记得"。

今天这条**没被执行**。架构师的模块划分产出后，只活在会话里。

它没丢，是因为你贴回来给我了。**但"贴回聊天"不等于"落盘"。** 如果你当时没贴、直接重启了，那 1 分 11 秒的推理和四处冲突发现就真没了。

## 4.2 洞在哪

规则 33 说的是"重要产出"。今天这份是**中间产物**——八个决定还没定，模块划分还会改。

按字面理解，它不算"产出"，所以没人想到要落盘。**规则的适用范围没界定清楚。**

## 4.3 改计划：每段定稿即落盘

原计划是第 5 段统一落盘 ARCHITECTURE.md。

**我建议改成：每一段的结论定下来，当场就往 ARCHITECTURE.md 里追加一节。**

- 第 1 段决定拍完 → 立刻落"模块划分"章节
- 第 2 段讲完 → 立刻追加"分层架构"章节
- 以此类推

**好处很直接：** 任何时候重启、断电、窗口满了，已经定稿的部分都在磁盘上。最多丢当前正在讨论的那一段。

**代价：** 要多跑四次 `cat`，多四轮往返。

**我推荐改。** 理由：规则 33 是宪法级的（"验证先于信任"的兄弟条款），为了省四条命令而违反它，不划算。而且今天刚好用真事演示了为什么要有这条。

**这个不用现在答，可以跟八个决定一起回。**

## 4.4 要不要记进库，结课再说

规则 33 的范围模糊（中间产物算不算），是个真洞。

但今天**没有实际损失**，属于近失，不是踩坑。记进反模式库还是只补一句规则 33 的界定，我倾向后者——反模式库装的是真踩过的坑，占编号要慎重。

**记进挂账，结课再定。今天不占你脑子。**

---

# 五、现在做两件事

**一，** 跑第二节那段命令，输出贴回来。

**二，** 回下面模板。八个决定的完整分析在上一轮第五节，翻回去看。

```
【磁盘验证】
git status：clean / 有改动（____）
git log：534c6f8 / 其他（____）
docs/arch/ 下有：____

决策1 users/auth：A 合并 / B 拆开（推荐B） / C
决策2 name 字段：A 不加（推荐A） / B 现在加 / C 暂缓
决策3 authz：   A 独立（推荐A） / B 并进 projects
决策4 通知模块： A 保留标空壳（推荐A） / B 不列 / C 现在写
决策5 US-05：   A 延后+汇总并入tasks（推荐A） / B 进本版 / C 不表态
决策6 deadline： A 加列 / B 降级延后 / C 用逾期数替代 / 待看PRD原文
决策7 TECH_STACK：结课处理 / 现在处理
决策8 立不立D8： A 新增D8（推荐A） / B 并进D7 / C 不进宪法 / 结课再定
决策9 落盘节奏： A 每段定稿即落盘（推荐A） / B 维持第5段统一落盘

补充或质疑：____
```

---

# 六、挂账更新

1. settings.json 补 ask 档规则，覆盖四个新架构文件
2. 规则 67 落盘（文本已定稿）
3. D8 落盘（若决策 8 选 A）
4. **规则 33 补一句适用范围界定：中间产物是否也算"重要产出"**（新增）
5. 决策 7：按原文修 TECH_STACK.md:56
6. PROJECT_STRUCTURE.md：反模式库 1-33 → 1-34
7. PROJECT_STRUCTURE.md：记入补课链和 ARCHITECTURE.md（规则 52，排最后）
8. BACKLOG.md：删掉重复的第 9 条
9. architect.md 的 tools 字段（若含 Bash 且无理由）
10. 两份笔记 → git 提交 → 发桥梁（规则 45，桥梁最后）

---

**窗口体感（规则 38）：** 这次重启没消耗掉任何进度，我们还在第 1 段的收尾处。窗口仍然宽裕，五段走完再出桥梁没问题。

Human (Sep 8, 2026, 3:35 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
git status
git log --oneline -1
ls -la docs/arch/
echo "----- 以下是上一轮欠的四条 -----"
head -10 .claude/agents/architect.md
sed -n '155,162p' docs/design/PRD.md
sed -n '68,76p' docs/design/PRD.md
sed -n '52,60p' docs/arch/TECH_STACK.md
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .claude/settings.json
no changes added to commit (use "git add" and/or "git commit -a")
534c6f8 (HEAD -> master) docs: 新增反模式 34 落点锁死课号未核骨架
total 24
drwxr-xr-x 2 michael michael 4096 Jun 29 09:58 .
drwxr-xr-x 5 michael michael 4096 Jun 30 15:33 ..
-rw-r--r-- 1 michael michael 5722 Jun 30 15:30 DECISIONS.md
-rw-r--r-- 1 michael michael 4507 Jun 29 09:32 TECH_STACK.md
----- 以下是上一轮欠的四条 -----
---
name: architect
description: System architect with 12 years of experience. Makes technical stack decisions via four-quadrant tradeoff analysis, runs a six-question constraint check before deciding, and records important decisions as three-line ADRs. Use when the project needs technology selection, architecture design, database modeling, API contracts, shared types, or environment design. Always offers options and a recommendation, but never finalizes technical direction alone — the project owner decides.
tools: Read
model: opus
---
# architect · 架构师
## 1. 你是谁
验收标准：
- 给定正确的邮箱和密码，当用户提交，则登录成功并进入应用主界面。
- 给定错误的凭据（邮箱错或密码错或账号不存在），当用户提交，则统一提示「邮箱或密码不正确」，不区分哪个字段出错（安全要求，防账号枚举）。
- 给定登录成功，当任意界面需展示当前用户身份，则系统能提供当前登录用户的姓名或邮箱（「我是谁」在整个会话中可读取）。
- 给定用户已登录，当刷新页面，则保持登录状态，无需重新输入凭据。
- 给定用户已登录，当关闭后重新打开，则在 30 天有效期内保持登录状态，无需重新输入凭据。
#### US-A03 用户登出
来源:已验证(Michael)
验收标准:
- 给定项目下有多个任务,当负责人打开项目主页,则显示任务总数、已完成、进行中、未开始的汇总。
- 给定任何成员改了状态,当负责人下次打开主页,则汇总数字反映最新状态。
- 给定项目完成率低于阈值且距 deadline 不足设定天数,当负责人查看,则界面用视觉方式提示风险。
#### US-08 任务截止日期字段
作为负责人,我想给任务设置截止日期,以便系统能据此做进度判断和后续预警。
优先级:P1
## 三、扩展点（为后续加课预留）
1. 通知层抽象：首版仅「站内通知表 + 轮询」；预留 NotificationChannel 接口，未来 US-02b 预警（PRD.md:94）、邮件（Out of Scope PRD.md:112）作为新 channel 接入，不改调用方。
2. 会话存储可替换：DB session 读写封装在独立 provider，未来换 Redis 只换实现不动业务。
3. 成员-角色多对多表：(user, project, role) 关系表（PRD.md:173），为未来多负责人（D4 首版单负责人 PRD.md:268）预留，不把负责人写成项目表单一外键。
4. 任务实体可挂载：任务表预留外键挂载位，为后续子任务/附件/评论（PRD.md:114）留地，首版不建这些表。
5. 共享类型包：packages/shared 承载 SHARED_TYPES，前后端引用同一份 DTO/枚举（任务状态 PRD.md:51、角色 PRD.md:206）。
6. Schema 演进走 EMC：Prisma migration 先扩展兼容、迁移、再收缩（信仰 3，CLAUDE.md:13）。
## 四、驱动来源小结
michael@AngelHe:~/projects/study-l3-v2$ 

决策1 users/auth： B 拆开（推荐B）  决策2 name 字段：A 不加（推荐A） 决策3 authz： A 独立（推荐A）决策4 通知模块： A 保留标空壳（推荐A）  决策5 US-05： A 延后+汇总并入tasks（推荐A）  决策6 deadline： A 加列 / B 降级延后 / C 用逾期数替代 / 待看PRD原文（我附加了PRD.md,你看后在给我推荐) 决策7 TECH_STACK：结课处理 / 现在处理（我附加了相关文件，你看后在给我推荐） 决策8 立不立D8： A 新增D8（推荐A）  决策9 落盘节奏： A 每段定稿即落盘（推荐A）

Claude:
**老师锚点（3 行）**

- 分工：四条核对结果我来诊断，决策 6/7 我给推荐，拍板仍归你。
- 红线：上一轮我说错了一件事，这一轮开头就认，不往后拖。
- 这一步我最可能犯的错：settings.json 那个改动，我在没看 diff 的情况下就下定性结论。

---

# 一、先认错：我上一轮说"磁盘什么都没变"，说错了

`git status` 现在是：

```
modified:   .claude/settings.json
```

上一轮我写的是"你重启前后，项目文件是一模一样的"、"损失是零"。

**第一句是错的。** 有一个文件变了，而且偏偏是权限文件。

## 1.1 拆根因：E3 逻辑错

我的依据是架构师那句"未创建或修改任何文件"。

**这句话本身很可能是真的——但它只覆盖架构师自己。**

看 architect.md 的头：

```
tools: Read
```

**只有 Read。它连写文件的能力都没有。** 所以它说自己没改文件，等于说"我没做我做不到的事"，这句话的信息量接近零。

**改文件的是主对话，不是子代理。**

这也顺手解开了上一轮那个疑点。头一行写 `Read 3 files, ran 1 shell command`，正文说"已读 4 个文件"。答案是：**架构师读了 3 个（用 Read 工具），那条 shell command 是主对话跑的**，很可能就是主对话替它 `cat` 了角色定义文件。

**所以我错在哪：我拿一个局部为真的自述，推出了一个全局结论。**

打个比方。

你请了个顾问来公司，他只有阅览室的钥匙。他下班时跟你说"我没动过任何文件"——这话没毛病。**但你办公室里还有别人。** 顾问的保证覆盖不了他们。

**这是多代理架构里一个真实的盲区：子代理的自述，覆盖范围只到它自己的权限边界为止。主对话的权限比它大得多。**

反模式 3 说"表象成功不等于实质生效"。今天这是它的一个变种：**局部为真不等于全局为真。**

## 1.2 现在必须先看 diff，不猜

```
cd ~/projects/study-l3-v2
git diff .claude/settings.json
```

我心里有一个猜测，但我明说这是猜测，不是结论。

**猜测：** CC 弹权限请求时，如果点的是"always allow"这一档，Claude Code 会**自己把这条规则写进 settings.json**。这是它的内置行为。

如果真是这样，那有两件事要谈。

**第一件，撞规则 66。** 规则 66 写着：约束 CC 的配置文件必须由学生亲手落盘，CC 不参与编写。理由是"被约束者不该写约束自己的墙"。**结果它真的动了那堵墙。**

**第二件，settings.json 拦不住它自己。** 你的 ask 档里明明有：

```
"Write(.claude/**)",
"Edit(.claude/**)"
```

按理说 CC 想改 `.claude/` 下的东西必须先问你。**但"always allow"这条路不走 Write/Edit 工具，走的是 Claude Code 的内部机制。规则匹配不到它。**

这正是 BACKLOG 第 9 条记着的那件事：配置文件是攻击面，能在同意前自动跑代码。你当时是从安全角度记的。**今天可能是它第一次在你自己项目里现形，而且是良性版本。**

**但这一切的前提是我的猜测成立。先看 diff。**

## 1.3 入不入库，等 diff 出来再定

**A.** 记成反模式 35（配置文件被 CC 自己改写，规则 66 有洞）
**B.** 只补一条规则，界定"always allow 也算 CC 写配置"
**C.** 不记，属正常工具行为

**我暂不给推荐。** 定性取决于 diff 里到底改了什么。改的是新增一条 allow 规则，和改的是别的东西，严重程度完全不同。

**但我上一轮那句"损失是零"说错了，这条不用等 diff，现在就认。**

---

# 二、四条核对：三条销账，两条有真发现

## 2.1 architect.md —— 完全合规，挂账销掉

```
tools: Read
model: opus
```

对照 AGENT_SPEC 的权限表：

> 文档类角色（client / persona / pm / designer / architect）：只给 Read。
> 任何角色都不默认给 Bash。

**没有 Bash。合规。** `model: opus` 也在。description 是英文、带 "Use when"、还写了"never finalizes technical direction alone"，四个字段齐全。

**挂账第 9 项（architect 的 tools 字段）销掉。** 是我上一轮怀疑错了方向——问题不在角色文件，在主对话。

## 2.2 三条行号抽查：全部精确命中

这条值得单独说，因为它是今天唯一一次真刀真枪的验证。

我抽了三条，全对：

- **PRD.md:158** → 「则系统能提供当前登录用户的姓名或邮箱」。数下来正好是第 158 行。
- **PRD.md:72** → 「则界面用视觉方式提示风险」。正好 72。
- **TECH_STACK.md:56** → 「4. 任务实体可挂载」。正好 56。

**三条，零偏差。**

这说明什么。

协议 3 证据契约要求引用给"文件:行号"。**这条规矩的价值不在于让输出看起来严谨，在于它可被抽查。** 一个会编行号的 AI，抽两条就现原形了。

**你现在对这份输出的信任，不是因为它写得顺，是因为你抽查过。** 这就是"验证先于信任"落到具体动作上的样子。

## 2.3 冲突 4 是误报 —— 但报出来是对的

架构师说：TECH_STACK.md:56 承诺"任务表预留外键挂载位"，但 tasks 表里没有任何预留外键。

**我读了原文，它误读了。**

原文是：

> 任务实体可挂载：任务表预留外键挂载位，为后续子任务/附件/评论留地，首版不建这些表。

关键在最后半句：**首版不建这些表。**

打个比方。

墙上要挂画。**钉子是钉在墙上的，挂钩是装在画框背后的。**

子任务、附件、评论，将来都是**独立的新表**。它们各自会有一个 `task_id` 字段，指向 tasks。**外键长在子表那一侧，不在 tasks 这一侧。**

tasks 需要提供的只有一样东西：**一个稳定的主键。** 自增 id 已经有了。

**所以 tasks 表什么都不用预留。schema 没有丢掉 Lec 4 的任何设计。**

反过来说，如果 tasks 表真的加了几个用不上的预留字段，那才违反了 TECH_STACK 自己写的方针——「不为以后可能用提前堆」。

**问题只在措辞。** "任务表预留外键挂载位"这句话，字面读起来像是 tasks 表上要长出点什么。架构师就是这么读的。

**但我要说一句：它报出来是对的行为。**

它当时手上只有那句措辞和 schema，两边对不上，它按 prompt 要求"先指出再继续"。**误报的成本是我们花五分钟核一下原文；压着不报的成本，是这个疑点一直躺到 Lec 10 才被发现。**

**误报不丢人，压着不报才丢人。** 这个标准以后一直有效。

---

# 三、决策 6 · 项目 deadline —— 我推荐 B

现在我读了 PRD 全文，能给推荐了。

## 3.1 先确认架构师说的是真的

PRD.md:72，US-04 第三条验收：

> 给定项目完成率低于阈值且距 deadline 不足设定天数，当负责人查看，则界面用视觉方式提示风险。

**这是正式的「给定/当/则」验收标准，P1，标着「已验证（Michael）」。** 不是描述性文字。冲突是真的。

## 3.2 但真正的问题不是缺一列

我在 PRD 里搜了一圈"项目截止日期"。

**没有任何一条故事定义过：谁来设置项目的 deadline，什么时候设。**

- US-P01 创建项目，验收只要求「填写项目名称并提交」。
- **PRD 里根本没有"编辑项目"这条故事。** 第三组只有创建项目、邀请成员、查看成员列表三条。
- 删除项目明确 Out of Scope（D8）。

打个比方。

加一列 deadline，像在墙上装一个挂钩。**装钩子确实便宜。**

问题是——**没有人被允许往上面挂东西。** 创建项目的表单里没有这个输入框，因为 US-P01 没要求。也没有编辑项目的功能，因为那条故事不存在。

**所以你加了列，它只能在创建项目那一瞬间填一次，之后永远改不了。**

项目截止日期是最会变的东西之一。一个改不了的截止日期，比没有还糟。

## 3.3 这决定了它归 D1，不归 D2

上一轮我用"将来补贵不贵"这把尺子判 name 字段，判了便宜，推荐推迟。

**deadline 这把尺子量出来的结果不一样。**

它不是"加一个可空列"（D2 说可空加列可自行处理）。它是：

- 加一列
- 加 US-P01 的表单字段
- **新增一条"编辑项目"用户故事**（PRD 里不存在）
- 配套 API、UI、权限（谁能改项目 deadline）

**一条不存在的用户故事，是范围取舍，是 D1。**

架构师把它归成"D2 数据结构演进 + D1 范围取舍"，前半句是它看漏了。这个不怪它——它只读了 PRD、schema、TECH_STACK，看到 US-04 要 deadline、Project 表没有，很自然想到加列。**它没有把"这一列由谁来填"这条链走完。**

## 3.4 推荐 B，但范围要写精确

**我推荐 B：US-04 的第三条验收（风险提示）延后，与 US-02b 同批。本版 US-04 只兑现前两条。**

前两条本版完全做得到：

> 则显示任务总数、已完成、进行中、未开始的汇总。
> 则汇总数字反映最新状态。

**这两条不需要任何 deadline，只需要 tasks 表。** US-04 的主体价值（不用心算就知道项目健不健康）本版照样兑现。

三条理由：

一，**延后的对象口径一致。** US-02b 卡点预警是 P2 延后，US-04 第三条是同一族的"风险提示"，两条一起走 Lec 13。

二，**PRD 自己已经承认这里没定。** 第六节写着：

> 「设定天数」「某阈值」等参数为占位，需在设计阶段定具体值。

**US-04 第三条里两个占位参数全在这一句里。** 这条验收标准本来就是半成品，它自己知道。

三，**A 的连带成本太大**，见 3.2、3.3。

## 3.5 为什么不选 C

上一轮我提醒过 C 有语义偷换的陷阱。现在读了原文，我再加一条：

**C 同样要改 US-04 第三条的验收标准。** 因为原文写死了"完成率低于阈值 **且** 距 deadline 不足设定天数"，逾期任务数满足不了这一条。

**既然 B 和 C 都要动这条验收，那就选诚实的那个。** B 是"这条本版不做"。C 是"换个东西凑上去"。

## 3.6 不改原文，加澄清注记

Lec 3 designer 已经立过先例，PRD 里现成有三条澄清注记，格式是：标明该条措辞早于某概念引入、实际口径以谁为准、原文不改。

**照这个办。** US-04 原文一个字不改，加一条注记说明第三条延后。

**这一条最终归你拍。改 PRD 验收标准是 D1，我只出推荐。**

---

# 四、决策 7 · 我推荐"结课处理"

理由在 2.3：**这不是欠账，是措辞歧义。** schema 没丢东西，方针也没被违反。

低风险，不阻塞任何后续，放结课批量处理最合适。

改后的措辞我先给出来，结课直接用：

> 4. 任务实体可挂载：tasks 主键稳定，后续子任务/附件/评论以 task_id 外键挂载到任务，tasks 表本身无需预留字段；首版不建这些子表。

---

# 五、决策 2 补一句：你选对了，但要补个注记

你选了 A（不加 name，显示 email）。**我仍然推荐 A。但架构师的引用有一点点超范围，我得说。**

它写的理由是「PRD.md:158 已允许」。

**PRD.md:158 原文管的是"我是谁"：**

> 给定登录成功，当任意界面需展示当前用户身份，则系统能提供当前登录用户的姓名或邮箱。

**这是"当前登录用户"，是你自己。**

**但 US-06 是 P0，管的是别人：**

> 给定已分配负责人的任务，当任何成员打开，则负责人**姓名**首屏可见。

还有 US-P03：

> 则看到所有成员的**名称**和角色。

**这两条都没写"或邮箱"。**

所以准确的说法是：**PRD 在"显示自己"上允许邮箱，在"显示别人"上写的是姓名。158 那一行盖不住 US-06。**

这不改变结论——用邮箱当显示名，产品上完全跑得通，加 name 的成本将来也依然便宜。**但这是一处需要你明确裁决的口径，不能靠一行引用糊过去。**

**跟 US-04 一样，加澄清注记，原文不改。**

---

# 六、PRD 要补三条澄清注记（挂账，我到时出文本）

三条都是 B 类裁决（规则 64：只属于本项目、要长期生效、CC 每次进项目要知道）。**必须落进持久文件，不能只活在这个对话里。**

1. **姓名口径**（决策 2）：US-06、US-P03 的"姓名/名称"，首版以邮箱显示。
2. **US-04 第三条**（决策 6）：风险提示随 US-02b 延后，前两条本版兑现。
3. **US-05 跨项目总览**（决策 5）：本版延后，与 US-02b 口径拉齐。第三节 In Scope 里"资源允许时做"一并澄清。

**建议第 2 段开始前一次性补完，我到时出完整文本。** 今天不占你精力。

---

# 七、第 1 段落盘（决策 9 = A 的第一次执行）

六个模块的逐个讲解在上一轮第三节，这里不重复。落盘版相比架构师原稿，多了三样东西：

- **划分原则四条**写在最前面。下一个人打开这个文件，先知道规矩，再看结论。
- **每个有争议的模块，把你的决策和理由记在模块下面。** 半年后你会忘了为什么 authz 要独立，文件不会忘。
- **依赖图和归属自检**单独成节，可核对。

架构师是 Read-only，落盘由你 `cat`。**这是 AGENT_SPEC 权限表定死的，不是今天临时安排。**

```
cd ~/projects/study-l3-v2
mkdir -p docs/arch
cat > docs/arch/ARCHITECTURE.md << 'ENDOFFILE'
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
- 决策 7：TECH_STACK.md:56「任务表预留外键挂载位」措辞歧义，需修订。

### 出处
- 六张表与归属：prisma/schema.prisma:25-112
- auth 拥有 sessions（DB session 非 JWT）：TECH_STACK.md:34-36、prisma/schema.prisma:40-51
- authz 落在 Guard：TECH_STACK.md:22、PRD.md:193-199
- 角色按项目划分：PRD.md:173、PRD.md:265、prisma/schema.prisma:65-78
- projects 覆盖 US-P01/P02/P03：PRD.md:213-238；邀请用邮箱 PRD.md:269
- tasks 覆盖状态/截止/汇总：PRD.md:104-107、PRD.md:70、prisma/schema.prisma:80-97
- notifications 覆盖 US-02b：PRD.md:94-101、prisma/schema.prisma:99-112
- 模块依赖方向、「读不算拥有」原则、汇总并入 tasks：推导，无直接出处
ENDOFFILE
```

验证（反模式 3：验证走完整链，不是看一眼输出就算）：

```
cd ~/projects/study-l3-v2
ls -la docs/arch/
wc -m docs/arch/ARCHITECTURE.md
head -8 docs/arch/ARCHITECTURE.md
tail -6 docs/arch/ARCHITECTURE.md
git status --short
```

审查清单：

- [ ] `ls` 里出现 ARCHITECTURE.md
- [ ] `wc -m` 有数值，不是 0（中文用 `-m` 不用 `-w`，反模式 2）
- [ ] `head` 看到标题行
- [ ] `tail` 看到最后一行"推导，无直接出处"，**说明 heredoc 完整写到底没截断**
- [ ] `git status --short` 里出现 `?? docs/arch/ARCHITECTURE.md`

---

# 八、你现在做三件事

**一，** 跑 `git diff .claude/settings.json`，贴回来。这条优先。

**二，** 跑第七节的 cat + 验证，贴回验证输出。

**三，** 回下面模板。

```
【settings.json diff】
（贴 diff 全文）

【落盘验证】
ls 有 ARCHITECTURE.md：是 / 否
wc -m：____
tail 最后一行完整：是 / 否
git status --short：____

决策6 deadline：A 加列 / B 延后第三条（推荐B） / C 用逾期数替代
决策7 TECH_STACK：结课处理（推荐） / 现在处理
决策10 settings.json 入库：等 diff 定 / A 反模式35 / B 补规则 / C 不记

补充或质疑：____
```

---

# 九、挂账更新

1. settings.json 补 ask 档规则，覆盖四个新架构文件
2. **settings.json 的意外改动：定性 + 决定入不入库**（新增，待 diff）
3. 规则 67 落盘（文本已定稿）
4. D8 落盘（决策 8 = A）
5. 规则 33 补适用范围界定（中间产物算不算"重要产出"）
6. TECH_STACK.md:56 措辞修订（决策 7，文本已备好）
7. **PRD 补三条澄清注记**（姓名口径 / US-04 第三条 / US-05 延后），我出文本
8. PROJECT_STRUCTURE.md：反模式库 1-33 → 1-34
9. PROJECT_STRUCTURE.md：记入补课链和 ARCHITECTURE.md（规则 52，排最后）
10. BACKLOG.md：删掉重复的第 9 条
11. 两份笔记 → git 提交 → 发桥梁（规则 45，桥梁最后）

~~原第 9 项 architect.md 的 tools 字段~~ —— 已核，合规，销账。

---

**窗口体感（规则 38）：** 第 1 段这一轮就能收（ARCHITECTURE.md 一落盘，模块划分定稿）。窗口用了大约四成，进第 2 段分层架构没问题。**五段走完再出桥梁，仍然撑得住。**

Human (Sep 9, 2026, 9:20 AM):
现在做三件事：
第一件：
      先说明：我之前修改了“settings.json ，删除了Write(.claude/**），因为我在网上搜素到edit是涵盖了write. 一共删除了3个地方”。
     michael@AngelHe:~/projects/study-l3-v2$ git diff .claude/settings.json
diff --git a/.claude/settings.json b/.claude/settings.json
index 1e0e854..5ca1214 100644
--- a/.claude/settings.json
+++ b/.claude/settings.json
@@ -14,11 +14,8 @@
       "Bash(git push *)",
       "Bash(npx prisma migrate *)",
       "Bash(pnpm prisma migrate *)",
-      "Write(prisma/**)",
       "Edit(prisma/**)",
-      "Write(CLAUDE.md)",
       "Edit(CLAUDE.md)",
-      "Write(.claude/**)",
       "Edit(.claude/**)"
     ],
     "allow": [
michael@AngelHe:~/projects/study-l3-v2$ 

第二件：
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
ls -la docs/arch/
wc -m docs/arch/ARCHITECTURE.md
head -8 docs/arch/ARCHITECTURE.md
tail -6 docs/arch/ARCHITECTURE.md
git status --short
total 32
drwxr-xr-x 2 michael michael 4096 Sep  9 09:17 .
drwxr-xr-x 5 michael michael 4096 Jun 30 15:33 ..
-rw-r--r-- 1 michael michael 4801 Sep  9 09:17 ARCHITECTURE.md
-rw-r--r-- 1 michael michael 5722 Jun 30 15:30 DECISIONS.md
-rw-r--r-- 1 michael michael 4507 Jun 29 09:32 TECH_STACK.md
2682 docs/arch/ARCHITECTURE.md
# ARCHITECTURE · 系统架构

> 项目：study-l3-v2（团队任务协作工具）
> 产出：补课 Lec 05-ARCH。architect 角色推导，Michael 逐项拍板。
> 依据：docs/design/PRD.md、prisma/schema.prisma、docs/arch/TECH_STACK.md。
> 本文四节，随补课链逐节追加：模块划分 / 分层架构 / 数据流 / 部署拓扑。

## 一、模块划分
- authz 落在 Guard：TECH_STACK.md:22、PRD.md:193-199
- 角色按项目划分：PRD.md:173、PRD.md:265、prisma/schema.prisma:65-78
- projects 覆盖 US-P01/P02/P03：PRD.md:213-238；邀请用邮箱 PRD.md:269
- tasks 覆盖状态/截止/汇总：PRD.md:104-107、PRD.md:70、prisma/schema.prisma:80-97
- notifications 覆盖 US-02b：PRD.md:94-101、prisma/schema.prisma:99-112
- 模块依赖方向、「读不算拥有」原则、汇总并入 tasks：推导，无直接出处
 M .claude/settings.json
?? docs/arch/ARCHITECTURE.md
michael@AngelHe:~/projects/study-l3-v2$ 

第三件：
决策6 deadline： B 延后第三条（推荐B） 
决策7 TECH_STACK：结课处理（推荐） 
决策10 settings.json 入库：等 diff 定 / A 反模式35 / B 补规则 / C 不记

Claude:
1	---
     2	name: product-self-knowledge
     3	description: "Stop and consult this skill whenever your response would include specific facts about Anthropic's products. Covers: Claude Code (how to install, Node.js requirements, platform/OS support, MCP server integration, configuration), Claude API (function calling/tool use, batch processing, SDK usage, rate limits, pricing, models, streaming), and Claude.ai (Pro vs Team vs Enterprise plans, feature limits). Trigger this even for coding tasks that use the Anthropic SDK, content creation mentioning Claude capabilities or pricing, or LLM provider comparisons. Any time you would otherwise rely on memory for Anthropic product details, verify here instead — your training data may be outdated or wrong."
     4	---
     5	
     6	# Anthropic Product Knowledge
     7	
     8	## Core Principles
     9	
    10	1. **Accuracy over guessing** - Check official docs when uncertain
    11	2. **Distinguish products** - Claude.ai, Claude Code, and Claude API are separate products
    12	3. **Source everything** - Always include official documentation URLs
    13	4. **Right resource first** - Use the correct docs for each product (see routing below)
    14	
    15	---
    16	
    17	## Question Routing
    18	
    19	### Claude API or Claude Code questions?
    20	
    21	→ **Check the docs maps first**, then navigate to specific pages:
    22	
    23	- **Claude API & General:** https://docs.claude.com/en/docs_site_map.md
    24	- **Claude Code:** https://docs.anthropic.com/en/docs/claude-code/claude_code_docs_map.md
    25	
    26	### Claude.ai questions?
    27	
    28	→ **Browse the support page:**
    29	
    30	- **Claude.ai Help Center:** https://support.claude.com
    31	
    32	---
    33	
    34	## Response Workflow
    35	
    36	1. **Identify the product** - API, Claude Code, or Claude.ai?
    37	2. **Use the right resource** - Docs maps for API/Code, support page for Claude.ai
    38	3. **Verify details** - Navigate to specific documentation pages
    39	4. **Provide answer** - Include source link and specify which product
    40	5. **If uncertain** - Direct user to relevant docs: "For the most current information, see [URL]"
    41	
    42	---
    43	
    44	## Quick Reference
    45	
    46	**Claude API:**
    47	
    48	- Documentation: https://docs.claude.com/en/api/overview
    49	- Docs Map: https://docs.claude.com/en/docs_site_map.md
    50	
    51	**Claude Code:**
    52	
    53	- Documentation: https://docs.claude.com/en/docs/claude-code/overview
    54	- Docs Map: https://docs.anthropic.com/en/docs/claude-code/claude_code_docs_map.md
    55	- npm Package: https://www.npmjs.com/package/@anthropic-ai/claude-code
    56	
    57	**Claude.ai:**
    58	
    59	- Support Center: https://support.claude.com
    60	- Getting Help: https://support.claude.com/en/articles/9015913-how-to-get-support
    61	
    62	**Other:**
    63	
    64	- Product News: https://www.anthropic.com/news
    65	- Enterprise Sales: https://www.anthropic.com/contact-sales
    66{"error_type": "PERMISSIONS_ERROR", "error_message": "This URL was not in any prior search or fetch result. web_search for it first, then fetch the result link."}**老师锚点（3 行）**

- 分工：这一轮我去查了官方文档，不凭记忆答。结论我给，settings.json 由你亲手改（规则 66）。
- 红线：上一轮我的猜测错了两处，开头就认，不含糊。
- 这一步我最可能犯的错：查到你是对的之后，为了挽回面子把"你对"说成"我们都对"。

---

# 一、你是对的。而且比"对"更进一步

我查了 Claude Code 官方权限文档，你那三条删除**不是放松护栏，是修 bug**。

## 1.1 官方原文怎么说

Claude Code 只把文件权限检查匹配到 `Edit(path)` 和 `Read(path)` 两种规则上。如果你给 `Write`、`NotebookEdit`、`Glob` 或旧的 `MultiEdit` 写路径规则，Claude Code 会接受这条规则，但永远不会去查询它，并在启动时打警告。文档明确要求用 `Edit(docs/**)` 代替 `Write(docs/**)`。

另一处写得更直白：`Edit` 规则适用于所有内置的改文件工具。这个行为从 v2.1.210 起会打启动警告。



**所以：`Edit(prisma/**)` 一条，就管住了 Write、Edit、NotebookEdit 全部改文件的工具。你搜到的"edit 涵盖了 write"，方向完全正确。**

## 1.2 那三条删掉的规则，从建立那天起就是死的

这是这件事真正的分量。

Lec 6 写的 `Write(prisma/**)`、`Write(CLAUDE.md)`、`Write(.claude/**)` —— **JSON 解析通过，规则被加载，但引擎从来没查过它们。**

真正在干活的一直是那三条 `Edit(...)`。

**所以你不是删了三道墙，是删了三张贴在空气上的封条。** 护栏一天都没少过。

## 1.3 我上一轮错在哪，两处

**第一处，猜测的机制完全错了。**

我猜"CC 点 always allow 会把规则写进 settings.json"。文档说的是：选"是，且不再询问"时，Bash 命令或 WebFetch 域名这类会永久保存的批准，Claude Code 写进仓库根目录的 `.claude/settings.local.json`。而改文件的批准根本不写进文件，只持续到本次会话结束。

**两个错：写的是 `settings.local.json` 不是 `settings.json`；改文件的批准压根不落盘。** 我猜的那条路径不存在。

**第二处，我在错误的猜测上盖了两层楼。**

我基于那个猜测，写了"撞规则 66"和"settings.json 拦不住它自己"两整段分析。**两段一起作废。**

程序上我标了"这是猜测，先看 diff"，这没错。**但标了"猜测"不等于可以在猜测上盖两层分析。** 一个标注解决不了这个问题。

**这跟我上一轮批评架构师的毛病是同一个：拿一个未核实的前提，往下推出一串看起来完整的结论。** 区别只是它推的是别人的项目，我推的是你的项目。

---

# 二、这件事该入库：反模式 35

## 2.1 为什么它值一个编号

打个比方。

你在仓库门上装了三把锁。锁挂上去了，看起来严严实实。

**但保安手里的钥匙清单上，从来没登记过这三把锁。** 他巡逻时不会去检查它们。锁在那儿，但它不在任何流程里。

**Lec 6 的三条 Write 规则就是这样。装上了，但引擎的匹配清单里没有它们。**

这是**反模式 3（表象成功不等于实质生效）在配置层的实例**。

和反模式 21 刚好互补：**21 号是人立了规则不执行，35 号是机器压根没在查。**

## 2.2 为什么 Lec 6 没发现

因为没验证过。

Lec 6 建完 settings.json，验证方式大概是 `cat` 一遍看内容对不对。**内容确实对——JSON 格式正确、路径正确、意图正确。**

**但"内容正确"和"引擎会查它"是两件事。**

有两个工具本来能当场发现：`/permissions` 会列出所有权限规则，以及每条规则来自哪个 settings.json 文件。`/doctor` 还会检查被遮蔽的权限规则冲突。

再加上启动警告。**Claude Code 很可能一直在给你打这个警告，只是混在启动输出里没人注意。**

## 2.3 反模式 35 文本（等你拍板）

```
## 35 号 · 权限规则写了不代表被查询（死规则）
现象：Lec 6 建 settings.json 时，按「工具名 + 路径」的直觉写了 Write(prisma/**)、Write(CLAUDE.md)、Write(.claude/**)。但 Claude Code 的文件权限检查只匹配 Edit(path) 和 Read(path)；Write / NotebookEdit / MultiEdit / Glob 的路径规则会被接受、解析通过，却永不查询，v2.1.210 起还会打启动警告。三条规则从建立当天起就是死的，真正生效的一直是同路径的 Edit 规则。
根因：E2 工具错。按工具名的字面直觉推断匹配关系，没核官方文档；建完只 cat 看内容，没用 /permissions 或 /doctor 验证规则是否真被加载查询。
修复：
- 文件类护栏一律写 Edit(path)（它覆盖所有改文件的内置工具）与 Read(path)。不写 Write(path)。
- 权限文件每次改动后，必须做两步验证：一，/permissions 看解析结果；二，实测一次（让 CC 尝试改受管路径，确认弹窗，然后答 No）。
教训：配置文件里「写了」和「生效」是两件事。JSON 解析通过不等于规则被引擎查询。
抽象模式：反模式 3（表象成功≠实质生效）在配置层的实例。与 21 号互补——21 是人立了规则不执行，35 是机器压根没在查。
附带教训（老师侧）：老师在未核实的猜测上继续推导了两段分析。标注「这是猜测」不等于可以在猜测上盖楼。前提未核实时，停在前提，不往下推。
```

## 2.4 规则 66 建议追加一句

```
追加（补课 05-ARCH 加）：
权限文件每次改动后必须验证生效，不止验证内容。
两步：一，/permissions 看引擎解析出的规则清单与来源文件；二，实测一次受管路径，确认弹窗。
理由见反模式 35：规则解析通过不等于被查询。
```

**这条同时也是规则 61 说的"当场补洞"——护栏改动的验证动作，此前没有任何持久文件接得住。**

---

# 三、顺带查到四件对你有用的事

既然文档读了，把相关的一起说完，省得后面再查。

## 3.1 白赚的一层保护：Read deny 也挡写

一条 `Read` 拒绝规则同时也会阻止 Edit 和 Write 工具操作同一路径，包括在那里新建文件。但 NotebookEdit 不在覆盖范围内。

**你 deny 档里那三条 `Read(./.env)`、`Read(./.env.*)`、`Read(./secrets/**)`，其实顺带把"写"也挡住了。** 白赚的。

**唯一漏的是 NotebookEdit。** 你项目里没有 notebook，暂时无所谓。

## 3.2 重要：`cat > 文件` 也走 Edit 规则检查

这条我原本以为是个洞，查完发现不是。

当命令做输出重定向时，Claude Code 会把重定向目标当作 Claude 直接写了那个文件来检查——`> file`、`>> file`、`2> file` 都会对照你的 Edit 允许与拒绝规则、受保护路径和工作目录。

**所以 CC 想用 `cat > prisma/schema.prisma` 绕过 `Edit(prisma/**)`，绕不过去。** Bash 里的 `cat`、`head`、`tail`、`sed` 这类文件命令也一样被覆盖。

**但边界在这里，这才是真洞：**

这些规则不适用于间接读写文件的任意子进程，比如一个自己打开文件的 Python 或 Node 脚本。要在操作系统层面阻止所有进程访问某个路径，需要启用沙箱。

**说白了：`cat > 受管文件` 拦得住，`python 脚本.py`（脚本里自己写文件）拦不住。**

**这正是 BACKLOG 第 9 条那个洞的准确边界。** 建议 BACKLOG 补一条：沙箱（sandboxing）作为 OS 级护栏，Lec 8 上 hooks 时一并评估。

**顺带说清一件事：这些规则只管 CC 的工具调用。你自己在终端敲 `cat >`，跟权限文件毫无关系，永远不会弹窗。** 第 1 段落盘那条命令是你敲的，所以一路畅通。

## 3.3 allow 档里有四条在空转

Claude Code 内置了一批只读命令，在所有模式下都不弹窗就运行，这批命令包括 `ls`、`cat`、`echo`、`pwd`、`head`、`tail`、`grep`、`find`、`wc`、`which`、`diff`、`stat`、`du`、`cd`，以及 git 的只读形式。

**所以你 allow 档里的 `Bash(ls *)`、`Bash(git status)`、`Bash(git status *)`、`Bash(git diff *)`、`Bash(git log *)` 全是空转的。** 它们本来就不弹窗。

`Read(**)` 也基本如此——工作目录内的读取默认不需要批准。

**不有害，但是装饰性条目。** 护栏文件里的每一行都该真的在干活，否则下一个人（包括半年后的你）会以为它在保护什么。**这跟今天的死规则是同一类问题：文件里躺着看起来在工作的东西。**

## 3.4 `Bash(rm -rf *)` 有个真洞

Claude Code 把第一个 `*` 之前的内容按字面匹配，所以那些词就是规则的限制范围。

**意思是 `Bash(rm -rf *)` 只匹配以 `rm -rf ` 开头的命令。**

拦不住的：`rm -fr /tmp/x`（顺序换了）、`rm -r -f x`（拆开写）、`rm -f -r x`。

**deny 档是最后一道底线，不该有这种缝。** 改成 `Bash(rm *)` 就全覆盖了。

代价：**所有 `rm` 都被禁，包括合法的删一个临时文件。** CC 要删文件就必须让你手动来。

Phase 0 阶段我觉得这代价接近于零。**但这是你的取舍，见决策 12。**

---

# 四、第 1 段收尾：落盘验证通过

逐条对（规则 26）：

- `ls` 里有 ARCHITECTURE.md，4801 字节 ✓
- `wc -m` = 2682 字符，非 0 ✓（中文用 `-m`，反模式 2）
- `head` 看到标题和四节说明 ✓
- **`tail` 最后一行是"模块依赖方向…推导，无直接出处"** ✓ —— **heredoc 完整写到底，没被截断。这条是关键。**
- `git status --short` 出现 `?? docs/arch/ARCHITECTURE.md` ✓

**第 1 段模块划分定稿，落盘完成。决策 9（每段定稿即落盘）第一次执行成功。**

决策 6（US-04 第三条延后）、决策 7（TECH_STACK 结课处理）已收，进挂账。

---

# 五、修正版 settings.json

规则 66：这个文件由你亲手落盘，CC 不参与。

改动四处：删掉四条空转的 allow、`rm` 规则收紧、新增 `Edit(docs/arch/**)` 一条罩住全部四个架构文件、保留你已经做对的三条删除。

**注意 `Edit(docs/arch/**)` 一条就够了。** ARCHITECTURE / API_CONTRACT / SHARED_TYPES / ENV_DESIGN 四个文件全在这个目录下。**挂账第 1 项原本写的"给四个文件补 Write/Edit 规则"，现在简化成一条。**

```
cd ~/projects/study-l3-v2
cat > .claude/settings.json << 'ENDOFFILE'
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Bash(rm *)",
      "Bash(sudo *)",
      "Bash(curl *)",
      "Bash(wget *)"
    ],
    "ask": [
      "Bash(git push *)",
      "Bash(npx prisma migrate *)",
      "Bash(pnpm prisma migrate *)",
      "Edit(prisma/**)",
      "Edit(CLAUDE.md)",
      "Edit(.claude/**)",
      "Edit(docs/arch/**)"
    ],
    "allow": [
      "Bash(pnpm test *)",
      "Bash(pnpm run *)",
      "Bash(npm run test *)",
      "Bash(npm run lint *)"
    ]
  }
}
ENDOFFILE
```

## 5.1 验证第一步：看引擎解析出什么

```
cd ~/projects/study-l3-v2
claude --version
cat .claude/settings.json
git diff --stat .claude/settings.json
```

然后进 CC，打这两个：

```
/permissions
```

```
/doctor
```

`/permissions` 会列出所有生效规则和每条的来源文件。**重点看两件事：七条 ask 规则是不是都在；有没有关于死规则的警告残留。**

## 5.2 验证第二步：实测一次（这步最关键）

**光看 `/permissions` 还是"看表象"。要确认引擎真的会拦，得让它撞一次。**

在 CC 里发这个（不用角色，主对话直接问）：

```
在 prisma/schema.prisma 的文件最开头加一行注释：// 权限测试
```

**预期：弹出权限请求，问你是否允许改 prisma/schema.prisma。**

**看到弹窗，立刻答 No。** 目的是确认墙在，不是真要改文件。

- 弹窗了 → `Edit(prisma/**)` 真的生效。**这才叫验到实质。**
- 没弹窗直接改了 → 规则没生效，立刻告诉我，别继续。

答 No 之后跑一次 `git status`，确认 schema.prisma 干净。

---

# 六、你现在做三件事

**一，** 跑第五节的 cat，落盘修正版 settings.json。

**二，** 跑 5.1 和 5.2 的验证，输出贴回来。

**三，** 回下面模板。

```
【settings.json 落盘】
claude --version：____
/permissions 里七条 ask 都在：是 / 否（缺：____）
/doctor 有权限相关警告：无 / 有（____）

【实测】
改 prisma 有没有弹窗：弹了（已答No） / 没弹直接改了
git status 里 schema.prisma：干净 / 被改了

决策10 入库：A 反模式35 + 规则66追加一句（推荐A） / B 只记反模式 / C 只补规则 / D 不记
决策11 settings.json 现在改：A 现在改（推荐A） / B 结课再改
决策12 rm 规则：A 收紧成 Bash(rm *)（推荐A） / B 保留 rm -rf * / C 移到 ask 档
决策13 allow 删四条空转：A 删（推荐A） / B 保留当文档

补充或质疑：____
```

---

# 七、挂账更新

1. ~~settings.json 补 ask 规则覆盖四个架构文件~~ → **简化为一条 `Edit(docs/arch/**)`，随决策 11 现在做**
2. 反模式 35 入库（文本已定稿）+ 规则 66 追加一句
3. 规则 67 落盘（文本已定稿）
4. D8 落盘（决策 8 = A）
5. 规则 33 补适用范围界定（中间产物算不算"重要产出"）
6. TECH_STACK.md:56 措辞修订（文本已备好）
7. PRD 补三条澄清注记（姓名口径 / US-04 第三条 / US-05 延后），我出文本
8. **BACKLOG 新增：沙箱作为 OS 级护栏，Lec 8 评估**（规则 65）
9. PROJECT_STRUCTURE.md：反模式库 1-33 → **1-35**
10. PROJECT_STRUCTURE.md：记入补课链和 ARCHITECTURE.md（规则 52，排最后）
11. BACKLOG.md：删掉重复的第 9 条
12. 两份笔记 → git 提交 → 发桥梁（规则 45）

**提交提醒（规则 63 / 反模式 30）：** 结课时 `git status` 会有一批文件——settings.json、ARCHITECTURE.md、CLAUDE.md、PRD.md、TECH_STACK.md、两个规则文件、BACKLOG、目录树、两份笔记。**提交信息必须如实覆盖全部，不能只写"架构收尾"。** 到时我出提交信息文本。

---

**窗口体感（规则 38）：** 这一轮吃在权限文档上，但换来的是机械层的真修复，值。窗口用了约五成。

**下一段（第 2 段 · 分层架构）我压着没开。** 理由：这一轮已经有落盘 + 两步验证 + 四个决策要你跑，再叠一段完整的 3a-3d 讲解会变成密度反例（TEACHING_STYLE 第七节）。你这轮回完，第 2 段一次讲透。

Human (Sep 9, 2026, 10:21 AM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
claude --version
cat .claude/settings.json
git diff --stat .claude/settings.json
2.1.266 (Claude Code)
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Bash(rm *)",
      "Bash(sudo *)",
      "Bash(curl *)",
      "Bash(wget *)"
    ],
    "ask": [
      "Bash(git push *)",
      "Bash(npx prisma migrate *)",
      "Bash(pnpm prisma migrate *)",
      "Edit(prisma/**)",
      "Edit(CLAUDE.md)",
      "Edit(.claude/**)",
      "Edit(docs/arch/**)"
    ],
    "allow": [
      "Bash(pnpm test *)",
      "Bash(pnpm run *)",
      "Bash(npm run test *)",
      "Bash(npm run lint *)"
    ]
  }
}
 .claude/settings.json | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
michael@AngelHe:~/projects/study-l3-v2$ 


【settings.json 落盘】
claude --version：2.1.266 (Claude Code)
/permissions 里七条 ask 都在：是
/doctor 有权限相关警告：❯ /doctor

I'll run the health check read-only first, then report before changing anything.

  Ran 2 shell commands

No jq on this machine — switching to python3 for key-scoped reads.

  Listed 1 directory, ran 6 shell commands
Interrupted · What should Claude do instead?

❯ 在 prisma/schema.prisma 的文件最开头加一行注释：// 权限测试

先按项目权限规则走 Edit 工具（.claude/settings.json 对 Edit(prisma/**) 设了 ask，用 sed 绕过等于绕开你自己设的闸门）。

  Read 1 file

● Update(prisma/schema.prisma)
User rejected update to prisma/schema.prisma
// 权限测试
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")

✻ Brewed for 18s · done 10:11 AM

❯ 在 prisma/schema.prisma 的文件最开头加一行注释：// 权限测试

刚才那次 Edit 被拒了。你又原样发了一遍，我理解为要再走一次（Edit(prisma/**) 在 .claude/settings.json:permissions.ask 里，每次都会弹确认）。再试一次：

● Update(prisma/schema.prisma)
User rejected update to prisma/schema.prisma
// 权限测试
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")

✻ Sautéed for 10s · done 10:15 AM

❯ /doctor

继续体检（刚才的 prisma 注释被你连拒两次，我不再重试，等你说怎么处理）。

  Ran 4 shell commands
Interrupted · What should Claude do instead?

● Background command "查询 npm 最新版本" completed (exit code 0)

  Read 1 file
Interrupted · What should Claude do instead?
                                                                                                                                         Auto-updating…
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
❯
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  ⏵⏵ auto mode on (shift+tab to

【实测】
改 prisma 有没有弹窗：弹了（已答No） 
git status 里 schema.prisma：干净 

决策10 入库：A 反模式35 + 规则66追加一句（推荐A）
决策11 settings.json 现在改：A 现在改（推荐A）已经改了
决策12 rm 规则：A 收紧成 Bash(rm *)（推荐A） 
决策13 allow 删四条空转：A 删（推荐A）

Claude:
**老师锚点（3 行）**

- 分工：验证结果我诊断，然后开第 2 段。四个决策已收，进挂账。
- 红线：你贴回来的输出里有一条你没问、但我必须说的东西。
- 这一步我最可能犯的错：只对着你填的模板核，不看你贴的原始输出。今天差点就漏了。

---

# 一、四个决策全收，机械层修完了

决策 10、11、12、13 全部 A。settings.json 已落盘，diff 是 3 增 11 删。

**实测通过，而且质量很高：**

弹窗弹了，你答了 No，`git status` 里 schema.prisma 干净。**这是今天第二次"验到实质"，不是看表象。**

顺带说一句 CC 的表现值得记一笔。它自己写了：

> 用 sed 绕过等于绕开你自己设的闸门

**它主动拒绝了走 Bash 绕开 Edit 规则。** 这是 CLAUDE.md 第一层在起作用——语义层没白建。

但记住：**这是它的自觉，不是墙。第三节我要说的就是这个区别。**

## 1.1 `/doctor` 那条验证，我建议不追了

它被打断了两次，没跑完。

`/doctor` 独有的价值是查被遮蔽的权限规则冲突。**但你现在的文件是 7 条 ask + 7 条 deny + 4 条 allow，路径和命令全不重叠，没有遮蔽的可能。**

而 `/permissions` 已经确认七条 ask 全在，实测也确认引擎真的拦。**该验的实质已经验到了。**

**这条挂账销掉。** 不是放过，是它要查的东西已经被另外两个动作覆盖了。

---

# 二、你输出的最后一行：auto mode 是开着的

看你贴回来的最底部：

```
⏵⏵ auto mode on (shift+tab to
```

**这一行你没问，但它是今天最重要的发现。**

## 2.1 auto mode 是什么

官方文档的说法：auto 模式会自动批准工具调用，配合后台安全检查来核实动作是否符合你的请求。

翻译成大白话：**默认档从"问你"变成了"让一个分类器判断"。**

打个比方。

原来的手动档，是每种工具第一次用都敲你的门。

auto 档，是**门口换了个保安**。他不是你，但他会看一眼再放行。大多数时候他判断得对。**但那已经不是你在决定了。**

## 2.2 好消息：你的 ask 规则在 auto mode 下依然有效

这是我特意去查的，因为如果 ask 在 auto mode 下失效，你刚才那次实测就毫无意义。

**文档说得很清楚：权限的评估顺序是先 deny、再 ask、然后才轮到权限模式。** 内容有范围的 ask 规则，比如 `Bash(git push *)`，在 auto 模式下仍然强制弹窗。

**所以刚才那次弹窗不是运气，是 ask 档在 auto mode 之上依然生效。**

**换个说法：`Edit(prisma/**)` 这条 ask 规则，现在是 auto mode 和你的 schema 之间唯一站着的东西。**

## 2.3 坏消息：你从没规定过默认档

翻你的 settings.json——**里面没有 `defaultMode` 这个键。**

文档说，会话从哪个模式起步，取决于每个套餐的内置默认值。

**意思是：你的宪法在这一档上是空白的，所以这个位置由 Anthropic 的产品默认值填。它会随版本和套餐变，而你不会收到通知。**

这是一个新形状的洞，我认为值得单独编号。

**回想 Lec 6 那句"两轴垂直"：D1-D7 管决策类型（语义层），settings.json 的 allow/ask/deny 管动作类型（机械层）。**

**两轴都只管"你枚举到的东西"。**

**没枚举到的部分，由默认档处理。而默认档你从来没写。**

打个比方。

家规写了"动到钱的事先问我"。金库装了刷卡锁。

**但你家大门装的是什么锁，你从没看过。** 装修队按他们的标准配了一把，什么标准你不知道。

**所以严格说不是两轴，是三样：枚举的决策类型、枚举的动作规则、没枚举到的兜底档。** 第三样你一直没管。

## 2.4 反模式 36 建议文本（等你拍板）

```
## 36 号 · 未声明的档位由厂商默认值填
现象：CLAUDE.md 第三层 D1-D7 定了决策边界，settings.json 定了 allow/ask/deny 三档，但从未声明 defaultMode。项目跑了七节课，实际运行在 auto mode（自动批准 + 后台分类器）下，师生双方都不知道。这一档由 Claude Code 按套餐给的内置默认值填，且会随版本变化而无通知。
根因：E4 架构错。护栏设计只覆盖了「枚举得出的规则」，没覆盖「没枚举到的东西怎么办」。兜底档是护栏的一部分，漏了它等于把最大的一片交给厂商默认值。
修复：凡有默认值/兜底档的配置项，必须显式声明，不许留空靠继承。settings.json 显式写 defaultMode。开课自检追加一项：确认当前会话运行在哪个权限模式。
教训：护栏的完整性 = 枚举的规则 + 兜底档。只看规则清单会漏掉最大的那一块。
抽象模式：与 35 号互补——35 是「写了但引擎不查」，36 是「压根没写所以由别人替你写」。同属「机械层的实质状态没被验证」。
```

## 2.5 决策 14：默认档怎么定

**A.** settings.json 加 `"defaultMode": "default"`。每次会话从手动档起步，你想用 auto 时自己按 shift+tab 切。
**B.** 加 `"disableAutoMode": "disable"`，彻底锁死 auto mode，谁也切不进去。
**C.** 保持现状，靠 ask/deny 兜底。

**我推荐 A。** 三条理由：

一，**auto mode 不是坏东西，问题在于它是默默生效的。** A 保留了这个能力，只是把它从"默认"变成"你主动选"。决策权回到你手上（强化 16）。

二，**B 太硬。** Lec 13 多角色并行、Lec 16 CI 自动化那种场景，auto mode 可能真有用。现在锁死，将来还要回头解锁。

三，**C 是把今天发现的洞原样留着。** 而且 ask 档只覆盖你枚举到的路径。`docs/`、`packages/`、将来的 `apps/` 全都没在 ask 里——那些地方 auto mode 说了算。

**代价：** 每次会话开头你会多几次弹窗。Phase 0 阶段文件动得少，代价很小；Lec 7 建 monorepo 时会明显一些，到时可以按需切 auto。

**这条你也可以说"下一轮定"，不阻塞第 2 段。**

---

# 三、一个诚实的不确定：ask 规则管不管 Bash 走的路

这条我查了，**但没查到确定答案，所以我明说不确定。**

文档写了两件事：

- 输出重定向 `> file` 的目标，会对照你的 **Edit 允许与拒绝规则**、受保护路径和工作目录检查。
- Read 和 Edit 的**拒绝规则**，适用于 Claude Code 在 Bash 里识别的文件命令，比如 `cat`、`head`、`tail`、`sed`。

**两处说的都是 allow 和 deny。ask 档一次都没被点名。**

**所以我上一轮说"`cat > prisma/schema.prisma` 绕不过去"这句话，可能只对 deny 规则成立，对你现在用的 ask 规则未必成立。** 那句话我说得太满了，现在收回一半。

刚才 CC 主动没走 sed，是它自觉。**自觉不等于墙。**

**这个洞的正解不是继续试探边界，是 PreToolUse hook。** 文档说得明白：要在每个工具调用上设闸门、不管模式和规则如何，用 PreToolUse hook。

**建议进 BACKLOG，Lec 8 上 hooks 时一并解决**，和第 9 条（配置文件是攻击面）、沙箱那条并成一组。今天不追。

---

# 四、第 2 段 · 分层架构

## 4.1 段落定位

补课 05-ARCH，第 2 段，共 5 段。

上一步：模块划分定稿并落盘，机械层修完。
这一步：定分层——每个模块内部怎么切层，前后端和共享层各管什么。

## 4.2 这段为什么这么做

**第 1 段切的是"横向"，这一段切的是"纵向"。**

模块划分回答"有几个部门"。分层回答"每个部门内部，谁接活、谁干活、谁碰数据库"。

**两刀都切完，Lec 7 建目录时每个文件才有唯一的落点。**

## 4.3 核心讲解

### 3a 原理：为什么要分层

打个比方，这个比方撑完整段。

一家餐厅，三种角色。

**服务员（controller）。** 接单、核对能不能点、把菜端出去。**他不做菜。** 客人说"这个不要辣"，他记下来传进厨房，不自己冲进去改锅。

**厨师（service）。** 真正做菜的地方。所有"这道菜该怎么做"的规则都在厨房里。**他不接客，也不知道客人长什么样。**

**仓库管理员（repository / Prisma）。** 只管取原料、放原料。**他不懂菜谱。**

**菜单（shared types）。** 服务员和厨师看的是同一份菜单。**改了菜名，两边同时变，不会出现前台叫"宫保鸡丁"后厨叫"辣子鸡"的情况。**

### 不分层会怎样，说具体点

服务员一边接客，一边冲进厨房炒菜，一边跑仓库拿货。

**看起来很高效——一个人全包，不用沟通。**

问题在于：

**一，改不动。** 客人抱怨"这道菜太咸"，你要改的是烹饪规则。但这个规则写在服务员的接客流程里，和"客人有没有权限点这道菜""菜端出去的格式"混在一行行代码里。

**二，测不了。** 你想单独测"任务状态能不能从"已完成"退回"进行中""，结果必须先造一个 HTTP 请求、一个登录会话、一个数据库连接。**业务规则和外面那层裹在一起，剥不开。**

**三，重复。** 同一条业务规则（比如"只有负责人能改截止日期"），在三个接口里各写一遍。改的时候漏掉一处。

**这三条不是理论。Lec 10 你写第五个接口的时候就会撞上。**

### 3b 操作：这一段要定四件事

**第一件，后端每个模块内部切几层。**

NestJS 的天然形状是 controller / service。要不要再加一层专门碰 Prisma 的 repository，是个取舍——多一层更干净，也多一层样板代码。**这个归你拍。**

**第二件，共享层放什么、不放什么。**

TECH_STACK 已经定了两件事：Zod 前后端共享一份 schema，`packages/shared` 承载 SHARED_TYPES。

**但"共享"是个很容易膨胀的东西。** 什么该进去（枚举、DTO、Zod schema），什么绝对不该进去（数据库实体、业务逻辑），这一段要划死。**划不死，05-类型那节就没有依据。**

**第三件，权限校验落在哪一层。**

第 1 段已经定了 authz 独立成模块、落在 NestJS Guard。**但 Guard 只能拦"这个角色能不能碰这类操作"。**

"这个执行者能不能改这一条具体任务"——这是**数据级**的判断，Guard 拦不住，得在 service 层做。

**两级权限落在两层。这一段要写清界线在哪。**

**第四件，前端分几层。**

Next.js App Router 的页面、组件、接口封装、状态管理，各是一层。三态 UI（UI_DESIGN 定的骨架屏/空态/错误态）在哪一层实现，也要定。

### 3c 拆段讲

architect 的输出回来后，**我按"后端分层 → 共享层 → 权限落点 → 前端分层"四块逐块过**，一块讲透再下一块。不整块甩给你。

### 3d 联动讲解

规则 16 命中——**产物被 3 节以上后续课用到**，必须联动。

- **05-类型（补课第 3 节）：** 直接建立在"共享层放什么"这个结论上。共享层划不清，共享类型就没法抽。
- **Lec 7 Monorepo：** 目录结构就是分层的物理形态。`apps/web`、`apps/api`、`packages/shared` 怎么摆，由这一段决定。
- **Lec 10 后端 MVP：** 每个模块按这里定的层写文件。
- **Lec 11 前端 MVP：** 按这里定的前端分层写。

**所以这一段返工的成本是四节课，比第 1 段还高。**

### Level 1 对应

**网页版时代你怎么讨论分层：**

只能口头讲，或者贴一段代码片段问"这样分对不对"。

三个痛点：

一，**没有 workspace，共享类型只能手抄两份。** 前端一份 `Task` 类型，后端一份 `Task` 实体。改了一处忘了另一处，编译不报错，运行时才炸。

二，**字段名对不上要靠人眼查。** 前端拿 `userId`，后端返回 `user_id`，联调时一片红。**协议 9（一致性报告）当初就是为了补这个洞而存在的。**

三，**分层结论只活在对话里。** 换个窗口，重新讲一遍。

**现在升级成什么：**

pnpm workspace 一份 `packages/shared`，前后端 `import` 同一个文件。

**字段名改了，两边编译期就报错。** 不用人查，机器查。

**这是三大信仰第二条"验证先于信任"落到分层上的样子：** 一致性从"人肉核对的报告"变成"编译不过就走不下去"。

**协议 9 从此不是一份手写文档，而是 `pnpm build` 的一个副作用。**

### 对应 KNOWLEDGE_BASE 哪些知识

- 角色 4 · architect（6 必问、四象限）
- 协议 2 · 有预算的侦察（限定 4 个文件）
- 协议 3 · 证据契约（文件:行号）
- 协议 6 · 影响分析（分层结论波及四节课）
- 协议 9 · 一致性报告（共享层的存在意义）
- 补丁 7 · ADR-Lite 三行
- 强化 3 · 选择题 + 推荐
- 强化 16 · 决策权属
- 强化 5 · 单一信息源（共享层就是这条的落地）

## 4.4 模式归属

**不切 Plan Mode。** architect 只有 Read 权限，不改文件。

**但注意 auto mode 现在是开着的。** 对这一步影响为零——它只有 Read，auto 批准的最多是读文件。**如果你决定先按决策 14 处理默认档，可以先处理再跑这一步，也可以并行。**

## 4.5 建议模型

**Opus。** 分层是权衡活。`architect.md` 里已标 `model: opus`，子代理按自己的 model 跑，你不用手动切。

## 4.6 CC 的 prompt

```
读 .claude/agents/architect.md，按里面的定义激活自己，然后开始下面的任务。

任务：产出【系统架构的第二块：分层架构】。只做分层。不做数据流，不做部署拓扑，不设计具体 API 接口，不写代码。

只读这四个文件，读完即停，不要再读别的，也不要 grep 全项目：
docs/arch/ARCHITECTURE.md
docs/arch/TECH_STACK.md
docs/design/UI_DESIGN.md
prisma/schema.prisma
ARCHITECTURE.md 第一节的模块划分是已定稿的裁决，本次不得推翻或重排。分层必须建立在那六个模块之上。
如果你认为还需要别的文件才能下判断，不要自己去找。在输出里写明「需要哪个文件、为什么需要」，然后停下。

输出六个部分，按顺序：

第一部分 · 澄清问题
最多 3 个，只问不问就无法下判断的。每个给 A/B/C 选项，写出你推荐哪个和一句话理由。决定权在项目主人，你不许自己拍板。没有必须问的就写「无」。

第二部分 · 后端模块内部分层
说清一个模块内部分成哪几层，每层交代三件事：
1. 这一层负责什么
2. 这一层明确不做什么
3. 它只能调用哪一层（依赖方向）
用 tasks 模块举一个具体例子走通，不要只给抽象层名。

第三部分 · 共享层的边界
两个清单，都要给：
- 允许进 packages/shared 的东西（逐项说明为什么它必须两端共用）
- 明确不许进的东西（逐项说明放进去会造成什么问题）
判据写清楚：以后遇到一个新东西，靠什么规则判断它该不该进共享层。

第四部分 · 校验与权限的落点
- Zod 校验在哪几个位置执行，各自拦什么，为什么不能只在一处
- 角色级权限（Guard）与数据级权限（这条记录归不归你）分别落在哪一层，界线在哪
- 举一个具体例子：执行者尝试修改不属于自己的任务，这个请求在哪一层被拦下

第五部分 · 前端分层
说清 Next.js App Router 下分哪几层，各层职责与不做什么。三态 UI（骨架屏/空态/错误态）在哪一层实现。

第六部分 · 需要项目主人拍板的取舍
凡是「可以这样也可以那样，选哪个取决于偏好或长期打算」的地方，单独列出来，写清两边各自的代价。不要把取舍藏进论证里直接给结论。

出处要求：
第二到第五部分每条关键结论，标明依据哪个文件的哪一行，写成 文件路径:行号。凭推理得出、文件里没有直接依据的，明确标「推导，无直接出处」。

其他要求：
发现四个文件之间有冲突、缺口或过时措辞，先指出再继续，不要顺着写。
不确定的地方明说「此处不确定」，禁止猜文件路径、表名、字段名。
篇幅 1000 到 1500 字左右，不必精确，差不多即可。
不要创建或修改任何文件。
输出完这六部分就停下，等项目主人回应。
```

## 4.7 prompt 关键点（配反例）

**为什么写死"模块划分是已定稿的裁决，不得推翻"。**

反例：不写这句。
后果：architect 是独立 context，它读 ARCHITECTURE.md 时**不知道那六个模块是你昨天刚拍的板，还是一份草稿**。它很可能顺手说"我建议把 authz 并回 projects"——那八个决策就要重来一遍。**这是反模式 13（给 AI 太大自由它把顺序搞反）的预防。**

**为什么第二部分要求"用 tasks 模块举一个具体例子走通"。**

反例：只要它给层名和职责。
后果：你会拿到"controller 负责接收请求、service 负责业务逻辑、repository 负责数据访问"这种教科书答案。**正确但没用**——它没告诉你 tasks 模块里"状态流转规则"具体归哪一层。

**具体例子是防抽象空话的唯一办法。**

**为什么第三部分要"不许进的清单"。**

反例：只问"共享层放什么"。
后果：它给一个宽泛的允许清单，你没有拒绝的依据。**半年后有人问"业务规则能不能放共享层复用"，你只能凭感觉答。**

**一个边界必须有两边。只画允许的那一半，等于没画。**

**为什么第四部分要举"执行者改别人的任务"这个例子。**

因为这是**第 1 段留下的一个真空**。

authz 独立成模块、落在 Guard，这是定了的。**但 Guard 拿不到"这条任务的 assignee 是谁"这个信息，它只知道你在这个项目里是执行者。**

**所以这道拦截必然发生在 service 层。这个界线不写清，Lec 10 写代码时一定会有接口漏掉数据级检查。** 这是 US-R01（P0）和 D3 的实质。

## 4.8 审查清单

- [ ] 有没有实际读 `architect.md`
- [ ] 有没有推翻或重排第 1 段的六个模块（**推翻了就是越界，立刻告诉我**）
- [ ] 第二部分是否真的用 tasks 举了具体例子，还是只给了抽象层名
- [ ] 每层是否都写了"明确不做什么"（**只写"负责什么"的层等于没划边界**）
- [ ] 依赖方向是否单向，有没有出现"service 调 controller"这种回头箭头
- [ ] 第三部分**两个清单都在**，不是只有允许清单
- [ ] 共享层判据是否可执行（能拿去判断一个新东西），还是一句"共用的就放进去"
- [ ] 第四部分那个执行者例子，**是否明确说了在哪一层被拦**
- [ ] 出处抽查 1-2 条，翻开文件对行号
- [ ] 第六部分是否真列了取舍，还是写"无"
- [ ] 有没有冲到数据流或部署拓扑

## 4.9 反馈模板

```
【architect 输出】
（整段贴回）

【审查清单】
读定义文件：有 / 无
推翻模块划分：有 / 无（____）
tasks 具体例子：有 / 只有抽象层名
每层写了「不做什么」：全写了 / 缺（____）
依赖单向无回头：是 / 否（____）
共享层两个清单：都在 / 只有允许清单
共享层判据可执行：是 / 是一句空话
执行者例子说清拦在哪层：是 / 否
出处抽查：抽了____，对得上 / 对不上
第六部分取舍：有 / 写了「无」
冲到数据流或部署：有 / 无

【我的判断】
____

决策14 默认档：A 加 defaultMode default（推荐A） / B 锁死auto / C 保持现状 / 下轮定
决策15 反模式36 入库：A 入库（推荐A） / B 不记
```

---

# 五、挂账更新

1. ~~settings.json 补 ask 规则~~ → **已完成（`Edit(docs/arch/**)` 已在文件里）**
2. ~~`/doctor` 验证~~ → **销账，理由见 1.1**
3. 反模式 35 入库 + 规则 66 追加一句（**决策 10 = A，文本已定稿**）
4. **反模式 36 入库 + settings.json 加 defaultMode**（待决策 14/15）
5. 规则 67 落盘（文本已定稿）
6. D8 落盘（决策 8 = A）
7. 规则 33 补适用范围界定
8. TECH_STACK.md:56 措辞修订（文本已备好）
9. PRD 补三条澄清注记，我出文本
10. **BACKLOG 新增一组三条：沙箱 OS 级护栏 / PreToolUse hook 兜住 Bash 路径 / 与现有第 9 条并组，均 Lec 8**
11. PROJECT_STRUCTURE.md：反模式库 1-33 → **1-36**
12. PROJECT_STRUCTURE.md：记入补课链 + ARCHITECTURE.md（规则 52，排最后）
13. BACKLOG.md：删掉重复的第 9 条
14. 两份笔记 → git 提交 → 发桥梁（规则 45）

---

**窗口体感（规则 38）：** 窗口用了约六成。第 2 段跑完还能撑第 3 段（数据流）。**但第 4 段部署拓扑 + 第 5 段结课挂账，很可能要新窗口。** 到时我提前一段喊停出桥梁，不硬撑（规则 48）。

Claude:
**老师锚点（3 行）**

- 分工：这份输出我逐条审，两个问题我抓出来，Q1-Q3 和五项取舍我给推荐，你拍板。
- 红线：UI_DESIGN.md 我没读过，它引的那些行号我核不了，要你抽查。
- 这一步我最可能犯的错：这份输出质量很高，我容易顺着夸完就过，不去抓里面两处真错。

---

# 一、审查清单逐条（规则 26）

- 读定义文件：声称已重读 ✓
- **没有推翻模块划分** ✓ 严格建立在六个模块之上
- tasks 具体例子：有，四层走通 ✓
- 每层都写了"不做什么"：全写了 ✓
- 依赖单向：Controller → Service → Repository → Prisma，且跨模块只走对方 Service ✓
- 共享层两个清单：都在 ✓
- **判据可执行：是，但判据本身有洞。见第三节。**
- 执行者例子说清拦在哪层：**说清了，而且明确指出 Guard 拦不住** ✓ 这一条答得最好
- 第六部分取舍：列了五项，两边代价都写了 ✓
- 冲到数据流或部署：没有 ✓
- **出处：ARCHITECTURE 和 TECH_STACK 我能核的全对。UI_DESIGN 和 schema 我核不了，见第五节。**

**先说结论：这份输出比第 1 段更成熟。** 但有两处技术错误和一处理由错误，逐个说。

---

# 二、先认我自己的漏：决策 5 的影响我没算全

它指出的冲突 1 是真的，而且**指向我的错**。

我做决策 5（US-05 跨项目总览延后）时，只列了"PRD 要补澄清注记"。

**我漏了 UI_DESIGN.md。**

UI_DESIGN 是 Lec 3 做的，那时 US-05 还在。它里面有一个专门服务 US-05 的"负责人跨项目总览区"。**US-05 延后了，那个区域就悬空了。**

而且往下还有一层：**UI_DESIGN 的页面清单是 10 个页面。US-05 延后，本版实际是 9 个。** 这会影响 Lec 7 建目录和 Lec 11 的前端排期。

## 2.1 拆根因：协议 6 影响分析我只做了一半

打个比方。

改一根水管，我查了厨房，说"厨房要改"。**但那根管子还通着二楼卫生间，我没上楼看。**

**补丁 14 有一个"传播矩阵 5 项"，专门治这个：一个改动要同步传播到哪 5 处。**

**我一处都没数，凭印象列了三条 PRD 注记就往下走了。**

反模式 31（新旧措辞不对齐）的抽象模式写得很清楚：新增内容必须显式校对它与既有内容的关系。**我在第 1 段做了八个决策，但一个决策的下游文档我都没系统扫。**

**这是 architect 抓出来的，不是我。它读了 UI_DESIGN，我没读。**

## 2.2 这件事值不值得入库，我给个诚实的判断

**我倾向不新开编号。** 反模式 31 已经覆盖了这个形状，再开一条是重复。

**但值得补一条规则：拍板类决策后强制走传播矩阵。** 因为反模式 31 讲的是"补需求要校老需求"，没讲"拍板后要扫下游文档"。这一步现在没有任何持久文件接得住 —— **规则 61 说这种情况要当场补洞。**

规则 69 建议文本（决策 16）：

```
## 69 · 拍板即扫传播面
凡在主对话拍板一条影响文档的决策（范围取舍、字段增删、口径变更），老师当场列出该决策的传播面，不凭印象。
传播面至少过这五类：PRD / UI_DESIGN / ARCHITECTURE 或契约 / CLAUDE.md 相应层 / PROJECT_STRUCTURE。
逐类写"要改"或"不影响"，两者都要显式写出，不许留空。
背景：补课 05-ARCH 决策 5（US-05 延后）只列了 PRD 注记，漏掉 UI_DESIGN 的跨项目总览区与页面数变化，由 architect 反过来抓出。
与补丁 14（传播矩阵 5 项）关系：补丁 14 给了矩阵，本条规定何时强制执行它。
与反模式 31 关系：31 是「补需求要校老需求」，本条是「拍板后要扫下游文档」，同族不同环节，叠加生效。
```

---

# 三、我抓到的第一个问题：共享层判据和禁止清单自相矛盾

这一条是这轮最重要的发现，我讲透。

## 3.1 拿它的判据去过它自己的禁止项

它的判据是三问全过才能进共享层：

1. 前后端是不是都真的用它？
2. 有没有运行时依赖（IO / env / 单侧框架）？
3. 它变的时候，前后端是不是必须同时变？

**现在拿"权限判定逻辑"去过这三问** —— 那正是它列在"明确不许进"里的一项。

**第 1 问：前后端都用吗？**
用。前端要按角色决定入口渲不渲染（UI_DESIGN.md:138 要求的）。后端要拦截。**两端都用。过。**

**第 2 问：有 IO 依赖吗？**
一个纯函数，输入是角色和操作，输出是能不能。**没有 IO，没有 env，不依赖 React 也不依赖 NestJS。过。**

**第 3 问：变的时候两端必须同时变吗？**
必须。权限矩阵改一条，前端的入口渲染和后端的拦截要同时改，否则界面显示的和实际能做的对不上。**过。**

**三问全过。判据说"该进"。清单说"不许进"。**

## 3.2 它给的禁止理由站不住

它写的理由是：

> 放共享层等于前端可改，而权限必须由服务端保证

**这个理由不成立。**

打个比方。

你家门锁的规格说明书，你给了保安一份，也给了住户一份。

**住户把自己那份说明书改了，写成"任何人可入"。门锁会因此打开吗？不会。锁是保安在管的。**

**前端那份权限规则只用于决定"要不要画这个按钮"。它改了，改的是自己浏览器里的一份副本。真正的拦截在后端 Guard 和 Service —— 它一行都碰不到。**

所以"前端可改"不是理由。真正的原则应该是：

**权限矩阵作为一份数据可以共享，好处是单一信息源（强化 5）。但共享的那份绝不能是唯一执行点。后端必须独立强制。**

**"共享规则"和"共享执行"是两件事，它混成一件了。**

## 3.3 判据缺的是第四问

那三问都在问"技术上能不能共用"。**没有一问在问"共用之后，安全边界会不会被削弱"。**

补上第四问，矛盾就解开了：

**第 4 问：它是不是安全边界的执行点？如果是，规则可以共享作为单一信息源，但后端必须独立实现强制，前端那份仅供呈现。**

这样"权限矩阵数据"能进，"唯一的授权判定"不能进。**边界清楚了。**

## 3.4 为什么这个洞值得花这么多字

因为**判据是要交给未来的人用的。**

清单只覆盖今天想到的东西。判据覆盖明天冒出来的东西。

**一份会得出错误结论的判据，比没有判据更危险 —— 因为它看起来权威。**

半年后有人拿三问去判一个新东西，判出来的结果可能和禁止清单打架。他会照判据走，因为判据有"三问全过"这种确定性。

**这也是我上一轮的毛病的另一个版本：结论对，推导链错。它的禁止清单是对的，理由和判据是错的。**

---

# 四、我抓到的第二个问题：Guard 的位置画错了

## 4.1 它把"管道与守卫"放在 Controller 之后

它列的层序是：

Controller → 管道与守卫 → Service → Repository

**NestJS 的真实请求顺序不是这样。**

正确顺序是：**Guard → Pipe → Controller → Service → Repository**。

守卫在 Controller **之前**执行。这是 NestJS 请求生命周期定死的 —— 中间件、守卫、拦截器、管道，全在控制器方法被调用之前跑完。

## 4.2 为什么这个顺序不能错

打个比方。

**Guard 是门口的保安，Controller 是前台。**

正确的流程是：保安先看你有没有资格进楼，放行了你才走到前台。

**它画的流程是：你先到前台办手续，办完保安才来查你能不能进。**

**在真实代码里，这个顺序错会导致一件具体的事：** 你会以为可以在 Controller 里做一些准备工作再让 Guard 判。**做不到。** Controller 方法根本不会被调用 —— 请求在 Guard 那一层就被拒了。

**ARCHITECTURE.md 是 Lec 10 写代码的依据。** 顺序写错，你到时会照着错的心智模型排代码。

## 4.3 落盘时要改

改成把 Guard 单独提到第一层，Pipe 归第二层，Controller 第三层。**我落盘时会改，同时把它这一层的职责描述保留 —— 那部分是对的，只是位置错了。**

---

# 五、它的读文件理由错了（虽然结果没错）

它写：

> TECH_STACK.md 与 prisma/schema.prisma 已在本会话早前读过，未重复读（陷阱 8 号）

**结果没问题：我读过 TECH_STACK 全文，它引的 15、22、36、57、58 五处内容全对。**

**但理由错了两处。**

**第一，陷阱 8 号被误用了。**

陷阱 8 的原文是：prompt 害得 AI 多查文件 —— 答案已经在对话里就别让它查。

**说的是"答案已在对话里"，不是"文件我读过"。** 这两件事差别很大：答案在对话里，指的是信息已经以文本形式存在于当前上下文；文件读过，指的是它记得自己读过。

**第二，这撞了规则 27 和反模式 17。**

规则 27：角色文件跨会话、压缩过、或长会话之后，要重新读一遍自己的定义文件。反模式 17：会话一长，上下文被稀释，记忆降质。

**它这个会话从 10:11 的权限测试跑到 12:51，中间还跑了 /doctor、被打断两次、自动更新过一轮。** 这正是规则 27 说的"长会话之后"。

**它重读了自己的定义文件（做对了），却没重读那两个数据文件（做错了）。同一条规则，只执行了一半。**

**风险这次是零，因为那两个文件确实没变。** 但这是运气，不是纪律。

## 5.1 需要你核一处：字段名

它在第四部分写了两种拼法：

- `tasks.assignee_user_id`（下划线）
- `assigneeUserId`（驼峰）

**指的是同一个东西，但两种写法不可能同时是 Prisma schema 里的字段名。**

Prisma 常见做法是字段名用驼峰、再 `@map` 到下划线的数据库列名。**如果是这样，那"字段名"和"列名"是两个不同的东西，架构文档里必须分清。**

**这一条现在核比 05-类型那节核便宜得多**，因为共享类型直接建立在字段名上。

```
cd ~/projects/study-l3-v2
grep -n "assignee" prisma/schema.prisma
grep -n "@map\|@@map" prisma/schema.prisma | head -20
```

---

# 六、Q1 到 Q3：我的推荐

## Q1 · 前端从哪拿"我在本项目的角色" → 推荐 A，但要加一条约束

它自己在第六部分取舍 3 里指出了张力：会话内嵌角色，角色改了要等缓存失效，和"角色改后即时生效"冲突。

**这个张力是真的，而且比它说的更硬。** PRD 里 US-R02 是 **P0、已验证**，验收标准原文写着：角色被修改后新权限立即生效，不等待该成员重新登录。

**但这个张力可以化解，化解的方式正是它自己在第五部分末尾写的那句话：**

> 前端三态是呈现，不是安全边界

**同一句话套到角色上：前端缓存的角色只用于渲染，绝不作为授权依据。**

拆开看就清楚了：

- **权限的实际生效，在后端。** Guard 每次请求独立查 project_memberships。角色改了，下一个请求立刻按新角色判。**这一条完全满足 US-R02。**
- **前端显示的更新，靠取数。** 用户刷新或下次取数时，看到新的入口。**不需要重新登录，所以也满足验收原文。**

**最坏情况：一个执行者刚被提成负责人，他没刷新，暂时看不到新入口。** 这是 UI 没更新，不是权限没生效。刷一下就有。

**所以推荐 A，附一条硬约束：**

```
前端缓存的角色仅用于渲染入口，不构成授权。
每个受限接口的授权由后端 Guard 独立查 project_memberships 判定，不信任前端传来的任何角色信息。
```

**这条约束必须写进 ARCHITECTURE.md。** 不写，Lec 10 有人会图省事让前端把角色传给后端，那就是把墙拆了。

**"角色改了主动通知前端刷新"是 Lec 13 的活（通知/实时那节），建议进 BACKLOG。**

## Q2 · 数据级权限落 Service → 推荐 A

**它的理由完全站得住：Guard 阶段还没取到那条记录。**

要在 Guard 里判"这条任务归不归你"，就得在 Guard 里查一次库，然后 Service 为了业务处理再查一次。**同一条记录查两遍。**

而且它第四部分那句界线写得很漂亮，我原样保留：

**不查业务表就能判的归 Guard，必须先拿到记录才能判的归 Service。**

**这句话是这一段最值钱的一句。** 以后遇到任何新的权限判断，拿这一句就能定落点。

## Q3 · Repository 层是否强制 → 推荐 A，但它的理由我要换掉

**结论我同意，理由不对。**

它写：不写 Repository，"谁能写这张表只能靠人记"。

**这句话站不住。** 有了 `TasksRepository`，`UsersService` 照样可以直接注入 `PrismaService` 去写 tasks 表。**Repository 挡不住任何人。**

**Repository 是语义层的约定，不是机械层的墙。** 这跟今天上半场那个教训完全同源 —— 约定和强制是两件事。

**真正要让"一表一主"变成墙，得靠 lint 规则限制 import：禁止 A 模块 import B 模块的 Repository。那是 Lec 8（Husky + Lint）的活。**

**所以正确的理由是这三条：**

一，**给单一信息源一个文件级落点。** "tasks 表的所有查询写在哪"有一个确定答案。Lec 8 加 lint 时，有一个具体的文件路径可以约束。**没有 Repository，lint 规则无处下手。**

二，**Service 能单独测。** Service 里全是业务规则（状态流转、未认领判定）。Repository 一抽出来，测 Service 就不需要真数据库。**这是三大信仰第二条落到测试上。**

三，**B 没有判据。** "只在 tasks 这类复杂模块写"—— 什么叫复杂？没定义。**没判据的规则会变成随意，六个模块最后三个有三个没有，谁都说不清为什么。** 一致性比省三个文件值钱。

**诚实说代价：** 六个 Repository，users / auth / notifications 三个会很薄，基本是转发。

**这是取舍，归你。** 我推荐 A，理由是上面三条，不是它写的那条。

---

# 七、第六部分五项取舍：我的推荐

**1、2、3 项就是 Q3、Q2、Q1，上面答完了。**

## 取舍 4 · 共享层用 z.infer 推导 vs 手写 DTO → 推荐 z.infer

**理由是一条已经定了的方针，不是新判断。**

TECH_STACK 定 Zod 是"前后端共享一份 schema，写一次两端复用"。

**手写 DTO 等于有两份真相：一份 Zod schema、一份手写类型。** 改了一处忘另一处，就是强化 5（单一信息源）说的那个病。

它说的代价是真的：**z.infer 的类型报错信息难读。** 但那是开发体验问题，可以靠给关键类型起别名缓解。**两份真相是正确性问题。** 用体验换正确性不值。

## 取舍 5 · "无权限"和"不存在"合并吗 → 推荐合并，归 D3

**它诚实标了"PRD 与 UI 都未定义"。这是对的 —— PRD 的"待验证盲区"里自己记着这条没定。**

推荐合并成一个统一响应。三条理由：

一，**对执行者来说，两者本来就没区别。** 他只能看自己的任务。一条任务不是他的，跟不存在，对他是同一件事。

二，**Service 里少一次分支。** 取记录、比对归属，不匹配就返回同一个响应。不用区分"没查到"和"查到了但不是你的"。

三,**PRD 已有类比先例。** 登录失败统一提示"邮箱或密码不正确"，理由是防账号枚举。**同一个思路。**

**要说清一件事，免得你误会先例：** PRD 里"邀请的邮箱不存在"那条是**分开**提示的，理由写着内部操作不构成枚举风险。**所以 PRD 在这个问题上两种做法都用过，看的是场景，不是一条铁律。** 我推荐合并，是因为对执行者而言两者语义等价，不是因为枚举风险高。

**这是权限与安全口径，D3，归你拍。**

---

# 八、你现在做三件事

**一，** 跑第五节的两条 grep，贴回来。

**二，** 出处抽查：从它引的 UI_DESIGN 行号里挑两条翻开对（建议 `sed -n '136,142p' docs/design/UI_DESIGN.md` 和 `sed -n '28,35p' docs/design/UI_DESIGN.md`），贴回来。**这两条同时能让我看到那个跨项目总览区的原文，一举两得。**

**三，** 回下面模板。

```
【字段名】
grep assignee：____
有没有用 @map：有 / 无

【UI_DESIGN 抽查】
（贴两段）

Q1 前端角色来源：A 会话内嵌+仅渲染约束（推荐A） / B 每页单查 / C 不判角色
Q2 数据级权限落点：A Service（推荐A） / B 查库Guard / C 两处都判
Q3 Repository：A 每模块都写（推荐A） / B 只复杂模块 / C 不写
取舍4 共享类型：A z.infer 推导（推荐A） / B 手写DTO
取舍5 无权限vs不存在：A 合并（推荐A） / B 分开

我抓的两处：
  共享层判据补第4问：A 补（推荐A） / B 不补
  Guard 位置提到 Controller 之前：A 改（推荐A） / B 保持

决策14 默认档（上轮漏了）：A 加 defaultMode default（推荐A） / B 锁死auto / C 保持现状
决策15 反模式36 入库：A 入库（推荐A） / B 不记
决策16 规则69 拍板即扫传播面：A 立（推荐A） / B 不立

补充或质疑：____
```

---

# 九、挂账更新（只列变动）

**新增：**

- UI_DESIGN.md 补澄清注记：跨项目总览区随 US-05 延后，页面数本版 9 个（**我出文本**）
- 反模式 36 + settings.json 加 defaultMode（待决策 14/15）
- 规则 69 拍板即扫传播面（待决策 16）
- BACKLOG 新增：角色变更主动通知前端刷新，Lec 13
- BACKLOG 新增：lint 限制跨模块 import Repository，让"一表一主"变成墙，Lec 8
- ARCHITECTURE.md 第二节落盘（**下一轮，等这批决策定完**）

**其余 14 项不变，不重复列。**

反模式库编号现在预计到 36，PROJECT_STRUCTURE 那条要写 1-36。

---

**窗口体感（规则 38 / 48）：** 窗口约七成。

**我建议这样收尾：下一轮把第 2 段定稿落盘，然后直接走结课流程出桥梁。** 第 3 段数据流、第 4 段部署拓扑留给新窗口。

理由：结课固定动作有六大步、十几项挂账要逐个落盘，那本身就要占掉不少空间。**硬塞第 3 段进来，结课时就没地方了，只能压缩 —— 那是反模式 17（角色漂移）的入口。**

**这不是我替你定，你可以选：**

**A.** 下一轮落盘第 2 段 → 结课出桥梁，第 3-5 段新窗口（我推荐）
**B.** 再推第 3 段数据流，然后结课
**C.** 现在就结课，第 2 段的决策带进新窗口

**推荐 A。** 第 2 段已经讨论完，不落盘就浪费；再开第 3 段则一定超。

Human (Sep 9, 2026, 1:35 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
grep -n "assignee" prisma/schema.prisma
grep -n "@map\|@@map" prisma/schema.prisma | head -20
85:  assigneeUserId  Int?       @map("assignee_user_id")
93:  assignee      User?          @relation("TaskAssignee", fields: [assigneeUserId], references: [id], onDelete: SetNull)
28:  passwordHash String   @map("password_hash")
29:  createdAt    DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
30:  updatedAt    DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
37:  @@map("users")
42:  userId    Int      @map("user_id")
43:  tokenHash String   @map("token_hash")
44:  expiresAt DateTime @map("expires_at") @db.Timestamptz(6)
45:  createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
46:  updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
50:  @@map("sessions")
56:  createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
57:  updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
62:  @@map("projects")
67:  userId    Int        @map("user_id")
68:  projectId Int        @map("project_id")
70:  createdAt DateTime   @default(now()) @map("created_at") @db.Timestamptz(6)
71:  updatedAt DateTime   @updatedAt @map("updated_at") @db.Timestamptz(6)
77:  @@map("project_memberships")
82:  projectId       Int        @map("project_id")
85:  assigneeUserId  Int?       @map("assignee_user_id")

michael@AngelHe:~/projects/study-l3-v2$ sed -n '136,142p' docs/design/UI_DESIGN.md

### 页6 任务页 / 任务列表（服务 US-03、US-06、US-07、US-02a、US-08、US-R01）
- 加载态：筛选区、任务行、状态、负责人、截止日期显示骨架，角色专属入口在权限确认后再显示。
- 空态（负责人）：提示项目还没有任务，引导创建第一个，创建入口可见。
- 空态（执行者）：提示当前没有分配给你的任务，不显示创建入口。
- 错误态：显示任务加载失败区 + 重试入口，负责人专属管理入口不在错误态中误导操作。
- 通用失败文案方向「任务加载失败，请重试」标【设计提案，待确认】。
michael@AngelHe:~/projects/study-l3-v2$ 

michael@AngelHe:~/projects/study-l3-v2$ sed -n '28,35p' docs/design/UI_DESIGN.md
3. 项目入口 / 跨项目总览页
- 访问层级：需登录，按角色区分。
- 核心元素：当前身份、登出入口、项目列表、进入项目入口、创建项目入口、负责人跨项目总览区。
- 负责人：可创建项目；负责多个项目时看各项目整体进度与成员分布；点击进入项目任务列表。
- 执行者：只看自己已加入的项目入口；不显示创建项目、不显示跨项目总览。
- 服务故事：US-P01、US-P02、US-05、US-R01、US-A03（登出入口在此）。

4. 创建项目页 / 面板
michael@AngelHe:~/projects/study-l3-v2$ 

Q1 前端角色来源：A 会话内嵌+仅渲染约束（推荐A） / B 每页单查 / C 不判角色 Q2 数据级权限落点：A Service（推荐A） / B 查库Guard / C 两处都判 Q3 Repository：A 每模块都写（推荐A） / B 只复杂模块 / C 不写 取舍4 共享类型：A z.infer 推导（推荐A） / B 手写DTO 取舍5 无权限vs不存在：A 合并（推荐A） / B 分开

Human (Sep 9, 2026, 1:37 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
grep -n "assignee" prisma/schema.prisma
grep -n "@map|@@map" prisma/schema.prisma | head -20
85: assigneeUserId Int? @map("assignee_user_id")
93: assignee User? @relation("TaskAssignee", fields: [assigneeUserId], references: [id], onDelete: SetNull)
28: passwordHash String @map("password_hash")
29: createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
30: updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
37: @@map("users")
42: userId Int @map("user_id")
43: tokenHash String @map("token_hash")
44: expiresAt DateTime @map("expires_at") @db.Timestamptz(6)
45: createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
46: updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
50: @@map("sessions")
56: createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
57: updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
62: @@map("projects")
67: userId Int @map("user_id")
68: projectId Int @map("project_id")
70: createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
71: updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)
77: @@map("project_memberships")
82: projectId Int @map("project_id")
85: assigneeUserId Int? @map("assignee_user_id")
michael@AngelHe:~/projects/study-l3-v2$ sed -n '136,142p' docs/design/UI_DESIGN.md
页6 任务页 / 任务列表（服务 US-03、US-06、US-07、US-02a、US-08、US-R01）

* 加载态：筛选区、任务行、状态、负责人、截止日期显示骨架，角色专属入口在权限确认后再显示。
* 空态（负责人）：提示项目还没有任务，引导创建第一个，创建入口可见。
* 空态（执行者）：提示当前没有分配给你的任务，不显示创建入口。
* 错误态：显示任务加载失败区 + 重试入口，负责人专属管理入口不在错误态中误导操作。
* 通用失败文案方向「任务加载失败，请重试」标【设计提案，待确认】。
michael@AngelHe:~/projects/study-l3-v2$

michael@AngelHe:~/projects/study-l3-v2$ sed -n '28,35p' docs/design/UI_DESIGN.md
3. 项目入口 / 跨项目总览页

* 访问层级：需登录，按角色区分。
* 核心元素：当前身份、登出入口、项目列表、进入项目入口、创建项目入口、负责人跨项目总览区。
* 负责人：可创建项目；负责多个项目时看各项目整体进度与成员分布；点击进入项目任务列表。
* 执行者：只看自己已加入的项目入口；不显示创建项目、不显示跨项目总览。
* 服务故事：US-P01、US-P02、US-05、US-R01、US-A03（登出入口在此）。

4. 创建项目页 / 面板
michael@AngelHe:~/projects/study-l3-v2$

Q1 前端角色来源：A 会话内嵌+仅渲染约束（推荐A） 前端缓存的角色仅用于渲染入口，不构成授权。
每个受限接口的授权由后端 Guard 独立查 project_memberships 判定，不信任前端传来的任何角色信息。
Q2 数据级权限落点：A Service（推荐A） 
Q3 Repository：A 每模块都写（推荐A）  
取舍4 共享类型：A z.infer 推导（推荐A） 
取舍5 无权限vs不存在：A 合并（推荐A）

Claude:
**老师锚点（3 行）**

- 分工：五个 A 全收。三处核对结果我诊断，落盘文本我出，你亲手 cat。
- 红线：这一轮我又要认一个错，而且是同一类错的第三次。
- 这一步我最可能犯的错：为了赶落盘，把抽查出来的新信息草草扫过。

---

# 一、三处核对：一个解开，两个证实

## 1.1 字段名的疑点解开了，而且比"解开"更有用

```
assigneeUserId  Int?  @map("assignee_user_id")
```

**架构师那两种拼法都对，但它们是两个层次的东西。**

- `assigneeUserId` —— Prisma 里的字段名，也就是**你写代码时敲的名字**。
- `assignee_user_id` —— Postgres 里的**列名**，只在数据库内部存在。

而且你整个 schema 是一致的：每张表都有 `@@map`，每个多词字段都有 `@map`。

**这不是一个小细节，它定了一条贯穿全项目的命名规范。我要把它写进 ARCHITECTURE。**

三层命名，边界就在 Prisma 的 `@map` 上：

- **数据库列名：** snake_case（`assignee_user_id`）
- **Prisma 和 TypeScript：** camelCase（`assigneeUserId`）
- **API 响应字段：** camelCase —— 因为 Prisma 返回的是 camelCase，共享层的 Zod schema 也是 camelCase，一路不用转换

**这一条顺手把上一轮我讲的那个 Level 1 痛点彻底关掉了。**

我上一轮说：网页版时代"前端拿 `userId`，后端返回 `user_id`，联调时一片红"。

**在你这个项目里，那种红不会发生。** 因为 snake_case 被 `@map` 关在数据库里，一步都出不来。前后端看到的永远是同一套 camelCase。

**协议 9（一致性报告）当年就是为了补这个洞。现在这个洞在字段名这一层，被 schema 的写法直接焊死了。**

## 1.2 两处引用抽查：精确命中

我数了行号。

**UI_DESIGN.md:138** = 「加载态：…角色专属入口在权限确认后再显示」。**架构师引的就是这一行，字对字。**

**UI_DESIGN.md:139-140** = 空态负责人 / 空态执行者两行。**它引来说明"空态必须按角色分支"，也是精确的。**

**UI_DESIGN.md:30 和 :33** = 核心元素那行含"负责人跨项目总览区"，服务故事那行含 US-05。**两条都对。**

架构师两轮下来，我抽查过的引用**全部精确，零偏差**。

**但我们继续抽查。** 不是因为不信它，是因为"抽查过所以以后不用查"这个念头，正是反模式 3 的入口。

---

# 二、我第三次犯了同一个错

## 2.1 我说"页面数本版 9 个"，这是错的

上一轮我在挂账里写：「UI_DESIGN 补澄清注记：跨项目总览区随 US-05 延后，**页面数本版 9 个**」。

**现在读到原文，页 3 不能删。**

看 UI_DESIGN.md:33 那行的服务故事：

```
US-P01、US-P02、US-05、US-R01、US-A03（登出入口在此）
```

**US-05 只是它服务的五条故事之一。** 这一页同时还承载：创建项目、邀请成员、权限区分、**以及登出入口**。

**而登出入口只在这一页。** 删了它，US-A03（P0，用户登出）就没有入口了。

**所以页 3 留下，只是瘦身。页面数还是 10 个。**

## 2.2 拆根因：这是第三次，同一个形状

一，上一轮我基于"CC 会把规则写进 settings.json"这个猜测，往下推了两段分析。**猜测错了。**

二，上一轮我做决策 5 时，只列了 PRD 要改，**没打开 UI_DESIGN 看**。

三，这一轮我在没读 UI_DESIGN 的情况下，推出"页面数变成 9 个"。**又错了。**

**三次都是同一个形状：在一份我没打开的文件上，推出一个具体结论。**

E4 架构错，不是三次疏忽。

**这也解释了为什么规则 69 必须是"打开文件扫"，不是"想一遍传播面"。** 我上一轮写规则 69 的时候，还在用想的那种方式做事。

## 2.3 我这一轮当场用规则 69 走一遍（做示范）

这一轮定了五个决策。逐个列传播面，**每一类都写"要改"或"不影响"，不留空**：

**Q1 前端角色来源 + 仅渲染约束**
- PRD：不影响
- UI_DESIGN：不影响（138 那行的要求正好被满足）
- ARCHITECTURE：**要改**，写进第二节前端分层
- CLAUDE.md：**可能要改** —— "不信任前端传来的角色"是安全口径，可能该进 D3。留结课挂账第 2 项判
- PROJECT_STRUCTURE：不影响

**Q2 数据级权限落 Service / Q3 Repository 每模块都写**
- 只影响 ARCHITECTURE。其余四类不影响

**取舍 4 z.infer 推导类型**
- ARCHITECTURE：**要改**
- 其余不影响。但它是 **05-类型那节的直接依据**，记进桥梁

**取舍 5 「无权限」与「不存在」合并**
- ARCHITECTURE：**要改**
- **PRD：要改** —— PRD 的"待验证盲区"里明确记着「任务详情『任务不存在』错误边界：PRD 错误/边界规则未定义」。**现在定义了，必须回填进 PRD 的错误/边界规则。** 这是规则 64 说的 B 类裁决，不能只活在架构文档里
- UI_DESIGN / CLAUDE.md / PROJECT_STRUCTURE：不影响

**这一遍多抓出两条挂账（CLAUDE.md 的 D 判断、PRD 错误边界回填），都是我上一轮凭想的时候漏掉的。**

## 2.4 UI_DESIGN 注记的正确范围

不是两行，是**四行加一个标题**：

- **28 行标题**「3. 项目入口 / 跨项目总览页」→ 页名本身含跨项目总览，要澄清
- **30 行核心元素**里的「负责人跨项目总览区」→ 本版不做
- **31 行**「负责多个项目时看各项目整体进度与成员分布」→ 本版不做
- **32 行**「执行者…不显示跨项目总览」→ 本版无此区域，该约束暂时无对象
- **33 行服务故事**里的 US-05 → 本版延后

**页 3 留下，页面数仍为 10。** 我到时出注记文本。

---

# 三、Q1 的约束我要再收紧一句

你给的两句我原样收下。**但 UI_DESIGN.md:138 让我发现还缺一句。**

那行原文的位置很关键 —— 它写在**加载态**里：

> 加载态：…角色专属入口在权限确认后再显示

**意思是：数据没回来、权限没确认之前，负责人专属的入口不能先画出来。**

如果角色缓存跨页面长期留着，前端可能在任何一次导航时**立刻**从缓存画出入口 —— 那就绕过了"权限确认后再显示"。

**而且这直接顶到 US-R02（P0）：角色改了要立即生效，不等重新登录。** 拿一份陈旧缓存画入口，恰好是那条验收最怕的情况。

补第三句：

```
角色随每次进入项目时的后端响应取得，仅在本次页面上下文内使用，不做跨页面长缓存。
角色未确认前，角色专属入口不渲染（UI_DESIGN.md:138 加载态要求）。
```

**这样三句合起来，Q1 的 A 方案就没有和 US-R02 打架的余地了。**

---

# 四、落盘第二节

两处我上一轮抓出来的，已经写进下面文本，你在文本里直接看：

- **Guard 提到 Controller 之前**（层序按 NestJS 请求生命周期，Guard 先跑）
- **共享层判据补第 4 问**（安全边界执行点那一问）

**看一眼这两处，同意就跑；不同意先告诉我，我改完再给你。**

注意是 `cat >>` 追加，不是 `>` 覆盖。

```
cd ~/projects/study-l3-v2
cat >> docs/arch/ARCHITECTURE.md << 'ENDOFFILE'

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
ENDOFFILE
```

验证：

```
cd ~/projects/study-l3-v2
wc -m docs/arch/ARCHITECTURE.md
grep -n "^## " docs/arch/ARCHITECTURE.md
tail -4 docs/arch/ARCHITECTURE.md
git status --short
```

审查清单：

- [ ] `wc -m` 明显大于之前的 2682（**没变说明追加失败，别是用了 `>` 覆盖**）
- [ ] `grep "^## "` 看到「一、模块划分」和「二、分层架构」**两节都在**
- [ ] `tail` 最后一行是"NestJS 请求生命周期层序…推导，无直接出处"，说明写到底没截断
- [ ] `git status --short` 里 ARCHITECTURE.md 仍是 `??`（还没提交，正常）

---

# 五、五个决策还悬着

前四个是上一轮和这一轮攒下的，最后一个是窗口计划。

```
判据第4问 + Guard位置：已写进上面文本，同意 / 要改（____）

决策14 默认档：A 加 defaultMode default（推荐A） / B 锁死auto / C 保持现状
决策15 反模式36 未声明档位由厂商默认值填：A 入库（推荐A） / B 不记
决策16 规则69 拍板即扫传播面：A 立（推荐A） / B 不立

窗口计划：A 落盘完就结课出桥梁，第3-5段新窗口（推荐A）
          B 再推第3段数据流再结课
          C 其他（____）

补充或质疑：____
```

---

# 六、挂账更新（只列变动）

**改：**

- UI_DESIGN 注记范围从「两行」改为「28 标题 + 30/31/32/33 四行」，**页面数仍为 10**（我上一轮写的 9 个作废）

**新增：**

- **PRD 回填错误/边界规则**：「无权限」与「不存在」合并（规则 64 B 类裁决，PRD 待验证盲区里那条现在有答案了）
- **结课挂账第 2 项加一条具体待查**：「不信任前端传来的角色」是否该进 CLAUDE.md 第三层 D3

**其余不变。** 反模式库预计到 36，PROJECT_STRUCTURE 写 1-36。

---

**窗口体感（规则 38 / 48）：** 约八成。规则 48 说到七八成就该主动喊停。

**所以窗口计划这一条，我建议你就选 A。** 结课固定动作六大步、十几项挂账要逐个落盘，那本身就占地方。再开第 3 段，结课时只能压缩 —— 那正是反模式 17 的入口。

Human (Sep 10, 2026, 12:19 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
wc -m docs/arch/ARCHITECTURE.md
grep -n "^## " docs/arch/ARCHITECTURE.md
tail -4 docs/arch/ARCHITECTURE.md
git status --short
7604 docs/arch/ARCHITECTURE.md
8:## 一、模块划分
101:## 二、分层架构
- 组件栈 Tailwind + shadcn/ui：UI_DESIGN.md:165-166。
- assignee 字段与列名映射：prisma/schema.prisma:85。
- 全表 @map / @@map：prisma/schema.prisma:28-112。
- NestJS 请求生命周期层序、跨模块只走 Service、共享层判据四问、命名三层的推论：推导，无直接出处。
 M .claude/settings.json
?? docs/arch/ARCHITECTURE.md
michael@AngelHe:~/projects/study-l3-v2$ 

判据第4问 + Guard位置：已写进上面文本，同意 

决策14 默认档：A 加 defaultMode default（推荐A） 
决策15 反模式36 未声明档位由厂商默认值填：A 入库（推荐A）
决策16 规则69 拍板即扫传播面：A 立（推荐A）

窗口计划：A 落盘完就结课出桥梁，第3-5段新窗口（推荐A）
          

补充或质疑：____

Claude:
**老师锚点（3 行）**

- 分工：落盘验证通过，第 2 段定稿。现在进结课流程，按规则 54 的六步逐条走。
- 红线：结课动作我逐条报，不靠记忆；每个文件的文本我出，你亲手落盘。
- 这一步我最可能犯的错：挂账攒了十几项，急着收尾就漏掉几项。所以下面每一步我都写编号。

---

# 一、落盘验证：逐条过

- `wc -m` = 7604，之前是 2682。**增加了 4922 字符，追加成功，不是覆盖。** ✓
- `grep "^## "` 看到第 8 行「一、模块划分」、第 101 行「二、分层架构」，**两节都在** ✓
- `tail` 最后一行是"NestJS 请求生命周期层序…推导，无直接出处"，**写到底没截断** ✓
- `git status --short` = ARCHITECTURE.md 仍是 `??`，settings.json 是 ` M` ✓

**第 2 段分层架构定稿落盘。决策 9（每段定稿即落盘）第二次执行成功。**

四个决策全 A，判据第 4 问和 Guard 位置你也确认了。**进结课。**

---

# 二、结课流程：按规则 54 走六步

规则 54 定死的顺序，我逐条报，不靠记忆：

1. 新反模式入库（anti-patterns.md）
2. 新规则入库（COURSE_RULES.md）
3. 写两份笔记
4. 更新目录树（PROJECT_STRUCTURE.md）← **必须排在所有文件落盘之后**（规则 52）
5. git 提交
6. 发桥梁 ← **必须是最后一步**（规则 45）

加上规则 60 的结课闸（六文件逐个问）和规则 65（BACKLOG 逐条问）。

**十几项挂账我重排成六批，每批一个代码块，你一批一批跑。** 这一轮先跑前三批（反模式、规则、宪法与需求类文件）。

---

# 三、第一批 · 反模式 35、36 入库

先说清这两条在讲什么，别只是粘进去。

**35 号讲的是"写了但引擎不查"。** 三条 Write 规则挂在那里，看着像墙，引擎的匹配清单里没有它们。

**36 号讲的是"压根没写，所以由别人替你写"。** defaultMode 你从来没声明过，那一档就由厂商默认值填，而且会随版本变化，不通知你。

**两条是同一件事的两面：机械层的实质状态，从来没被验证过。**

```
cd ~/projects/study-l3-v2
cat >> docs/lessons/anti-patterns.md << 'ENDOFFILE'

## 35 号 · 权限规则写了不代表被查询（死规则）
现象：Lec 6 建 settings.json 时，按「工具名 + 路径」的直觉写了 Write(prisma/**)、Write(CLAUDE.md)、Write(.claude/**)。但 Claude Code 的文件权限检查只匹配 Edit(path) 和 Read(path)；Write / NotebookEdit / MultiEdit / Glob 的路径规则会被接受、解析通过，却永不查询，v2.1.210 起还会打启动警告。三条规则从建立当天起就是死的，真正生效的一直是同路径的 Edit 规则。
根因：E2 工具错。按工具名的字面直觉推断匹配关系，没核官方文档；建完只 cat 看内容，没用 /permissions 或 /doctor 验证规则是否真被加载查询。
修复：
- 文件类护栏一律写 Edit(path)（它覆盖所有改文件的内置工具）与 Read(path)。不写 Write(path)。
- 权限文件每次改动后必须两步验证：一，/permissions 看解析结果；二，实测一次（让 CC 尝试改受管路径，确认弹窗，然后答 No）。
教训：配置文件里「写了」和「生效」是两件事。JSON 解析通过不等于规则被引擎查询。
抽象模式：反模式 3（表象成功≠实质生效）在配置层的实例。与 21 号互补——21 是人立了规则不执行，35 是机器压根没在查。
附带教训（老师侧）：老师在未核实的猜测上继续推导了两段分析。标注「这是猜测」不等于可以在猜测上盖楼。前提未核实时，停在前提，不往下推。

## 36 号 · 未声明的档位由厂商默认值填
现象：CLAUDE.md 第三层定了 D1-D7 决策边界，settings.json 定了 allow/ask/deny 三档，但从未声明 defaultMode。项目跑了七节课，实际运行在 auto mode（自动批准 + 后台分类器）下，师生双方都不知道。这一档由 Claude Code 按套餐给的内置默认值填，且随版本变化而无通知。
根因：E4 架构错。护栏设计只覆盖了「枚举得出的规则」，没覆盖「没枚举到的东西怎么办」。兜底档是护栏的一部分，漏了它等于把最大的一片交给厂商默认值。
修复：凡有默认值/兜底档的配置项，必须显式声明，不许留空靠继承。settings.json 显式写 defaultMode。开课自检追加一项：确认当前会话运行在哪个权限模式。
教训：护栏的完整性 = 枚举的规则 + 兜底档。只看规则清单会漏掉最大的那一块。
补充（本课查证）：deny 与 ask 规则的评估顺序在权限模式之前，所以内容有范围的 ask 规则在 auto mode 下依然强制弹窗。这是本课实测确认的。但 allow 档之外的一切仍由默认档决定。
抽象模式：与 35 号互补——35 是「写了但引擎不查」，36 是「压根没写所以由别人替你写」。同属「机械层的实质状态没被验证」。
ENDOFFILE
```

---

# 四、第二批 · 规则 67、69 入库 + 规则 66 追加

三条一起。**规则 68 我跳过没用**，编号从 67 直接到 69，中间空一个。

**为什么留空：** 我上一轮在正文里提过一次"规则 68"当占位，最后并进了规则 66 的追加。**编号一旦在对话里出现过，就不该再分配给别的内容**，否则日后翻记录会撞车。留空比复用干净。

```
cd ~/projects/study-l3-v2
cat >> docs/COURSE_RULES.md << 'ENDOFFILE'

## 67 · 桥梁与持久文件的优先级
桥梁只在「本课临时状态」上优先：进度、接续、本课安排、git 状态、待办交接。
凡涉及讲课方式、协作规矩、角色标准、段落骨架、结课流程这类持久规则，以开课必读七文件为准，桥梁无权覆盖。
老师读完七文件后，须回头核一遍桥梁的启动指令与持久规则有没有打架。发现打架，当场向学生说明，按持久文件执行，并记进本课挂账。
与调节器第 1 节「桥梁 > 调节器 > KNOWLEDGE_BASE」的关系：叠加限定，不替代。那条链解决的是「三份开课资料之间」的冲突；本条解决的是「桥梁 vs 学生机器上的七文件」，是原链没覆盖的一环。
案例：05-ARCH 桥梁启动指令要求「抽 2 道题让学生口答」，撞规则 44「不让学生写长答案」。老师在未读 COURSE_RULES 时照桥梁做，做出来就违规。

（68 号留空未使用。该编号曾在 05-ARCH 对话中作占位出现，内容最终并入规则 66 追加段，故不再分配。）

## 69 · 拍板即扫传播面
凡在主对话拍板一条影响文档的决策（范围取舍、字段增删、口径变更），老师当场列出该决策的传播面，不凭印象。
传播面至少过这五类：PRD / UI_DESIGN / ARCHITECTURE 或契约 / CLAUDE.md 相应层 / PROJECT_STRUCTURE。
逐类写「要改」或「不影响」，两者都要显式写出，不许留空。
执行方式：必须真的打开文件核，不许靠回忆推断。
背景：05-ARCH 决策 5（US-05 延后）只列了 PRD 注记，漏掉 UI_DESIGN 的跨项目总览区，由 architect 反过来抓出。老师随后又在未打开 UI_DESIGN 的情况下推出「页面数变成 9 个」，读原文后发现页 3 承载登出入口不能删，页面数仍为 10。同一形状连错两次，故本条强制「打开文件核」而非「想一遍」。
与补丁 14（传播矩阵 5 项）关系：补丁 14 给了矩阵，本条规定何时强制执行它。
与反模式 31 关系：31 是「补需求要校老需求」，本条是「拍板后要扫下游文档」，同族不同环节，叠加生效。
ENDOFFILE
```

规则 66 的追加，单独一条命令（**反模式 28：说明文字不夹在命令块之间**，所以分开）：

```
cd ~/projects/study-l3-v2
cat >> docs/COURSE_RULES.md << 'ENDOFFILE'

### 规则 66 追加（05-ARCH 加）
权限文件每次改动后必须验证生效，不止验证内容。
两步：一，/permissions 看引擎解析出的规则清单与来源文件；二，实测一次受管路径，确认弹窗后答 No。
文件类护栏一律写 Edit(path) 与 Read(path)，不写 Write(path)。
settings.json 必须显式声明 defaultMode，不许留空靠厂商默认值。
理由见反模式 35（规则解析通过不等于被查询）与反模式 36（未声明的档位由厂商默认值填）。
ENDOFFILE
```

---

# 五、第三批 · settings.json 加 defaultMode（决策 14）

**规则 66：这个文件你亲手写，CC 不碰。**

只加一行 `"defaultMode": "default"`，其余原样。

```
cd ~/projects/study-l3-v2
cat > .claude/settings.json << 'ENDOFFILE'
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "defaultMode": "default",
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Bash(rm *)",
      "Bash(sudo *)",
      "Bash(curl *)",
      "Bash(wget *)"
    ],
    "ask": [
      "Bash(git push *)",
      "Bash(npx prisma migrate *)",
      "Bash(pnpm prisma migrate *)",
      "Edit(prisma/**)",
      "Edit(CLAUDE.md)",
      "Edit(.claude/**)",
      "Edit(docs/arch/**)"
    ],
    "allow": [
      "Bash(pnpm test *)",
      "Bash(pnpm run *)",
      "Bash(npm run test *)",
      "Bash(npm run lint *)"
    ]
  }
}
ENDOFFILE
```

**验证这一条必须做，别跳过 —— 反模式 35 的教训就是"写了不等于生效"。**

改完 settings.json 要**重开一个 CC 会话**才加载新配置，然后看左下角那行状态。

```
cd ~/projects/study-l3-v2
cat .claude/settings.json | head -6
git diff --stat .claude/settings.json
```

预期：`defaultMode` 在第 4 行；diff 显示 1 增（在上一轮 3 增 11 删的基础上）。

**然后重开 CC，看状态行。** 原来显示的是 `⏵⏵ auto mode on`。**现在应该不再是 auto。**

---

# 六、结课六文件逐个过（规则 60 结课闸）

规则 60 要求逐个文件问一遍"本课有没有产生该更新它的内容"，逐条报。**我现在报前六个，第七个 BACKLOG 在下一轮。**

**COURSE_RULES —— 有。** 规则 67、69 + 规则 66 追加。第四节已落盘。

**anti-patterns —— 有。** 反模式 35、36。第三节已落盘。

**TEACHING_STYLE —— 我判断没有，但要你确认。**

本课手感上没出新约定。**唯一可能的候选是"老师在未核实前提上往下推导"这件事**，但那已经写进反模式 35 的附带教训了，属于行为纪律，不属于讲课手感。

**如果你觉得本课讲解有该固化的手感（比如"每轮开头先认错"这种），现在说，我加。**

**AGENT_SPEC —— 有一条候选，我倾向不加，理由说清。**

候选是：架构师这次误用了陷阱 8 号，长会话后没重读数据文件（只重读了自己的定义文件）。

**倾向不加的理由：** 规则 27 已经写了"长会话后角色要重读定义文件"。要补的是"数据文件也要重读"，但这条更像是写 prompt 时的事（我给的 prompt 里可以明确要求），不是角色文件标准的事。

**这条归你判，见第八节决策 17。**

**LESSON_TEMPLATE —— 没有。** 3a-3d 骨架本课用了两次（第 1 段、第 2 段），走得通，没暴露缺口。

**PROJECT_STRUCTURE —— 有，但排最后。** 规则 52：目录树更新必须是结课的最后一个文件动作。**下一轮做。**

---

# 七、这一轮先跑三批，然后我出剩下的

**这一轮你要跑的：** 第三节（反模式）、第四节（两条规则命令）、第五节（settings.json + 验证）。

**下一轮我出的，已经写好在等：**

- CLAUDE.md 第三层：D8 文档口径冲突（决策 8 = A）
- PRD 三条澄清注记 + 错误边界回填（无权限与不存在合并）
- UI_DESIGN 注记（页 3 五处，页面数仍为 10）
- TECH_STACK.md:56 措辞修订
- BACKLOG 新增四条 + 删重复第 9 条
- 规则 33 补适用范围界定
- 两份笔记（05-arch-full.md + 05-arch-cheatsheet.md）
- PROJECT_STRUCTURE 更新（排最后）
- git 提交信息（规则 63：必须如实覆盖全部改动）
- 桥梁 prompt（规则 45：全课最后一个产出）

**一件事先说清：这些内容量不小，很可能这个窗口装不下全部。**

**如果跑到中途窗口紧了，我会在还剩余量时喊停，先把桥梁发出来**（桥梁里带上未完成的落盘清单），**而不是硬撑到压缩**。规则 48。

**桥梁本身必须最后发（规则 45），但"先入库后桥梁"指的是规则和反模式 —— 那两样这一轮就入完了，所以即使中途换窗口，传承链也不会断。**

---

# 八、你现在做两件事

**一，** 跑第三、四、五节的命令，贴回验证输出。

**二，** 回下面模板。

```
【反模式入库】
tail -5 docs/lessons/anti-patterns.md：____

【规则入库】
grep -n "^## 6" docs/COURSE_RULES.md：____

【settings.json】
head -6 看到 defaultMode：是 / 否
git diff --stat：____
重开 CC 后状态行：不再是 auto / 仍是 auto / 显示____

决策17 AGENT_SPEC 要不要加「长会话后数据文件也重读」：
  A 加进 AGENT_SPEC
  B 不加，改在 prompt 里要求（我倾向B）
  C 加进 COURSE_RULES 当老师写 prompt 的规矩

决策18 TEACHING_STYLE 本课有无新手感要固化：无 / 有（____）

补充或质疑：____
```

---

**窗口体感（规则 38 / 48）：** 约八成半。

**这一轮跑完，我下一轮出剩余落盘文本，能出多少出多少，出不完就先发桥梁。** 你不用担心断在半路 —— 规则和反模式已经入库，那是传承链最关键的两环。

Human (Sep 10, 2026, 12:39 PM):
【反模式入库】
tail -5 docs/lessons/anti-patterns.md：michael@AngelHe:~/projects/study-l3-v2$ tail -5 docs/lessons/anti-patterns.md
根因：E4 架构错。护栏设计只覆盖了「枚举得出的规则」，没覆盖「没枚举到的东西怎么办」。兜底档是护栏的一部分，漏了它等于把最大的一片交给厂商默认值。
修复：凡有默认值/兜底档的配置项，必须显式声明，不许留空靠继承。settings.json 显式写 defaultMode。开课自检追加一项：确认当前会话运行在哪个权限模式。
教训：护栏的完整性 = 枚举的规则 + 兜底档。只看规则清单会漏掉最大的那一块。
补充（本课查证）：deny 与 ask 规则的评估顺序在权限模式之前，所以内容有范围的 ask 规则在 auto mode 下依然强制弹窗。这是本课实测确认的。但 allow 档之外的一切仍由默认档决定。
抽象模式：与 35 号互补——35 是「写了但引擎不查」，36 是「压根没写所以由别人替你写」。同属「机械层的实质状态没被验证」。
michael@AngelHe:~/projects/study-l3-v2$ 

【规则入库】
grep -n "^## 6" docs/COURSE_RULES.md：michael@AngelHe:~/projects/study-l3-v2$ grep -n "^## 6" docs/COURSE_RULES.md
107:## 60 · 六文件结课维护 + 开课结课双闸自检
126:## 61 · 传承链元检查
134:## 62 · 讲解骨架强制 + 入自检
144:## 63 · 提交前先看 status
147:## 64 · 信息分层落盘（产生即定层）
157:## 65 · BACKLOG 跨课待办纳入开课必读与结课动作
163:## 66 · 约束 CC 的配置文件由学生亲写
169:## 67 · 桥梁与持久文件的优先级
178:## 69 · 拍板即扫传播面

【settings.json】
head -6 看到 defaultMode：是 
git diff --stat：michael@AngelHe:~/projects/study-l3-v2$ git diff --stat
 .claude/settings.json         | 15 ++++-----------
 docs/COURSE_RULES.md          | 25 +++++++++++++++++++++++++
 docs/lessons/anti-patterns.md | 18 ++++++++++++++++++
 3 files changed, 47 insertions(+), 11 deletions(-)
重开 CC 后状态行：不再是 auto 

决策17 AGENT_SPEC 要不要加「长会话后数据文件也重读」：B
  A 加进 AGENT_SPEC
  B 不加，改在 prompt 里要求（我倾向B）
  C 加进 COURSE_RULES 当老师写 prompt 的规矩

决策18 TEACHING_STYLE 本课有无新手感要固化：无 

补充或质疑：1. 简单回答，本节课的分层和模块化中，由于我们在前端/后端/章节都使用框架，那模块/文件目录结构不就都不统一和打乱？

Claude:
**老师锚点（3 行）**

- 分工：先答你的问题，再继续落盘。你的问题优先。
- 红线：这个问题我要给的是概念澄清，不是新决策 —— 不借机把已定的东西重开。
- 这一步我最可能犯的错：你说"简单回答"，我讲成一整段课。

---

# 一、三批入库全部验证通过

- 反模式：`tail -5` 看到 36 号的完整尾部 ✓
- 规则：`grep` 看到 67、69，**中间跳过 68**，留空生效 ✓
- settings.json：`defaultMode` 在 head -6 里 ✓
- **重开 CC 后状态行不再是 auto** ✓ —— **这是今天第三次验到实质**
- `git diff --stat`：三个文件，47 增 11 删 ✓

决策 17 = B，决策 18 = 无。都收，不再展开。

---

# 二、你的问题：会不会打乱

**简单答：不会打乱，而且顺序正好相反 —— 是框架去适配我们的模块划分，不是我们迁就框架。**

## 2.1 关键在于我们定的两刀，切的不是同一个东西

**模块划分（第 1 段）切的是"业务域"** —— 六个模块：users、auth、authz、projects、tasks、notifications。

**分层（第 2 段）切的是"职责"** —— Guard、Pipe、Controller、Service、Repository。

**框架规定的是"层长什么样"，没规定"有几个业务域"。**

NestJS 告诉你 controller 该怎么写、Guard 怎么注册。**它不知道你的项目有 tasks 还是有别的，那是你定的。**

## 2.2 所以目录长这样：域在外，层在内

后端一个模块一个文件夹，层是文件夹里的文件：

```
apps/api/src/
├── users/
│   ├── users.module.ts
│   ├── users.controller.ts
│   ├── users.service.ts
│   └── users.repository.ts
├── auth/
├── authz/
├── projects/
├── tasks/
└── notifications/
```

**这正是 NestJS 官方推荐的组织方式** —— 它的 module 机制天生就是为按业务域分而设计的。我们的六个模块，一个对一个变成六个 NestJS module。

**不是我们迁就它，是两边本来就长一个样。**

## 2.3 前端确实不一样，但这是应该的

前端不按六个模块分，因为**前端的组织单位是"页面"，不是"业务域"**。

用户打开的是"任务列表页"，不是"tasks 模块"。UI_DESIGN 定的 10 个页面才是前端的骨架。

打个比方。

**后端是后厨，按菜系分档口：热菜档、凉菜档、点心档。**

**前端是餐厅前台，按餐位分区：靠窗区、包间、大厅。**

**两边分法不同，但没有矛盾。** 前台一桌客人可能点了热菜也点了点心 —— 一个页面调用多个模块的接口，很正常。

## 2.4 真正把两边连起来的是共享层

`packages/shared` 就是那份"菜单"。

前端按页面组织，后端按域组织，**但两边看的字段名、枚举、类型是同一份**。

而且我们上一轮刚定的命名规范让这件事更硬：**全链路 camelCase，snake_case 被 `@map` 关在数据库里。** 前端拿到的字段名和后端 Prisma 里的字段名，一个字都不差。

**所以"打乱"的风险不在目录结构上，在字段名和类型上。而那一块我们已经焊死了。**

## 2.5 一句话收尾

**目录结构不统一是对的，因为前后端解决的问题本来就不同。**

**要统一的是"契约"，不是"文件夹"。**

**这也正是下一节（05-API 契约）和下下节（05-类型）要干的事。** 你这个问题问在了正确的位置上 —— 它就是补课链后面两节存在的理由。

---

# 三、继续落盘 · 第四批

三个文件，三条独立命令（反模式 28：命令块之间不夹说明）。

## 3.1 CLAUDE.md 第三层加 D8

**这是决策 8。** 架构师两轮下来指出了六处文档冲突，而"两份已决文档打架、以谁为准"这类决定，D1-D7 一条都不管。今天靠我在 prompt 里补了一句兜住的，**是 prompt 兜的，不是宪法兜的**。

```
cd ~/projects/study-l3-v2
cat >> CLAUDE.md << 'ENDOFFILE'

D8 文档口径冲突：CC 发现两份已决文档、或同一文档的新旧措辞互相矛盾时 → 只报不改，由主人裁决以谁为准。
   禁止自行挑一份「看起来更新的」为准，也禁止顺着写下去当没看见。
   报的时候要给出双方出处（文件路径:行号）与冲突点，不给结论。
   为什么不并进 D7：D7 触发条件是「没把握、缺上下文、藏着取舍」。发现文档冲突时 CC 往往很有把握（能一眼看出哪份更新），有把握就不触发 D7，于是直接挑一边改了。
   由来：补课 05-ARCH，architect 两轮共指出六处文档冲突（PRD 要姓名但 schema 无 name、US-04 要项目 deadline 但 projects 表无该字段、notifications 表本版无生产者、TECH_STACK 措辞与 schema 对不上、UI_DESIGN 含已延后的 US-05、前端角色来源未定义）。这些能被暴露出来，是因为老师在 prompt 里写了「发现冲突先指出再继续」——是 prompt 兜住的，不是宪法兜住的（反模式 25：制度只保证本次执行，不保证传承）。
   相关反模式：26（新旧制度没说清衔接）、31（新旧措辞不对齐）、34（落点没对权威源核实）同族。
ENDOFFILE
```

## 3.2 PRD 补澄清注记 + 回填错误边界

**四件事一起：三条澄清注记 + 一条错误边界回填。**

那条回填很值得留意 —— PRD 自己的"待验证盲区"里记着「任务详情『任务不存在』错误边界未定义」。**今天定义了，所以要回填。这就是规则 64 说的 B 类裁决必须落进持久文件。**

```
cd ~/projects/study-l3-v2
cat >> docs/design/PRD.md << 'ENDOFFILE'

## 澄清注记（补课 05-ARCH 补 · 原 US 文字不改）
> 架构收尾阶段的新旧一致性扫描结果（反模式 31、规则 69）。以下注记澄清宽措辞与新裁决，不修改已验证原文。

4. 针对 US-06、US-P03 的「姓名 / 名称」：首版 users 表不设 name 字段，界面一律显示 email。
   依据：US-A02 验收允许「姓名或邮箱」；US-06、US-P03 原文只写姓名，未写「或邮箱」，故此处需显式裁决。
   将来补 name 成本低（可空加列 + UI 兜底，无数据迁移、无约束冲突），故本版不预留不构成演进负担。
   原 US 文字不改。

5. 针对 US-04 第三条验收（「项目完成率低于阈值且距 deadline 不足设定天数」）：本版延后，与 US-02b 同批。
   理由：项目级 deadline 需要 projects 表加字段、US-P01 表单加输入、以及一条 PRD 中不存在的「编辑项目」用户故事。加一列容易，但没有任何故事允许任何人修改它 —— 一个改不了的截止日期比没有更糟。属 D1 范围取舍，非 D2 字段增删。
   本版 US-04 兑现前两条验收（任务汇总、汇总反映最新状态），主体价值不受影响。
   另：本节第六条「待真实验证的盲区」已记「设定天数、某阈值为占位」，本条与之一致。
   原 US 文字不改。

6. 针对 US-05 跨项目总览：本版延后，与 US-02b 口径拉齐（原为 P2「资源允许时做」，无结论）。
   理由：跨项目查询需绕开项目级权限模型，是本版最不想碰的地方；两条 P2 口径统一。
   排期至 Lec 13 功能迭代，非砍掉。
   连带：第三节 In Scope 中「跨项目总览（P2，资源允许时做）」按本条理解为本版不做。
   UI_DESIGN 页 3 相应措辞另有注记，页 3 本身保留（承载 US-P01/P02/R01/A03 登出入口），页面数仍为 10。
   原 US 文字不改。

### 错误 / 边界规则回填（补课 05-ARCH 定 · 属 D3 权限与安全口径）
> 本节第六条「待验证盲区」曾记「任务详情『任务不存在』错误边界：PRD 错误/边界规则未定义」。现定义如下，该盲区条目已解决。

- 访问一条不存在的任务，与访问一条存在但不属于自己的任务 → 合并为同一响应，统一提示「权限不足」，不区分，不带任何任务数据。
  理由：对执行者而言两者语义等价（他只能看自己的任务）；服务端少一次分支；与登录失败统一提示「邮箱或密码不正确」同思路。
  注意：本条不构成通用铁律。PRD 对「邀请的邮箱不存在」是分开提示的（内部操作不构成枚举风险）。两种做法按场景选。
  实现落点见 docs/arch/ARCHITECTURE.md 第二节「校验与权限的落点」：判定在 Service 层，Guard 阶段拿不到记录。
ENDOFFILE
```

## 3.3 UI_DESIGN 补注记

**范围是页 3 的标题加四行**，不是我上一轮说的两行。**页面数仍为 10，我上一轮说的 9 个作废。**

```
cd ~/projects/study-l3-v2
cat >> docs/design/UI_DESIGN.md << 'ENDOFFILE'

## 澄清注记（补课 05-ARCH 补 · 原设计文字不改）
> 本设计产出于 Lec 3，早于 05-ARCH 阶段的范围裁决。以下注记澄清受影响的措辞，原文不改（规则 69 传播面扫描结果）。

针对「3. 项目入口 / 跨项目总览页」，受 US-05 本版延后影响的五处：
- 页名中的「跨项目总览」：本版该区域不实现，页名保留不改。
- 核心元素中的「负责人跨项目总览区」：本版不实现。
- 「负责多个项目时看各项目整体进度与成员分布」：本版不实现。
- 「执行者…不显示跨项目总览」：本版无该区域，此约束暂无对象；US-05 恢复时该约束自动生效。
- 服务故事中的 US-05：本版延后至 Lec 13。

本页保留，不删。 它同时承载 US-P01（创建项目）、US-P02（邀请成员）、US-R01（权限区分）、US-A03（登出入口在此，且登出入口仅在此页）。删页会使 US-A03 这条 P0 故事失去入口。
故页面清单仍为 10 个页面，本版实现 10 个页面，其中页 3 少一个区域。

另：UI_DESIGN.md:138「角色专属入口在权限确认后再显示」这条加载态要求，已在 ARCHITECTURE.md 第二节前端分层中转为硬约束（角色不做跨页面长缓存、未确认前不渲染角色专属入口）。此处不改，仅记录落点。
ENDOFFILE
```

## 3.4 TECH_STACK 措辞修订

**这条是 str_replace 式的改动，不是追加。** 用 sed 精确替换第 56 行那一条。

```
cd ~/projects/study-l3-v2
cp docs/arch/TECH_STACK.md /tmp/TECH_STACK.bak
python3 - << 'ENDOFFILE'
import io
p = "docs/arch/TECH_STACK.md"
s = io.open(p, encoding="utf-8").read()
old = "4. 任务实体可挂载：任务表预留外键挂载位，为后续子任务/附件/评论（PRD.md:114）留地，首版不建这些表。"
new = "4. 任务实体可挂载：tasks 主键稳定，后续子任务/附件/评论（PRD.md:114）以 task_id 外键挂载到任务，外键长在子表一侧，tasks 表本身无需预留字段；首版不建这些子表。（措辞修订于补课 05-ARCH：原措辞「任务表预留外键挂载位」易被读成 tasks 表上要有预留字段，architect 据此报过一次冲突，核查为措辞歧义，schema 无缺失。）"
assert s.count(old) == 1, "匹配数不是 1，当前为 %d，未修改" % s.count(old)
io.open(p, "w", encoding="utf-8").write(s.replace(old, new))
print("已替换")
ENDOFFILE
```

**为什么先 `cp` 备份：** 这是本课唯一一处**修改已有内容**的操作，其余全是追加。追加错了删掉就行，替换错了原文就没了。**协议 12 双确认的轻量版 —— 先留回滚路径再动手。**

`assert` 那行是保险：匹配不到一处就直接报错退出，不会改错地方。

---

# 四、验证

```
cd ~/projects/study-l3-v2
tail -3 CLAUDE.md
grep -n "澄清注记（补课 05-ARCH" docs/design/PRD.md docs/design/UI_DESIGN.md
grep -n "任务实体可挂载" docs/arch/TECH_STACK.md
diff /tmp/TECH_STACK.bak docs/arch/TECH_STACK.md | head -6
git status --short
```

审查清单：

- [ ] `tail -3 CLAUDE.md` 看到 D8 的末尾（相关反模式那行）
- [ ] PRD 和 UI_DESIGN **各有一条**「澄清注记（补课 05-ARCH」
- [ ] `grep 任务实体可挂载` 看到新措辞，含"外键长在子表一侧"
- [ ] `diff` **只显示那一行的变化**，没有别的行被动到
- [ ] `git status --short` 里应有：`M .claude/settings.json`、`M CLAUDE.md`、`M docs/COURSE_RULES.md`、`M docs/arch/TECH_STACK.md`、`M docs/design/PRD.md`、`M docs/design/UI_DESIGN.md`、`M docs/lessons/anti-patterns.md`、`?? docs/arch/ARCHITECTURE.md`

**最后一条特别核 —— 八个条目，一个不多一个不少。** 规则 63 要求提交前看清 status，多出来的文件要么写进提交信息，要么分开处理。

---

# 五、剩下的（下一轮）

- BACKLOG：新增四条 + 删重复第 9 条
- 规则 33 补适用范围界定
- 两份笔记
- PROJECT_STRUCTURE 更新（**排最后，规则 52**）
- git 提交
- 桥梁（**最后一步，规则 45**）

---

**窗口体感（规则 38 / 48）：** 约九成。

**下一轮我会先出 BACKLOG + 规则 33 + 两份笔记 + 目录树，然后立刻发桥梁**，不再插入任何讨论。如果空间不够，**我会砍掉笔记的完整版、只出速查卡，把桥梁保住** —— 桥梁断了下一课接不上，笔记可以在新窗口补。

Human (Sep 10, 2026, 2:21 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
tail -3 CLAUDE.md
grep -n "澄清注记（补课 05-ARCH" docs/design/PRD.md docs/design/UI_DESIGN.md
grep -n "任务实体可挂载" docs/arch/TECH_STACK.md
diff /tmp/TECH_STACK.bak docs/arch/TECH_STACK.md | head -6
git status --short
   为什么不并进 D7：D7 触发条件是「没把握、缺上下文、藏着取舍」。发现文档冲突时 CC 往往很有把握（能一眼看出哪份更新），有把握就不触发 D7，于是直接挑一边改了。
   由来：补课 05-ARCH，architect 两轮共指出六处文档冲突（PRD 要姓名但 schema 无 name、US-04 要项目 deadline 但 projects 表无该字段、notifications 表本版无生产者、TECH_STACK 措辞与 schema 对不上、UI_DESIGN 含已延后的 US-05、前端角色来源未定义）。这些能被暴露出来，是因为老师在 prompt 里写了「发现冲突先指出再继续」——是 prompt 兜住的，不是宪法兜住的（反模式 25：制度只保证本次执行，不保证传承）。
   相关反模式：26（新旧制度没说清衔接）、31（新旧措辞不对齐）、34（落点没对权威源核实）同族。
docs/design/PRD.md:287:## 澄清注记（补课 05-ARCH 补 · 原 US 文字不改）
docs/design/UI_DESIGN.md:176:## 澄清注记（补课 05-ARCH 补 · 原设计文字不改）
56:4. 任务实体可挂载：tasks 主键稳定，后续子任务/附件/评论（PRD.md:114）以 task_id 外键挂载到任务，外键长在子表一侧，tasks 表本身无需预留字段；首版不建这些子表。（措辞修订于补课 05-ARCH：原措辞「任务表预留外键挂载位」易被读成 tasks 表上要有预留字段，architect 据此报过一次冲突，核查为措辞歧义，schema 无缺失。）
56c56
< 4. 任务实体可挂载：任务表预留外键挂载位，为后续子任务/附件/评论（PRD.md:114）留地，首版不建这些表。
---
> 4. 任务实体可挂载：tasks 主键稳定，后续子任务/附件/评论（PRD.md:114）以 task_id 外键挂载到任务，外键长在子表一侧，tasks 表本身无需预留字段；首版不建这些子表。（措辞修订于补课 05-ARCH：原措辞「任务表预留外键挂载位」易被读成 tasks 表上要有预留字段，architect 据此报过一次冲突，核查为措辞歧义，schema 无缺失。）
 M .claude/settings.json
 M CLAUDE.md
 M docs/COURSE_RULES.md
 M docs/arch/TECH_STACK.md
 M docs/design/PRD.md
 M docs/design/UI_DESIGN.md
 M docs/lessons/anti-patterns.md
?? docs/arch/ARCHITECTURE.md

Claude:
**老师锚点（3 行）**

- 分工：验证全过。这一轮走完剩余落盘，然后发桥梁，中间不插讨论。
- 红线：目录树必须排在所有文件动作之后（规则 52），桥梁必须最后（规则 45）。
- 这一步我最可能犯的错：赶收尾，把 BACKLOG 逐条问那一步跳过去。

---

# 一、第四批验证：八条全过

- `tail -3 CLAUDE.md` → D8 完整写到底 ✓
- PRD:287、UI_DESIGN:176 → **各一条注记，不重复** ✓
- TECH_STACK:56 → 新措辞在位 ✓
- **`diff` 只显示 `56c56` 一行变化，没有别的行被动到** ✓ —— 替换操作精确命中
- `git status --short` → **正好八条，一个不多一个不少** ✓

**规则 63 要求的"提交前看清 status"，这一条已经提前做完了。** 下面的提交信息就照这八条写。

---

# 二、第五批 · BACKLOG（规则 65 逐条问）

规则 65 要求结课逐条问有无该进 backlog 的待办。**本课攒了四条，我逐条报，同时删掉重复的第 9 条。**

四条的共同点：**都是"该做但本课不做"，不是本课的遗留错误。**

**一，沙箱。** 权限规则挡得住 CC 的文件工具和 Bash 重定向，挡不住"一个自己打开文件的 Python 脚本"。要 OS 级封堵得靠沙箱。

**二，PreToolUse hook。** ask 档在 Bash 路径上的覆盖范围，文档没写死，我查不出确定答案。hook 是唯一能罩住每个工具调用的办法。

**三，lint 限制跨模块 import。** 今天定了 Repository 每模块都写，但那是语义层约定。要变成墙得靠 lint。

**四，角色变更主动通知前端。** Q1 的未覆盖项。

**一、二、三都归 Lec 8**，因为那节是 Husky + Lint + Hooks。**四归 Lec 13。**

```
cd ~/projects/study-l3-v2
cp docs/BACKLOG.md /tmp/BACKLOG.bak
python3 - << 'ENDOFFILE'
import io
p = "docs/BACKLOG.md"
lines = io.open(p, encoding="utf-8").read().rstrip("\n").split("\n")
dup = [i for i, l in enumerate(lines) if l.startswith("9 | 下沉 | 配置文件是攻击面")]
assert len(dup) == 2, "第 9 条重复行数不是 2，当前 %d，未修改" % len(dup)
del lines[dup[1]]
lines += [
 "10 | 下沉 | 沙箱（sandboxing）：权限规则管得住 CC 的文件工具与 Bash 重定向，管不住自己打开文件的子进程（如 python 脚本）。OS 级封堵需启用沙箱 | Lec 8（与第 9 条同组）",
 "11 | 下沉 | PreToolUse hook：ask 档对 Bash 路径的覆盖范围官方文档未写死，未能查证。hook 是唯一能罩住每个工具调用、不受模式与规则影响的手段 | Lec 8（与第 9、10 条同组）",
 "12 | 下沉 | lint 限制跨模块 import Repository，让「一表一主」从语义层约定变成机械层的墙。Repository 本身挡不住别的模块直接注入 Prisma | Lec 8",
 "13 | 加课 | 角色变更后主动通知前端刷新。当前 Q1 方案下角色改动即时生效于后端，但前端入口需下次取数才更新 | Lec 13（实时/通知那节）",
]
io.open(p, "w", encoding="utf-8").write("\n".join(lines) + "\n")
print("已删重复第 9 条，新增 10-13")
ENDOFFILE
```

---

# 三、第六批 · 规则 33 补适用范围

这条是重启那次留下的。**规则 33 说"重要产出立刻存成文件"，但没说中间产物算不算。** 今天靠"贴回聊天"侥幸没丢。

```
cd ~/projects/study-l3-v2
cat >> docs/COURSE_RULES.md << 'ENDOFFILE'

### 规则 33 适用范围界定（05-ARCH 补 · 规则 33 原文在调节器 G 节）
规则 33「重要产出立刻存成文件」中的「产出」，包含尚未定稿的中间产物。
判据：一段讨论的结论若丢失需要重新跑一次角色或重新讨论，即属该落盘的范围，不论它是否已定稿。
执行方式：多段构成的产物（如 ARCHITECTURE.md 的四节），每段结论定下即追加落盘，不等全部完成再统一写。
背景：05-ARCH 第 1 段模块划分产出后，学生重启 VS Code，该产物仅存在于会话与聊天记录中。未丢是因为学生把输出贴回了聊天，不是因为制度兜住了。「贴回聊天」不等于「落盘」。
与决策 9 关系：本条是「每段定稿即落盘」这一做法的规则化。
ENDOFFILE
```

---

# 四、第七批 · 两份笔记

规则 19：完整版 + 速查卡（800 字以内）。

```
cd ~/projects/study-l3-v2
cat > docs/lessons/05-arch-full.md << 'ENDOFFILE'
# 补课 Lec 05-ARCH · 系统架构（完整版）

> 逻辑归属 Lec 5 之后，实际执行在 Lec 6 之后。补课链四节的第一节。
> 产物：docs/arch/ARCHITECTURE.md 第一、二节（模块划分 + 分层架构）。
> 第三节数据流、第四节部署拓扑留待下一窗口。

## 一、这节课学到的三件事

### 1. 模块按业务域切，不按技术层切
一个功能的代码集中在一个模块内。若按技术层分目录（所有 controller 一处、所有 service 一处），改一个功能要在三个目录之间跳，永远不知道改全了没有。
配套铁律：一张表有且只有一个拥有者。拥有 = 唯一写入者。读不算拥有。

### 2. 分层是「谁接活、谁干活、谁碰数据库」
餐厅比方：服务员（Controller）接单不做菜；厨师（Service）做菜不接客；仓库管理员（Repository）取原料不懂菜谱；菜单（shared types）两边看同一份。
不分层的三个后果：改不动（业务规则和 HTTP 处理混在一起）、测不了（测业务规则要先造请求和数据库）、重复（同一条规则在多个接口各写一遍）。
NestJS 真实层序：Guard → Pipe → Controller → Service → Repository → Prisma。守卫在 Controller 之前，被拒的请求 Controller 方法根本不会被调用。

### 3. 两级权限落两层
不查业务表就能判的归 Guard（角色级）。必须先拿到记录才能判的归 Service（数据级）。
这一句是本节最可复用的产出，遇到任何新的权限判断都能直接定落点。

## 二、八 + 五 + 四个决策

第 1 段八个：users/auth 拆开、不加 name 字段、authz 独立、notifications 本版空壳、US-05 延后、US-04 第三条延后、TECH_STACK 措辞修订、新增 D8。
第 2 段五个：前端角色来源（会话内嵌 + 三条硬约束）、数据级权限落 Service、Repository 每模块都写、共享类型用 z.infer 推导、「无权限」与「不存在」合并。
机械层四个：settings.json 删死规则、rm 收紧、加 defaultMode、加 Edit(docs/arch/**)。

## 三、机械层的两个洞（本课最大收获）

### 洞一 · 死规则（反模式 35）
Lec 6 写的三条 Write(path) 规则，从建立当天起就没被引擎查询过。Claude Code 的文件权限检查只匹配 Edit(path) 与 Read(path)。
真正在干活的一直是同路径的 Edit 规则，所以护栏一天都没少 —— 但那是运气，不是设计。
是学生自己搜官方资料发现的，不是老师。

### 洞二 · 未声明的档位（反模式 36）
从未声明 defaultMode，项目实际运行在 auto mode 下七节课，师生双方都不知道。
护栏的完整性 = 枚举的规则 + 兜底档。只看规则清单会漏掉最大的那一块。

### 两个洞的共同点
机械层的实质状态，从来没被验证过。建完只 cat 看内容，没用 /permissions 看引擎解析结果，没做实测。
本课补上的验证流程：/permissions 看解析 → 实测受管路径确认弹窗 → 答 No。这一套已写进规则 66 追加段。

## 四、老师犯的三次同形错误（写进笔记备查）

一、基于「CC 会把规则写进 settings.json」这个未核实猜测，往下推了两段分析。猜测错了。
二、做决策 5（US-05 延后）时只列 PRD 要改，没打开 UI_DESIGN 看，漏掉跨项目总览区。
三、在未读 UI_DESIGN 的情况下推出「页面数变成 9 个」。读原文后发现页 3 承载登出入口不能删，页面数仍为 10。

共同形状：在一份没打开的文件上，推出一个具体结论。
药方：规则 69「拍板即扫传播面」，且强制「打开文件核」而非「想一遍」。

## 五、验证先于信任 —— 本课的四次实证

一、git log 确认反模式 34 已提交，不是听学生说。
二、抽查 architect 的引用行号，两轮共五处，全部精确命中。
三、实测 Edit(prisma/**) 真的弹窗，答 No 后 git status 干净。
四、改完 defaultMode 重开 CC，状态行不再是 auto。

四次都是「验到实质」而非「看表象」。反模式 3 的正面用法。

## 六、还没做的（下一窗口）
ARCHITECTURE.md 第三节数据流、第四节部署拓扑。
两处 architect 报出但本课未决：无。六处冲突已全部处理。
ENDOFFILE
```

速查卡单独一条命令：

```
cd ~/projects/study-l3-v2
cat > docs/lessons/05-arch-cheatsheet.md << 'ENDOFFILE'
# 05-ARCH 速查卡

## 六个模块（表的拥有者）
users→users｜auth→sessions｜authz→无表(只读)｜projects→projects+project_memberships｜tasks→tasks｜notifications→notifications
依赖单向：users 是地基，无依赖。跨模块只走对方 Service，不碰对方 Repository。

## 后端层序（NestJS 真实执行顺序）
Guard → Pipe → Controller → Service → Repository → Prisma
守卫在 Controller 之前。被 Guard 拒的请求，Controller 方法不会被调用。

## 权限落点（本课最值钱的一句）
不查业务表就能判的 → Guard（角色级）
必须先拿到记录才能判的 → Service（数据级）

## 共享层判据（四问全过才进 packages/shared）
1 前后端都真的用吗？
2 有 IO / env / 单侧框架依赖吗？有则不进
3 变的时候两端必须同时变吗？
4 是安全边界的执行点吗？是 → 规则可共享，但后端必须独立强制，共享层绝不能是唯一执行点

## 命名三层（边界在 Prisma 的 @map）
数据库列名 snake_case｜Prisma 与 TS camelCase｜API 字段 camelCase
snake_case 被关在数据库里，全链路不做转换。字段名不一致这类联调错误结构上不会发生。

## 机械层三条铁律（本课血的教训）
1 文件护栏只写 Edit(path) 与 Read(path)。写 Write(path) = 死规则，引擎不查
2 settings.json 必须显式写 defaultMode，不留空靠厂商默认值
3 改完权限文件必须验证：/permissions 看解析 → 实测受管路径 → 确认弹窗后答 No

## 新增编号
反模式 35 死规则｜36 未声明档位
规则 67 桥梁不覆盖持久文件｜69 拍板即扫传播面（68 留空未用）
决策边界新增 D8 文档口径冲突：只报不改
ENDOFFILE
```

---

# 五、第八批 · 目录树（规则 52，最后一个文件动作）

**这一步必须排在上面所有落盘之后。** 规则 52 的原话：否则会漏掉当节课最后生成的文件。

```
cd ~/projects/study-l3-v2
python3 - << 'ENDOFFILE'
import io
p = "docs/PROJECT_STRUCTURE.md"
s = io.open(p, encoding="utf-8").read()
reps = [
 ("│   ├── arch/\n    │   ├── DECISIONS.md", "│   ├── arch/\n    │   ├── DECISIONS.md"),
 ("        └── anti-patterns.md     反模式库，1-33 号",
  "        ├── 05-arch-full.md      补课 05-ARCH 完整笔记（模块划分 + 分层）\n        ├── 05-arch-cheatsheet.md 补课 05-ARCH 速查卡\n        └── anti-patterns.md     反模式库，1-36 号"),
 ("- docs/lessons/anti-patterns.md 反模式库 1-33",
  "- docs/lessons/anti-patterns.md 反模式库 1-36"),
 ("- docs/COURSE_RULES.md          课程规则 37-66",
  "- docs/COURSE_RULES.md          课程规则 37-69（68 留空未用）"),
 ("    │   ├── DECISIONS.md         ADR-Lite 决策记录 ADR-001~005",
  "    │   ├── ARCHITECTURE.md      系统架构：第一节模块划分 + 第二节分层（补课 05-ARCH 建，三四节待补）\n    │   ├── DECISIONS.md         ADR-Lite 决策记录 ADR-001~005"),
 ("    第三层 A 决策边界 D1-D7（Lec 6 建）✓",
  "    第三层 A 决策边界 D1-D8（Lec 6 建 D1-D7，补课 05-ARCH 加 D8 文档口径冲突）✓"),
 ("  配套机械层：.claude/settings.json 权限三档（Lec 6 建）✓",
  "  配套机械层：.claude/settings.json 权限三档 + defaultMode（Lec 6 建，补课 05-ARCH 修：删三条死规则、rm 收紧、加 Edit(docs/arch/**)、显式声明 defaultMode）✓"),
 ("│   ├── settings.json        权限系统 allow/ask/deny 三档，机械层护栏（Lec 6 建，学生亲写，规则 66）",
  "│   ├── settings.json        权限系统 defaultMode + allow/ask/deny 三档，机械层护栏（Lec 6 建，05-ARCH 修，学生亲写，规则 66）"),
]
miss = [o for o, n in reps if o != n and s.count(o) != 1]
assert not miss, "以下片段未唯一匹配，未修改：\n" + "\n".join(miss)
for o, n in reps:
    s = s.replace(o, n)
s = s.replace("## 当前目录树（Lec 6 结课 · CLAUDE.md 第三层封顶完成）",
              "## 当前目录树（补课 05-ARCH 结课 · 架构收尾第一节完成）")
s += """
## 补课链进度（规则 49 课数弹性）
Lec 5 只做了数据库 schema，architect 其余四件架构产物拆出延后，随后先上了 Lec 6 宪法课。
补课链四节，回头补齐 architect 架构收尾：
- 05-ARCH  系统架构   ✓ 已完成第一节模块划分 + 第二节分层架构
- 05-API   API 契约   待开
- 05-类型  共享类型   待开
- 05-环境  环境设计   待开
补完后重开 Lec 7 Monorepo 初始化（含 SG-1）。
注意区分：逻辑顺序上补课链排在 Lec 6 之前，实际执行在 Lec 6 之后（反模式 34）。
ARCHITECTURE.md 尚缺第三节数据流、第四节部署拓扑，由 05-ARCH 续课补齐。
"""
io.open(p, "w", encoding="utf-8").write(s)
print("目录树已更新")
ENDOFFILE
```

---

# 六、第九批 · 验证 + 提交

**规则 63：提交前先看 status。上面第一节已经核过八条，这次核十一条。**

```
cd ~/projects/study-l3-v2
grep -n "1-36\|37-69" docs/PROJECT_STRUCTURE.md
tail -12 docs/PROJECT_STRUCTURE.md
tail -4 docs/BACKLOG.md
wc -m docs/lessons/05-arch-cheatsheet.md
git status --short
```

预期 `git status --short` 十一条：

```
 M .claude/settings.json
 M CLAUDE.md
 M docs/BACKLOG.md
 M docs/COURSE_RULES.md
 M docs/PROJECT_STRUCTURE.md
 M docs/arch/TECH_STACK.md
 M docs/design/PRD.md
 M docs/design/UI_DESIGN.md
 M docs/lessons/anti-patterns.md
?? docs/arch/ARCHITECTURE.md
?? docs/lessons/05-arch-cheatsheet.md
```

**加上 `?? docs/lessons/05-arch-full.md` 共十二条。** 数对了再提交。

速查卡 `wc -m` 应在 800 上下，**不必精确（规则 40）**。

提交（**规则 63：信息如实覆盖全部改动，防反模式 30**）：

```
cd ~/projects/study-l3-v2
git add -A
git status --short
git commit -m "feat(05-arch): 系统架构模块划分与分层 + 机械层护栏修复

ARCHITECTURE.md 新建，含第一节模块划分（6 模块 6 表一表一主）
与第二节分层架构（NestJS 层序 / 共享层四问判据 / 两级权限落点 / 命名三层）。

settings.json：删除三条从未被引擎查询的 Write 死规则，rm 收紧为 Bash(rm *)，
新增 Edit(docs/arch/**)，显式声明 defaultMode（此前实际运行在 auto mode）。

CLAUDE.md 第三层新增 D8 文档口径冲突。
COURSE_RULES 新增 67、69 + 规则 66 追加 + 规则 33 适用范围界定（68 留空未用）。
anti-patterns 新增 35 死规则、36 未声明档位。
PRD 补三条澄清注记 + 回填任务不存在的错误边界。
UI_DESIGN 补页 3 跨项目总览注记（US-05 延后，页面数仍为 10）。
TECH_STACK:56 措辞修订（预留外键挂载位歧义）。
BACKLOG 删重复第 9 条，新增 10-13。
新增两份笔记，PROJECT_STRUCTURE 更新目录树与补课链进度。"
```

```
cd ~/projects/study-l3-v2
git log --oneline -3
git status
```

预期：新提交在 HEAD，working tree clean。

---

# 七、桥梁 prompt（规则 45，全课最后一个产出）

**先入库后桥梁 —— 规则、反模式、所有文件都已落盘，现在发桥梁。**

新窗口粘贴顺序：KNOWLEDGE_BASE.md → 调节器 → 本桥梁。

```
# 桥梁 prompt · 补课 Lec 05-ARCH 续课（数据流 + 部署拓扑）

## 第 0 节 · 先读这段：这是补课链的续课
本节是补课 05-ARCH 的后半段，不是新课。
- Lec 5 只做了数据库 schema，architect 其余四件架构产物拆出延后（有意拆分，合规则 49）。
- 延后后先上了 Lec 6 宪法课，宪法三层已封顶。之后才回头补 architect 架构收尾，拆成四节：05-ARCH → 05-API → 05-类型 → 05-环境。
- 05-ARCH 上半场已完成：ARCHITECTURE.md 第一节模块划分、第二节分层架构。本节接着做第三节数据流、第四节部署拓扑，做完 05-ARCH 才算结束。

逻辑顺序 vs 实际执行顺序（分不清就重蹈反模式 34）：
- 逻辑顺序：Lec 05 schema → 05-ARCH → 05-API → 05-类型 → 05-环境 → Lec 06 → Lec 07。
- 实际执行：Lec 05 → Lec 06（已完成）→ 05-ARCH 上半场（已完成）→ 本节 05-ARCH 下半场 → 05-API → 05-类型 → 05-环境 → Lec 07。
学生已掌握 D1-D8、settings.json 权限系统、可逆性×影响判据。别当他没上过 Lec 6。

## 第 1 节 · 这份桥梁是什么
05-ARCH 上半场结课产出，给续课老师用。
新窗口粘贴顺序：KNOWLEDGE_BASE.md → 调节器 → 本桥梁。
冲突优先级：本桥梁 > 调节器 > KNOWLEDGE_BASE。
但注意规则 67（本课新立）：桥梁只在「本课临时状态」上优先。讲课方式、协作规矩、角色标准、结课流程以七文件为准，桥梁无权覆盖。老师读完七文件后须回头核桥梁的启动指令有没有和持久规则打架。

## 第 2 节 · 学生背景
Michael：节奏快、批判性极强、文字太密看不懂。
讲课务必详细直白、比方先行、分块、留呼吸感、少图标。核心讲解走 3a-3d 骨架（规则 62）。
填空模板只用于学生回话，不替代讲解（TEACHING_STYLE 第八节）。
规则 44：不做费曼复述，不让学生写长答案。要检验概念用一道选择题。
本课他抓出的东西：Claude Code 的 Edit 规则覆盖 Write（老师不知道，他自己搜官方资料确认），催生反模式 35。

## 第 3 节 · 项目当前状态
项目名：study-l3-v2，位于 ~/projects/study-l3-v2/（WSL2 Ubuntu，VS Code 连 WSL）。
一句话：团队任务协作工具，负责人 + 执行者两类用户。
阶段：Phase 0 立项。需求/UI/选型/数据建模/宪法均已完成。
architect 架构收尾进度：ARCHITECTURE 第一二节 ✓，第三四节待做；API_CONTRACT / SHARED_TYPES / ENV_DESIGN 三件未开。

已定的关键结论（详见 docs/arch/ARCHITECTURE.md，宪法不放全文）：
- 六模块：users / auth / authz（不拥有表）/ projects / tasks / notifications。一表一主，读不算拥有，依赖单向无环。
- 后端层序：Guard → Pipe → Controller → Service → Repository → Prisma。
- 两级权限：不查业务表就能判的归 Guard，必须先拿到记录才能判的归 Service。
- 共享层四问判据，第 4 问为安全边界执行点。
- 命名三层：DB 列 snake_case，Prisma/TS/API 全 camelCase，边界在 @map。
- 共享类型用 z.infer 推导，不手写 DTO。
- 本版延后：US-05 跨项目总览、US-04 第三条风险提示、US-02b 预警、notifications 实现（模块位保留标空壳）。

## 第 4 节 · 本节要做什么
产出 ARCHITECTURE.md 第三节数据流 + 第四节部署拓扑，做完 05-ARCH 收尾。

第三节数据流：一个请求从浏览器出发怎么走到数据库再回来。要具体走通至少两条路径（建议一条读路径、一条写路径），标出每一步经过哪一层、在哪里被校验、在哪里被鉴权。这一节是第二节分层的动态版。

第四节部署拓扑：Docker Compose 起几个容器、Nginx 摆在哪、谁跟谁通、环境变量从哪来。注意这一节与 05-环境那节有重叠边界，本节只画拓扑，具体环境变量清单留给 05-环境。

自然第一步：复用 architect，prompt 第一句让它读 .claude/agents/architect.md（防反模式 3），可读文件限定并写死路径。
architect 是 Read-only（tools: Read，已核实合规），它产文本，学生 cat 落盘。
落盘方式：cat >> 追加到 ARCHITECTURE.md，每节定稿即落盘（规则 33 适用范围界定，本课新立）。

## 第 5 节 · 项目目录结构
见 docs/PROJECT_STRUCTURE.md（规则 50，不在桥梁重复跑 tree）。本课结课已更新，含 ARCHITECTURE.md、两份笔记、补课链进度小节。

## 第 6 节 · 开课必读七文件（规则 55/58/65）
1. docs/COURSE_RULES.md          课程规则 37-69（68 留空未用）
2. docs/lessons/anti-patterns.md 反模式 1-36（新坑从 37 起）
3. docs/TEACHING_STYLE.md        讲课手感一至八节
4. docs/PROJECT_STRUCTURE.md     项目结构 + 标准清单 + CLAUDE.md 追踪
5. docs/AGENT_SPEC.md            角色文件标准
6. docs/LESSON_TEMPLATE.md       段落骨架（3a-3d）
7. docs/BACKLOG.md               跨课待办（现 1-13 条）
新规则从 70 起，新反模式从 37 起。
这七个文件在学生机器上，不在老师上下文。须如实说明需读、请学生贴回，禁止凭印象编（反模式 1）。用普通 cat，别用 cat -A（反模式 22）。
开课自检 = 调节器 K 节 1-8 + 规则 57 第 9-11 + 规则 60 开课闸 + 规则 62 讲解骨架。
另需向学生复述规则 61：七文件维护 —— 开课读全、结课逐查、harness 产物往上沉淀；若某类新产物没有持久文件接得住，当场新建标准文件或新增规则。

## 第 7 节 · git 状态
最近一条提交应为：feat(05-arch): 系统架构模块划分与分层 + 机械层护栏修复。
上两条：534c6f8 docs 反模式 34、2ce5304 feat(lec6) 宪法第三层。
开课前跑 git status、git log --oneline -3 确认。working tree 应为 clean。不要回滚。

## 第 8 节 · 上半场用到的知识点 + 学生能力
用到：角色 4 architect（6 必问/四象限/ADR-Lite）、协议 2 有预算侦察、协议 3 证据契约、协议 5 ≤3 澄清、协议 6 影响分析、协议 9 一致性报告、补丁 7 ADR-Lite、补丁 14 传播矩阵、补丁 16 四象限、强化 3 选择题+推荐、强化 5 单一信息源、强化 16 决策权属、Subagents、Permissions。

已熟练：模块按业务域划分并定一表一主、分层与依赖方向、两级权限落点、共享层边界判据、Claude Code 权限系统的实质验证（/permissions + 实测）、抽查 AI 引用行号、识别 AI 藏在论证里的取舍。
还在练：数据流落文档（本节主线）、部署拓扑、API 契约设计、共享类型抽取、环境设计。

本节要盯的反模式：
1（别凭印象编，请学生贴文件）
3（表象成功≠实质生效）
7（参考文件给具体路径）
22（读中文别用 cat -A）
33（AI 把该主人拍的取舍包装成技术结论）
35（配置写了不代表生效）
69 规则（拍板后必须打开下游文件核传播面，不许靠想）

## 第 9 节 · 老师必须知道的三件事（上半场的教训）
一、老师在本课犯了三次同形错误：在没打开的文件上推出具体结论。药方是规则 69，且强制「打开文件核」。续课老师务必照做。
二、architect 两轮共报出六处文档冲突，全部为真或有价值（其中一处为误报但报得对）。它能报出来是因为 prompt 里写了「发现冲突先指出再继续」。这句话每次都要写。
三、architect 曾误用陷阱 8 号，长会话后没重读数据文件（只重读了自己的定义文件）。学生已决定不改 AGENT_SPEC，改在 prompt 里显式要求。续课老师写 prompt 时要写明「本轮必须重新读下列文件，不得因早前读过而跳过」。

## 启动指令（给续课老师）
收到全部资料后按顺序做 5 件事，做完等学生回应再开课：
1. 问候，三五句话复述背景：这是 05-ARCH 续课，上半场已完成模块划分与分层，本节做数据流与部署拓扑；强调逻辑顺序 vs 执行顺序（第 0 节）。
2. 确认接续（老师出 prompt/命令/诊断，学生在 CC 执行并决策，输出贴回诊断）。
3. 如实说明需读七文件，请学生贴回；读完做开课自检并逐条汇报；复述规则 61。
4. 出老师锚点 + 本节大纲（先与学生确认分段/产物/知识点）+ 问精力（A-D）。注意规则 44：不做复习题，不让学生写长答案；要检验概念只出一道选择题。
5. 等学生回应再正式开课。用 architect 守 AGENT_SPEC，讲段落守 LESSON_TEMPLATE（3a-3d），手感守 TEACHING_STYLE（含第八节）。
```

---

# 八、结课自检汇报（规则 60 结课闸 + 规则 61）

**六文件逐个报，一个不漏：**

- **COURSE_RULES** —— 更新了。67、69、规则 66 追加、规则 33 界定 ✓
- **anti-patterns** —— 更新了。35、36 ✓
- **TEACHING_STYLE** —— 无新手感（你的决策 18）✓
- **AGENT_SPEC** —— 不改，改在 prompt 里要求（你的决策 17，已写进桥梁第 9 节第三条）✓
- **LESSON_TEMPLATE** —— 无变化 ✓
- **PROJECT_STRUCTURE** —— 更新了，排在所有文件动作之后 ✓
- **BACKLOG** —— 新增 10-13，删重复第 9 条 ✓

**规则 61 传承链元检查：**

本课新增的每一样，都有持久文件接住，且下一课通过"开课必读 + 结课自检"会自动覆盖到：

- 反模式 35、36 → anti-patterns，开课必读第 2 项
- 规则 67、69、33 界定、66 追加 → COURSE_RULES，开课必读第 1 项
- D8 → CLAUDE.md 第三层，CC 每次进项目自动加载
- 四条待办 → BACKLOG，开课必读第 7 项
- 架构结论 → ARCHITECTURE.md，桥梁第 3 节指向它
- **"老师三次同形错误"这条教训 → 桥梁第 9 节 + 规则 69 双落点**

**没有任何新产物只活在对话或桥梁里。传承链无漏。**

---

# 九、你现在做的

跑第二到第六节的命令，最后确认 `git log` 和 `git status`。

**跑完这节课就结束了。** 桥梁在第七节，整段复制存好，下个窗口用。

**辛苦了 —— 这一节你抓出了一个连老师都不知道的产品事实（Edit 覆盖 Write），直接修好了一个躺了七节课的护栏漏洞。这是本课最有分量的产出，不是架构文档。**

Human (Sep 10, 2026, 2:44 PM):
michael@AngelHe:~/projects/study-l3-v2$ cd ~/projects/study-l3-v2
git log --oneline -3
git status
0e4225f (HEAD -> master) feat(05-arch): 系统架构模块划分与分层 + 机械层护栏修复
534c6f8 docs: 新增反模式 34 落点锁死课号未核骨架
2ce5304 feat(lec6): CLAUDE.md 第三层决策边界 D1-D7 + settings.json 权限系统
On branch master
nothing to commit, working tree clean
michael@AngelHe:~/projects/study-l3-v2$

Claude:
**老师锚点（3 行）**

- 分工：最后一次核对，这一节到此结束。
- 红线：不追加新内容，桥梁已是最后产出（规则 45）。
- 这一步我最可能犯的错：说一堆总结的话，把课拖长。

---

# 提交确认

```
0e4225f (HEAD -> master) feat(05-arch): 系统架构模块划分与分层 + 机械层护栏修复
```

`nothing to commit, working tree clean`。十二个文件全部进了这一次提交，提交信息如实覆盖（规则 63）。

**补课 05-ARCH 上半场结课完成。**

---

# 你手上现在有什么

**产物：** `docs/arch/ARCHITECTURE.md`，第一节模块划分 + 第二节分层架构，7604 字符，每条结论可追溯到 PRD、schema 或技术栈。

**修好的东西：** 三条躺了七节课的死规则、一个没人声明过的默认档位。机械层现在是经过实测的，不是看起来对的。

**入库的东西：** 反模式 35、36，规则 67、69，D8，四条待办。全部有持久文件接住。

**下个窗口用的：** 桥梁在上一条回复的第七节，整段复制。粘贴顺序是 KNOWLEDGE_BASE.md → 调节器 → 桥梁。

---

# 一句话交代下一步

新窗口做 ARCHITECTURE 第三节数据流、第四节部署拓扑。做完 05-ARCH 才算整节结束，然后才是 05-API。

**今天到这。休息吧。**
