**资料体检报告（第七次体检）**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 9 条输出,最新是 bb9b92e,文件在,所以不是首次体检。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`。下面是它的输出,没删没改没转述。

```
== 资料体检 2026-10-21 11:35:51  提交 9766a52  未提交改动 0 处
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
  DECISIONS-R1 条目：共 528 条，最大号 528；缺号：无；重号：无
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
  反模式 1-13 ← docs/COURSE_RULES.md:433（常驻）
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
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 37(历史2 产品0) 38(历史0 产品0) 39(历史2 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品3) 78(历史0 产品0) 80(历史0 产品1) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    52701 total
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
      742 docs/arch/PENDING-C1-DRAFT.md
      642 docs/COURSE_RULES.md
      637 docs/arch/ARCHITECTURE.md
      521 docs/PENDING-TUNER-REFACTOR.md
      502 docs/lessons/05-api-full.md
      432 docs/KNOWLEDGE_BASE.md
      402 docs/arch/API_CONTRACT.md
      387 docs/HARNESS.md
      353 docs/design/PRD.md
      331 docs/lessons/anti-patterns.md
      229 docs/BRIDGE-05-api-w6.md
      221 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      208 docs/lessons/05-api-cheatsheet.md
      190 docs/BRIDGE-05-api-w8.md
      172 CLAUDE.md
      158 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
      153 docs/PROJECT_STRUCTURE.md
      140 docs/lessons/05-api-wbs.md
      137 docs/BRIDGE-05-api-w11.md
      136 docs/REFACTOR-HANDBOOK.md
      133 docs/BRIDGE-05-api-w10.md
      129 docs/BRIDGE-05-api-w9.md
      117 docs/lessons/05-arch-cheatsheet.md
      113 docs/CHECKPOINTS.md
       93 docs/lessons/00-full.md
       91 docs/BACKLOG.md
       85 docs/arch/DECISIONS.md
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
  起点：上次报告提交 bb9b92e
  A	docs/BRIDGE-05-api-w11.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 67 份，缺 62 份
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
- 文件头号段 1-87、实际条数 81、下一个可用号 88 也没变(docs/COURSE_RULES.md:7-10)。
- 没涨,所以没有「涨了要对应删并」的问题。
- docs/COURSE_RULES.md 行数 641 变 642,加 1 行。`git diff` 显示加的是一条「例外」说明,写 SESSION_START J 节第 2 件的固定派单,出处问 569 A。它加在已有规则条目里,没有新开规则号。

其他清单变化:
- BACKLOG 78 变 80(新增 79、80)。BACKLOG 文件头「实际条数：80 条」(docs/BACKLOG.md:9) 与脚本一致。
- DECISIONS-R1 521 变 528(新增 R1-522 到 R1-528),是历史记录,不查旧号。
- 反模式 46、原则 20、问题 16、D 条 8、规则 57 自检项 12、补遗 170 都没变。
- S4:BACKLOG 77 的产品引用从 2 次变 3 次,80 有 1 次产品引用。

各文件行数(上次报告栏 1 的数到本次):
- 总数 51735 变 52701,加 966。
- 新增 docs/arch/PENDING-C1-DRAFT.md,742 行。它是 9b50b4f 提交建的(`git log --diff-filter=A`),在上次报告提交 bb9b92e 之前,但上次脚本(提交 3bb2faa)没算它,所以今天范围从 65 份变 67 份。
- 新增 docs/BRIDGE-05-api-w11.md,137 行(S6)。
- docs/arch/API_CONTRACT.md 399 变 402,加 3。
- docs/arch/DECISIONS.md 79 变 85,加 6(ADR-DB-008)。
- docs/lessons/05-api-full.md 455 变 502,加 47。
- docs/lessons/05-api-cheatsheet.md 189 变 208,加 19。
- docs/lessons/05-api-wbs.md 133 变 140,加 7。
- docs/BACKLOG.md 89 变 91,加 2。
- docs/PROJECT_STRUCTURE.md 151 变 153,加 2。
- docs/COURSE_RULES.md 641 变 642,加 1。
- 其余行数没变:HARNESS 387、SESSION_START 158、CLAUDE.md 172、PRD 353、UI_DESIGN 221、ARCHITECTURE 637、CHECKPOINTS 113、样本文件。
- 今天脚本给的 `.claude/agents/librarian.md` 是 50 行,与上次相同。
- 从 3bb2faa 到 bb9b92e 的 `git diff --stat` 里,librarian.md 有 1 行改,CLAUDE.md 有 1 行改。我没读 CLAUDE.md 那 1 行改了什么。

