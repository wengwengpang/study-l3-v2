**资料体检报告（第六次体检）**

我先读了 `.claude/agents/librarian.md`，再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 7 条输出，最新是 f717a0e，文件在，所以不是首次体检。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`，输出如下，没删没改。

```
== 资料体检 2026-10-20 08:20:40  提交 3bb2faa  未提交改动 0 处
== 范围：65 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 78 条，最大号 78；缺号：无；重号：无
  原则（HARNESS 第四节）：共 20 条，最大号 20；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 521 条，最大号 521；缺号：无；重号：无
  DECISIONS-G1 补遗：共 170 条，最大号 170；缺号：无；重号：无

== S3 指空的引用（写了号，清单里没有）
  规则 42 ← docs/PENDING-TUNER-REFACTOR.md:196（历史）
  规则 42 ← docs/LESSON_TEMPLATE.md:23（常驻）
  规则 42 ← docs/web_course5_sample1.md:673（常驻）
  规则 42 ← docs/web_course_sample1.md:1019（常驻）
  规则 42 ← docs/web_course_sample1.md:1115（常驻）
  规则 42 ← docs/web_course_sample1.md:1432（常驻）
  规则 42 ← docs/web_course_sample1.md:1596（常驻）
  规则 42 ← docs/web_course_sample1.md:1785（常驻）
  规则 42 ← docs/web_course_sample1.md:1923（常驻）
  规则 42 ← docs/web_course_sample1.md:2078（常驻）
  规则 42 ← docs/web_course_sample1.md:2348（常驻）
  规则 42 ← docs/web_course_sample1.md:2563（常驻）
  规则 42 ← docs/web_course_sample1.md:2622（常驻）
  规则 42 ← docs/web_course_sample1.md:365（常驻）
  规则 42 ← docs/web_course_sample1.md:468（常驻）
  规则 42 ← docs/web_course_sample1.md:684（常驻）
  规则 42 ← docs/web_course_sample1.md:817（常驻）
  规则 42 ← docs/web_course_sample2.md:1457（常驻）
  规则 42 ← docs/web_course_sample2.md:463（常驻）
  规则 42 ← docs/web_course_sample3.md:1092（常驻）
  规则 42 ← docs/web_course_sample3.md:216（常驻）
  规则 42 ← docs/web_course_sample3.md:719（常驻）
  规则 42 ← docs/web_course_sample6.md:1350（常驻）
  规则 42 ← docs/web_course_sample6.md:1386（常驻）
  规则 42 ← docs/web_course_sample6.md:1402（常驻）
  规则 42 ← docs/web_course_sample6.md:1404（常驻）
  规则 42 ← docs/web_course_sample6.md:1466（常驻）
  规则 42 ← docs/web_course_sample6.md:1479（常驻）
  规则 42 ← docs/web_course_sample6.md:1501（常驻）
  规则 42 ← docs/web_course_sample6.md:1508（常驻）
  规则 42 ← docs/web_course_sample6.md:1615（常驻）
  规则 42 ← docs/web_course_sample6.md:2223（常驻）
  规则 68 ← docs/web_course5_sample2.md:4013（常驻）
  规则 68 ← docs/web_course5_sample2.md:4015（常驻）
  规则 68 ← docs/web_course5_sample4.md:3874（常驻）
  规则 68 ← docs/web_course5_sample4.md:3901（常驻）
  规则 68 ← docs/web_course5_sample5.md:535（常驻）
  反模式 57 ← docs/web_course_sample2.md:2463（常驻）
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗：无
  （原则、问题两份只看常驻列：常用词会撞名。D 号不查：常驻文件里 PRD 审定决策 D1 到 D9、重构分组 D0 也叫 D，只看常驻列也撞）

