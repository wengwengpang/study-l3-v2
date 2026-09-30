**资料体检报告（第二次体检）**

上一份报告已存在：`git log --oneline -- docs/LIBRARIAN_REPORT.md` 输出 `fea47ef docs(复课前-324): 资料管理员首跑报告存档`。

## 栏 1　脚本原样输出

```
== 资料体检 2026-10-01 01:12:49  提交 a63e94f  未提交改动 0 处
== 范围：45 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 83 条，最大号 85；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 69 条，最大号 69；缺号：无；重号：无
  原则（HARNESS 第四节）：共 17 条，最大号 17；缺号：无；重号：无
  问题（HARNESS 第三节）：共 9 条，最大号 9；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 10 条，最大号 18；缺号：无；重号：无
  DECISIONS-R1 条目：共 131 条，最大号 131；缺号：无；重号：无
  DECISIONS-G1 补遗：共 170 条，最大号 170；缺号：无；重号：无

== S3 指空的引用（写了号，清单里没有）
  规则 42 ← docs/PENDING-TUNER-REFACTOR.md:196（历史）
  规则 42 ← docs/LESSON_TEMPLATE.md:22（常驻）
  反模式：无
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗：无
  （原则、问题两份只看常驻列：常用词会撞名。D 号不查：常驻文件里 PRD 审定决策 D1 到 D9、重构分组 D0 也叫 D，只看常驻列也撞）

== S3 附：跨度超过 10 的区间（只是不算进引用次数，不是不查；首尾号在不在请人工看）
  规则 1-36 ← docs/PENDING-TUNER-REFACTOR.md:46（历史）
  规则 1-36 ← docs/BACKLOG.md:43（常驻）
  规则 1-36 ← docs/COURSE_RULES.md:4（常驻）
  反模式 1-13 ← docs/COURSE_RULES.md:426（常驻）
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗 132-170 ← docs/PENDING-TUNER-REFACTOR.md:169（历史）

== S4 常驻文件里从没被引用过的号
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 23(历史0 产品0) 26(历史0 产品0) 30(历史0 产品0) 34(历史1 产品0) 38(历史4 产品0) 39(历史3 产品0) 40(历史1 产品0) 43(历史1 产品0) 63(历史0 产品0) 
  反模式（参考，不是删并信号）：2(历史0 产品0) 6(历史0 产品0) 8(历史0 产品0) 9(历史0 产品0) 10(历史0 产品0) 11(历史0 产品0) 13(历史0 产品0) 20(历史0 产品0) 26(历史0 产品0) 28(历史0 产品0) 
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 6(历史0 产品0) 9(历史1 产品0) 10(历史0 产品0) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 18(历史0 产品0) 19(历史0 产品0) 21(历史0 产品0) 22(历史0 产品1) 23(历史1 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 37(历史0 产品0) 38(历史0 产品0) 39(历史0 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 43(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 48(历史1 产品0) 50(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 59(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 69(历史0 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    5806 total
     617 docs/arch/ARCHITECTURE.md
     613 docs/COURSE_RULES.md
     521 docs/PENDING-TUNER-REFACTOR.md
     432 docs/KNOWLEDGE_BASE.md
     331 docs/lessons/anti-patterns.md
     314 docs/design/PRD.md
     301 docs/HARNESS.md
     242 docs/BRIDGE-05-api-w2.md
     219 docs/lessons/05-arch-full.md
     189 docs/design/UI_DESIGN.md
     169 CLAUDE.md
     154 docs/SESSION_START.md
     124 docs/REFACTOR-HANDBOOK.md
     121 docs/PROJECT_STRUCTURE.md
     117 docs/lessons/05-arch-cheatsheet.md
      92 docs/lessons/00-full.md
      76 docs/BACKLOG.md
      75 docs/lessons/05-api-full.md
      72 docs/TEACHING_STYLE.md
      65 .claude/agents/architect.md
      64 docs/lessons/03-full.md
      63 docs/arch/TECH_STACK.md
      56 docs/lessons/05-full.md
      56 docs/arch/DECISIONS.md
      51 docs/lessons/06-full.md
      50 .claude/agents/librarian.md
      45 docs/LESSON_TEMPLATE.md
      44 docs/lessons/04-full.md
      43 docs/arch/API_CONTRACT.md
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
```

## 栏 2　和上次比

- 规则总数：83 条，与上次相同。没有新增规则，所以无需核对对应的删并。
- 其他清单变化只有一项：DECISIONS-R1 条目从 126 增到 131。这是历史记录文件，按规则不查旧号。
- 各文件行数变化：
  - docs/PROJECT_STRUCTURE.md 由 119 增到 121，增 2 行（git diff fea47ef HEAD，加了 report-check.sh 和 LIBRARIAN_REPORT.md 两条目录树）。
  - 总行数由 5804 增到 5806，与上一条对得上。
  - docs/SESSION_START.md 行数不变（154），但 docs/SESSION_START.md:60 的 J 节第四步改了一行，加了 report-check.sh 核对。
  - docs/DECISIONS-R1.md 的 git diff 增 1531 行。它不在脚本的 45 份范围内。
  - scripts/report-check.sh 是新增文件，69 行，不在 45 份范围内。
- 上一份「学生选择」复查：上一份栏 6 是空的（docs/LIBRARIAN_REPORT.md:152-154，只有一句「空着，由 CC 照学生原话填」）。没有选择可复查，无「已落」也无「没落」。

## 栏 3　发现

1. 上一份存档的栏 1 比脚本原样输出少一行。
   - 上次存档 docs/LIBRARIAN_REPORT.md 的 S5 段在 docs/LIBRARIAN_REPORT.md:94-95 之间，没有 `17 docs/lessons/06-cheatsheet.md` 这一行。
   - 本次脚本输出有该行。docs/lessons/06-cheatsheet.md 现在 17 行，最近一次改它的提交是 2ce5304（lec6），早于上次体检。
   - 上次的 total 5804 加上该 17 行才与各文件之和对得上，所以文件当时就在。
   - 判断：上次存档漏抄了一行，不是文件变化。scripts/report-check.sh:1-3 说明它就是查这种问题（栏 1 与原样输出是否一致）。
   - 我没有跑 report-check.sh。它会写记录读取，且核对的是本次返回，要等报告存档后由主对话跑。
   - 出处：docs/LIBRARIAN_REPORT.md:94-95、scripts/report-check.sh:1-8。
2. 规则 42 的指空引用仍在，脚本报告与上次相同，两处都写明 42 已废。
   - 一方：docs/LESSON_TEMPLATE.md:22 写「规则 42 已废」。
   - 另一方：docs/COURSE_RULES.md:8 把 42 列入「留空」。
   - 判断：这是误报，不是真悬空。
3. CLAUDE.md 内的 D 总数口径不一致，这一条上次已报，仍没改。只报出处，不给结论。
   - 写「D1-D7」的：CLAUDE.md:144、CLAUDE.md:147、docs/KNOWLEDGE_BASE.md:236、docs/KNOWLEDGE_BASE.md:401、docs/HARNESS.md:103、docs/PROJECT_STRUCTURE.md:79。
   - 写「D1-D8」的：docs/PROJECT_STRUCTURE.md:18、docs/PROJECT_STRUCTURE.md:77。
   - 脚本显示 CLAUDE.md 有 D1 到 D8 共 8 条（D8 在 CLAUDE.md:164）。
   - 冲突点：总数算 7 还是 8，以及「语义层」一词指哪个范围。
   - docs/PROJECT_STRUCTURE.md:77 自己写了「Lec 6 建 D1-D7，补课 05-ARCH 加 D8」，这可能是历史口径。我不做结论。
4. S4 规则零引用清单与上次完全相同，共 12 条（8、9、13、23、26、30、34、38、39、40、43、63）。本次没有新增零引用，也没有消失的。

## 栏 4　可删/可并

以下每条都是判断，删不删由学生拍板。我没有逐条重读全部 12 条原文，只重读了栏 5 所列的几条。其余沿用上一份报告的判断。

| 候选 | 出处 | 判断 | 该留的理由 |
|---|---|---|---|
| 规则 34 | docs/COURSE_RULES.md:73 | 可删。它被规则 82 完全盖住，上次报告已记它只是指向规则 82。 | 它在 1-36 块里是继承条。常驻引用为 0，历史引用 1。 |
| 规则 26 | docs/COURSE_RULES.md:61 | 可删。它与 CLAUDE.md:22 的第一层 B 第 6 条意思相同。 | 课程规则是老师读的正本，CLAUDE.md 是 CC 读的宪法，读者不同。 |
| 规则 30 | docs/COURSE_RULES.md:69 | 可并。它是规则 28 第三行「弹窗先看清」的一层补充。 | 规则 30 管权限请求，规则 28 管改文件时的弹窗，场景不完全一样。 |
| 规则 8、9 | docs/COURSE_RULES.md:31、docs/COURSE_RULES.md:32 | 可并。两条可并成一条，或并入规则 62 的 3a、3b。 | 规则 8、9 管每步，规则 62 只管复杂步骤，范围不同。 |
| 规则 13、23、38、39、40、43、63 | 见栏 3 第 4 条 | 留。零引用不等于重复。 | 各自是独立的具体规则，我没发现被别的条盖住。 |

## 栏 5　我拿不准的

1. 规则 26 与 CLAUDE.md:22 的关系，套不进规则 77 判据三的三分法。意思相同，但一份是课程规则，一份是宪法，读者和生效层不同。
2. 规则 8、9 的范围是「每步」，规则 62 只管复杂步骤，我不确定该算「补充」还是「都不是」。
3. 「形状相同」的判断，我本次没有逐条套用。我没读 HARNESS 第五节全文。
4. 本次没有逐条读 46 条反模式和 69 条 BACKLOG 的内容，只看了脚本的零引用数。
5. 没有系统比对 PRD 与 UI_DESIGN、ARCHITECTURE 与 TECH_STACK 之间的矛盾。栏 3 第 3 条是顺手核对发现的。
6. 栏 4 的规则 34、26、30、8、9 沿用上次判断，本次没有重新逐条读原文。原因是两次之间 docs/COURSE_RULES.md 行数不变（613 行），我判断原文没改。
7. 栏 3 第 1 条的「漏抄一行」是我对比两份文本得出的判断。至于漏在管理员返回还是漏在 CC 存档，我没法分辨，也没读子代理记录。

## 栏 6　学生选择

（空着，由 CC 照学生原话填。）

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/LIBRARIAN_REPORT.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/CLAUDE.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/scripts/report-check.sh
