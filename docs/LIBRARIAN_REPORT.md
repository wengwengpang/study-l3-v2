**资料体检报告（第十八次体检）**

我先读了 `.claude/agents/librarian.md`，再读了上一份报告 `docs/LIBRARIAN_REPORT.md`（第十七次，栏 6 已填）。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出，最新是 ee03910，文件在，所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

```
== 资料体检 2026-11-05 09:23:03  提交 8aa3524  未提交改动 0 处
== 范围：49 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 48 条，最大号 48；缺号：无；重号：无
  BACKLOG：共 88 条，最大号 88；缺号：无；重号：无
  原则（HARNESS 第四节）：共 24 条，最大号 24；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 704 条，最大号 704；缺号：无；重号：无
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
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 9(历史1 产品1) 10(历史0 产品0) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 16(历史1 产品0) 17(历史2 产品0) 18(历史0 产品0) 19(历史0 产品0) 20(历史1 产品0) 21(历史1 产品0) 22(历史0 产品1) 23(历史1 产品1) 24(历史0 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 31(历史0 产品0) 32(历史1 产品0) 34(历史3 产品0) 35(历史3 产品1) 38(历史0 产品0) 40(历史0 产品0) 42(历史0 产品0) 43(历史0 产品0) 44(历史0 产品0) 48(历史2 产品0) 51(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 59(历史1 产品0) 62(历史0 产品0) 64(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 68(历史0 产品0) 72(历史0 产品0) 74(历史0 产品6) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品2) 81(历史2 产品1) 82(历史1 产品1) 84(历史1 产品0) 85(历史0 产品0) 86(历史0 产品1) 88(历史0 产品1) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    9908 total
    2752 docs/lessons/05-api-full.md
     794 docs/arch/API_CONTRACT.md
     649 docs/COURSE_RULES.md
     639 docs/arch/ARCHITECTURE.md
     521 docs/PENDING-TUNER-REFACTOR.md
     433 docs/KNOWLEDGE_BASE.md
     432 docs/lessons/anti-patterns.md
     431 docs/HARNESS.md
     361 docs/design/PRD.md
     231 docs/design/UI_DESIGN.md
     219 docs/lessons/05-arch-full.md
     175 CLAUDE.md
     164 docs/SESSION_START.md
     153 docs/PROJECT_STRUCTURE.md
     136 docs/REFACTOR-HANDBOOK.md
     121 docs/CHECKPOINTS.md
     117 docs/lessons/05-arch-cheatsheet.md
     100 docs/BRIDGE-05-types-w1.md
     100 docs/BACKLOG.md
      93 docs/lessons/00-full.md
      88 docs/arch/DECISIONS.md
      75 docs/TEACHING_STYLE.md
      72 docs/arch/TECH_STACK.md
      69 docs/REVIEW-DEBT.md
      65 .claude/agents/architect.md
      64 docs/lessons/03-full.md
      63 docs/arch/STANDARDS.md
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
  起点：上次报告提交 ee03910
  D	docs/BRIDGE-05-api-w10.md
  D	docs/BRIDGE-05-api-w11.md
  D	docs/BRIDGE-05-api-w12.md
  D	docs/BRIDGE-05-api-w13.md
  D	docs/BRIDGE-05-api-w14.md
  D	docs/BRIDGE-05-api-w15.md
  D	docs/BRIDGE-05-api-w16.md
  D	docs/BRIDGE-05-api-w17.md
  D	docs/BRIDGE-05-api-w18.md
  D	docs/BRIDGE-05-api-w19.md
  D	docs/BRIDGE-05-api-w20.md
  D	docs/BRIDGE-05-api-w21.md
  D	docs/BRIDGE-05-api-w6.md
  D	docs/BRIDGE-05-api-w7.md
  D	docs/BRIDGE-05-api-w8.md
  D	docs/BRIDGE-05-api-w9.md
  A	docs/BRIDGE-05-types-w1.md
  A	docs/design/mockups/Main.dc.html
  A	docs/design/mockups/README.md
  A	docs/design/mockups/TaskDetailExecutor.dc.html
  A	docs/design/mockups/TasksEmptyExecutor.dc.html
  A	docs/design/mockups/TasksEmptyOwner.dc.html
  A	docs/design/mockups/TasksError.dc.html
  A	docs/design/mockups/TasksExecutor.dc.html
  A	docs/design/mockups/TasksLoading.dc.html
  A	docs/design/mockups/TasksOwner.dc.html
  A	docs/design/mockups/canvas.json
  D	docs/lessons/05-api-wbs.md
  A	docs/web_course_sample7.md
  A	docs/web_course_sample8.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 49 份，缺 26 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  docs/AGENT_SPEC.md
  docs/BRIDGE-05-types-w1.md
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
- BACKLOG 84 变 88，新增 85 到 88 四条（`docs/BACKLOG.md:97` 到 `docs/BACKLOG.md:100`）。
- DECISIONS-R1 633 变 704，新增 71 条。它是历史记录，不查旧号。
- 反模式 48、原则 24、问题 16、D 条 8、自检项 12、补遗 170 都没变。
- 文件范围 64 份变 49 份。BRIDGE 16 份与 `docs/lessons/05-api-wbs.md` 删除，新增 `docs/BRIDGE-05-types-w1.md` 和 `docs/design/mockups/README.md`。
- 上次 S4 规则零引用为空，这次出现 6 条：8、9、13、30、38、40，见栏 3 发现 3。
- S7 缺「去留：」由 42 份降到 26 份，降的 16 份是已删的 BRIDGE。新缺的是 `docs/BRIDGE-05-types-w1.md`。

**各文件行数：**
- 总数 10451 变 9908，减 543。
- `docs/lessons/05-api-full.md` 928 变 2752，加 1824。`git diff --stat` 显示 1828 行增删，是本窗口之外的最大改动。
- `docs/COURSE_RULES.md` 648 变 649，加 1。`docs/HARNESS.md` 429 变 431，加 2。
- `docs/lessons/anti-patterns.md` 425 变 432，加 7。
- `docs/SESSION_START.md` 159 变 164，加 5。
- `docs/PROJECT_STRUCTURE.md` 163 变 153，减 10。
- `docs/REVIEW-DEBT.md` 65 变 69，`docs/arch/STANDARDS.md` 53 变 63，`docs/arch/TECH_STACK.md` 65 变 72，`docs/BACKLOG.md` 96 变 100。
- 我没逐份核总数加减，只核了方向。

**上一份「学生选择」的复查：**
- 发现 2（目标句落后一个窗口，开课第 5 件照常改）：上份栏 6 写已落 e6c33e2。该句所在的 `docs/lessons/05-api-wbs.md` 已整份删除，该事不再适用。
- 栏 3 发现 1（w21 不进送审清单）：没有要落的动作。w21 随后已删（de7b622）。
- 栏 4 第 1 条（BRIDGE w6 到 w20 在结课 E11 删）：已落。提交 ff4e0d4「删旧桥梁 w6 到 w20 与交付物清单」。S6 的 D 行也列了。
- 栏 4 第 2 条（`05-api-wbs.md` 结课删）：已落，同在 ff4e0d4。S6 列了 D。
- 栏 4 第 3 条（规则 26 与宪法第一层 B 第 6 条重复，随 BACKLOG 83）：没落。`docs/BACKLOG.md:95` 仍挂着，触发时点是补课链上完、Lec 7 开课前，未到。
- 栏 5 没有要学生拍的，无复查项。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-types-w1.md`（100 行）。** 要不要进 SESSION_START M 节送审命令清单，学生判。`.claude/agents/librarian.md:27` 写 BRIDGE-*.md 是一次性桥梁，已定不进（问 567 A），只列不问。

2. **BRIDGE-05-types-w1.md:5 的一句已过时（判断）。**
   - 原句：「docs/ 下如果还有 BRIDGE-05-api-w21.md，就是学生还没亲跑那一行删除」。
   - 现状：w21 已由 de7b622 删掉，`docs/` 下已无 BRIDGE-05-api 文件。
   - 所以这句的条件已不成立。是否改，学生判。
   - 补一句：`docs/lessons/05-api-full.md:4` 写「w6 到 w20 …… 结课时已删」，没提 w21。w21 的删除在 de7b622。两处措辞不齐，不算矛盾。

3. **S4 规则零引用 6 条（上次为空）。** 逐条看原文，可删的理由和该留的理由都写。
   - **8、9、13**（`docs/COURSE_RULES.md:34`、`:35`、`:42`）：
     - 它们在规则 1 到 36 那一块，原文分别是「每步要讲为什么这么做」「每步要讲具体怎么做」「每节课开头要有『我们在哪』的地图」。
     - 常驻文件里没有单号引用，但 `docs/COURSE_RULES.md:5` 与 `docs/BACKLOG.md:48` 用「规则 1-36」整块引用，脚本不计跨度超过 10 的区间。
     - 该留的理由：这是教学写法的根本要求，课堂产出靠它们。
     - 可删的理由：无证据，我没找到其他条文盖住它们。
   - **30**（`docs/COURSE_RULES.md:73`）：「CC 弹权限请求一律人工看一眼再批」。
     - 历史列 1 次，产品列 0。
     - `docs/BACKLOG.md:95` 已把「规则 29、36 同类」挂进精简专场，30 没列在内。
     - 该留的理由：权限模式 `.claude/settings.json:4` 是 default，权限弹窗仍在，这条仍对得上。
   - **38 窗口体感**（`docs/COURSE_RULES.md:84`）与**40 字数给范围**（`docs/COURSE_RULES.md:90`）：
     - 38 要求每段或每课结尾报一次窗口体感，40 要求字数给范围并注明差不多即可。
     - 历史列分别 5 次、2 次，常驻列 0。
     - 判断：是否仍被执行我没核。若不再做，就是死规则候选。
   - 这 6 条都只是「脚本没在常驻文件里数到单号引用」。不是删并信号，只列给学生看。

4. **S7 缺「去留：」26 份。**
   - 5 份 `.claude/agents/`：architect、client、designer、persona、pm。
   - 其余 21 份：`docs/AGENT_SPEC.md`、`docs/BRIDGE-05-types-w1.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`，加 `docs/lessons/` 下各课 full 与 cheatsheet 共 16 份。
   - 分类与上次相同，BRIDGE 只列。
   - `docs/lessons/anti-patterns.md` 本窗口改了，它自己不在缺单里，说明已有「去留：」。

5. **规则 42 仍是指空引用，同上次。** `docs/LESSON_TEMPLATE.md:24`（常驻列）是「已废」说明，写明「规则 42 已废，改文件怎么走见规则 28」。`docs/PENDING-TUNER-REFACTOR.md:196` 是历史列。

6. **BACKLOG 新增 85 到 88 四条，S4 零引用里 85 为 0、86、88 各产品 1。**
   - `docs/BACKLOG.md:97` 到 `docs/BACKLOG.md:100`。
   - 85 登的是「designer 只出文字」，触发时点「全课走完后」，零引用合理。
   - 这是参考列，不是删并信号。

7. **BACKLOG 83 现在是一条超长条目。**
   - `docs/BACKLOG.md:95` 一行里并了：七个必读逐条过、规则 26 重复、规则 29、36 同类、自动记忆、DECISIONS 写多细、多条体检相关、05-API 结课送审留下的约十项。
   - 判断：把多件不同事塞进一条，之后拆分、验收会难。这条我没逐字核。
   - 是否拆，学生判。

8. **`docs/web_course_sample7.md` 与 `docs/web_course_sample8.md` 各五千多行，S6 列为新增，不在 S5 范围。**
   - `docs/PROJECT_STRUCTURE.md:60` 已登。
   - `docs/PROJECT_STRUCTURE.md:37` 提到 `docs/notes/` 下有摘要报告。
   - 脚本范围不含它们，我没读。

9. **`docs/design/mockups/` 新增 9 个文件（README、8 个 html 或 json）。**
   - 只有 `docs/design/mockups/README.md` 进了脚本范围，它有「去留：长期」。
   - 其余不是 md，不在脚本范围。`docs/PROJECT_STRUCTURE.md:76` 已登记。

10. **`docs/lessons/05-api-full.md` 暴增到 2752 行，是单文件最大。**
    - 它比第二大的 `docs/arch/API_CONTRACT.md`（794 行）大三倍多。
    - 文件头写「共二十一个窗口：开头是第一窗口的笔记，后面是各窗口补记」。
    - 这是已定做法，不是矛盾。读量会越来越重，与 `docs/BACKLOG.md:95` 提到的开课读量问题同类。
    - 是否要拆，学生判。

## 栏 4　可删/可并

候选清单：

1. **规则 26（`docs/COURSE_RULES.md:64`）与项目宪法第一层 B 第 6 条（`CLAUDE.md:23`）意思重复。**
   - 判断：规则 26 被完全盖住，可删。
   - 该留的理由：学生已拍「留」，登进 `docs/BACKLOG.md:95`（BACKLOG 83），随精简专场一起看。
   - 不是新候选，只记现状。我这次重读了两条原文，判断与上次一致。

2. **规则 38、40（`docs/COURSE_RULES.md:84`、`:90`）。** 是否仍在执行没核证，见栏 3 发现 3。我不判，列给学生看。

可并：无。理由如下。
- 规则总数没涨，反模式、原则、问题、D 条也没涨，没有新增条目需要对照旧条目。
- 本窗口 `docs/COURSE_RULES.md` 只改了规则 78 附近的 2 处措辞，没有新增条文。`docs/HARNESS.md` 加的是两段「补一层」。我没找到「一条被另一条完全盖住」的新证据（判断）。
- 零引用的反模式和 BACKLOG 是参考列，不是删并信号。
- 上次的两个候选（BRIDGE w6 到 w20、`05-api-wbs.md`）已删，不再列。

## 栏 5　我拿不准的

1. 发现 1：`docs/BRIDGE-05-types-w1.md` 按 `.claude/agents/librarian.md:27` 已定不进送审命令清单，我无异议。
2. 发现 2：`docs/BRIDGE-05-types-w1.md:5` 那句的改法和时点，学生判。
3. 发现 3：规则 8、9、13、30、38、40 是否仍有执行，我没核。38、40 尤其拿不准。
4. 发现 7：BACKLOG 83 太长，我没逐字读，没判里面各件之间有无相互矛盾。
5. `docs/lessons/05-api-full.md` 新增 1800 余行，我只读了开头 12 行，没读新增内容。与 `docs/arch/API_CONTRACT.md` 或书章有无矛盾，没比。
6. `book/` 下各章不在脚本范围，也没读。本窗口的大改动大都在那里，我没碰。
7. `docs/CHECKPOINTS.md`（改 4 行）、`docs/KNOWLEDGE_BASE.md`（改 4 行）、`docs/SESSION_START.md`（加 5 行）、`docs/REVIEW-DEBT.md`（改 18 行）、`docs/arch/STANDARDS.md`、`docs/arch/TECH_STACK.md`、`docs/PROJECT_STRUCTURE.md`：只看了 `git diff --stat`，没读改了什么，是否改出新冲突没比。
8. `docs/COURSE_RULES.md` 与 `docs/HARNESS.md` 我只读了 diff，没读它们的全文，没重做「形状相同」判据（HARNESS 第五节）。
9. `docs/PENDING-TUNER-REFACTOR.md`（521 行）计入范围，我没读，是否仍有保留价值没判断。
10. 我没逐条读 48 条反模式、88 条 BACKLOG。
11. 上次栏 5 里写的 4b41938 提交号这次没再核，该事已随 `05-api-wbs.md` 删除而不再适用。
12. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

（空，由 CC 照学生原话填。）

相关文件：
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/BRIDGE-05-types-w1.md
- docs/BACKLOG.md
- docs/COURSE_RULES.md
- docs/HARNESS.md
- docs/LESSON_TEMPLATE.md
- docs/PROJECT_STRUCTURE.md
- docs/lessons/05-api-full.md
- docs/lessons/anti-patterns.md
- docs/design/mockups/README.md
- CLAUDE.md
- .claude/settings.json
- scripts/doc-check.sh