== S3 附：跨度超过 10 的区间（只是不算进引用次数，不是不查；首尾号在不在请人工看）
  规则 1-36 ← docs/PENDING-TUNER-REFACTOR.md:46（历史）
  规则 1-36 ← docs/BACKLOG.md:47（常驻）
  规则 1-36 ← docs/COURSE_RULES.md:4（常驻）
  规则 1-36 ← docs/web_course5_sample3.md:2595（常驻）
  规则 1-36 ← docs/web_course5_sample4.md:2928（常驻）
  规则 1-36 ← docs/web_course5_sample5.md:5812（常驻）
  规则 1-36 ← docs/web_course_sample1.md:105（常驻）
  规则 1-36 ← docs/web_course_sample1.md:61（常驻）
  规则 1-36 ← docs/web_course_sample4.md:3404（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4315（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4375（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4417（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4438（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4567（常驻）
  规则 1-36 ← docs/web_course_sample4.md:4692（常驻）
  规则 1-36 ← docs/web_course_sample6.md:1621（常驻）
  规则 37-49 ← docs/web_course_sample6.md:1583（常驻）
  规则 37-49 ← docs/web_course_sample6.md:1599（常驻）
  规则 37-49 ← docs/web_course_sample6.md:1712（常驻）
  规则 37-49 ← docs/web_course_sample6.md:1828（常驻）
  规则 37-51 ← docs/web_course_sample6.md:2175（常驻）
  规则 37-51 ← docs/web_course_sample6.md:2201（常驻）
  规则 37-61 ← docs/web_course_sample3.md:2399（常驻）
  规则 37-61 ← docs/web_course_sample3.md:2466（常驻）
  规则 37-61 ← docs/web_course_sample3.md:2632（常驻）
  规则 37-61 ← docs/web_course_sample3.md:2725（常驻）
  规则 37-61 ← docs/web_course_sample3.md:2744（常驻）
  规则 37-62 ← docs/web_course_sample3.md:2744（常驻）
  规则 37-62 ← docs/web_course_sample3.md:2783（常驻）
  规则 37-62 ← docs/web_course_sample3.md:2787（常驻）
  规则 37-62 ← docs/web_course_sample3.md:2921（常驻）
  规则 37-63 ← docs/web_course_sample1.md:416（常驻）
  规则 37-64 ← docs/web_course_sample1.md:3293（常驻）
  规则 37-64 ← docs/web_course_sample1.md:3339（常驻）
  规则 37-64 ← docs/web_course_sample1.md:3548（常驻）
  规则 37-65 ← docs/web_course5_sample1.md:1741（常驻）
  规则 37-65 ← docs/web_course_sample2.md:2834（常驻）
  规则 37-65 ← docs/web_course_sample2.md:3293（常驻）
  规则 37-66 ← docs/web_course5_sample2.md:4721（常驻）
  规则 37-66 ← docs/web_course_sample5.md:1291（常驻）
  规则 37-66 ← docs/web_course_sample5.md:1385（常驻）
  规则 37-66 ← docs/web_course_sample5.md:1978（常驻）
  规则 37-69 ← docs/web_course5_sample2.md:4722（常驻）
  规则 37-69 ← docs/web_course5_sample2.md:4887（常驻）
  规则 37-69 ← docs/web_course5_sample3.md:2406（常驻）
  规则 37-69 ← docs/web_course5_sample3.md:2407（常驻）
  规则 37-69 ← docs/web_course5_sample3.md:2596（常驻）
  规则 37-69 ← docs/web_course5_sample4.md:2551（常驻）
  规则 37-70 ← docs/web_course5_sample4.md:2551（常驻）
  规则 37-70 ← docs/web_course5_sample4.md:2612（常驻）
  规则 37-70 ← docs/web_course5_sample4.md:2929（常驻）
  规则 37-70 ← docs/web_course5_sample5.md:5813（常驻）
  规则 37-70 ← docs/web_course_sample4.md:2895（常驻）
  规则 37-70 ← docs/web_course_sample4.md:3012（常驻）
  规则 37-72 ← docs/web_course_sample4.md:2896（常驻）
  规则 37-72 ← docs/web_course_sample4.md:2930（常驻）
  规则 37-72 ← docs/web_course_sample4.md:2998（常驻）
  规则 37-72 ← docs/web_course_sample4.md:3405（常驻）
  反模式 1-13 ← docs/COURSE_RULES.md:432（常驻）
  反模式 1-13 ← docs/web_course_sample1.md:61（常驻）
  反模式 1-18 ← docs/web_course_sample6.md:1713（常驻）
  反模式 1-18 ← docs/web_course_sample6.md:1829（常驻）
  反模式 1-19 ← docs/web_course_sample6.md:2176（常驻）
  反模式 1-19 ← docs/web_course_sample6.md:2202（常驻）
  反模式 1-26 ← docs/web_course_sample3.md:2632（常驻）
  反模式 1-26 ← docs/web_course_sample3.md:2725（常驻）
  反模式 1-28 ← docs/web_course_sample3.md:2787（常驻）
  反模式 1-28 ← docs/web_course_sample3.md:2922（常驻）
  反模式 1-31 ← docs/web_course_sample1.md:3549（常驻）
  反模式 1-32 ← docs/web_course_sample2.md:3294（常驻）
  反模式 1-33 ← docs/web_course5_sample1.md:1742（常驻）
  反模式 1-33 ← docs/web_course_sample5.md:1386（常驻）
  反模式 1-34 ← docs/web_course_sample5.md:1979（常驻）
  反模式 1-36 ← docs/web_course5_sample2.md:4888（常驻）
  反模式 1-40 ← docs/web_course5_sample3.md:2597（常驻）
  反模式 1-41 ← docs/web_course5_sample4.md:2930（常驻）
  反模式 1-42 ← docs/web_course5_sample5.md:5814（常驻）
  反模式 1-43 ← docs/web_course_sample4.md:2930（常驻）
  反模式 1-43 ← docs/web_course_sample4.md:3407（常驻）
  BACKLOG 1-35 ← docs/web_course_sample4.md:2930（常驻）
  原则：无
  问题：无
  R1：无
  补遗 132-170 ← docs/PENDING-TUNER-REFACTOR.md:169（历史）

== S4 常驻文件里从没被引用过的号
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 23(历史0 产品0) 
  反模式（参考，不是删并信号）：无
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 37(历史2 产品0) 38(历史0 产品0) 39(历史2 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    51735 total
     5901 docs/web_course5_sample5.md
     5018 docs/web_course5_sample2.md
     4751 docs/web_course_sample4.md
     4694 docs/vide_coding.md
     4106 docs/web_course5_sample4.md
     3998 docs/web_course_sample1.md
     3361 docs/web_course_sample2.md
     2955 docs/web_course_sample3.md
     2664 docs/web_course5_sample3.md
     2268 docs/web_course_sample6.md
     2045 docs/web_course5_sample1.md
     2034 docs/web_course_sample5.md
      641 docs/COURSE_RULES.md
      637 docs/arch/ARCHITECTURE.md
      521 docs/PENDING-TUNER-REFACTOR.md
      455 docs/lessons/05-api-full.md
      432 docs/KNOWLEDGE_BASE.md
      399 docs/arch/API_CONTRACT.md
      387 docs/HARNESS.md
      353 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      229 docs/BRIDGE-05-api-w6.md
      221 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      189 docs/lessons/05-api-cheatsheet.md
      172 CLAUDE.md
      158 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
      151 docs/PROJECT_STRUCTURE.md
      136 docs/REFACTOR-HANDBOOK.md
      133 docs/lessons/05-api-wbs.md
      133 docs/BRIDGE-05-api-w10.md
      129 docs/BRIDGE-05-api-w9.md
      117 docs/lessons/05-arch-cheatsheet.md
      113 docs/CHECKPOINTS.md
       93 docs/lessons/00-full.md
       89 docs/BACKLOG.md
       79 docs/arch/DECISIONS.md
       72 docs/TEACHING_STYLE.md
       65 docs/REVIEW-DEBT.md
       65 .claude/agents/architect.md
       64 docs/lessons/03-full.md
       64 docs/arch/TECH_STACK.md
       56 docs/lessons/05-full.md
       51 docs/lessons/06-full.md
       50 .claude/agents/librarian.md
       47 docs/arch/STANDARDS.md
       46 docs/LESSON_TEMPLATE.md
       44 docs/lessons/04-full.md
       41 docs/lessons/01-full.md
       41 docs/design/USER_RESEARCH.md
       39 docs/lessons/00-cheatsheet.md
       38 docs/AGENT_SPEC.md
       36 docs/lessons/01-cheatsheet.md
       34 docs/lessons/02-full.md
       32 .claude/agents/designer.md
       30 .claude/agents/pm.md
       28 docs/lessons/05-cheatsheet.md
       28 .claude/agents/client.md
       27 .claude/agents/persona.md
       26 docs/lessons/03-cheatsheet.md
       21 docs/lessons/02-cheatsheet.md
       17 docs/lessons/06-cheatsheet.md
       14 docs/lessons/04-cheatsheet.md

== S6 上次体检以来新增、删除、改名的文件（A 新增、D 删除、R 改名；请对 SESSION_START M 节送审命令清单：要不要加、要不要改）
  起点：上次报告提交 f717a0e
  A	docs/BRIDGE-05-api-w10.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 65 份，缺 61 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/librarian.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  CLAUDE.md
  docs/AGENT_SPEC.md
  docs/BACKLOG.md
  docs/BRIDGE-05-api-w10.md
  docs/BRIDGE-05-api-w6.md
  docs/BRIDGE-05-api-w7.md
  docs/BRIDGE-05-api-w8.md
  docs/BRIDGE-05-api-w9.md
  docs/COURSE_RULES.md
  docs/HARNESS.md
  docs/KNOWLEDGE_BASE.md
  docs/LESSON_TEMPLATE.md
  docs/PENDING-TUNER-REFACTOR.md
  docs/PROJECT_STRUCTURE.md
  docs/REFACTOR-HANDBOOK.md
  docs/SESSION_START.md
  docs/TEACHING_STYLE.md
  docs/arch/API_CONTRACT.md
  docs/arch/ARCHITECTURE.md
  docs/arch/DECISIONS.md
  docs/arch/TECH_STACK.md
  docs/design/PRD.md
  docs/design/UI_DESIGN.md
  docs/design/USER_RESEARCH.md
  docs/lessons/00-cheatsheet.md
  docs/lessons/00-full.md
  docs/lessons/01-cheatsheet.md
  docs/lessons/01-full.md
  docs/lessons/02-cheatsheet.md
  docs/lessons/02-full.md
  docs/lessons/03-cheatsheet.md
  docs/lessons/03-full.md
  docs/lessons/04-cheatsheet.md
  docs/lessons/04-full.md
  docs/lessons/05-api-cheatsheet.md
  docs/lessons/05-api-full.md
  docs/lessons/05-arch-cheatsheet.md
  docs/lessons/05-arch-full.md
  docs/lessons/05-cheatsheet.md
  docs/lessons/05-full.md
  docs/lessons/06-cheatsheet.md
  docs/lessons/06-full.md
  docs/lessons/anti-patterns.md
  docs/vide_coding.md
  docs/web_course5_sample1.md
  docs/web_course5_sample2.md
  docs/web_course5_sample3.md
  docs/web_course5_sample4.md
  docs/web_course5_sample5.md
  docs/web_course_sample1.md
  docs/web_course_sample2.md
  docs/web_course_sample3.md
  docs/web_course_sample4.md
  docs/web_course_sample5.md
  docs/web_course_sample6.md
```

## 栏 2　和上次比

规则总数：
- 脚本数 85 条，上次 85 条，没涨。最大号 87、缺号 42 68、占位 2 3 21 34 都没变。
- 文件头也没变：号段 1-87（docs/COURSE_RULES.md:7），实际条数 81（docs/COURSE_RULES.md:9），下一个可用号 88（docs/COURSE_RULES.md:10）。
- 没涨，所以没有「涨了要对应删并」的问题。
- 上次报告里 COURSE_RULES 的行数是 641，本次也是 641，规则文件没动。

其他清单变化：
- DECISIONS-R1 514 变 521（新增 R1-515 到 R1-521），是历史记录，不查旧号。
- 反模式 46、BACKLOG 78、原则 20、问题 16、D 条 8、规则 57 自检项 12、补遗 170，都没变。

各文件行数（上次报告栏 2 的数到本次）：
- 总数 49800（上上次）、上份报告写的是 51550，本次 51735，加 185。
- 这些变化里，有一部分发生在上份报告的脚本跑完到存档之间，所以对的是上份报告栏 1 的数（S5）：
  - docs/lessons/05-api-full.md 412 变 455，加 43。
  - docs/lessons/05-api-cheatsheet.md 172 变 189，加 17。
  - docs/CHECKPOINTS.md 131 变 113，减 18（`git diff --stat 47e91b8 f717a0e` 显示该文件 90 行变动，与「70 条并删成 51 条」一致，见 docs/PROJECT_STRUCTURE.md:43）。
  - docs/lessons/05-api-wbs.md 128 变 133，加 5。
  - docs/HARNESS.md 385 变 387，docs/SESSION_START.md 156 变 158，各加 2；这两份都不在 f717a0e 到 HEAD 的差里，是上份脚本跑完到 f717a0e 之间改的。
  - docs/PROJECT_STRUCTURE.md 150 变 151，加 1。
  - docs/BRIDGE-05-api-w10.md 新增 133 行。
- 样本文件、API_CONTRACT、PRD、UI_DESIGN、ARCHITECTURE、COURSE_RULES、CLAUDE.md 行数都没变。
- 从 f717a0e 到 HEAD 共 8 个提交，`git diff --stat f717a0e HEAD` 共 6 个文件：BRIDGE-w10（新）、DECISIONS-R1（+19）、PROJECT_STRUCTURE、05-api-cheatsheet（+17）、05-api-full（+43）、05-api-wbs（1 行改）。

上一份「学生选择」的复查：
- 问 552 A（认第五次报告并提交）：已落。f717a0e、a7bf150 两次提交就是存档，记录在 docs/DECISIONS-R1.md 的 R1-515（约 11727 行）。
- 问 560 A（发现 2 是真问题，改法退回结课 E9，交付物清单 G49）：没落，时点未到。
  - docs/lessons/05-api-wbs.md:129 的 G49 状态仍是「待做（结课 E9）」。
  - COURSE_RULES 的 173、312、450 行三处文字与上次相同，见发现 1。
- 栏 4 两项候选（旧桥梁 w6 到 w8、交付物清单）照文件原定整节课结课时删：没落，时点未到。w6 到 w8 仍在，05-api-wbs.md 仍在。
- 栏 2「问 330 挂账」更正：学生指出挂账在 G9（R1-388）。我没有再核 G9 那一行，这条按学生更正记。
- 更早遗留：
  - 问 321（把 web_course 样本和 vide_coding 排出体检范围）：没落。S3 里的外来样本引用还在，本次范围 65 份。
  - 问 323（缺「去留：」的文件顺手补）：没落。S7 现在 65 份缺 61 份，新增的 w10 也缺。学生选的是顺手补，所以数字没动不算违反。
  - 问 333（改管理员定义文件还是改核对脚本，结课时定）：没落。`.claude/agents/librarian.md` 仍是 50 行，scripts/ 下只有 decision-index.sh、doc-check.sh、report-check.sh、rule-index.sh。时点未到。
- 删并：上次栏 4 的两项候选都按文件原定时点，学生没另裁，没有需要复查的删并选择。

## 栏 3　发现

1. 规则 57 第 12 项的三处文字仍未对齐。[判断：这是上次发现 2，学生已认定是真问题，只是改法还没落]
   - docs/COURSE_RULES.md:173：写「留空未用……已于 05-API 删除，见本文件末尾该条」。
   - docs/COURSE_RULES.md:312-313：「规则 57 追加第 12 项」还在，正文是「我确认了当前会话运行在哪个权限模式吗？」，没有废止标记。
   - docs/COURSE_RULES.md:450-451：「第 12 项……取消」。
   - 173 行说的「本文件末尾」，文件末尾是规则 87，不是 450 行的取消说明。
   - docs/COURSE_RULES.md:168 头写「实际条数：11 条」，脚本数 12 条（栏 1 S1）。这是同一处口径差。
   - 以谁为准、怎么改，已退回结课 E9（docs/lessons/05-api-wbs.md:129），本次不再另出。
2. S6 新增文件：docs/BRIDGE-05-api-w10.md（133 行）。要不要进 SESSION_START M 节送审命令清单，学生判。
   - 性质：docs/PROJECT_STRUCTURE.md:57 写「第十窗口暂存桥梁（第十窗口以它为准）」，与 w6 到 w9 同类。
   - 上次我对 w6 到 w9 的看法是「暂存桥梁，不进」。本次沿用，但这是我的倾向，不是结论。
3. 桥梁状态：docs/PROJECT_STRUCTURE.md:53-56 写 w6、w7、w8、w9 都是「已用完，只作存档，整节课结课时删」，w10 是当前（:57）。
   - 已用完的四份合计 229+157+190+129=705 行（上次三份 576 行）。
   - 这是现状，不是现在要删。删除时点按文件自己写的结课。见栏 4。
4. S7 缺「去留：」61 份，上次 60 份。多出的一份是 docs/BRIDGE-05-api-w10.md。
   - docs/PROJECT_STRUCTURE.md:57 的说明在目录树里，不在文件开头 15 行，脚本不认。这与 w6 到 w9 同。
   - docs/lessons/05-api-wbs.md 的「去留」写在 docs/PROJECT_STRUCTURE.md:83，该文件也在缺的名单外（S7 清单里没有它，说明文件头已有「去留：」）。
5. 规则 8、9、13、23 仍零引用（S4）。上次学生拍板留，本次 COURSE_RULES 行数没变，我没有重新读原文。[假设：理由未变]
6. BACKLOG 的 S4 零引用列表是参考，不是删并信号。75、76、78 零引用，77 有 2 次产品引用，和上次一样。
7. S3 的假指空引用没变，与栏 2 问 321 未落直接相关。
   - 规则 42：docs/LESSON_TEMPLATE.md:23 是常驻真引用，其余都在网页版样本里。
   - 规则 68、反模式 57：都在外来样本里。
   - 我没有逐处读这些行。
8. 文档口径一致性小核：docs/PROJECT_STRUCTURE.md 里「05-API 进行中（第一到九窗口已上）」，而 BRIDGE-05-api-w10 已建、第十窗口已开课（R1-521）。这是时间先后的正常状态，不算冲突。我只记一笔，不判。

## 栏 4　可删/可并

候选清单：

1. docs/BRIDGE-05-api-w6.md、w7.md、w8.md、w9.md（共 705 行）。
   - 可删的理由：docs/PROJECT_STRUCTURE.md:53-56 写「已用完，只作存档，整节课结课时删」，w10 已接棒。
   - 该留的理由：05-API 还没结课，存档用途未到期。
   - 删除时点按文件自己写的结课，不是现在。删除走学生亲跑与 CONFIRM，不归我。
2. docs/lessons/05-api-wbs.md（133 行）。
   - docs/PROJECT_STRUCTURE.md:83 写「去留：一次性，整节课结课时删」，规则 87 同。
   - 现在不到时点，列出只是登记。

可并：无。理由：
- 本次规则总数没涨，没有新增规则需要对照旧规则。
- 规则 8、9、13、23 的零引用，本次没有新理由推翻上次学生的「留」。
- 上次判的「规则 87 与 HARNESS 原则 18 追加段」是上下层关系，HARNESS 本次只多 2 行，我没有重新比对。

另有一处需要学生拍板，不属于删并：发现 1 的规则 57 第 12 项三处不对齐，已退回 E9（G49）。

## 栏 5　我拿不准的

1. 发现 2：w10 要不要进送审命令清单。我倾向「不进」，理由和 w6 到 w9 一样，但这是判断。
2. 发现 1 里 173 行「见本文件末尾该条」指的是 450 行的取消说明，还是本应在文件末尾但没有的条。我读不出来。这条与上次相同。
3. HARNESS 与 SESSION_START 各多 2 行（上份脚本跑完到 f717a0e 之间），我没有读 diff 内容，不知道改了什么。[假设：两处与 R1-515 到 R1-519 的删并或同步一步有关]
4. 我没有逐份读 12 份外来样本，不知道里面「规则 N」是否都是网页版编号。与上次相同。[假设]
5. 我没有比对 CLAUDE.md、PRD、UI_DESIGN、ARCHITECTURE、API_CONTRACT 之间有没有矛盾。这五份本次行数都没变，但上次也没比对，所以这一块至今未审。
6. 我没有读 DECISIONS-R1 新增的 R1-515 到 R1-521 全文，只看了条目标题。它是历史记录，职责 4 说不查旧号。
7. 我没有逐条读 46 条反模式、78 条 BACKLOG，也没有套「形状相同」的判据，没有读 HARNESS 第五节。
8. 我没有跑 scripts/report-check.sh。它要等报告存档后由主对话跑。
9. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 发现 2（桥梁 w10 要不要进送审命令清单）：问 567 A，不进，同 w6 到 w9。学生原话「567 选 A」。
- 认不认这份报告：问 568 A，认，原样提交（61d25fa）。学生原话「568 选 A」。
- 核对脚本第二项报的「跑了 2 次」：同一调用在记录里存了两遍，按 id 去重后只跑一次（DECISIONS-R1 R1-522）；脚本已按问 569 A 改（对照 658）。

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/lessons/05-api-wbs.md
- /home/michael/projects/study-l3-v2/docs/BRIDGE-05-api-w10.md
- /home/michael/projects/study-l3-v2/docs/DECISIONS-R1.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh
