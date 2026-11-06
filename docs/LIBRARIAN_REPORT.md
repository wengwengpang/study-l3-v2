**资料体检报告（第十九次体检）**

我先读了 `.claude/agents/librarian.md`，再读了上一份报告 `docs/LIBRARIAN_REPORT.md`（第十八次）。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出，最新是 cda4147，文件在，所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

```
== 资料体检 2026-11-06 08:07:42  提交 8d65133  未提交改动 0 处
== 范围：55 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 48 条，最大号 48；缺号：无；重号：无
  BACKLOG：共 90 条，最大号 90；缺号：无；重号：无
  原则（HARNESS 第四节）：共 24 条，最大号 24；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 722 条，最大号 722；缺号：无；重号：无
  DECISIONS-G1 补遗：共 170 条，最大号 170；缺号：无；重号：无

== S3 指空的引用（写了号，清单里没有）
  规则 42 ← docs/PENDING-TUNER-REFACTOR.md:196（历史）
  规则 42 ← docs/LESSON_TEMPLATE.md:24（常驻）
  反模式：无
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗：无
  （原则、问题两份只看常驻列：常用词会撞名。D 号不查：常驻文件里 PRD 审定决策 D1 到 D9、重构分组 D0 也叫 D，只看常驻列也撞）

== S3 附：跨度超过 10 的区间（只是不算进引用次数，不是不查；首尾号在不在请人工看）
  规则 1-36 ← docs/PENDING-TUNER-REFACTOR.md:46（历史）
  规则 1-36 ← docs/BACKLOG.md:48（常驻）
  规则 1-36 ← docs/COURSE_RULES.md:5（常驻）
  反模式 1-13 ← docs/COURSE_RULES.md:438（常驻）
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗 132-170 ← docs/PENDING-TUNER-REFACTOR.md:169（历史）

== S4 常驻文件里从没被引用过的号
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 30(历史1 产品0) 38(历史5 产品0) 40(历史2 产品0) 
  反模式（参考，不是删并信号）：2(历史0 产品0) 6(历史0 产品0) 8(历史0 产品0) 9(历史0 产品0) 10(历史0 产品0) 11(历史0 产品0) 13(历史0 产品0) 20(历史0 产品0) 26(历史0 产品0) 28(历史0 产品0) 40(历史4 产品0) 41(历史0 产品0) 
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 9(历史1 产品1) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 16(历史1 产品0) 17(历史2 产品0) 18(历史0 产品0) 19(历史0 产品0) 20(历史1 产品0) 21(历史1 产品0) 22(历史0 产品1) 23(历史1 产品1) 24(历史0 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 31(历史1 产品0) 32(历史1 产品0) 34(历史3 产品0) 35(历史3 产品1) 38(历史0 产品0) 40(历史0 产品0) 42(历史0 产品0) 43(历史0 产品0) 44(历史0 产品0) 48(历史2 产品0) 51(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 59(历史1 产品0) 62(历史0 产品0) 64(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 68(历史0 产品0) 72(历史0 产品0) 74(历史0 产品8) 75(历史0 产品1) 76(历史0 产品0) 77(历史0 产品5) 78(历史0 产品0) 79(历史2 产品4) 80(历史0 产品2) 81(历史2 产品1) 82(历史1 产品7) 84(历史1 产品0) 85(历史0 产品0) 86(历史0 产品1) 88(历史0 产品1) 89(历史0 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    11867 total
     2752 docs/lessons/05-api-full.md
      997 docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md
      794 docs/arch/API_CONTRACT.md
      649 docs/COURSE_RULES.md
      639 docs/arch/ARCHITECTURE.md
      570 docs/arch/PENDING-TYPES-DRAFT.md
      521 docs/PENDING-TUNER-REFACTOR.md
      433 docs/KNOWLEDGE_BASE.md
      432 docs/lessons/anti-patterns.md
      431 docs/HARNESS.md
      361 docs/design/PRD.md
      231 docs/design/UI_DESIGN.md
      219 docs/lessons/05-arch-full.md
      175 CLAUDE.md
      164 docs/SESSION_START.md
      159 docs/PROJECT_STRUCTURE.md
      136 docs/REFACTOR-HANDBOOK.md
      131 docs/arch/SHARED_TYPES.md
      121 docs/CHECKPOINTS.md
      117 docs/lessons/05-arch-cheatsheet.md
      108 docs/PENDING-ROLE-PERMISSIONS.md
      102 docs/BACKLOG.md
       93 docs/lessons/00-full.md
       91 docs/BRIDGE-05-types-w2.md
       88 docs/arch/DECISIONS.md
       86 docs/lessons/05-types-wbs.md
       75 docs/TEACHING_STYLE.md
       72 docs/arch/TECH_STACK.md
       69 docs/REVIEW-DEBT.md
       67 docs/lessons/05-types-full.md
       65 .claude/agents/architect.md
       64 docs/lessons/03-full.md
       64 docs/arch/STANDARDS.md
       56 docs/lessons/05-full.md
       53 .claude/agents/client.md
       51 docs/lessons/06-full.md
       51 .claude/agents/librarian.md
       47 docs/LESSON_TEMPLATE.md
       44 docs/lessons/04-full.md
       42 docs/lessons/01-full.md
       42 docs/design/USER_RESEARCH.md
       39 docs/lessons/00-cheatsheet.md
       38 docs/AGENT_SPEC.md
       37 docs/lessons/01-cheatsheet.md
       37 .claude/agents/persona.md
       34 docs/lessons/02-full.md
       32 docs/design/mockups/README.md
       32 .claude/agents/designer.md
       30 .claude/agents/pm.md
       28 docs/lessons/05-cheatsheet.md
       26 docs/lessons/03-cheatsheet.md
       21 docs/lessons/02-cheatsheet.md
       20 docs/lessons/05-api-cheatsheet.md
       17 docs/lessons/06-cheatsheet.md
       14 docs/lessons/04-cheatsheet.md

== S6 上次体检以来新增、删除、改名的文件（A 新增、D 删除、R 改名；请对 SESSION_START M 节送审命令清单：要不要加、要不要改）
  起点：上次报告提交 cda4147
  D	docs/BRIDGE-05-types-w1.md
  A	docs/BRIDGE-05-types-w2.md
  A	docs/PENDING-ROLE-PERMISSIONS.md
  A	docs/arch/PENDING-TYPES-DRAFT.md
  A	docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md
  A	docs/arch/SHARED_TYPES.md
  A	docs/lessons/05-types-full.md
  A	docs/lessons/05-types-wbs.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 55 份，缺 25 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  docs/AGENT_SPEC.md
  docs/PENDING-TUNER-REFACTOR.md
  docs/REFACTOR-HANDBOOK.md
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
  docs/lessons/05-arch-cheatsheet.md
  docs/lessons/05-arch-full.md
  docs/lessons/05-cheatsheet.md
  docs/lessons/05-full.md
  docs/lessons/06-cheatsheet.md
  docs/lessons/06-full.md
```

