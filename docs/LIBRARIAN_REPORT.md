**资料体检报告(第五次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 5 条输出,最新是 e59764f,文件在,所以不是首次体检。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`,下面是完整输出,没删没改。

```
== 资料体检 2026-10-19 14:43:20  提交 47e91b8  未提交改动 0 处
== 范围：64 份文件

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
  DECISIONS-R1 条目：共 514 条，最大号 514；缺号：无；重号：无
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
    51550 total
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
      432 docs/KNOWLEDGE_BASE.md
      412 docs/lessons/05-api-full.md
      399 docs/arch/API_CONTRACT.md
      385 docs/HARNESS.md
      353 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      229 docs/BRIDGE-05-api-w6.md
      221 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      172 docs/lessons/05-api-cheatsheet.md
      172 CLAUDE.md
      157 docs/BRIDGE-05-api-w7.md
      156 docs/SESSION_START.md
      150 docs/PROJECT_STRUCTURE.md
      136 docs/REFACTOR-HANDBOOK.md
      131 docs/CHECKPOINTS.md
      129 docs/BRIDGE-05-api-w9.md
      128 docs/lessons/05-api-wbs.md
      117 docs/lessons/05-arch-cheatsheet.md
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
  起点：上次报告提交 e59764f
  D	docs/BRIDGE-05-api-w2.md
  A	docs/BRIDGE-05-api-w6.md
  A	docs/BRIDGE-05-api-w7.md
  A	docs/BRIDGE-05-api-w8.md
  A	docs/BRIDGE-05-api-w9.md
  A	docs/CHECKPOINTS.md
  A	docs/arch/STANDARDS.md
  A	docs/lessons/05-api-wbs.md
  A	scripts/decision-index.sh

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 64 份，缺 60 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/librarian.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  CLAUDE.md
  docs/AGENT_SPEC.md
  docs/BACKLOG.md
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
- 本次 85 条,上次 84 条,涨了 1 条。新增的是规则 87(docs/COURSE_RULES.md:630),最大号 86 变 87。
- 缺号 42、68 和占位 2 3 21 34 都没变。
- 文件头对得上:号段 1-87(docs/COURSE_RULES.md:7)。实际条数 81 条(docs/COURSE_RULES.md:9),等于脚本 85 减 4 个占位。下一个可用号 88(docs/COURSE_RULES.md:10)。
- 涨了有没有对应的删并:没有。本次没有规则被删或并入。规则 87 自己写了「进 HARNESS:并入(原则 18)」,即并入的是 HARNESS,不是并掉别的规则。

其他清单变化:
- BACKLOG 74 变 78。新增 75 到 78。16、17、20、34、35 等条的状态改成「已做」,23、24 改成「规则已定」。
- HARNESS 原则 19 变 20,新增原则 20(docs/HARNESS.md 新增条)。原则 18 追加了三层「补一层」。
- 规则 57 自检项 10 变 12,新增第 19、20 项。
- DECISIONS-R1 387 变 514,是历史记录,不查旧号。
- 反模式、问题、D 条、补遗没变。
- 规则 57 的头(docs/COURSE_RULES.md:168)写「实际条数:11 条」,脚本数 12 条。上次也是头比脚本少 1(头 9、脚本 10),这次保持同样的差。原因是第 12 项留空,但 docs/COURSE_RULES.md:173 和 docs/COURSE_RULES.md:312 都有以「12.」开头的行。见发现 6。

各文件行数(上次到本次):
- 总数 49800 变 51550,加 1750。
- 12 份外来样本和 vide_coding 行数全部不变。
- 常驻文件增减:
  - docs/arch/API_CONTRACT.md 44 变 399,加 355。
  - docs/lessons/05-api-full.md 76 变 412,加 336。
  - docs/lessons/05-api-cheatsheet.md 38 变 172,加 134。
  - docs/design/PRD.md 314 变 353,加 39。
  - docs/design/UI_DESIGN.md 189 变 221,加 32。
  - docs/arch/ARCHITECTURE.md 617 变 637,加 20。
  - docs/arch/DECISIONS.md 62 变 79,加 17。
  - docs/COURSE_RULES.md 626 变 641,加 15。
  - docs/HARNESS.md 373 变 385,加 12。
  - docs/PROJECT_STRUCTURE.md 140 变 150,加 10。
  - docs/REFACTOR-HANDBOOK.md 130 变 136,加 6。
  - docs/BACKLOG.md 85 变 89,加 4。
  - CLAUDE.md 170 变 172,加 2。
  - docs/arch/TECH_STACK.md 63 变 64,加 1。
  - docs/SESSION_START.md 行数 156 不变(git diff 显示有 2 行被改)。
- 新增文件:BRIDGE w6 229 行、w7 157 行、w8 190 行、w9 129 行,CHECKPOINTS 131 行,STANDARDS 47 行,05-api-wbs 128 行。
- 删除文件:BRIDGE-05-api-w2.md,上次 244 行。
- 上次到本次共 493 个提交。

上一份「学生选择」的复查:
- 问 330(认这次没经学生说「发」就派出,A):是认可,不是待办。「谁派的」「有没有弹窗」记本课挂账。我在仓库里没有查到挂账落在哪份文件。没落,出处无。[假设]
- 问 331(B)、问 332(A):是事实陈述,不是待办,无需复查。
- 问 333(A,认这份;改管理员定义文件还是改核对脚本,结课时定):没落。
  - `git diff --stat e59764f HEAD -- scripts/ .claude/agents/` 只显示新增 scripts/decision-index.sh。
  - .claude/agents/librarian.md 仍是 50 行,没改。
  - 按学生原话是「结课时定」,时点未到,所以没落不算违反。
- 更早遗留,上一份报告里列为没落:
  - 问 321(把 web_course 样本和 vide_coding 排出体检范围):仍没落。`grep -n "web_course\|vide_coding" scripts/doc-check.sh` 没有输出,本次范围 64 份,S3 的假指空引用全在。
  - 问 323(缺「去留:」的 57 份,顺手补):没落。S7 现在是 64 份缺 60 份。学生选的是顺手补,所以数字没动不算违反。其中 6 份新增文件有 5 份缺(见发现 7)。
- 删并:上次无新候选,无选择可复查。

## 栏 3　发现

1. 规则 87 和 HARNESS 原则 18 的追加段说的是同一件事,而且规则 87 已声明并入。[判断]
   - docs/COURSE_RULES.md:630 起的规则 87,含「推到结课的事」和覆盖核对命令。
   - docs/HARNESS.md 原则 18 下四层「补一层」,第一层、第二层、第四层的内容分别对应「先搜再立」「说以后再做要登表」「全图要有清单加机器核对」。
   - 这是上层的框架版和下层的做法版,不是完全盖住。归类:不删,留。
2. 规则 57 第 12 项两处不对齐。
   - docs/COURSE_RULES.md:173 写「(留空未用。……已于 05-API 删除,见本文件末尾该条,编号不再分配。)」。
   - docs/COURSE_RULES.md:312 起仍有完整的「规则 57 追加第 12 项」,正文是「我确认了当前会话运行在哪个权限模式吗?」,没有废止标记。
   - docs/COURSE_RULES.md:450 才写「第 12 项……取消,开课自检项由 12 项退回 11 项」。
   - 173 行说的「本文件末尾该条」,文件末尾(docs/COURSE_RULES.md:630 起)是规则 87,不是取消说明。
   - 这是冲突点和出处,以谁为准由学生定。我不给结论。
3. 新增文件与 SESSION_START M 节送审命令清单(docs/SESSION_START.md:122)的关系。命令覆盖 COURSE_RULES、anti-patterns、TEACHING_STYLE、LESSON_TEMPLATE、AGENT_SPEC、SESSION_START、KNOWLEDGE_BASE、HARNESS、CLAUDE.md、.claude/settings.json、.claude/agents/、scripts/。要不要进清单,学生判:
   - docs/CHECKPOINTS.md(131 行,时刻检查单,docs/PROJECT_STRUCTURE.md:43 说发前自查的正本在其中,性质接近说明书):不在命令里。
   - docs/arch/STANDARDS.md(47 行,偏离登记):不在命令里。
   - docs/lessons/05-api-wbs.md(128 行,规则 87 的交付物清单,结课后删):不在命令里。
   - scripts/decision-index.sh:已被 `scripts/` 目录覆盖,不用加。
   - docs/BRIDGE-05-api-w6.md、w7、w8、w9:性质是暂存桥梁,不进。
   - docs/BRIDGE-05-api-w2.md(已删):不在命令里,无需处理。
4. 已用完的桥梁。
   - docs/PROJECT_STRUCTURE.md:53-55 写 w6、w7、w8 是「已用完,只作存档,整节课结课时删」。
   - 三份合计 576 行。w9 在 docs/PROJECT_STRUCTURE.md:56 标为当前。
   - 这是现状,删除时点按文件自己写的「整节课结课时」。见栏 4。
5. 规则 8、9、13、23 仍零引用(S4)。原文在 docs/COURSE_RULES.md 里,上次学生拍板留,本次常驻文件对这四条没有变化,我没有重新读。[假设]
6. BACKLOG 的 S4 零引用列表是参考,不是删并信号。新增的 75、76、78 零引用,77 有 2 次产品引用。75 到 78 都是本次新增,零引用是正常的。
7. S7 缺「去留:」60 份,上次 57 份。新增文件里 w6 到 w9、05-api-wbs 等都缺。docs/PROJECT_STRUCTURE.md 里这几份桥梁有「已用完/整节课结课时删」的说明,但不在文件开头 15 行,脚本不认。
8. S3 的假指空引用没变,与栏 2 问 321 未落直接相关,与上次报告栏 3 第 1 条说法一致。
   - 规则 42:docs/LESSON_TEMPLATE.md:23 是常驻真引用,其余是网页版样本。
   - 规则 68、反模式 57:都在外来样本里。
   - 这次我没有逐处读这些行。
9. S5 显示 CLAUDE.md 与 PRD、ARCHITECTURE 本次有同步修改。
   - CLAUDE.md 第二层 B 的关键决策已改成「详见 PRD.md 审定决策记录,编号与本文件第三层 A 的决策边界不是一套」。
   - 但我没有逐条核对 CLAUDE.md 的新内容与 PRD、UI_DESIGN、ARCHITECTURE 是否一致。见栏 5。

## 栏 4　可删/可并

候选清单:

1. docs/BRIDGE-05-api-w6.md、docs/BRIDGE-05-api-w7.md、docs/BRIDGE-05-api-w8.md。
   - 可删的理由:docs/PROJECT_STRUCTURE.md:53-55 写「已用完,只作存档,整节课结课时删」,共 576 行,w9 已接棒。
   - 该留的理由:本节课还没结课,存档用途未到期。
   - 删除时点按文件自己写的结课,不是现在。删除走学生亲跑与 CONFIRM,不归我。
2. docs/lessons/05-api-wbs.md。
   - 规则 87 写结课时没做完的项转进 BACKLOG 并标「移出」,再删清单(docs/COURSE_RULES.md:630 起)。
   - 现在不到时点,列出只是登记。

可并:无。理由:
- 规则 87 与 HARNESS 原则 18 的追加段(发现 1)是上下层关系,不是完全盖住,也不是同层重复。
- 规则 57 第 19、20 项是规则 87、64、77 的指针,不重复。
- 规则 8、9、13、23 的零引用本次没有新理由推翻上次「留」。

另有一处需要学生拍板,不属于删并:发现 2 的规则 57 第 12 项两处不对齐。

## 栏 5　我拿不准的

1. 发现 2 里 173 行「见本文件末尾该条」指的是哪一条:是指 450 行的取消说明,还是文件末尾本应有但没有的条。我读不出来。
2. 问 330 的「本课挂账」落在哪份文件:我没查,因为任务只要求完整体检,没指向具体文件。[假设]
3. 我没有逐份读 12 份外来样本,不知道里面「规则 N」是否都是网页版编号。这条与上次相同。[假设]
4. CLAUDE.md、PRD、UI_DESIGN、ARCHITECTURE、API_CONTRACT 本次大幅改动,我只看了 `git diff --stat` 和 CLAUDE.md 的 diff,没有比对它们之间有没有矛盾。API_CONTRACT 一份就加了 355 行。这是本次最大的未审面。
5. 我没有逐条读 46 条反模式、78 条 BACKLOG、新增的规则 57 第 19、20 项以外的各项。
6. 我没有套「形状相同」的判据,也没有读 HARNESS 第五节。
7. 我没有读 DECISIONS-R1 新增的 127 条(R1-388 到 R1-514)。它是历史记录,职责 4 说不查旧号。
8. 我没有跑 scripts/report-check.sh。它要等报告存档后由主对话跑。
9. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 问 552 A（学生原话「552 选 A」）：认这份报告并提交。核对脚本报的两处差异是脚本自己的口径（记录里同一调用存了两遍、栏 1 多管理员说明一句），见 DECISIONS-R1 R1-515。
- 问 560 A（学生原话「560 选 A」）：发现 2 算真问题，改法退回结课 E9（交付物清单 G49）。
- 栏 4 两项候选（旧桥梁 w6 到 w8、交付物清单）照文件原定整节课结课时删，学生没另裁。
- 栏 2「问 330 挂账没查到」有误：挂账在交付物清单 G9（R1-388），以 DECISIONS-R1 R1-515 为准，报告正文不改。

相关文件:
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/docs/HARNESS.md
- /home/michael/projects/study-l3-v2/docs/SESSION_START.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/CHECKPOINTS.md
- /home/michael/projects/study-l3-v2/docs/arch/STANDARDS.md
- /home/michael/projects/study-l3-v2/docs/lessons/05-api-wbs.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh