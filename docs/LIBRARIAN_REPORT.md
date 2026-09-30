**资料体检报告**（首次体检：`docs/LIBRARIAN_REPORT.md` 不存在，`git log --oneline -- docs/LIBRARIAN_REPORT.md` 无输出。）

## 栏 1　脚本原样输出

```
== 资料体检 2026-10-01 00:19:12  提交 126cc23  未提交改动 0 处
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
  DECISIONS-R1 条目：共 126 条，最大号 126；缺号：无；重号：无
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
    5804 total
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
     119 docs/PROJECT_STRUCTURE.md
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
      14 docs/lessons/04-cheatsheet.md
```

## 栏 2　和上次比

- 规则总数：首次体检，无上一份报告可比。基线是脚本的 83 条，含占位 3 条，即 80 条实际规则。这个数和 docs/COURSE_RULES.md:9 写的「实际条数：80 条」一致。
- 各文件行数：无基线，不写增减。
- 上一份「学生选择」复查：无上一份报告，本栏无可复查项。

## 栏 3　发现

1. 规则 42 被两处提到，脚本标为「指空」。判断：这是误报，不是真悬空。
   - docs/COURSE_RULES.md:8 和 docs/COURSE_RULES.md:92 都明写「42 号已废，编号留空」。
   - docs/LESSON_TEMPLATE.md:22 写的是「规则 42 已废」。
   - docs/PENDING-TUNER-REFACTOR.md:196 是历史文件里的说明。
   - 指向废号本身没有打架。
2. docs/COURSE_RULES.md 的文件头没有单列规则 68 的空号说明段落，但 docs/COURSE_RULES.md:8 已把 68 列入「留空」（并入规则 66）。这与脚本的缺号 42、68 对得上，没有问题。
3. CLAUDE.md 内部措辞不一致，符合 D8「文档口径冲突」的报告条件。只报双方出处，不给结论。
   - 一方：CLAUDE.md:144 的小节标题和 CLAUDE.md:147 的正文写「D1-D7」。
   - 另一方：CLAUDE.md:164 有 D8。docs/PROJECT_STRUCTURE.md:18 和 docs/PROJECT_STRUCTURE.md:75 写「D1-D8」。
   - 另外 docs/KNOWLEDGE_BASE.md:236、docs/KNOWLEDGE_BASE.md:401 和 docs/HARNESS.md:103 仍写「D1-D7」。
   - 冲突点：D 的总数到底算 7 条还是 8 条。脚本的 D 清单显示 CLAUDE.md 里共 8 条。
   - 提示：docs/PROJECT_STRUCTURE.md:77 把「语义层 D1-D7」和「D1-D8」并写。这可能是「Lec 6 建的是 D1-D7」的历史口径，我不做结论。
4. S4 列出 12 条常驻文件零引用的规则。脚本没有做内容判断，判断放在栏 4。
   - 8、9、13、23、26、30、63：历史 0，产品 0。
   - 34、38、39、40、43：只有历史引用。
5. 与 CLAUDE.md 或全局规则文字重叠的规则，逐条读了原文。
   - 规则 26（docs/COURSE_RULES.md:61）与 CLAUDE.md:22 的第一层 B 第 6 条，意思几乎逐字相同。全局 ~/.claude/CLAUDE.md 的 2.6 也是同一意思。
   - 规则 30（docs/COURSE_RULES.md:69）与规则 28 的第三行（docs/COURSE_RULES.md:65，「弹窗先看清文件名再答」）在同一件事上有交叠。
   - 规则 34（docs/COURSE_RULES.md:73）只是指向规则 82（docs/COURSE_RULES.md:552）。
6. 规则 8、9 与规则 62 有部分交叠。
   - 规则 8、9（docs/COURSE_RULES.md:31、docs/COURSE_RULES.md:32）要求每步讲「为什么」和「怎么做」。
   - 规则 62（docs/COURSE_RULES.md:228 起）的 3a 原理、3b 操作，覆盖的是复杂步骤。
   - 规则 8、9 的范围是「每步」，比规则 62 宽。
7. 反模式和 BACKLOG 的零引用清单较长，脚本已标明「参考，不是删并信号」，我不据此提删并。

## 栏 4　可删/可并

以下每条都是判断，删不删由学生拍板。

| 候选 | 出处 | 判断 | 该留的理由 |
|---|---|---|---|
| 规则 34 | docs/COURSE_RULES.md:73 | 可删。它被规则 82 完全盖住，34 自己写着「标准见规则 82」。 | 它在 1-36 块里是原 TaskFlow 继承条，规则 35（docs/COURSE_RULES.md:74）和别处可能按号引用它。脚本显示常驻文件引用 0，历史文件引用 1。 |
| 规则 26 | docs/COURSE_RULES.md:61 | 可删。它被 CLAUDE.md:22 完全盖住，是同一句话的重复。 | 这份规则是给「老师」用的课程规则正本。CLAUDE.md 是给 CC 读的宪法。两份读者不同，删掉后课程规则正本会少一条。 |
| 规则 30 | docs/COURSE_RULES.md:69 | 可并。它是规则 28 第三行「弹窗先看清」的一层补充，可并入规则 28。 | 规则 30 管「权限请求」，规则 28 管「改文件时的弹窗」，场景不完全一样。DECISIONS-G1.md:231 到 DECISIONS-G1.md:241（补遗 9）记过它被专门裁决改写过。 |
| 规则 8、9 | docs/COURSE_RULES.md:31、docs/COURSE_RULES.md:32 | 可并。两条可并成一条，或并入规则 62 的 3a、3b。 | 规则 8、9 的范围是「每步」，规则 62 只管复杂步骤，范围不同。所在分组小标题「规则 8 到 12，是讲解的必做项」（docs/COURSE_RULES.md:29）是成组的，拆开会影响规则 10 到 12。 |
| 规则 13、23、38、39、40、43、63 | 见栏 3 第 4 条 | 留。它们都是独立的具体规则，没有被别的条完全盖住，也不是别的条的补充。零引用不等于重复。 | 规则 63 的 git status 检查（docs/COURSE_RULES.md:238）在别处没有同类条。规则 40、43 是给 CC 的任务写法约束。 |

## 栏 5　我拿不准的

1. 规则 26 与 CLAUDE.md:22 的关系，套不进规则 77 判据三的三分法。两条一字不差的「相同」，但一在课程规则、一在宪法，读者和生效层不同。要不要算「完全盖住」，我说不准。
2. 规则 8、9 的「每步」和规则 62 的「复杂步骤」范围不同，我不确定该算「补充」还是「都不是」。
3. 「形状相同」的判断（HARNESS 第五节：同触发点、同动作、同留痕），我在本次没有逐条套用。原因：没读 HARNESS 第五节全文，只确认了它在 docs/HARNESS.md:276。
4. 规则 42 被 docs/LESSON_TEMPLATE.md:22 引用，我判断是合理的历史说明。要不要让脚本对「已废号被写明已废」的引用免报，是学生要考虑的事。
5. 本次没有逐条读 46 条反模式和 69 条 BACKLOG 的内容，只看了脚本的零引用数。
6. 没有系统检查其他文件之间的矛盾，例如 PRD 与 UI_DESIGN、ARCHITECTURE 与 TECH_STACK 之间。栏 3 第 3 条是顺手核对时发现的，不是全面比对。

## 栏 6　学生选择

（空着，由 CC 照学生原话填。）

相关文件：
- /home/michael/projects/study-l3-v2/.claude/agents/librarian.md
- /home/michael/projects/study-l3-v2/docs/COURSE_RULES.md
- /home/michael/projects/study-l3-v2/CLAUDE.md
- /home/michael/projects/study-l3-v2/docs/PROJECT_STRUCTURE.md
- /home/michael/projects/study-l3-v2/docs/LESSON_TEMPLATE.md