上一份「学生选择」的复查(三项):
- 发现 2(w10 不进送审命令清单,问 567 A):已落。.claude/agents/librarian.md:26 现在写着「docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问」。
- 认不认这份报告(问 568 A):已落,61d25fa 是存档提交。bb9b92e 是栏 6 填学生原话。
- 核对脚本「跑了 2 次」改法(问 569 A,对照 658):已落。`git diff --stat 3bb2faa bb9b92e` 显示 scripts/report-check.sh 有 19 行改。我没读那 19 行,是否改对我没验。

更早遗留(上次报告栏 2 列的几项,我只核文件现状):
- 问 560 A(规则 57 第 12 项三处不对齐,退回结课 E9,交付物清单 G49):没落,时点未到。docs/lessons/05-api-wbs.md:129 的 G49 仍是「待做(结课 E9)」。
- 旧桥梁 w6 到 w9 与 05-api-wbs.md 照原定整节课结课时删:没落,时点未到。五份桥梁都还在。
- 问 321(把网页版样本和 vide_coding 排出体检范围):没落。S3 里的外来样本引用还在,范围 67 份。
- 问 323(缺「去留：」的文件顺手补):没落。S7 缺 62 份,上次 61 份,多出的是 w11。PENDING-C1-DRAFT.md 开头有「去留：一次性」(docs/arch/PENDING-C1-DRAFT.md:3),不在缺的名单里。
- 问 333(改管理员定义文件还是改核对脚本,结课时定):没落。时点未到。

## 栏 3　发现

1. S6 新增文件:docs/BRIDGE-05-api-w11.md(137 行)。要不要进 SESSION_START M 节送审命令清单,学生判。
   - 按 .claude/agents/librarian.md:26,docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。
   - 性质:docs/PROJECT_STRUCTURE.md:58 写「第十一窗口暂存桥梁(第十一窗口以它为准)」。
2. 新进范围的文件:docs/arch/PENDING-C1-DRAFT.md(742 行),它不在 S6 里,因为它早于上次报告提交。
   - docs/arch/PENDING-C1-DRAFT.md:3 写「去留：一次性。第一节九个小节……全部落完后,学生认过后删;删除走学生亲跑与 CONFIRM」。
   - docs/PROJECT_STRUCTURE.md:70 写「按小节落完后删(第十窗口建,规则 70,R1-527)」。
   - 脚本 S1 到 S5 对它没有异常信号,S7 不缺。
   - 要不要进 SESSION_START M 节送审命令清单:这不是 S6 条目,我不问,只记一笔。
3. 桥梁状态:docs/PROJECT_STRUCTURE.md:53-57 写 w6 到 w10 五份都是「已用完,只作存档,整节课结课时删」,w11 是当前(:58)。
   - 已用完的五份合计 229+157+190+129+133=838 行(上次四份 705 行)。
   - 这是现状,不是现在要删。删除时点按文件自己写的结课。见栏 4。
4. 规则 57 第 12 项三处仍未对齐。[判断:学生已认定是真问题(问 560 A),改法还没落]
   - docs/COURSE_RULES.md:174:写「留空未用……已于 05-API 删除,见本文件末尾该条」。
   - docs/COURSE_RULES.md:312:「规则 57 追加第 12 项(05-ARCH 下半场加)」标题还在,没有作废标记。
   - docs/COURSE_RULES.md:450-451:「规则 57 第 12 项删除(05-API 加)」,取消的说明在这里。
   - 174 行说的「本文件末尾」,文件末尾是规则 87,不是 450 行的取消说明。
   - 文件头写「实际条数:11 条」,脚本数 12 条。这是同一处口径差。该行号我没单独再核,上次是 168,COURSE_RULES 在它前面加了 1 行,所以应是 169。[假设]
   - 以谁为准、怎么改,已退回结课 E9(docs/lessons/05-api-wbs.md:129),本次不再另出。
5. 交付物清单里新登记了几条「待做」,我只记状态,不判:
   - docs/lessons/05-api-wbs.md:135 G55(六行状态随问 569 A、570 A 改)。
   - docs/lessons/05-api-wbs.md:138 G58。PRD 定密码「至少 8 位、含字母和数字」,OWASP 写法与它相反,以谁为准写明由学生定,引决策边界 D8、D3。这是两份资料打架,出处双方都在该行里,我不给结论。
   - docs/lessons/05-api-wbs.md:139、140 G59、G60 也是待做。
6. 规则 8、9、13、23 仍零引用(S4)。上次学生拍板留。本次 COURSE_RULES 只在别的规则里加了 1 行,没碰这四条,我没重新读原文。[假设:理由未变]
7. BACKLOG 的 S4 零引用列表是参考,不是删并信号。75、76、78 零引用,77 产品引用 3 次,80 产品引用 1 次。
8. S3 的假指空引用没变。规则 42:docs/LESSON_TEMPLATE.md:23 是常驻真引用,其余都在网页版样本里。规则 68、反模式 57 都在外来样本里。我没有逐处读这些行,与问 321 未落直接相关。
9. 文档口径一致性小核:
   - docs/arch/PENDING-C1-DRAFT.md:3 写「删除走学生亲跑与 CONFIRM」。
   - docs/PROJECT_STRUCTURE.md:70 同口径。
   - docs/PROJECT_STRUCTURE.md:67 说 API-56 已拍待登。docs/arch/PENDING-C1-DRAFT.md:8 的「已拍」段也提 API-56。两处一致。
   - 我没发现新的两份打架,除 G58(见发现 5)。

## 栏 4　可删/可并

候选清单:

1. docs/BRIDGE-05-api-w6.md、w7.md、w8.md、w9.md、w10.md(共 838 行)。
   - 可删的理由:docs/PROJECT_STRUCTURE.md:53-57 写「已用完,只作存档,整节课结课时删」,w11 已接棒。
   - 该留的理由:05-API 还没结课,存档用途未到期。
   - 删除时点按文件自己写的结课,不是现在。删除走学生亲跑与 CONFIRM,不归我。
2. docs/lessons/05-api-wbs.md(140 行)。
   - docs/PROJECT_STRUCTURE.md 的去留说明写「一次性,整节课结课时删」。规则 87 同,具体行号我没单独核。
   - 现在不到时点,列出只是登记。
3. docs/arch/PENDING-C1-DRAFT.md(742 行)。
   - 可删的理由:docs/arch/PENDING-C1-DRAFT.md:3 写落完学生认过后删。
   - 该留的理由:契约第一节里第 3 到第 9 小节还没落(docs/PROJECT_STRUCTURE.md:67),文件在用。
   - 现在不到时点,列出只是登记。

可并:无。理由:
- 本次规则总数没涨,没有新增规则需要对照旧规则。
- 规则 8、9、13、23 的零引用,本次没有新理由推翻上次学生的「留」。
- COURSE_RULES 新加的那 1 行是已有规则里的「例外」说明,不是新规则。它和哪条规则像重复,我没读到对应规则全文,不敢判。

另有一处需要学生拍板,不属于删并:发现 4(规则 57 第 12 项三处不对齐)已退回 E9(G49)。发现 5 的 G58 是两份资料打架,由学生定以谁为准。

## 栏 5　我拿不准的

1. 发现 1:w11 要不要进送审命令清单。按 librarian.md:26 已定不进(只列不问),我无异议。
2. 发现 2:PENDING-C1-DRAFT.md 为什么上次脚本没算进范围。我只看到它在 3bb2faa 之后、bb9b92e 之前加入,没有查脚本逻辑。[假设:上次脚本跑在它建成之前]
3. 发现 4:174 行「见本文件末尾该条」指的是 450 行的取消说明,还是本应在文件末尾但没有的条。我读不出来。这条与上次相同。
4. 栏 2 里「CLAUDE.md 有 1 行改」「report-check.sh 有 19 行改」「COURSE_RULES 加的那 1 行是哪条规则里的」,我只看了 diff 统计和少量内容,没有逐处读。
5. 我没有逐份读 12 份外来样本,不知道里面「规则 N」是否都是网页版编号。与上次相同。[假设]
6. 我没有比对 CLAUDE.md、PRD、UI_DESIGN、ARCHITECTURE、API_CONTRACT 之间有没有矛盾。API_CONTRACT 这次加了 3 行,我没读内容。这一块至今未审。
7. 我没有读 PENDING-C1-DRAFT.md 全文 742 行,只读了开头的去留与执行铁律。
8. 我没有读 DECISIONS-R1 新增的 R1-522 到 R1-528 全文。它是历史记录,职责 4 说不查旧号。
9. 我没有逐条读 46 条反模式、80 条 BACKLOG,也没有套「形状相同」的判据,没有读 HARNESS 第五节。
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
- /home/michael/projects/study-l3-v2/docs/BRIDGE-05-api-w11.md
- /home/michael/projects/study-l3-v2/docs/arch/PENDING-C1-DRAFT.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh