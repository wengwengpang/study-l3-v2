**资料体检报告（第三次体检）**

我按 `.claude/agents/librarian.md` 做了本次体检。

上一份报告在 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 输出 3 条：1cd2dc3、a98b9eb、fea47ef。所以这不是首次体检，文件也在。

## 栏 1　脚本原样输出

```
== 资料体检 2026-10-14 15:09:14  提交 cb4bf87  未提交改动 0 处
== 范围：58 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 84 条，最大号 86；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 74 条，最大号 74；缺号：无；重号：无
  原则（HARNESS 第四节）：共 19 条，最大号 19；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 10 条，最大号 18；缺号：无；重号：无
  DECISIONS-R1 条目：共 384 条，最大号 384；缺号：无；重号：无
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
  反模式 1-13 ← docs/COURSE_RULES.md:430（常驻）
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
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 37(历史0 产品0) 38(历史0 产品0) 39(历史0 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 43(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 48(历史1 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 59(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 68(历史0 产品0) 72(历史0 产品0) 74(历史0 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    49800 total
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
      626 docs/COURSE_RULES.md
      617 docs/arch/ARCHITECTURE.md
      521 docs/PENDING-TUNER-REFACTOR.md
      432 docs/KNOWLEDGE_BASE.md
      373 docs/HARNESS.md
      331 docs/lessons/anti-patterns.md
      314 docs/design/PRD.md
      244 docs/BRIDGE-05-api-w2.md
      219 docs/lessons/05-arch-full.md
      189 docs/design/UI_DESIGN.md
      170 CLAUDE.md
      156 docs/SESSION_START.md
      140 docs/PROJECT_STRUCTURE.md
      130 docs/REFACTOR-HANDBOOK.md
      117 docs/lessons/05-arch-cheatsheet.md
       93 docs/lessons/00-full.md
       85 docs/BACKLOG.md
       76 docs/lessons/05-api-full.md
       72 docs/TEACHING_STYLE.md
       65 docs/REVIEW-DEBT.md
       65 .claude/agents/architect.md
       64 docs/lessons/03-full.md
       63 docs/arch/TECH_STACK.md
       62 docs/arch/DECISIONS.md
       56 docs/lessons/05-full.md
       51 docs/lessons/06-full.md
       50 .claude/agents/librarian.md
       46 docs/LESSON_TEMPLATE.md
       44 docs/lessons/04-full.md
       44 docs/arch/API_CONTRACT.md
       41 docs/lessons/01-full.md
       41 docs/design/USER_RESEARCH.md
       39 docs/lessons/00-cheatsheet.md
       38 docs/lessons/05-api-cheatsheet.md
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
  起点：上次报告提交 1cd2dc3
  A	docs/REVIEW-DEBT.md
  A	docs/vide_coding.md
  A	docs/web_course5_sample1.md
  A	docs/web_course5_sample2.md
  A	docs/web_course5_sample3.md
  A	docs/web_course5_sample4.md
  A	docs/web_course5_sample5.md
  A	docs/web_course_sample1.md
  A	docs/web_course_sample2.md
  A	docs/web_course_sample3.md
  A	docs/web_course_sample4.md
  A	docs/web_course_sample5.md
  A	docs/web_course_sample6.md
  A	scripts/rule-index.sh

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 58 份，缺 57 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/librarian.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  CLAUDE.md
  docs/AGENT_SPEC.md
  docs/BACKLOG.md
  docs/BRIDGE-05-api-w2.md
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
- 脚本数出 84 条，上次 83 条，涨了 1。
- 涨的原因不是新增规则。上次脚本把规则 34 算作一条规则，这次把它算作占位（占位从 3 个变 4 个：2 3 21 34）。
- 最大号从 85 变 86。
- 实际条数 80 与 docs/COURSE_RULES.md:9 写的「实际条数：80 条」对得上。「下一个可用号：87」（docs/COURSE_RULES.md:10）也对得上。
- 号段 1-86 在 docs/COURSE_RULES.md:7，留空清单在 docs/COURSE_RULES.md:8，也对得上。
- 因为脚本口径变了，我没法用 83 对 84 判断有没有对应的删并。判断：按 80 条的口径比，没有可核的新增规则。

其他清单变化：
- BACKLOG 69 增到 74。
- HARNESS 原则 17 增到 19，问题 9 增到 16。
- DECISIONS-R1 131 增到 384。这份是历史记录，按规则不查旧号。

各文件行数（上次存档的数字对本次脚本）：

| 文件 | 上次 | 本次 | 增减 |
|---|---|---|---|
| docs/COURSE_RULES.md | 613 | 626 | +13 |
| docs/HARNESS.md | 301 | 373 | +72 |
| docs/BACKLOG.md | 76 | 85 | +9 |
| docs/PROJECT_STRUCTURE.md | 121 | 140 | +19 |
| docs/REFACTOR-HANDBOOK.md | 124 | 130 | +6 |
| docs/SESSION_START.md | 154 | 156 | +2 |
| docs/LESSON_TEMPLATE.md | 45 | 46 | +1 |
| docs/arch/DECISIONS.md | 56 | 62 | +6 |
| docs/arch/API_CONTRACT.md | 43 | 44 | +1 |
| docs/BRIDGE-05-api-w2.md | 242 | 244 | +2 |
| docs/lessons/00-full.md | 92 | 93 | +1 |
| docs/lessons/05-api-full.md | 75 | 76 | +1 |
| CLAUDE.md | 169 | 170 | +1 |

- 其余文件行数不变。
- 总行数由 5806 变 49800。原因是 S6 新增 13 份大文件，范围从 45 份变 58 份。这 13 份是：REVIEW-DEBT、vide_coding、11 份 web_course 样本。
- scripts/rule-index.sh 在 S6 里列为新增，但它不在 58 份范围内。

上一份「学生选择」复查（栏 6 五条）：
- 规则 34「删，号留空，写已并入规则 82」：已落。docs/COURSE_RULES.md:75 写「已废……见 DECISIONS-R1 R1-137」。文件头留空清单含 34（docs/COURSE_RULES.md:8）。
- 规则 26「留」：已落。S4 本次不再把它列为零引用。
- 规则 30「留」：已落。S4 本次不再列它。
- 规则 8、9「留」：已落。这两条仍在 docs/COURSE_RULES.md:32、33，原文没动。
- 规则 13、23、38、39、40、43、63「留」：已落。7 条都还在。

## 栏 3　发现

1. 新入库的 12 份网页课堂记录样本，被脚本当「常驻」文件来查。这拉出一大批假指空引用。
   - 范围：web_course_sample1 到 6、web_course5_sample1 到 5，共 11 份。另有 vide_coding.md 一份。出处是 docs/PROJECT_STRUCTURE.md:50-52。
   - 这些文件是别处导出的聊天记录。里面的「规则 42」「规则 68」「反模式 57」用的是网页版当时的编号，不是本项目 COURSE_RULES 的编号。
   - S3 因此多出约 40 条指空引用，S3 附多出约 80 条区间。
   - S4 的规则零引用也被样本里的号码撞掉。上次零引用 12 条，本次只剩 4 条（8、9、13、23）。
   - 判断：规则 26、30、38、39、40、43、63 退出零引用，很可能是被样本里的撞号冲掉的，不是真有新引用。我只在样本以外的 md 里搜到 book/notes/ 下的引用，而 book/ 不在脚本范围内。所以没法确认这 7 条在范围内的真实引用数。[假设]
   - docs/PROJECT_STRUCTURE.md:50-51 写这些样本「去留：一次性，教科书写完后删」。docs/PROJECT_STRUCTURE.md:52 写 vide_coding「去留没定」。
   - 要不要把样本排出脚本范围，由学生定。
2. 规则 42 的指空引用，样本以外还有两处。docs/PENDING-TUNER-REFACTOR.md:196 是历史。docs/LESSON_TEMPLATE.md:23 是常驻，原文是「规则 42 已废……编号留空不重排」。
   - 一方：docs/LESSON_TEMPLATE.md:23 写 42 已废。
   - 另一方：docs/COURSE_RULES.md:8 把 42 列入留空。
   - 判断：两处说法一致，是误报。上次也是同样情况。
3. S7 报「58 份缺 57 份」。只有 docs/REVIEW-DEBT.md:4 有「去留：」。
   - S7 是新加的检查，上次报告没有这一项。
   - docs/REFACTOR-HANDBOOK.md:38 写「立项时就写好去留」，但 docs/REFACTOR-HANDBOOK.md 自己也缺。
   - 样本 12 份在 docs/PROJECT_STRUCTURE.md:50-52 有去留，但文件头没有。
   - 要不要补、补成长期还是一次性，学生判。
4. S6 有输出。按职责 1，每个文件列一条。每条都是「要不要进 SESSION_START M 节送审命令清单，学生判」。
   - docs/REVIEW-DEBT.md：它自己就是审查欠账表（docs/REVIEW-DEBT.md:1-4）。
   - docs/vide_coding.md：学习材料，docs/PROJECT_STRUCTURE.md:52。
   - docs/web_course5_sample1.md 至 sample5.md，共 5 份：样本，docs/PROJECT_STRUCTURE.md:51。
   - docs/web_course_sample1.md 至 sample6.md，共 6 份：样本，docs/PROJECT_STRUCTURE.md:50。
   - scripts/rule-index.sh：只读脚本，docs/PROJECT_STRUCTURE.md 我没核是否已列。[假设]
   - 判断：样本是外来记录、一次性文件，进送审清单的意义不大。这只是我的倾向，由学生拍。
5. D 总数口径不一致，上次报的 7 对 8，这次大半已对齐。
   - 现在 D1-D8 的有：CLAUDE.md:145、CLAUDE.md:148、docs/PROJECT_STRUCTURE.md:18、docs/PROJECT_STRUCTURE.md:94、docs/PROJECT_STRUCTURE.md:96、docs/KNOWLEDGE_BASE.md:401、docs/HARNESS.md:119。
   - 还写 D1-D7 的有：docs/KNOWLEDGE_BASE.md:236。
   - 该行自己注了「Lec 6 口径；现行为 D1-D8，见 CLAUDE.md 第三层 A」。
   - docs/PROJECT_STRUCTURE.md:94 写「Lec 6 建 D1-D7，补课 05-ARCH 加 D8」，是历史说明。
   - 判断：上次的冲突已基本消除，剩 KNOWLEDGE_BASE:236 一处带注的历史口径。
6. 规则 8、9、13、23 仍是零引用（docs/COURSE_RULES.md:32、33、40、59）。这四条与上次相同，学生已选「留」。

## 栏 4　可删/可并

无新增候选。理由：
- 上次候选（34、26、30、8、9、13、23、38、39、40、43、63）学生已全部拍板，处置已落（栏 2）。
- 本次 S4 零引用只剩 8、9、13、23，是已拍板「留」的那几条，我没有新的判断理由推翻。
- 这 4 条本次没有重读原文判断。原文只重读了一行：docs/COURSE_RULES.md:32、33、40、59。它们是独立的具体规则，我没发现被别的条盖住。
- 另有一项可能要学生拍：栏 3 第 1 条，样本 12 份是否排出脚本范围。这不是删文件的建议，是脚本范围问题。

## 栏 5　我拿不准的

1. 栏 3 第 1 条：26、30、38、39、40、43、63 退出零引用，是因为样本撞号，还是真有新的常驻引用，我没法确认。[假设]
2. 我没有逐份读 12 份样本的内容，只看了前几行和 S3 输出的行号。样本里的「规则 N」是否都是网页版编号，我没逐处核对。[假设]
3. 我没有比对 PRD 与 UI_DESIGN、ARCHITECTURE 与 TECH_STACK 之间有没有矛盾。栏 3 第 5 条的 D 口径是顺手核的。
4. 我没有逐条读 46 条反模式、74 条 BACKLOG 的内容，只看了脚本的零引用数。
5. 「形状相同」的判断，我本次没有套用，也没有读 HARNESS 第五节。
6. docs/HARNESS.md 增了 72 行、BACKLOG 增了 9 行，我只看了行数，没有读新增内容是否与旧内容重复或矛盾。
7. 我没有跑 scripts/report-check.sh。它要等报告存档后由主对话跑。

## 栏 6　学生选择

- 问 321（十二份外来材料要不要排出体检范围）：A，排出。本课结课前改 scripts/doc-check.sh 的范围，跳过 web_course 开头的样本与 docs/vide_coding.md；脚本在送审清单里，按规则 78 先出对照，学生说「帮我改」才改。
- 问 322（上次体检以来新增的文件进不进送审清单）：A，都不加。scripts/rule-index.sh 已被送审命令里的 scripts/ 覆盖。
- 问 323（开头缺「去留：」的 57 份）：A，照 S7 那句办，哪节课改到哪份，顺手补那份，不专门批量补。
- 删并：本次没有新候选，无选择。
学生原话：先回「321 _、322 _、323 _全按推荐」；CC 照手册第四节请回字母后，回「321 A、322 A、323 A」。

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/KNOWLEDGE_BASE.md
- /home/michael/projects/study-l3-v2/docs/REVIEW-DEBT.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh