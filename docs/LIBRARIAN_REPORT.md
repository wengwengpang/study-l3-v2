**资料体检报告(第八次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 10 条输出,最新是 4a4d6fd,文件在,所以不是首次体检。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`。下面是它的输出,没删没改没转述。

```
== 资料体检 2026-10-23 09:53:11  提交 cf406df  未提交改动 0 处
== 范围：67 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 80 条，最大号 80；缺号：无；重号：无
  原则（HARNESS 第四节）：共 20 条，最大号 20；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 535 条，最大号 535；缺号：无；重号：无
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
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 37(历史2 产品0) 38(历史0 产品0) 39(历史2 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品1) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    52293 total
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
      643 docs/COURSE_RULES.md
      637 docs/arch/ARCHITECTURE.md
      550 docs/lessons/05-api-full.md
      529 docs/arch/API_CONTRACT.md
      521 docs/PENDING-TUNER-REFACTOR.md
      432 docs/KNOWLEDGE_BASE.md
      387 docs/HARNESS.md
      353 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      229 docs/BRIDGE-05-api-w6.md
      226 docs/lessons/05-api-cheatsheet.md
      221 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      172 CLAUDE.md
      158 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
      153 docs/PROJECT_STRUCTURE.md
      142 docs/lessons/05-api-wbs.md
      138 docs/BRIDGE-05-api-w12.md
      137 docs/BRIDGE-05-api-w11.md
      136 docs/REFACTOR-HANDBOOK.md
      133 docs/BRIDGE-05-api-w10.md
      129 docs/BRIDGE-05-api-w9.md
      117 docs/lessons/05-arch-cheatsheet.md
      112 docs/CHECKPOINTS.md
       93 docs/lessons/00-full.md
       91 docs/BACKLOG.md
       85 docs/arch/DECISIONS.md
       73 docs/TEACHING_STYLE.md
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
  起点：上次报告提交 4a4d6fd
  A	docs/BRIDGE-05-api-w12.md
  D	docs/arch/PENDING-C1-DRAFT.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 67 份，缺 63 份
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

规则总数:
- 脚本数 85 条,上次 85 条,没涨。最大号 87、缺号 42 68、占位 2 3 21 34 都没变。
- 文件头「号段 1-87、实际条数 81、下一个可用号 88」也没变(docs/COURSE_RULES.md:7-10)。
- 没涨,所以没有「涨了要对应删并」的问题。
- 但 COURSE_RULES 有改条目:`git diff 4a4d6fd HEAD` 显示规则 22(docs/COURSE_RULES.md:59)、规则 44(:100-102)、规则 83 第 2 与第 5 项(:590 起)因取消检验题而改。没新开号。规则 83 第 2 项变成「已取消,编号留空不重排」(:590)。

其他清单变化:
- DECISIONS-R1 528 变 535(新增 R1-529 到 R1-535),是历史记录,不查旧号。
- 反模式 46、BACKLOG 80、原则 20、问题 16、D 条 8、规则 57 自检项 12、补遗 170 都没变。
- S4:规则 23 这次不再列零引用,只剩 8、9、13。我没查是谁新引了 23。
- S4:BACKLOG 77 的产品引用从 3 次变 2 次。

各文件行数(上次报告栏 1 的数到本次):
- 总数 52701 变 52293,减 408。
- 删除 docs/arch/PENDING-C1-DRAFT.md,减 742 行(S6)。
- 新增 docs/BRIDGE-05-api-w12.md,138 行(S6)。
- docs/arch/API_CONTRACT.md 402 变 529,加 127。
- docs/lessons/05-api-full.md 502 变 550,加 48。
- docs/lessons/05-api-cheatsheet.md 208 变 226,加 18。
- docs/lessons/05-api-wbs.md 140 变 142,加 2。
- docs/COURSE_RULES.md 642 变 643,加 1。
- docs/TEACHING_STYLE.md 72 变 73,加 1。
- docs/CHECKPOINTS.md 113 变 112,减 1。
- 其余行数没变,含 HARNESS 387、SESSION_START 158、CLAUDE.md 172、PROJECT_STRUCTURE 153。
- docs/arch/STANDARDS.md 和 docs/PROJECT_STRUCTURE.md 的 `git diff --stat` 有改动行,总行数不变。

上一份「学生选择」的复查:
- 上一份报告存档版(提交 4a4d6fd)的栏 6 是空的。`git log` 里 4a4d6fd 之后没有再提交过 LIBRARIAN_REPORT.md,所以没有学生选择可对。
- 本次无法逐条写「已落」或「没落」。这一点我已写进栏 5。

更早遗留(我只核文件现状):
- 问 560 A(规则 57 第 12 项三处不对齐,退回结课 E9,交付物清单 G49):没落,时点未到。docs/lessons/05-api-wbs.md:129 的 G49 仍是「待做(结课 E9)」。
- 旧桥梁 w6 到 w11 照原定整节课结课时删:没落,时点未到。六份都在。
- 问 321(把网页版样本和 vide_coding 排出体检范围):没落。S3 里的外来样本引用还在,范围仍是 67 份。
- 问 323(缺「去留：」的文件顺手补):没落。S7 缺 63 份,上次 62 份,多出的是 w12。
- 问 333(改管理员定义文件还是改核对脚本,结课时定):没落,时点未到。

## 栏 3　发现

1. S6 新增文件:docs/BRIDGE-05-api-w12.md(138 行)。要不要进 SESSION_START M 节送审命令清单,学生判。
   - 按 .claude/agents/librarian.md:26,docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。
   - docs/PROJECT_STRUCTURE.md:59 写「第十二窗口暂存桥梁(第十二窗口以它为准)」。
2. S6 删除文件:docs/arch/PENDING-C1-DRAFT.md。
   - 对应提交 4426b13「删待执行文件 PENDING-C1-DRAFT.md(学生亲跑,回 CONFIRM)」。
   - 删除后常驻文件里残留引用已清:CLAUDE.md、docs/PROJECT_STRUCTURE.md、docs/SESSION_START.md 里没有对它的活引用。
   - 仍提到它的是 docs/BRIDGE-05-api-w12.md:40、:71、:96 和 docs/PROJECT_STRUCTURE.md:118 的窗口回顾,都是过去时说明。
   - docs/lessons/05-api-wbs.md:8 的「本窗口目标」还写着「照 docs/arch/PENDING-C1-DRAFT.md 从第 3 小节起」。这是第十一窗口的目标句,文件已不在。
   - 上份报告栏 4 的候选 3(该文件)已执行,不再列。
3. 桥梁状态:docs/PROJECT_STRUCTURE.md:53-58 写 w6 到 w11 六份「已用完,只作存档,整节课结课时删」。w12 是当前(:59)。
   - 已用完的六份合计 229+157+190+129+133+137=975 行(上次五份 838 行)。
   - 这是现状,不是现在要删。见栏 4。
4. 取消检验题的传播面(判断:一致,依据是下面的 grep)。
   - docs/COURSE_RULES.md:59(规则 22)写「3 种情况」。
   - docs/TEACHING_STYLE.md:10 写「只在这三种情况停下等学生」。
   - 我 grep 了 CLAUDE.md、HARNESS、SESSION_START、CHECKPOINTS、LESSON_TEMPLATE、anti-patterns 里的「4 种情况」「每段讲完出一道」「概念检验」「检验题」,没有再命中旧说法。
   - 规则 83 背景段(docs/COURSE_RULES.md:596)和规则 44 来历(:102)仍写「概念检验」「选择题」。这是历史说明,不算打架。
   - docs/COURSE_RULES.md:101 写「要学生拍板的选择题照旧出(规则 25)」。规则 25 在 :63,是「所有要学生回答的问题,都给填空或选择模板」。两处对得上。
5. 规则 57 第 12 项三处仍未对齐。[判断:学生已认定是真问题(问 560 A),改法还没落]
   - docs/COURSE_RULES.md:313:「规则 57 追加第 12 项(05-ARCH 下半场加)」标题还在,没有作废标记。
   - docs/COURSE_RULES.md:451-452:「规则 57 第 12 项删除(05-API 加)」,取消的说明在这里。
   - docs/COURSE_RULES.md:9 写「实际条数:81 条」,与规则 57 自检项脚本数 12 条口径不同,两者数的对象不同,我没判。
   - docs/COURSE_RULES.md:174 的「见本文件末尾该条」这次我没重读,沿用上次判断。[假设:未变]
   - 以谁为准、怎么改,已退回结课 E9(docs/lessons/05-api-wbs.md:129),本次不再另出。
6. 交付物清单待做项,我只记状态,不判:
   - docs/lessons/05-api-wbs.md:138 G58:PRD 定密码「至少 8 位、含字母和数字」,OWASP 写「There should be no requirement for upper or lower case or numbers or special characters.」。两份打架,以谁为准由学生定(决策边界 D8、D3)。出处双方都在该行里,我不给结论。
   - docs/lessons/05-api-wbs.md:119 G39:示例邮箱改写法,留第十二窗口。
   - docs/lessons/05-api-wbs.md:142 G62:课程做法类问题进附录 H 的候选,待做。
7. 规则 8、9、13 仍零引用(S4)。上次学生拍板留。本次没读原文,没有新理由。[假设:理由未变]
8. BACKLOG 的 S4 零引用列表是参考,不是删并信号。75、76、78 零引用,77 产品引用 2 次,80 产品引用 1 次。
9. S3 的假指空引用没变。规则 42:docs/LESSON_TEMPLATE.md:23 是常驻真引用,其余在网页版样本里。规则 68、反模式 57 都在外来样本里。与问 321 未落直接相关。
10. 两份文件的数字对比:docs/arch/API_CONTRACT.md 从 402 行涨到 529 行(加 127)。docs/BRIDGE-05-api-w12.md:40 写契约汇总到 API-56,补了十行「补充」、三行「已落」。我没读 API_CONTRACT 新增内容,没核这两处说法。

## 栏 4　可删/可并

候选清单:

1. docs/BRIDGE-05-api-w6.md、w7.md、w8.md、w9.md、w10.md、w11.md(共 975 行)。
   - 可删的理由:docs/PROJECT_STRUCTURE.md:53-58 写「已用完,只作存档,整节课结课时删」,w12 已接棒。
   - 该留的理由:05-API 还没结课,docs/BRIDGE-05-api-w12.md:8 也写「w6 到 w11 只作存档,整节课结课时删」。存档用途未到期。
   - 删除时点按文件自己写的结课,不是现在。删除走学生亲跑与 CONFIRM,不归我。
2. docs/lessons/05-api-wbs.md(142 行)。
   - docs/PROJECT_STRUCTURE.md 的去留说明写「一次性,整节课结课时删」。具体行号我没单独核。
   - 现在不到时点,列出只是登记。
3. docs/lessons/05-api-wbs.md:8 的「本窗口目标」句(第十一窗口目标)。
   - 判断:已是过期的目标句,它引用的 PENDING-C1-DRAFT.md 已删。
   - 该留的理由:该文件是交付物清单,目标句可能是收尾时对照 W6 用的。
   - 并不并、改不改,学生判。

可并:无。理由:
- 本次规则总数没涨,没有新增规则需要对照旧规则。
- 规则 8、9、13 的零引用,本次没有新理由推翻上次学生的「留」。
- 规则 22、44、83 这次是改写,不是新增,没有出现一条被另一条完全盖住的情形。

另有一处需要学生拍板,不属于删并:发现 5(规则 57 第 12 项三处不对齐)已退回 E9(G49)。发现 6 的 G58 是两份资料打架,由学生定以谁为准。

## 栏 5　我拿不准的

1. 发现 1:w12 要不要进送审命令清单。按 librarian.md:26 已定不进(只列不问),我无异议。
2. 栏 2 复查:上一份报告栏 6 是空的,4a4d6fd 之后也没有填栏 6 的提交。我不知道是学生没给选择,还是 CC 还没填。上次的选择没法逐条对。
3. 发现 4:S4 里规则 23 不再零引用,我没查是哪份文件新引了它。
4. 发现 5:docs/COURSE_RULES.md:174 的「见本文件末尾该条」我这次没重读。
5. 发现 10:API_CONTRACT 新增 127 行、05-api-full 新增 48 行、05-api-cheatsheet 新增 18 行,我都没读内容。
6. 我没有逐份读 12 份外来样本,不知道里面「规则 N」是否都是网页版编号。与上次相同。[假设]
7. 我没有比对 CLAUDE.md、PRD、UI_DESIGN、ARCHITECTURE、API_CONTRACT 之间有没有矛盾。这一块至今未审。
8. 我没有读 DECISIONS-R1 新增的 R1-529 到 R1-535 全文。它是历史记录,职责 4 说不查旧号。
9. 我没有逐条读 46 条反模式、80 条 BACKLOG,也没有读 HARNESS 第五节套「形状相同」判据。
10. 我没有跑 scripts/report-check.sh。它要等报告存档后由主对话跑。
11. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

(空,由 CC 照学生原话填。)

相关文件:
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/lessons/05-api-wbs.md
- /home/michael/projects/study-l3-v2/docs/BRIDGE-05-api-w12.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh