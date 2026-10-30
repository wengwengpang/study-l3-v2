**资料体检报告(第十六次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`(第十五次体检)。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出,最新是 a5792b1,文件在,所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

下面是 `bash scripts/doc-check.sh` 的输出,没删没改没转述。

```
== 资料体检 2026-10-30 10:20:42  提交 6acb6d2  未提交改动 0 处
== 范围：63 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 48 条，最大号 48；缺号：无；重号：无
  BACKLOG：共 84 条，最大号 84；缺号：无；重号：无
  原则（HARNESS 第四节）：共 24 条，最大号 24；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 619 条，最大号 619；缺号：无；重号：无
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
  规则（删并候选，不含占位，删不删学生判）：无
  反模式（参考，不是删并信号）：2(历史0 产品0) 6(历史0 产品0) 8(历史0 产品0) 9(历史0 产品0) 10(历史0 产品0) 11(历史0 产品0) 13(历史0 产品0) 20(历史0 产品0) 26(历史0 产品0) 28(历史0 产品0) 40(历史6 产品0) 
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 9(历史1 产品0) 10(历史0 产品0) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 16(历史1 产品0) 17(历史2 产品0) 18(历史0 产品0) 19(历史0 产品0) 20(历史1 产品0) 22(历史0 产品1) 23(历史1 产品1) 24(历史0 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 32(历史1 产品0) 34(历史3 产品0) 35(历史3 产品1) 38(历史0 产品0) 40(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 51(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品2) 81(历史2 产品1) 82(历史2 产品1) 84(历史2 产品0) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    10263 total
      891 docs/lessons/05-api-full.md
      794 docs/arch/API_CONTRACT.md
      648 docs/COURSE_RULES.md
      639 docs/arch/ARCHITECTURE.md
      521 docs/PENDING-TUNER-REFACTOR.md
      433 docs/KNOWLEDGE_BASE.md
      429 docs/HARNESS.md
      425 docs/lessons/anti-patterns.md
      361 docs/design/PRD.md
      230 docs/design/UI_DESIGN.md
      229 docs/BRIDGE-05-api-w6.md
      219 docs/lessons/05-arch-full.md
      190 docs/BRIDGE-05-api-w8.md
      175 CLAUDE.md
      162 docs/lessons/05-api-wbs.md
      162 docs/PROJECT_STRUCTURE.md
      159 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
      148 docs/BRIDGE-05-api-w20.md
      148 docs/BRIDGE-05-api-w19.md
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
      119 docs/CHECKPOINTS.md
      117 docs/lessons/05-arch-cheatsheet.md
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
       47 docs/LESSON_TEMPLATE.md
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
       20 docs/lessons/05-api-cheatsheet.md
       17 docs/lessons/06-cheatsheet.md
       14 docs/lessons/04-cheatsheet.md

== S6 上次体检以来新增、删除、改名的文件（A 新增、D 删除、R 改名；请对 SESSION_START M 节送审命令清单：要不要加、要不要改）
  起点：上次报告提交 a5792b1
  A	docs/BRIDGE-05-api-w20.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 63 份，缺 41 份
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
  docs/BRIDGE-05-api-w19.md
  docs/BRIDGE-05-api-w20.md
  docs/BRIDGE-05-api-w6.md
  docs/BRIDGE-05-api-w7.md
  docs/BRIDGE-05-api-w8.md
  docs/BRIDGE-05-api-w9.md
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
```

## 栏 2　和上次比

**规则总数:** 脚本数 85 条,上次 85 条,没涨。最大号 87,缺号 42 68,占位 2 3 21 34,都没变。`docs/COURSE_RULES.md` 仍是 648 行,没动。不存在「涨了要对应删并」的问题。

**其他清单变化:**
- 反模式 48、BACKLOG 84、原则 24、问题 16、D 条 8、规则 57 自检项 12、补遗 170,条数都没变。
- DECISIONS-R1 608 变 619,新增 11 条。它是历史记录,不查旧号。
- 文件范围 62 份变 63 份,新增 `docs/BRIDGE-05-api-w20.md`。
- S3 指空引用、S4 各清单与上次逐项相同。
- S7 缺「去留:」41 份,上次 40 份。多出来的 1 份是新增的 w20。
- 自 a5792b1 起共 26 个提交(`git log --oneline a5792b1..HEAD | wc -l`)。`git diff --stat` 显示改动的文件有 `book/lec05-api-2.md`(+325/-116 左右,不在脚本范围内)、`docs/BRIDGE-05-api-w20.md`、`docs/DECISIONS-R1.md`、`docs/PROJECT_STRUCTURE.md`、`docs/lessons/05-api-full.md`、`docs/lessons/05-api-wbs.md`。
- `docs/COURSE_RULES.md`、`docs/HARNESS.md`、`docs/CHECKPOINTS.md`、`docs/BACKLOG.md`、`docs/lessons/anti-patterns.md` 在 `git diff --stat` 里没有出现,这几份常驻规则文件本窗口没动。

**各文件行数**(上次数取自上份报告栏 1):
- 总数 10075 变 10263,加 188。
- 新增 `docs/BRIDGE-05-api-w20.md` 148 行。
- `docs/lessons/05-api-full.md` 854 变 891,加 37。
- `docs/lessons/05-api-wbs.md` 160 变 162,加 2。
- `docs/PROJECT_STRUCTURE.md` 161 变 162,加 1。
- 其余不变。148+37+2+1=188,和总数对得上。

**上一份「学生选择」的复查:**
- 栏 5 第 3 条与发现 8(项目 `CLAUDE.md` 第一层 B 补不补「中断后复查」):学生选 695 A,不补。这是不改的决定,没有要落的动作。`CLAUDE.md` 第一层 B 现仍是 10 条,与此一致。
- 发现 2(本窗口目标句过期):学生同意 1036,开课第 5 件照常改。上份栏 6 写已落 512b64e,我没核这个提交号。现状见栏 3 发现 2。
- 栏 4 第 1 到 4 条时点早已定,上次不出题:
  - 第 1、2 条等结课 E11 删,至今未到时点,没落。
  - 第 3 条随 BACKLOG 83,没落。
  - 第 4 条问 679 A 都留,没落。
- 上次栏 2 里「S7 出去三份,实为两份」与「S4 零引用变空的来源没核」两处,学生已定报告原文不改,以 R1-610 第三点为准。我没重读 R1-610。
- 重派与 G74 登记(问 692 A、693 A):属于上一轮的流程事项,我没有可核的文件落点,不下结论。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-api-w20.md`(148 行)。**
   - 要不要进 SESSION_START M 节送审命令清单,学生判。
   - `.claude/agents/librarian.md:27` 写 docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。

2. **「本窗口目标」句再次过期,与上次同类。**
   - `docs/lessons/05-api-wbs.md:8` 写「第十九窗口,桥梁 w19 第 5 节」。
   - `docs/BRIDGE-05-api-w20.md:1` 已是「第二十窗口」。
   - 学生上次拍的是「开课第 5 件照常改」(对照 1036)。判断:这是每个窗口开课改一次的常态,不是错。

3. **桥梁数字对得上。**
   - `docs/BRIDGE-05-api-w20.md:6` 写「docs/ 下现有十五份 05-API 桥梁:w6 到 w19 只作存档」。
   - S5 里 BRIDGE 共 15 份(w6 到 w20),对得上。
   - 十四份存档(w6 到 w19)合计 2111 行(上次十三份 1963 加 w19 的 148)。

4. **S7 缺「去留:」的 41 份分类。**
   - 15 份 BRIDGE:w6 到 w20。BRIDGE 是一次性,按职责 1 只列。
   - 5 份 `.claude/agents/`:architect、client、designer、persona、pm。
   - 其余 21 份是 `docs/lessons/` 下各课 full 和 cheatsheet、`docs/AGENT_SPEC.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/PROJECT_STRUCTURE.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`。分类与上次相同。
   - `docs/PROJECT_STRUCTURE.md` 这次仍缺。

5. **规则 42 仍是指空引用。**
   - `docs/LESSON_TEMPLATE.md:24` 写的是「已废」说明,不是误引。
   - `docs/PENDING-TUNER-REFACTOR.md:196` 是历史列。
   - 规则 42 在 COURSE_RULES 里缺号(S1)。与上次相同。

6. **S4 规则零引用清单仍为空。** 反模式零引用仍是同样的 11 条(2、6、8、9、10、11、13、20、26、28、40)。BACKLOG 零引用清单与上次逐项相同,约 49 条。都是参考,不是删并信号。

7. **本窗口 05-API 书章与完整笔记在动。**
   - `docs/lessons/05-api-full.md` 加了 37 行。
   - `book/lec05-api-2.md` 有大改。
   - 这两份我都没读全文,与其他文档有无矛盾没比,见栏 5。

## 栏 4　可删/可并

候选清单:

1. `docs/BRIDGE-05-api-w6.md` 到 `docs/BRIDGE-05-api-w19.md`,共十四份,2111 行。
   - 可删的理由:`docs/BRIDGE-05-api-w20.md:6` 写「w6 到 w19 只作存档」,整节课结课时删(E11)。
   - 该留的理由:05-API 还没结课,存档用途未到期。
   - 删除时点是结课 E11,学生亲跑加 CONFIRM,不归我。

2. `docs/lessons/05-api-wbs.md` 整份(162 行)。
   - 它自己写的去留是「整节课结课时删」(`docs/lessons/05-api-wbs.md:3`)。
   - 现在不到时点,列出只是登记。

3. 规则 26(`docs/COURSE_RULES.md:64`)与项目宪法第一层 B 第 6 条意思重复。
   - 判断:可删(被完全盖住)。
   - 该留的理由:上次学生已拍「留」,已登进 `docs/BACKLOG.md` 第 83 条,随过七个必读时一起看。
   - 这次不再作为新候选,只记现状。

可并:无,理由如下。
- 规则总数没涨,反模式、原则、问题、D 条也都没涨,没有新增条目需要对照旧条目。
- 常驻规则文件本窗口没动(见栏 2)。我没有找到「一条被另一条完全盖住」的新证据(判断)。
- 零引用的反模式和 BACKLOG 都是参考列,不是删并信号。

## 栏 5　我拿不准的

1. 发现 1:w20 按 `.claude/agents/librarian.md:27` 已定不进送审命令清单,我无异议。
2. 发现 2:「本窗口目标」句改的时点,`docs/lessons/05-api-wbs.md:8` 没写。学生上次已拍照常改。
3. 上份栏 6 写的 512b64e 提交,我没核。
4. 我没读 `docs/BRIDGE-05-api-w20.md` 全文,只读到前 12 行。
5. 我没读 `docs/lessons/05-api-full.md` 新增 37 行全文,与其他文档有无矛盾没比。
6. 我没读 `book/lec05-api-2.md`。它不在脚本范围内,改动很大,是否与契约或书章口径冲突我没比。
7. 我没读 DECISIONS-R1 新增 11 条全文,职责 4 说不查旧号。
8. `docs/PROJECT_STRUCTURE.md` 加了 1 行,我没读改了什么,没核它与 S5 文件清单是否一致。
9. 我没逐条读 48 条反模式、84 条 BACKLOG,也没读 `docs/HARNESS.md` 第五节「形状相同」判据整段。本次这几份在 diff 中无改动,所以只做了计数比对。
10. `docs/PENDING-TUNER-REFACTOR.md` 计入范围,521 行我没读,是否仍有保留价值没判断。
11. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 发现 2（本窗口目标句过期）：开课第 5 件照常改，对照 1045 已落（4b41938）。学生原话「同意 1045」。
- 栏 3 发现 1（新增桥梁 w20）已定不进送审命令清单（问 567 A），只列不问；栏 4 三条时点早已定（第 1、2 条结课 E11 删，第 3 条随 BACKLOG 83），本次不出题；栏 5 没有要学生拍的。S4 规则零引用变空的来源这次核了：桥梁 w19 点名规则 8、9、13、30、38、40，体检脚本把桥梁归常驻，见 DECISIONS-R1 R1-620 第四点。

相关文件:
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/lessons/05-api-wbs.md
- docs/BRIDGE-05-api-w20.md
- docs/BRIDGE-05-api-w19.md
- docs/lessons/05-api-full.md
- docs/PROJECT_STRUCTURE.md
- docs/COURSE_RULES.md
- docs/BACKLOG.md
- docs/LESSON_TEMPLATE.md
- book/lec05-api-2.md
- CLAUDE.md
- scripts/doc-check.sh