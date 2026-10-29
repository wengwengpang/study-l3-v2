**资料体检报告(第十四次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`(第十三次体检)。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出,最新是 1144516,文件在,所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

下面是 `bash scripts/doc-check.sh` 的输出,没删没改没转述。

```
== 资料体检 2026-10-29 14:10:49  提交 a867545  未提交改动 0 处
== 范围：61 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 84 条，最大号 84；缺号：无；重号：无
  原则（HARNESS 第四节）：共 23 条，最大号 23；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 595 条，最大号 595；缺号：无；重号：无
  DECISIONS-G1 补遗：共 170 条，最大号 170；缺号：无；重号：无

== S3 指空的引用（写了号，清单里没有）
  规则 42 ← docs/PENDING-TUNER-REFACTOR.md:196（历史）
  规则 42 ← docs/LESSON_TEMPLATE.md:23（常驻）
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
  反模式 1-13 ← docs/COURSE_RULES.md:436（常驻）
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗 132-170 ← docs/PENDING-TUNER-REFACTOR.md:169（历史）

== S4 常驻文件里从没被引用过的号
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 30(历史1 产品0) 38(历史5 产品0) 40(历史2 产品0) 
  反模式（参考，不是删并信号）：2(历史0 产品0) 6(历史0 产品0) 8(历史0 产品0) 9(历史0 产品0) 10(历史0 产品0) 11(历史0 产品0) 13(历史0 产品0) 20(历史0 产品0) 26(历史0 产品0) 28(历史0 产品0) 40(历史5 产品0) 
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 9(历史1 产品0) 10(历史0 产品0) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 16(历史1 产品0) 17(历史2 产品0) 18(历史0 产品0) 19(历史0 产品0) 20(历史1 产品0) 22(历史0 产品1) 23(历史1 产品1) 24(历史0 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 30(历史1 产品0) 32(历史2 产品0) 34(历史3 产品0) 35(历史3 产品1) 36(历史2 产品0) 38(历史0 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品2) 81(历史2 产品1) 82(历史2 产品1) 84(历史2 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
   10097 total
     815 docs/lessons/05-api-full.md
     794 docs/arch/API_CONTRACT.md
     645 docs/COURSE_RULES.md
     639 docs/arch/ARCHITECTURE.md
     521 docs/PENDING-TUNER-REFACTOR.md
     433 docs/KNOWLEDGE_BASE.md
     421 docs/HARNESS.md
     361 docs/design/PRD.md
     342 docs/lessons/05-api-cheatsheet.md
     331 docs/lessons/anti-patterns.md
     230 docs/design/UI_DESIGN.md
     229 docs/BRIDGE-05-api-w6.md
     219 docs/lessons/05-arch-full.md
     190 docs/BRIDGE-05-api-w8.md
     175 CLAUDE.md
     160 docs/PROJECT_STRUCTURE.md
     159 docs/lessons/05-api-wbs.md
     159 docs/SESSION_START.md
     157 docs/BRIDGE-05-api-w7.md
     146 docs/BRIDGE-05-api-w18.md
     143 docs/BRIDGE-05-api-w14.md
     141 docs/BRIDGE-05-api-w17.md
     140 docs/BRIDGE-05-api-w16.md
     140 docs/BRIDGE-05-api-w15.md
     140 docs/BRIDGE-05-api-w13.md
     138 docs/BRIDGE-05-api-w12.md
     137 docs/BRIDGE-05-api-w11.md
     136 docs/REFACTOR-HANDBOOK.md
     133 docs/BRIDGE-05-api-w10.md
     129 docs/BRIDGE-05-api-w9.md
     117 docs/lessons/05-arch-cheatsheet.md
     114 docs/CHECKPOINTS.md
      96 docs/BACKLOG.md
      93 docs/lessons/00-full.md
      87 docs/arch/DECISIONS.md
      75 docs/TEACHING_STYLE.md
      65 docs/arch/TECH_STACK.md
      65 docs/REVIEW-DEBT.md
      65 .claude/agents/architect.md
      64 docs/lessons/03-full.md
      56 docs/lessons/05-full.md
      53 docs/arch/STANDARDS.md
      51 docs/lessons/06-full.md
      51 .claude/agents/librarian.md
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
  起点：上次报告提交 1144516
  A	docs/BRIDGE-05-api-w18.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 61 份，缺 41 份
  .claude/agents/architect.md
  .claude/agents/client.md
  .claude/agents/designer.md
  .claude/agents/persona.md
  .claude/agents/pm.md
  docs/AGENT_SPEC.md
  docs/BRIDGE-05-api-w10.md
  docs/BRIDGE-05-api-w11.md
  docs/BRIDGE-05-api-w12.md
  docs/BRIDGE-05-api-w13.md
  docs/BRIDGE-05-api-w14.md
  docs/BRIDGE-05-api-w15.md
  docs/BRIDGE-05-api-w16.md
  docs/BRIDGE-05-api-w17.md
  docs/BRIDGE-05-api-w18.md
  docs/BRIDGE-05-api-w6.md
  docs/BRIDGE-05-api-w7.md
  docs/BRIDGE-05-api-w8.md
  docs/BRIDGE-05-api-w9.md
  docs/LESSON_TEMPLATE.md
  docs/PENDING-TUNER-REFACTOR.md
  docs/PROJECT_STRUCTURE.md
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
  docs/lessons/anti-patterns.md
```

## 栏 2　和上次比

**规则总数:** 脚本数 85 条,上次 85 条,没涨。最大号 87,缺号 42 68,占位 2 3 21 34,都没变。`docs/COURSE_RULES.md` 644 变 645 行,新增的两处是规则里追加的内容,不是新条:
- `docs/COURSE_RULES.md:148`:结课前问「这节有哪些能删」。
- `docs/COURSE_RULES.md:262`:结课时梳理 BACKLOG。
两处都出自问 669 A。条数没涨,不存在「涨了要对应删并」的问题。

**其他清单变化:**
- 原则 22 变 23。`docs/HARNESS.md:7` 头部计数同步写 23 条、下一号 24,对得上。
- BACKLOG 82 变 84,新增 83 和 84。
- DECISIONS-R1 582 变 595,新增 13 条。它是历史记录,不查旧号。
- 反模式 46、问题 16、D 条 8、规则 57 自检项 12、补遗 170 没变。
- 文件范围 60 份变 61 份,新增的是 `docs/BRIDGE-05-api-w18.md`。
- S4 规则零引用由 `8 9 13 26 30 38 40` 变 `8 9 13 30 38 40`,规则 26 已有引用,退出零引用。S4 没有标出引用来自哪里,我没追。
- 规则 30、38、40 的历史引用数涨了(1、5、2),产品引用仍是 0。
- S7 缺「去留:」40 份变 41 份,多出来的是 w18。

**各文件行数:**
- 总数 9865 变 10097,文件数多 1,总行数加 232。
- 新增 `docs/BRIDGE-05-api-w18.md` 146 行。
- `docs/lessons/05-api-full.md` 774 变 815,加 41。
- `docs/lessons/05-api-cheatsheet.md` 322 变 342,加 20。
- `docs/HARNESS.md` 402 变 421,加 19。
- `docs/lessons/05-api-wbs.md` 157 变 159,加 2。
- `docs/BACKLOG.md` 94 变 96,加 2。
- `docs/COURSE_RULES.md` 644 变 645,加 1。
- `docs/PROJECT_STRUCTURE.md` 159 变 160,加 1。
- 其余不变。
- 自 1144516 起共 36 个提交(`git log 1144516..HEAD | wc -l`)。

**上一份「学生选择」的复查:**
- 发现 2 与栏 4 第 2 条(本窗口目标句过期,「同意 922」):
  - 开课时改过一次,已落(d5efa83,上份栏 6 自带出处)。
  - 现在 `docs/lessons/05-api-wbs.md:8` 写「第十七窗口,桥梁 w17 第 5 节」,而 w18 已建。同一个句子又过期了,见栏 3 发现 2。
- 发现 5 与栏 4 第 4 条(规则 26、30、38、40 都留,「663 选 A」):
  - 「留」本身:已落,规则 26、30、38、40 都还在,`docs/COURSE_RULES.md:64`、`:73`。
  - 「随交付物清单 E9 过七个必读时一起看」:已落成登记,在 `docs/BACKLOG.md` 第 83 条(含规则 26 与项目宪法第一层 B 第 6 条重复、规则 29、36 同类)。过七个必读本身要等补课链上完、Lec 7 开课前,时点未到。
- G49(规则 57 第 12 项三处不对齐):上份栏 6 已写「已完(对照 871、872,ab578a2)」,以 `docs/DECISIONS-R1.md` R1-583 第五点为准。我没重读 R1-583,只引学生那份栏 6 的说法。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-api-w18.md`(146 行)。**
   - 要不要进 SESSION_START M 节送审命令清单,学生判。
   - `.claude/agents/librarian.md:27` 写 docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。

2. **「本窗口目标」句又对不上。**
   - `docs/lessons/05-api-wbs.md:8` 写「第十七窗口,桥梁 w17 第 5 节」。
   - `docs/BRIDGE-05-api-w18.md:1` 与 `:6` 已是第十八窗口。
   - 上次学生拍的是「开课第 5 件照常改」。判断:这是每个窗口开课改一次的常态,不是错。

3. **桥梁数字对得上。**
   - `docs/BRIDGE-05-api-w18.md:6` 写「docs/ 下现有十三份 05-API 桥梁:w6 到 w17 只作存档」。
   - S5 里 BRIDGE 共 13 份(w6 到 w18),对得上。
   - 十二份存档(w6 到 w17)合计:229+157+190+129+133+137+138+140+143+140+140+141=1817 行。

4. **S7 缺「去留:」的 41 份分类。**
   - 13 份 BRIDGE:w6 到 w18。BRIDGE 一次性,按职责 1 只列。
   - 5 份 `.claude/agents/`:architect、client、designer、persona、pm。
   - 其余 23 份是 `docs/lessons/` 下各课 full/cheatsheet 和 anti-patterns、`docs/AGENT_SPEC.md`、`docs/LESSON_TEMPLATE.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/PROJECT_STRUCTURE.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`。
   - `docs/PROJECT_STRUCTURE.md` 的「去留:」补法已登在 w18 第 4 点(`docs/BRIDGE-05-api-w18.md:93`)。

5. **规则 30、38、40 仍是零引用。**
   - 规则 30(`docs/COURSE_RULES.md:73`):「CC 弹权限请求一律人工看一眼再批。不要图省事全同意。」
   - 上次学生已拍留(问 663 A)。我没找到新的被盖住证据,继续留。
   - 规则 38、40:我这次 grep 按「38.」「40.」开头没匹配到(见栏 5),没读到原文。

6. **规则 8、9、13 仍是零引用。** 原文与上次相同(`docs/COURSE_RULES.md:34`、`:35`、`:42`)。学生上次拍的是留,没有新理由推翻。

7. **规则 42 仍是指空引用。**
   - `docs/LESSON_TEMPLATE.md:23` 写的是「已废」说明,不是误引。
   - 规则 42 在 COURSE_RULES 里缺号(S1)。

8. **新增的 HARNESS 原则 23 与项目宪法有相近内容。**
   - 原则 23 在 `docs/HARNESS.md` 第四节末尾(原文以「23. 专业做法先照行业标准」开头),三档、先后顺序、标准登记一处。
   - `CLAUDE.md` 第二层 D「标准方针」(先照行业标准,再主流做法,再自定;各领域认哪份见 `docs/arch/STANDARDS.md`)覆盖同一件事。
   - `docs/HARNESS.md` 新增段落自己写明与原则 19 分开立、是原则 1 和 12 的一例。
   - 判断:不是互相完全盖住,宪法那段是摘要,原则 23 是带出处的完整版。是否算「一层补充」(可并),我拿不准。

9. **原则 21、22 等三对形状像的,HARNESS 自己已写不并。**
   - 在 `docs/HARNESS.md` 原则 18 到 23 之后新增的「三组读自整体读至原则 23」。
   - 都写了「不合并」的理由(触发点不同)。我没有新的判断推翻。

10. **BACKLOG 83、84 是新增。**
    - 83(`docs/BACKLOG.md` 第 95 行)是精简专场,体量大。
    - 84 是别家模型主做本项目的评估。
    - S4 显示 84 历史引用 2、产品 0,属参考列,不是删并信号。

11. **BACKLOG 的 S4 零引用列表仍长,约 54 条。** 参考,不是删并信号。上次已记。

12. **反模式零引用仍是 11 条:** 2、6、8、9、10、11、13、20、26、28、40。参考列,与上次相同。

13. **`docs/lessons/anti-patterns.md` 有一处内容改动。** 第 279 行「本文:NNN」指路牌的条目,数字从 7 处改成 11 处。改动内有出处 R1-591。我没去核这个数字,但是它是反模式原文的修订,不是新增。

## 栏 4　可删/可并

候选清单:

1. `docs/BRIDGE-05-api-w6.md` 到 `w17.md`,共十二份,1817 行。
   - 可删的理由:`docs/BRIDGE-05-api-w18.md:6` 写「w6 到 w17 只作存档,整节课结课时删(E11)」。
   - 该留的理由:05-API 还没结课,存档用途未到期。
   - 删除时点是结课 E11,学生亲跑加 CONFIRM,不归我。

2. `docs/lessons/05-api-wbs.md` 整份(159 行)。
   - 它自己写的去留是「整节课结课时删」(`docs/lessons/05-api-wbs.md:3`)。
   - 现在不到时点,列出只是登记。

3. `docs/lessons/05-api-wbs.md:8` 的「本窗口目标」句(第十七窗口)。
   - 判断:它每个窗口开课改一次,学生上次已拍。
   - 该留的理由:第十七窗口的收尾记录可能还会被引用。
   - 改不改、何时改,学生判。

4. 规则 26(`docs/COURSE_RULES.md:64`)与项目宪法第一层 B 第 6 条意思重复。
   - 判断:可删(被完全盖住)。
   - 该留的理由:上次学生已拍「留」。已登进 `docs/BACKLOG.md` 第 83 条,随过七个必读时一起看。
   - 这次不再作为新候选,只记现状。

5. 原则 23(`docs/HARNESS.md`)与 `CLAUDE.md` 第二层 D「标准方针」。
   - 判断:这不是完全盖住,倾向「留」。可并与否,我拿不准,见栏 5。

可并:无,理由如下。
- 规则总数没涨,没有新增规则需要对照旧规则。
- 规则 8 与 9 同主题但是并列两层,没有看出一条被另一条完全盖住(判断)。
- 规则 8、9、13 的零引用,本次没有新理由推翻上次学生的「留」。
- 原则 23 与宪法标准方针的关系见栏 5,我没有足够把握列为可并。

## 栏 5　我拿不准的

1. 发现 1:w18 按 `.claude/agents/librarian.md:27` 已定不进送审命令清单,我无异议。
2. 发现 2:「本窗口目标」句改的时点,`docs/lessons/05-api-wbs.md:8` 没写。
3. 发现 5:规则 38、40 我 grep 没匹配到(按「38.」「40.」开头找),没读到原文。可能是它们格式不同、被标成占位或另有缩进,我没再深查。S4 把它们列为零引用,历史引用 5 和 2。
4. 发现 5、6:S4 规则 30、38、40 的历史引用数涨了,我没核引用是不是真指向这些规则,还是撞名。
5. 发现 8:原则 23 与 `CLAUDE.md` 第二层 D「标准方针」是不是「一层补充」。这要读完整的 HARNESS 原则 23 原文和 `docs/arch/STANDARDS.md`,我只看了原则 23 的 diff。
6. 栏 2:规则 26 退出零引用,S4 不显示引用来源。我猜是 BACKLOG 83 带出的,没核。
7. 我没读 `docs/BRIDGE-05-api-w18.md` 全文,只读到 :1、:6、:93。
8. 我没读 `docs/lessons/05-api-full.md` 新增 41 行、`docs/lessons/05-api-cheatsheet.md` 新增 20 行的全文,与其他文档有无矛盾没比。
9. 我没读 DECISIONS-R1 新增 13 条全文,职责 4 说不查旧号。
10. 我没逐条读 46 条反模式、84 条 BACKLOG,也没读 `docs/HARNESS.md` 第五节完整套「形状相同」判据,只看到新增的三对不并说明。
11. `docs/PENDING-TUNER-REFACTOR.md` 计入范围,521 行我没读,是否仍有保留价值没判断。
12. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

(空着,由 CC 照学生原话填。)

相关文件:
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/COURSE_RULES.md
- docs/HARNESS.md
- docs/BACKLOG.md
- docs/lessons/05-api-wbs.md
- docs/BRIDGE-05-api-w18.md
- docs/LESSON_TEMPLATE.md
- docs/PROJECT_STRUCTURE.md
- docs/lessons/anti-patterns.md
- CLAUDE.md
- scripts/doc-check.sh