## 栏 2　和上次比

**规则总数：** 85 条，上次 85 条，没涨。最大号 87，缺号 42 68，占位 2 3 21 34，都没变。没有「涨了要对应删并」的问题。

**其他清单变化：**
- BACKLOG 88 变 90，新增 89、90 两条（`docs/BACKLOG.md:101`、`docs/BACKLOG.md:102`）。
- DECISIONS-R1 704 变 722，新增 18 条。它是历史记录，不查旧号。
- 反模式 48、原则 24、问题 16、D 条 8、自检项 12、补遗 170 都没变。
- 文件范围 49 份变 55 份。
- S4 规则零引用仍是同样 6 条（8、9、13、30、38、40），没变。
- S3 指空引用只有规则 42，同上次。
- S7 缺「去留：」由 26 份降到 25 份。降的是已删的 `docs/BRIDGE-05-types-w1.md`。新增的 7 份文件开头都有「去留：」，没有新缺的。

**各文件行数：**
- 总数 9908 变 11867，加 1959。
- 新增的文件里最大的是 `docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md`（997 行）和 `docs/arch/PENDING-TYPES-DRAFT.md`（570 行）。
- 其余新增：`docs/arch/SHARED_TYPES.md` 131 行，`docs/PENDING-ROLE-PERMISSIONS.md` 108 行，`docs/BRIDGE-05-types-w2.md` 91 行，`docs/lessons/05-types-wbs.md` 86 行，`docs/lessons/05-types-full.md` 67 行。
- 已有文件的增减：
  - `docs/PROJECT_STRUCTURE.md` 153 变 159，加 6。
  - `docs/BACKLOG.md` 100 变 102，加 2。
  - `docs/arch/STANDARDS.md` 63 变 64，加 1。
  - 删除了 `docs/BRIDGE-05-types-w1.md`（上次 100 行）。
