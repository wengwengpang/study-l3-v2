**资料体检报告（第九次体检）**

我先读了 `.claude/agents/librarian.md`，再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 10 条输出，最新是 4c3b4d5，文件在，所以不是首次体检。本次没有跑 `scripts/report-check.sh`，它要等报告存档后由主对话跑。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`。下面是它的输出，没删没改没转述。

```
== 资料体检 2026-10-26 08:32:22  提交 ff8cace  未提交改动 0 处
== 范围：69 份文件

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
  DECISIONS-R1 条目：共 545 条，最大号 545；缺号：无；重号：无
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
    53288 total
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
      752 docs/arch/PENDING-C2-DRAFT.md
      643 docs/COURSE_RULES.md
      637 docs/arch/ARCHITECTURE.md
      595 docs/lessons/05-api-full.md
      552 docs/arch/API_CONTRACT.md
      521 docs/PENDING-TUNER-REFACTOR.md
      432 docs/KNOWLEDGE_BASE.md
      387 docs/HARNESS.md
      356 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      244 docs/lessons/05-api-cheatsheet.md
      229 docs/BRIDGE-05-api-w6.md
      227 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      172 CLAUDE.md
      158 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
      155 docs/PROJECT_STRUCTURE.md
      145 docs/lessons/05-api-wbs.md
      140 docs/BRIDGE-05-api-w13.md
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
       50 docs/arch/STANDARDS.md
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
  起点：上次报告提交 4c3b4d5
  A	docs/BRIDGE-05-api-w13.md
  A	docs/arch/PENDING-C2-DRAFT.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 69 份，缺 64 份
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
- docs/COURSE_RULES.md 行数 643 不变，`git diff 4c3b4d5 HEAD --stat` 里也没有它。
- 文件头「号段 1-87、实际条数 81、下一个可用号 88」没变（docs/COURSE_RULES.md:7-10）。
- 没涨，所以没有「涨了要对应删并」的问题。

其他清单变化：
- DECISIONS-R1 535 变 545，新增 R1-536 到 R1-545。它是历史记录，不查旧号。
- 反模式 46、BACKLOG 80、原则 20、问题 16、D 条 8、规则 57 自检项 12、补遗 170 都没变。
- S4 的三类零引用（规则 8、9、13，BACKLOG 一长串）与上次逐字相同。

各文件行数（上次报告栏 1 到本次）：
- 总数 52293 变 53288，加 995。
- 新增 docs/arch/PENDING-C2-DRAFT.md，752 行（S6）。
- 新增 docs/BRIDGE-05-api-w13.md，140 行（S6）。
- docs/lessons/05-api-full.md 550 变 595，加 45。
- docs/arch/API_CONTRACT.md 529 变 552，加 23。
- docs/lessons/05-api-cheatsheet.md 226 变 244，加 18。
- docs/design/UI_DESIGN.md 221 变 227，加 6。
- docs/lessons/05-api-wbs.md 142 变 145，加 3。
- docs/design/PRD.md 353 变 356，加 3。
- docs/arch/STANDARDS.md 47 变 50，加 3。
- docs/PROJECT_STRUCTURE.md 153 变 155，加 2。
- 以上相加 995，与总数差对得上。
- docs/BACKLOG.md 和 docs/arch/ARCHITECTURE.md 总行数没变，`git diff` 各改一行。
- 没有文件被删或改名。
- 本次起点 4c3b4d5 之后共有 47 个提交。

上一份「学生选择」的复查：
- 上一份报告存档版（提交 4c3b4d5）的栏 6 是空的。`git log` 里 4c3b4d5 之后没有再提交过 docs/LIBRARIAN_REPORT.md。
- 所以没有学生选择可逐条对。这是连续第二次栏 6 为空，我已写进栏 5。

更早遗留，我只核文件现状：
- 问 560 A（规则 57 第 12 项三处不对齐，G49）：没落。docs/lessons/05-api-wbs.md:132 的 G49 仍是「待做（结课 E9）」。
- 旧桥梁 w6 到 w11 照原定整节课结课时删：没落，时点未到。现在 w12 也写成「已用完」，共七份。
- 问 321（把网页版样本和 vide_coding 排出体检范围）：没落。S3 的外来样本引用还在，范围从 67 份涨到 69 份。
- 问 323（缺「去留：」的文件顺手补）：没落。S7 缺 64 份，上次 63 份，多出的是 w13。
- 问 333（改管理员定义文件还是改核对脚本，结课时定）：没落，时点未到。
- G58（密码规则 PRD 对 OWASP）：没落，仍是「待做」（docs/lessons/05-api-wbs.md 的 G58 行）。

## 栏 3　发现

1. S6 新增 docs/BRIDGE-05-api-w13.md（140 行）。要不要进 SESSION_START M 节送审命令清单，学生判。
   - 按 .claude/agents/librarian.md:26，docs/BRIDGE-*.md 是一次性桥梁，已定不进（问 567 A），只列不问。
   - docs/PROJECT_STRUCTURE.md:60 写「第十三窗口以它为准」。
2. S6 新增 docs/arch/PENDING-C2-DRAFT.md（752 行）。要不要进 SESSION_START M 节送审命令清单，学生判。
   - 文件头自己写了去留：docs/arch/PENDING-C2-DRAFT.md:3「一次性。第二节接口清单落完、学生认过后删；删除走学生亲跑与 CONFIRM」。
   - docs/PROJECT_STRUCTURE.md:72 也登了同样的去留。
   - 这是待执行文件，里面有子代理报告原样存档，不是说明书。
3. G64 与新文件的行数相关（判断：提交纪律相关，我不判对错）。
   - 项目 CLAUDE.md 第一层 B 第 3 条写「一次改动不超过 100 行」。
   - docs/lessons/05-api-wbs.md 的 G64 行记了：先例 9b50b4f（742 行）一次提交；第十二窗口 0261b9f（345 行）没先报拆法；起草稿存档时停下问（问 619）；往后怎么定，结课定（待做，结课 E9）。
   - 本次新文件 752 行，与 G64 登记的情形同类，已在清单里，不另出题。
4. 桥梁状态。
   - docs/PROJECT_STRUCTURE.md:53-59 写 w6 到 w12 七份「已用完，只作存档，整节课结课时删」。w13 是当前（:60）。
   - 七份合计 229+157+190+129+133+137+138=1113 行（上次六份 975 行）。
   - 这是现状，不是现在要删。见栏 4。
5. 单数与复数的新旧措辞（判断：已被同文件标注，不算打架；列出供学生知道）。
   - docs/arch/API_CONTRACT.md:45 写「资源名用复数（API-51 第六点）」。
   - docs/arch/API_CONTRACT.md:46 紧接着写「只有一个的子资源……用单数，偏离 Zalando #134」。
   - docs/arch/API_CONTRACT.md:522（API-51 第六点）仍写「资源名用复数」，没有加例外指针。
   - docs/arch/API_CONTRACT.md:541（API-57 原文）写复数集合；:546 写「修订……推翻上面的复数写法，改写单数」。原文保留，修订另起一行。
   - docs/lessons/05-api-full.md:561 记「602 A 照复数」，:565 记重拍后改单数；docs/lessons/05-api-cheatsheet.md:233 写单数。
   - 以后读的人只看到 :522 或 :541 会读成复数。要不要在这两处加指针，学生判（D8：我只给出处，不给结论）。
6. 旧「本窗口目标」句还在。
   - docs/lessons/05-api-wbs.md:8 的「本窗口目标」写的是第十二窗口，桥梁 w12 第 5 节。
   - 现在是第十三窗口。规则 W6（:54）要求每个窗口开头写一句本窗口目标。
   - 上份发现 2 说的 PENDING-C1-DRAFT 引用，这次 grep 已不命中，说明那句已改过。
7. PRD 本窗口新增条目与其他文件的呼应，我只核了这几处，没有发现冲突。
   - docs/design/PRD.md 新增 D18「任务删除，首版不做」，与 CLAUDE.md 第二层 B「Out of Scope」列表没写任务删除。CLAUDE.md 写的是「不做项目删除」。两处不矛盾，但 CLAUDE.md 没列任务删除。要不要同步，学生判。
   - docs/design/UI_DESIGN.md 新增三条「针对」注记（页 5 风险提示区、负责人转让、移出唯一负责人），指向 PRD 澄清注记 5、D10、D14、契约 API-36、API-37。我没逐条核被指的条目内容。
8. 规则 57 第 12 项三处仍未对齐（G49，已退回结课 E9）。本次没重读，沿用上次判断。[假设：未变]
   - docs/COURSE_RULES.md:313「规则 57 追加第 12 项」标题、:451「规则 57 第 12 项删除」，两处还在，COURSE_RULES.md 没有改动。
9. G58 两份打架的状态没变。
   - docs/design/PRD.md:151、:293 写「至少 8 位，含字母和数字」。
   - OWASP 原句「There should be no requirement for upper or lower case or numbers or special characters.」在 docs/lessons/05-api-wbs.md 的 G58 行。
   - docs/arch/STANDARDS.md:38 已登 OWASP Authentication（API-32 补充，问 576 A）。以谁为准由学生定（决策边界 D8、D3），我不给结论。
10. G65 与 STANDARDS 的现状。
    - docs/arch/STANDARDS.md 这次新增 RFC 5789 一行和 OWASP Authentication 一行（:38），正是 G65 登记的两个漏登。
    - G65 仍写「待做（结课 E9）」，指的是「当场查有没有登」这个做法进不进检查单，不是这两行。没矛盾。
11. 规则 8、9、13 仍零引用（S4），上次学生拍板留，本次没读原文，没有新理由。[假设：理由未变]
12. BACKLOG 的 S4 零引用列表是参考，不是删并信号。75、76、78 零引用，77 产品引用 2 次，80 产品引用 1 次，与上次相同。
13. S3 的假指空引用没变。规则 42 有一处常驻真引用：docs/LESSON_TEMPLATE.md:23。其余在网页版样本里。规则 68、反模式 57 也在外来样本里。与问 321 未落相关。

## 栏 4　可删/可并

候选清单：

1. docs/BRIDGE-05-api-w6.md、w7.md、w8.md、w9.md、w10.md、w11.md、w12.md（共 1113 行）。
   - 可删的理由：docs/PROJECT_STRUCTURE.md:53-59 写「已用完，只作存档，整节课结课时删」，w13 已接棒。
   - 该留的理由：05-API 还没结课，存档用途未到期。
   - 删除时点按文件自己写的结课，不是现在。删除走学生亲跑与 CONFIRM，不归我。
2. docs/lessons/05-api-wbs.md:8 的「本窗口目标」句（第十二窗口）。
   - 判断：已过期，现在是第十三窗口。
   - 该留的理由：W6（:54）要求收尾时对着目标说达没达到，可能收尾还要用。
   - 并不并、改不改，学生判。
3. docs/lessons/05-api-wbs.md 整份（145 行）。
   - 它自己写的去留是「整节课结课时删」（:3）。现在不到时点，列出只是登记。
4. docs/arch/PENDING-C2-DRAFT.md（752 行）。
   - 它自己写的去留是「第二节接口清单落完、学生认过后删」（:3）。现在还没落完，列出只是登记。
   - 可删的理由：落完后内容已进 docs/arch/API_CONTRACT.md。
   - 该留的理由：现在是第十三窗口读稿阶段，还没落。

可并：无。理由：
- 本次规则总数没涨，没有新增规则需要对照旧规则。
- 规则 8、9、13 的零引用，本次没有新理由推翻上次学生的「留」。
- 本次新增内容主要是契约裁决、PRD 决策 D18、STANDARDS 登记，不是规则编号，没有出现一条被另一条完全盖住的情形。

另有两处需要学生拍板，不属于删并：
- 发现 5（API-51 第六点和 API-57 原文还写复数）。
- 发现 9（G58，PRD 与 OWASP 打架）。

## 栏 5　我拿不准的

1. 发现 1、2：w13 和 PENDING-C2-DRAFT 要不要进送审命令清单。w13 按 librarian.md:26 已定不进，我无异议。PENDING-C2-DRAFT 不是桥梁，我没有现成口径，学生判。
2. 栏 2 复查：上一份报告栏 6 是空的，4c3b4d5 之后也没有填栏 6 的提交。我不知道是学生没给选择，还是 CC 还没填。上次的选择没法逐条对。
3. 发现 3：752 行存档是否算一百行上限，G64 已登记为结课定，我不判。
4. 发现 5：API-51 第六点（:522）和 API-57 原文（:541）要不要加指针，我只给出处，不判。
5. 发现 7：D18 是否要同步到 CLAUDE.md 第二层 B，我没找到规定哪些 PRD 决策要同步进宪法，所以标不准。
6. 发现 8：docs/COURSE_RULES.md:174 的「见本文件末尾该条」我这次没重读。
7. 我没读 docs/arch/PENDING-C2-DRAFT.md 的甲节和乙节正文，只读了头部。里面 17 个接口的名字、鉴权、schema 与 API_CONTRACT 有没有矛盾，我没比。
8. 我没读 docs/arch/API_CONTRACT.md 新增的 23 行以外的部分，也没读 docs/lessons/05-api-full.md 新增 45 行、docs/lessons/05-api-cheatsheet.md 新增 18 行全文，只抽读了涉及单复数的几行。
9. 我没有逐份读 12 份外来样本，不知道里面「规则 N」是否都是网页版编号。与上次相同。[假设]
10. 我没有比对 CLAUDE.md、PRD、UI_DESIGN、ARCHITECTURE、API_CONTRACT 之间有没有其他矛盾。这一块至今只抽查。
11. 我没有读 DECISIONS-R1 新增的 R1-536 到 R1-545 全文，职责 4 说不查旧号。
12. 我没有逐条读 46 条反模式、80 条 BACKLOG，也没有读 HARNESS 第五节套「形状相同」判据。
13. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 发现 2（docs/arch/PENDING-C2-DRAFT.md 要不要进送审命令清单）：问 621 A，不进。理由同问 567 A：送审清单管长期约束 CC 的说明书，这份是一次性待执行文件。学生原话「621 选 A」。
- 发现 5、7（契约 API-51 第六点没指向 API-57 修订；CLAUDE.md 第二层 B 关键决策缺 D18）算不算 SESSION_START M 节试行期第一条的「主会话没发现的真问题」：问 622 A，两处都算。学生原话「622 选 A」。D18 已补（对照 767，0b6a53c）；API-51 照问 623 A 加补充（对照 770）。
- 抽查偏差：栏 2 复查里 G49 写在 docs/lessons/05-api-wbs.md:132，实为第 129 行；报告原文不改，以 DECISIONS-R1 R1-546 第四点为准。

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/lessons/05-api-wbs.md
- /home/michael/projects/study-l3-v2/docs/arch/PENDING-C2-DRAFT.md
- /home/michael/projects/study-l3-v2/docs/arch/API_CONTRACT.md
- /home/michael/projects/study-l3-v2/docs/arch/STANDARDS.md
- /home/michael/projects/study-l3-v2/docs/BRIDGE-05-api-w13.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh