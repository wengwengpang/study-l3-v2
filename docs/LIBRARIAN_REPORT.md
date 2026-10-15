**资料体检报告(第四次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有 4 条输出(123325d、1cd2dc3、a98b9eb、fea47ef),文件也在。所以这不是首次体检。

## 栏 1　脚本原样输出

脚本是 `bash scripts/doc-check.sh`,下面是完整输出,没删没改。

```
== 资料体检 2026-10-15 09:43:56  提交 ec60e1e  未提交改动 0 处
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
  DECISIONS-R1 条目：共 387 条，最大号 387；缺号：无；重号：无
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
  起点：上次报告提交 123325d
  无

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

规则总数:
- 本次 84 条,上次 84 条,没涨。
- 最大号 86 不变,缺号 42、68 不变,占位 2 3 21 34 不变。
- 实际条数 80 与 docs/COURSE_RULES.md:9 写的「实际条数:80 条」对得上。
- 下一个可用号 87(docs/COURSE_RULES.md:10)对得上。
- 号段 1-86(docs/COURSE_RULES.md:7)和留空清单(docs/COURSE_RULES.md:8)也对得上。
- 规则没涨,所以没有需要核对的删并。

其他清单变化:
- 只有 DECISIONS-R1 从 384 条增到 387 条。这是历史记录,不查旧号。
- BACKLOG、反模式、HARNESS 原则与问题、D 条、补遗、规则 57 自检项都没变。

各文件行数:
- S5 每个文件的行数与上一份报告栏 1 完全一致,总数同为 49800,增减全为 0。
- `git diff --stat 123325d HEAD` 只显示 docs/DECISIONS-R1.md 加了 29 行。DECISIONS-R1 不在 S5 的 58 份里。

上一份「学生选择」的复查(栏 6 共 3 条加「删并无选择」):
- 问 321(把 web_course 样本和 vide_coding 排出体检范围,A):没落。
  - 栏 6 写的是「本课结课前改 scripts/doc-check.sh,按规则 78 先出对照,学生说『帮我改』才改」,所以现在没落可能只是时间未到。
  - 我 `grep -n "web_course\|vide_coding" scripts/doc-check.sh` 没有输出,脚本里没有排除这些文件的写法。
  - 本次 S1 到 S5 仍是「范围:58 份」,假指空引用也都还在。
  - 这也解释了为什么 S3 的规则 42、68 和反模式 57 都留着。
- 问 322(新增文件不进送审清单,A):已落。本次 S6 输出「无」。scripts/rule-index.sh 已列在 docs/PROJECT_STRUCTURE.md:36。
- 问 323(缺「去留:」的 57 份,哪节课改到哪份就补哪份,A):没落。
  - 本次 S7 仍是「58 份缺 57 份」,与上次同数。
  - 这一条选的是「顺手补」,不是批量补,所以数字没动不算违反。我只写事实。
- 删并:上次无新候选,无选择可复查。

## 栏 3　发现

1. 脚本范围没变,假指空引用仍在。这是栏 2 问 321 未落的直接后果。
   - 规则 42 在 docs/web_course_sample*.md 和 docs/web_course5_sample1.md:673 等处约 30 条。
   - 规则 68 有 5 条:docs/web_course5_sample2.md:4013、4015,docs/web_course5_sample4.md:3874、3901,docs/web_course5_sample5.md:535。
   - 反模式 57 有 1 条:docs/web_course_sample2.md:2463。
   - 判断:这些是网页版当时的编号,与本项目 COURSE_RULES 的编号无关。依据是上次报告栏 3 第 1 条和 docs/PROJECT_STRUCTURE.md:50-52。我这次没有逐处读这些行。
2. 规则 42 在样本以外的指空引用,仍是两处,都是误报。
   - docs/LESSON_TEMPLATE.md:23(常驻)写「规则 42 已废……编号留空不重排」。
   - docs/PENDING-TUNER-REFACTOR.md:196(历史)。
   - docs/COURSE_RULES.md:8 把 42 列入留空,与 LESSON_TEMPLATE:23 说法一致。
   - 判断:没有冲突,和上次一样。
3. 规则 8、9、13、23 仍是零引用(S4),原文在 docs/COURSE_RULES.md:32、33、40、59。
   - 这四条上次学生拍板「留」。本次我重读了这四行原文。
   - 它们是独立的具体规则,我没发现被别条完全盖住。
   - 判断:没有推翻上次「留」的理由。
4. BACKLOG 在 S4 列了 34 个零引用号,例如 1、2、3、12、13、14。
   - 脚本标明这是「参考,不是删并信号」。我没逐条读。
   - 15 号有历史引用 4 次,48 号有 1 次,其余历史 0 次。
5. S6 本次无输出,按职责 1 栏 3 不必列文件。
6. S7 报缺 57 份,与上次相同。
   - 只有 docs/REVIEW-DEBT.md:4 有「去留:」。
   - docs/REFACTOR-HANDBOOK.md:38 写「立项时就建,立项时就写好去留」,但 docs/REFACTOR-HANDBOOK.md 自己开头也缺。
   - 这一点上次已经报过,没有变化。
7. 本次与上次之间只有两个提交:89bfda4 和 ec60e1e。
   - 它们只动 docs/DECISIONS-R1.md,加 29 行(R1-385 之后记到 R1-387)。
   - 常驻文件没有变化。所以我没有发现新的矛盾或新的重复。

## 栏 4　可删/可并

无。理由:
- 规则总数、各常驻文件行数都没动,没有新增内容可以判重复。
- S4 唯一的规则零引用是 8、9、13、23,上次学生已选「留」。我重读原文后没有新的判断理由推翻。
- 不是删文件的建议,但有一项仍待学生处理:栏 2 问 321 的脚本范围改动,按栏 6 的话要先出对照,学生说「帮我改」。

## 栏 5　我拿不准的

1. 问 321 未落,是排期还是漏了,我无法判断。栏 6 写的是「本课结课前」,今天是 2026-10-15。我没读 SESSION_START 或 DECISIONS-R1 的本课计划来核对。[假设]
2. 我没有逐份读 12 份外来样本,不知道里面「规则 N」是否都是网页版编号。这条与上次相同。[假设]
3. 我没有比对 PRD 与 UI_DESIGN、ARCHITECTURE 与 TECH_STACK 有没有矛盾。这次没有常驻文件变化,所以没有触发。
4. 我没有逐条读 46 条反模式和 74 条 BACKLOG。BACKLOG 的 34 个零引用号只看了脚本数字。
5. 我没有套「形状相同」的判据,也没有读 HARNESS 第五节。
6. 我没有读 DECISIONS-R1 新增的 R1-385 到 R1-387。它是历史记录,职责 4 说不查旧号。我只看了 `git diff --stat`。
7. 我没有跑 scripts/report-check.sh。它要等报告存档后由主对话跑。

## 栏 6　学生选择

- 问 330（这次体检没经学生说「发」就派出，认不认）：A，认。派单原文与规定一字不差，四次调用全是只读，体检前后指纹相同。「谁派的」「有没有弹窗」记本课挂账。
- 问 331（体检那段时间看到弹窗没有）：B，看到了，选了 Yes。
- 问 332（学生有没有自己启动管理员）：A，没有。
- 问 333（核对脚本退出码 1，栏 1 多一句说明，认不认这份）：A，认。去掉那一句后，栏 1 与脚本原样输出 271 行逐行同序相同。改管理员定义文件还是改核对脚本，结课时定。
- 删并：本次没有新候选，无选择。
学生原话：「330 A、331 B、332 A」；「333 A」。

相关文件:
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/LESSON_TEMPLATE.md
- /home/michael/projects/study-l3-v2/docs/REFACTOR-HANDBOOK.md
- /home/michael/projects/study-l3-v2/scripts/doc-check.sh