- `docs/COURSE_RULES.md`（649）、`docs/HARNESS.md`（431）、`docs/SESSION_START.md`（164）、`CLAUDE.md`（175）、`docs/lessons/05-api-full.md`（2752）行数都没变。
- 我没逐份核总数加减，只核了方向。

**上一份「学生选择」的复查：**
- cda4147 那份报告栏 6 仍是「（空，由 CC 照学生原话填。）」。
- 查到的存档提交只有 cda4147「存第十八次资料体检报告」，没有对应的「栏 6 填学生选择」提交。
- 所以没有可复查的选择项。
- 上份栏 3、栏 4 挂着的事照旧：
  - 规则 26 与 `CLAUDE.md:23`（第一层 B 第 6 条）重复，随 BACKLOG 83：没落。`docs/BACKLOG.md` 里 83 仍挂着，触发时点未到。我这次没重读该行全文。
  - `docs/BRIDGE-05-types-w1.md:5` 过时句：该文件已删，不再适用。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-types-w2.md`（91 行）。**
   - 它是一次性桥梁，按 `.claude/agents/librarian.md:27` 已定不进送审命令清单，只列不问。
   - 文件头 `docs/BRIDGE-05-types-w2.md:3` 写「去留：一次性。下个窗口或结课出新桥梁后删」。
   - `docs/PROJECT_STRUCTURE.md:59` 已登记。

2. **S6 新增 5 份非桥梁文件，要不要进 SESSION_START M 节送审命令清单，学生判。**
   - `docs/arch/SHARED_TYPES.md`（131 行，开头写「去留：长期」，见 `docs/arch/SHARED_TYPES.md:4`）。
   - `docs/lessons/05-types-full.md`（67 行，「去留：长期」）。
   - `docs/PENDING-ROLE-PERMISSIONS.md`（108 行，「去留：一次性。定稿落进各正本（第七节）后删」）。
   - `docs/arch/PENDING-TYPES-DRAFT.md`（570 行，「去留：一次性」）。
   - `docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md`（997 行，「去留：一次性」）。
   - 另有 `docs/lessons/05-types-wbs.md`（86 行，「去留：一次性」）。
   - 5 份都已登进 `docs/PROJECT_STRUCTURE.md`：行 60、73、74、75、91、92。
   - 判断：两份 PENDING-TYPES 一次性，按它们自己写的条件（学生认过后删）走即可，进不进送审清单由学生定。

3. **两份 PENDING-TYPES 文件互相指向，体量大（判断，我没读全文）。**
   - `docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md:4` 指回 `docs/arch/PENDING-TYPES-DRAFT.md` 的回写清单。
   - 两份合计 1567 行，都标一次性、删除走学生亲跑加 CONFIRM。
   - 两份头部都写「报告原样存档，一字不改」，所以内容上有无重复报告块，我没核。
   - 它们占本次新增行数的大头（约 80%）。

4. **BACKLOG 新增 89、90。**
   - 89（`docs/BACKLOG.md:101`）：第 7 课建 `packages/shared` 时接上 05-类型 的三件，含 Zod 版本重核和 `strictNullChecks`。S4 里 89 零引用，参考列，触发时点是第 7 课，合理。
   - 90（`docs/BACKLOG.md:102`）：角色权限系统，设计稿指向 `docs/PENDING-ROLE-PERMISSIONS.md`。S4 里 90 不在零引用清单，说明至少有一处常驻引用，如 `docs/PROJECT_STRUCTURE.md:60`。
   - 90 与 BACKLOG 83、BACKLOG 7 互相指（「权限表与去重定稿放精简专场（BACKLOG 83）；路径钩子与流水第 8 课（BACKLOG 7）」）。BACKLOG 83 仍是上次提过的超长条目，现在又多了一处指向它。

5. **BACKLOG 83 超长条目问题同上次。** 上次栏 3 发现 7 的拆分问题没变化，我这次没逐字读，是否拆学生判。

6. **S4 规则零引用 6 条，原样未变（8、9、13、30、38、40）。**
   - 原文位置：`docs/COURSE_RULES.md:34`、`:35`、`:42`、`:73`、`:84`、`:90`。
   - 判断与上次一致：只是脚本没在常驻文件里数到单号引用，不是删并信号。
   - 8、9、13 在规则 1 到 36 那一块，`docs/COURSE_RULES.md:5`、`docs/BACKLOG.md:48` 用「1-36」整块引用，脚本不计跨度超过 10 的区间。
   - 38、40 是否仍在执行，我没核。

7. **S7 缺「去留：」25 份，分类与上次相同。**
   - 5 份 `.claude/agents/`：architect、client、designer、persona、pm。
   - 20 份其余：`docs/AGENT_SPEC.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`，加 `docs/lessons/` 下 05 课之前及 arch、05、06 的 full 与 cheatsheet 共 16 份。
   - 新增文件没有缺的。

8. **规则 42 仍是指空引用，同上次。** `docs/LESSON_TEMPLATE.md:24` 是「已废」说明，`docs/PENDING-TUNER-REFACTOR.md:196` 是历史列。

## 栏 4　可删/可并

候选清单：

1. **规则 26（`docs/COURSE_RULES.md:64`）与项目宪法第一层 B 第 6 条（`CLAUDE.md:23`）。**
   - 判断：规则 26 被完全盖住，可删。
   - 该留的理由：学生已拍「留」，登进 BACKLOG 83，随精简专场一起看。
   - 不是新候选，只记现状。这次我没重读两条原文，沿用上次判断。

2. **规则 38、40（`docs/COURSE_RULES.md:84`、`:90`）。** 是否仍在执行没核证，见栏 3 发现 6。我不判，列给学生看。

3. **`docs/arch/PENDING-TYPES-DRAFT.md` 与 `docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md`。** 它们是一次性稿，按各自「去留」行，条件满足后删。我没读全文，不判两份之间有无重复。

可并：无。理由如下。
- 规则、反模式、原则、问题、D 条总数都没涨，没有新增条文需要对照旧条文。
- `docs/COURSE_RULES.md`、`docs/HARNESS.md` 行数没变；`docs/arch/STANDARDS.md` 加 1 行，我没读加了什么。
- 新增 BACKLOG 89、90 与已有条目的重复，我没逐条对照，没找到「一条被另一条完全盖住」的证据（判断）。
- 零引用的反模式和 BACKLOG 是参考列，不是删并信号。

## 栏 5　我拿不准的

1. 发现 2：新增 5 份非桥梁文件要不要进送审命令清单，学生判。
2. 发现 3：两份 PENDING-TYPES 之间有无重复内容，我没读全文。
3. 发现 4：BACKLOG 90 与 BACKLOG 83、BACKLOG 7 的指向有无相互矛盾，我只读了 89、90 两行，没比 83 和 7 的原文。
4. 发现 6：规则 8、9、13、30、38、40 是否仍有执行，我没核。38、40 尤其拿不准。
5. `docs/arch/SHARED_TYPES.md` 与 `docs/arch/API_CONTRACT.md`、`docs/arch/ARCHITECTURE.md` 有无矛盾，我只读了前 6 行，没比。
6. `docs/arch/STANDARDS.md` 加的那 1 行、`docs/PROJECT_STRUCTURE.md` 改的 6 行，我只看了行数，没读内容，是否改出新冲突没比。
7. `docs/lessons/05-api-full.md`（2752 行）这次没动，我也没读。上次拿不准的点（与 `docs/arch/API_CONTRACT.md`、书章有无矛盾）照旧。
8. `book/` 下各章不在脚本范围，没读。
9. `docs/PENDING-TUNER-REFACTOR.md`（521 行）计入范围，我没读，是否仍有保留价值没判断。
10. 我没逐条读 48 条反模式、90 条 BACKLOG。
11. 上份栏 6 为空，没有学生对上份候选的拍板记录。是否漏填，学生判。
12. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 发现 2（新增六份文件进不进送审命令清单）：问 772 A，六份都不进。学生原话「是 manual mode；771 A；772 A；同意 1181 到 1183」。
- 栏 3 发现 1（新增桥梁 w2）已定不进送审命令清单（问 567 A），只列不问；栏 4 三条时点已定（规则 26、38、40 随 BACKLOG 83；两份 PENDING-TYPES 照各自「去留：」删），本次不出题；栏 5 没有要学生拍的。

相关文件：
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/BRIDGE-05-types-w2.md
- docs/BACKLOG.md
- docs/COURSE_RULES.md
- docs/PROJECT_STRUCTURE.md
- docs/PENDING-ROLE-PERMISSIONS.md
- docs/arch/PENDING-TYPES-DRAFT.md
- docs/arch/PENDING-TYPES-SCHEMA-DRAFT.md
- docs/arch/SHARED_TYPES.md
- docs/lessons/05-types-full.md
- docs/lessons/05-types-wbs.md
- CLAUDE.md
- scripts/doc-check.sh