**资料体检报告（第十二次体检）**

我先读了 `.claude/agents/librarian.md`，再读了上一份报告 `docs/LIBRARIAN_REPORT.md`（第十一次体检）。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 15 条输出，最新是 b1c56fa，文件在，所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

下面是 `bash scripts/doc-check.sh` 的输出，没删没改没转述。

```
== 资料体检 2026-10-29 08:40:25  提交 ecc1d1f  未提交改动 0 处
== 范围：71 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 82 条，最大号 82；缺号：无；重号：无
  原则（HARNESS 第四节）：共 22 条，最大号 22；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 576 条，最大号 576；缺号：无；重号：无
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
  反模式 1-13 ← docs/COURSE_RULES.md:434（常驻）
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
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 
  反模式（参考，不是删并信号）：无
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 37(历史2 产品0) 38(历史0 产品0) 39(历史2 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品2) 81(历史2 产品1) 82(历史2 产品1) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    53433 total
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
      793 docs/arch/API_CONTRACT.md
      727 docs/lessons/05-api-full.md
      643 docs/COURSE_RULES.md
      638 docs/arch/ARCHITECTURE.md
      521 docs/PENDING-TUNER-REFACTOR.md
      432 docs/KNOWLEDGE_BASE.md
      401 docs/HARNESS.md
      360 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      301 docs/lessons/05-api-cheatsheet.md
      229 docs/design/UI_DESIGN.md
      229 docs/BRIDGE-05-api-w6.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      172 CLAUDE.md
      158 docs/SESSION_START.md
      158 docs/PROJECT_STRUCTURE.md
      157 docs/lessons/05-api-wbs.md
      157 docs/BRIDGE-05-api-w7.md
      143 docs/BRIDGE-05-api-w14.md
      140 docs/BRIDGE-05-api-w16.md
      140 docs/BRIDGE-05-api-w15.md
      140 docs/BRIDGE-05-api-w13.md
      138 docs/BRIDGE-05-api-w12.md
      137 docs/BRIDGE-05-api-w11.md
      136 docs/REFACTOR-HANDBOOK.md
      133 docs/BRIDGE-05-api-w10.md
      129 docs/BRIDGE-05-api-w9.md
      117 docs/lessons/05-arch-cheatsheet.md
      114 docs/CHECKPOINTS.md
       93 docs/lessons/00-full.md
       93 docs/BACKLOG.md
       86 docs/arch/DECISIONS.md
       73 docs/TEACHING_STYLE.md
       65 docs/REVIEW-DEBT.md
       65 .claude/agents/architect.md
       64 docs/lessons/03-full.md
       64 docs/arch/TECH_STACK.md
       56 docs/lessons/05-full.md
       53 docs/arch/STANDARDS.md
       51 docs/lessons/06-full.md
       50 .claude/agents/librarian.md
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
  起点：上次报告提交 b1c56fa
  A	docs/BRIDGE-05-api-w16.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 71 份，缺 67 份
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
  docs/BRIDGE-05-api-w11.md
  docs/BRIDGE-05-api-w12.md
  docs/BRIDGE-05-api-w13.md
  docs/BRIDGE-05-api-w14.md
  docs/BRIDGE-05-api-w15.md
  docs/BRIDGE-05-api-w16.md
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
- docs/COURSE_RULES.md 行数 643 不变，`git diff b1c56fa HEAD --stat` 里也没有它。没涨，所以没有「涨了要对应删并」的问题。

其他清单变化：
- 原则 20 变 22。HARNESS 新开原则 21、22（提交 a4a5dff；docs/HARNESS.md 头部计数行写「实际条数 22 条；下一个可用号 23」）。
- BACKLOG 81 变 82（提交 93a270c）。S4 里 82 号显示（历史2 产品1），不是零引用。
- BACKLOG 80 在 S4 的产品引用由 1 变 2，不是零引用。
- DECISIONS-R1 562 变 576，新增 14 条。它是历史记录，不查旧号。
- 反模式 46、问题 16、D 条 8、规则 57 自检项 12、补遗 170 都没变。
- S4 规则 8、9、13 的零引用与上次逐字相同。
- 范围 70 份变 71 份：新增 w16，没有删除。
- S7 缺「去留：」66 份变 67 份，多出的是 w16。

各文件行数（上次报告栏 1 到本次）：
- 总数 53204 变 53433，加 229。
- docs/BRIDGE-05-api-w16.md 新增 140 行（S6 的 A）。
- docs/lessons/05-api-full.md 685 变 727，加 42。
- docs/lessons/05-api-cheatsheet.md 282 变 301，加 19。
- docs/HARNESS.md 387 变 401，加 14。
- docs/CHECKPOINTS.md 112 变 114，加 2。
- docs/lessons/05-api-wbs.md 155 变 157，加 2。
- docs/PROJECT_STRUCTURE.md 156 变 158，加 2。
- docs/arch/STANDARDS.md 51 变 53，加 2。
- docs/design/PRD.md 358 变 360，加 2。
- docs/design/UI_DESIGN.md 227 变 229，加 2。
- docs/arch/DECISIONS.md 85 变 86，加 1。
- docs/BACKLOG.md 92 变 93，加 1。
- 加数相加 140+42+19+14+2+2+2+2+2+2+1+1=229，与总数差对得上。
- CLAUDE.md 172、docs/arch/API_CONTRACT.md 793 行数没变，但 `git diff --stat` 里各有 1 行改动。
- 上次报告提交 b1c56fa 之后共有 31 个提交（我只数了 `git log b1c56fa..HEAD | head -40` 的前 40 行输出，实际条数没数全，[假设] 不少于 31）。

上一份「学生选择」的复查：
- 上一份报告（b1c56fa 存档）栏 6 写着「空着，由 CC 照学生原话填」。
- `git log` 里 b1c56fa 之后没有「体检报告栏 6 照学生原话填」的提交，所以没有可逐条复查的新选择。
- 上一份栏 3 发现 3（docs/lessons/05-api-wbs.md 的「本窗口目标」过期）：已落（docs/lessons/05-api-wbs.md:8 现写「第十五窗口，桥梁 w15 第 5 节」）。但现在 w16 已建，见栏 3 发现 2。
- 上一份栏 3 发现 6（G58 密码规则）：已落（docs/lessons/05-api-wbs.md:145 的 G58 状态格写「已完（对照 825 到 831：PRD 新编审定决策 D20 取代 D9……）」）。

更早遗留，我只核文件现状：
- 问 560 A（规则 57 第 12 项三处不对齐，G49）：没落。docs/lessons/05-api-wbs.md:136 仍是「待做（结课 E9）」。
- 旧桥梁 w6 到 w15 整节课结课时删：没落，时点未到。现在是十份存档加 w16 一份现行。
- 问 321（把网页版样本和 vide_coding 排出体检范围）：没落，S3 的外来样本引用还在。
- 问 323（缺「去留：」的文件顺手补）：没落，S7 缺 67 份。
- 问 333（改管理员定义文件还是改核对脚本，结课时定）：没落，时点未到。

## 栏 3　发现

1. S6 新增 docs/BRIDGE-05-api-w16.md（140 行）。要不要进 SESSION_START M 节送审命令清单，学生判。
   - 按 .claude/agents/librarian.md:26，docs/BRIDGE-*.md 是一次性桥梁，已定不进（问 567 A），只列不问。

2. 「本窗口目标」句现在对不上。
   - docs/lessons/05-api-wbs.md:8 写的是「第十五窗口，桥梁 w15 第 5 节」。
   - docs/BRIDGE-05-api-w16.md:1 与 :6 已是第十六窗口，且写「以本文件为准」。
   - 规则 W6（docs/lessons/05-api-wbs.md:61）要求每个窗口开头写一句本窗口目标。
   - 判断：这是 w16 开课时才改的事，开课前对不上是正常状态，不是错。改不改、何时改，学生判。

3. 桥梁状态。
   - docs/PROJECT_STRUCTURE.md 目录树写 w6 到 w15 十份「已用完，只作存档，整节课结课时删」，w16 写「第十六窗口以它为准」。
   - docs/BRIDGE-05-api-w16.md:6 写「docs/ 下现有十一份 05-API 桥梁：w6 到 w15 只作存档」。这与目录树、与 `ls` 的数字（w6 到 w16 共 11 份）对得上。
   - 十份存档合计 229+157+190+129+133+137+138+140+143+140=1536 行（上次九份 1396 行）。
   - 这是现状，不是现在要删。见栏 4。

4. 规则 57 第 12 项三处仍未对齐（G49，已退回结课 E9）。
   - docs/COURSE_RULES.md:313「规则 57 追加第 12 项」、:451「规则 57 第 12 项删除」仍在。COURSE_RULES.md 本期没有改动。
   - G49 在 docs/lessons/05-api-wbs.md:136，状态「待做（结课 E9）」，引用请用条目名。

5. 密码规则：D20 已落，但 PRD 里留有旧措辞，且写明了以谁为准。
   - docs/design/PRD.md:152 仍写「至少 8 位、含字母和数字」。
   - docs/design/PRD.md:305 的 D20 写「最短 15 位……取代 D9『至少 8 位，含字母和数字』，D9 原文不改」。
   - docs/design/PRD.md:360 澄清注记 16 写「密码规则以决策 D20 为准……原 US 文字不改（问 649 A）」。
   - CLAUDE.md:94 已写「密码最短 15 位、最长不少于 64 位、不限字符种类（PRD 审定决策 D20，取代 D9）」。
   - 判断：文档里已自带取代声明，这不是未被发现的打架。两份文字并存是学生已拍板的做法（「原文不改」），我只记录、不给结论。上次的「G58 两份打架」状态是变了：已按 D20 落。

6. 规则 8、9、13 仍零引用（S4）。上次学生拍板留。我本次没读原文，没有新理由。[假设：理由未变]

7. BACKLOG 的 S4 零引用列表是参考，不是删并信号。
   - 75、76、78 零引用，与上次相同。
   - 77 产品引用 2 次，80 产品引用由 1 变 2，81、82 有引用，不在零引用之列。

8. S3 的假指空引用没变。
   - 规则 42 有一处常驻真引用：docs/LESSON_TEMPLATE.md:23。其余在网页版样本里。规则 68、反模式 57 也在外来样本里。
   - 与问 321 未落相关。

9. PENDING-C2-DRAFT 的残留引用。
   - docs/arch/PENDING-C2-DRAFT.md 上期已删。本期 docs/lessons/05-api-wbs.md 里 grep 到它的只剩第 29 行（C2 状态格的历史交代），第 8 行的现行指令已经没有了。
   - docs/PROJECT_STRUCTURE.md:123 是叙述性历史。
   - 判断：上期我提出的「现行指令指向已不存在文件」已不再成立，其余是历史交代，可留。

10. HARNESS 头部计数与条目对得上。docs/HARNESS.md:6 写「实际条数 22 条」，脚本数 22 条，一致。

11. 新增原则 21、22 与已有原则的形状对照。
    - 原则 21（子代理交回的产出当场存进项目文件）：docs/HARNESS.md 内自注「与原则 13 分开立：原则 13 管送审时证据带没带够，本条管产出落没落进大家都拿得到的地方」。
    - 原则 22（改文件前先拼副本、预期在副本上数）：自注「与原则 8 分开立」。
    - 判断：两条都自带区分声明，按三分法是「都不是 → 留」。我没逐条重读原则 8、13 的原文，见栏 5。

## 栏 4　可删/可并

候选清单：

1. docs/BRIDGE-05-api-w6.md 到 w15.md，共十份，1536 行。
   - 可删的理由：docs/PROJECT_STRUCTURE.md 目录树写「已用完，只作存档，整节课结课时删」，w16 已接棒（docs/BRIDGE-05-api-w16.md:6）。
   - 该留的理由：05-API 还没结课，存档用途未到期。
   - 删除时点按文件自己写的结课，不是现在。删除走学生亲跑与 CONFIRM，不归我。

2. docs/lessons/05-api-wbs.md:8 的「本窗口目标」句（第十五窗口）。
   - 判断：w16 开课后会过期，现在算不上错。
   - 该留的理由：W6 要求收尾时对着目标说达没达到，第十五窗口的收尾记录还可能被引用。
   - 改不改、何时改，学生判。

3. docs/lessons/05-api-wbs.md 整份（157 行）。
   - 它自己写的去留是「整节课结课时删」（docs/lessons/05-api-wbs.md:3）。现在不到时点，列出只是登记。

可并：无。理由：
- 本次规则总数没涨，没有新增规则需要对照旧规则。
- 新增的是原则 21、22 和 BACKLOG 82，三条都有自注的区分声明或不同主题，没有看出一条被另一条完全盖住（判断）。
- 规则 8、9、13 的零引用，本次没有新理由推翻上次学生的「留」。

## 栏 5　我拿不准的

1. 发现 1：w16 按 librarian.md:26 已定不进送审命令清单，我无异议。
2. 发现 2、栏 4 第 2 条：「本窗口目标」句是 w16 开课时改，还是现在改，规则 W6 没写时点，我标不准。
3. 发现 5：PRD.md:152 旧措辞与 D20 并存，是学生拍板的「原文不改」；要不要在 152 行旁加指向，属取舍，学生判。
4. 发现 11：我没读原则 8、13 与新原则 21、22 的完整原文，只读了 diff 里新增部分，所以「都不是 → 留」是粗判。
5. 我没读 docs/BRIDGE-05-api-w16.md 全文，只引了 :1、:6。
6. 我没读 BACKLOG 82 号条目的原文，所以不知道它和 BACKLOG 74 等已有条目是否重复。
7. 我没读 DECISIONS-R1 新增 14 条全文，职责 4 说不查旧号。
8. docs/lessons/05-api-full.md 新增 42 行、docs/lessons/05-api-cheatsheet.md 新增 19 行、docs/arch/STANDARDS.md 新增 2 行的全文我没读，与其他文档有无矛盾没比。
9. docs/arch/API_CONTRACT.md 本期只有 1 行改动（密码依据改指 D20，提交 9253485），我没读该行原文。
10. 我没有逐份读 12 份外来样本，不知道里面「规则 N」是否都是网页版编号。与上次相同。[假设]
11. 我没有逐条读 46 条反模式、82 条 BACKLOG，也没有读 HARNESS 第五节套「形状相同」判据。
12. 本次提交数「31」是数 `git log` 输出前 40 行得到的，输出没截断，所以 31 是实数；这条只为说明数法。
13. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

（空着，由 CC 照学生原话填。）

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/lessons/05-api-wbs.md
- /home/michael/projects/study-l3-v2/docs/BRIDGE-05-api-w16.md
- /home/michael/projects/study-l3-v2/docs/design/PRD.md
- /home/michael/projects/study-l3-v2/docs/HARNESS.md
- /home/michael/projects/study-l3-v2/CLAUDE.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh