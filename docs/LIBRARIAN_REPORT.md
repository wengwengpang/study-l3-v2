**资料体检报告(第十五次体检)**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`(第十四次体检)。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出,最新是 3787cfb,文件在,所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

下面是 `bash scripts/doc-check.sh` 的输出,没删没改没转述。

```
== 资料体检 2026-10-29 23:02:18  提交 03b7f9d  未提交改动 0 处
== 范围：62 份文件

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
  DECISIONS-R1 条目：共 608 条，最大号 608；缺号：无；重号：无
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
    10075 total
      854 docs/lessons/05-api-full.md
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
      161 docs/PROJECT_STRUCTURE.md
      160 docs/lessons/05-api-wbs.md
      159 docs/SESSION_START.md
      157 docs/BRIDGE-05-api-w7.md
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
  起点：上次报告提交 3787cfb
  A	docs/BRIDGE-05-api-w19.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 62 份，缺 40 份
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

**规则总数:** 脚本数 85 条,上次 85 条,没涨。最大号 87,缺号 42 68,占位 2 3 21 34,都没变。`docs/COURSE_RULES.md` 645 变 648 行,加的 3 行是给已有规则追加的补充句,不是新条:
- 规则 45 追加一句,换窗口出的桥梁不要求先入库(`docs/COURSE_RULES.md:107`)。
- 规则 48 追加一句,一节课没上完时喊停就是建议换窗口(`docs/COURSE_RULES.md:129`)。
- 桥梁 9 节那段追加一句,换窗口桥梁同样写 9 节(`docs/COURSE_RULES.md:580`)。

三处都标了问 684 A 或 365 甲。条数没涨,不存在「涨了要对应删并」的问题。

**其他清单变化:**
- 反模式 46 变 48,新开 47(搜不到不等于没有,`docs/lessons/anti-patterns.md:402`)和 48(一轮做到一半没发消息就停,`docs/lessons/anti-patterns.md:417`)。
- 原则 23 变 24,新开原则 24(`docs/HARNESS.md` 第四节末尾)。`docs/HARNESS.md:7` 头部计数同步写 24 条、下一号 25,对得上。
- 检查单从 13 张变 14 张,新加卡 14(`docs/CHECKPOINTS.md:105`)。
- DECISIONS-R1 595 变 608,新增 13 条。它是历史记录,不查旧号。
- BACKLOG 条数仍 84,但 `git diff` 里 7、28、30、37、39、41、47、48、52、59、63、65、83 这十三条的文字变了,主要是改时机、关闭 48 和 59。
- 问题 16、D 条 8、规则 57 自检项 12、补遗 170 没变。
- 文件范围 61 份变 62 份,新增 `docs/BRIDGE-05-api-w19.md`。
- S4 规则零引用由 `8 9 13 30 38 40` 变成「无」。S4 不显示引用来源,我没追是哪份文件新引了它们。
- S7 缺「去留:」41 份变 40 份。`docs/lessons/anti-patterns.md:3`、`docs/LESSON_TEMPLATE.md:3`、`docs/lessons/05-api-cheatsheet.md:3` 都补上了,新增的缺项是 w19。

**各文件行数**(上次数取自上份报告栏 1):
- 总数 10097 变 10075,文件多 1 份,总行数减 22。
- `docs/lessons/05-api-cheatsheet.md` 342 变 20,减 322(速查卡压成一页,`git diff --stat` 为 358 行改动)。
- `docs/lessons/anti-patterns.md` 331 变 425,加 94。
- 新增 `docs/BRIDGE-05-api-w19.md` 148 行。
- `docs/lessons/05-api-full.md` 815 变 854,加 39。
- `docs/HARNESS.md` 421 变 429,加 8。
- `docs/CHECKPOINTS.md` 114 变 119,加 5。
- `docs/COURSE_RULES.md` 645 变 648,加 3。
- `docs/lessons/05-api-wbs.md` 159 变 160,加 1。
- `docs/PROJECT_STRUCTURE.md` 160 变 161,加 1。
- `docs/LESSON_TEMPLATE.md` 46 变 47,加 1。
- 其余不变。这些增减加起来是 -22,和总数对得上。
- 自 3787cfb 起共 33 个提交(`git log --oneline 3787cfb..HEAD | wc -l`)。

**上一份「学生选择」的复查:**
- 发现 2 与栏 4 第 3 条(本窗口目标句过期):学生选「开课第 5 件照常改」,对照 983,已落(8899e5e,上份栏 6 自带出处)。现在 `docs/lessons/05-api-wbs.md:8` 又过期一轮,见栏 3 发现 2。
- 发现 8 与栏 4 第 5 条(原则 23 与宪法第二层 D「标准方针」):问 679 A 两处都留不改,已落。`CLAUDE.md` 第二层 D「标准方针」和 `docs/HARNESS.md` 原则 23 都还在。
- 栏 4 第 1、2、4 条时点已定,上次不出题。第 1、2 条(十二份旧桥梁与交付物清单整份)等结课 E11 删,至今未到时点。第 4 条随 BACKLOG 83,现状同上。
- 栏 5 第 3、6 条与发现 4 的节号 CC 当场核过,结论以 DECISIONS-R1 R1-596 第五点为准。我没重读 R1-596,只引上份栏 6 的说法。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-api-w19.md`(148 行)。**
   - 要不要进 SESSION_START M 节送审命令清单,学生判。
   - `.claude/agents/librarian.md:27` 写 docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。

2. **「本窗口目标」句又对不上。**
   - `docs/lessons/05-api-wbs.md:8` 写「第十八窗口,桥梁 w18 第 5 节」。
   - `docs/BRIDGE-05-api-w19.md:1` 与 `:6` 已是第十九窗口。
   - 上次学生拍的是「开课第 5 件照常改」(对照 983)。判断:这是每个窗口开课改一次的常态,不是错。

3. **速查卡改成一页后,清单里的 W1 行和「速查卡补记」的旧说法互相改过口径。**
   - `docs/lessons/05-api-wbs.md:56` W1 行前半句写「05-api-full.md、05-api-cheatsheet.md 末尾追加本窗口补记」,括号里补了「第十八窗口起速查卡不再追加补记」。同一格内新旧并存,括号已说明,不算冲突。
   - `docs/PROJECT_STRUCTURE.md` 的 05-api-cheatsheet 一行改成「第十八窗口改成一页,800 字内」。
   - 实测 `wc -m docs/lessons/05-api-cheatsheet.md` 是 731 字符。`docs/lessons/05-api-wbs.md:70` 说压回 800 字内,对得上。

4. **桥梁数字对得上。**
   - `docs/BRIDGE-05-api-w19.md:6` 写「docs/ 下现有十四份 05-API 桥梁:w6 到 w18 只作存档」。
   - S5 里 BRIDGE 共 14 份(w6 到 w19),对得上。
   - 十三份存档(w6 到 w18)合计 1963 行(229+157+190+129+133+137+138+140+143+140+140+141+146)。

5. **S7 缺「去留:」的 40 份分类。**
   - 14 份 BRIDGE:w6 到 w19。BRIDGE 一次性,按职责 1 只列。
   - 5 份 `.claude/agents/`:architect、client、designer、persona、pm。
   - 其余 21 份是 `docs/lessons/` 下各课 full 和 cheatsheet(不含 anti-patterns 与 05-api-cheatsheet)、`docs/AGENT_SPEC.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/PROJECT_STRUCTURE.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`。
   - `docs/PROJECT_STRUCTURE.md` 的「去留:」补法已登在上次提到的 w18 计划里,这次仍缺。

6. **S4 规则零引用清单本次为空。** 规则 8、9、13、30、38、40 都有了常驻引用。学生上次已拍留,没有删并动作。

7. **规则 42 仍是指空引用。**
   - `docs/LESSON_TEMPLATE.md:24` 写的是「已废」说明,不是误引。
   - `docs/PENDING-TUNER-REFACTOR.md:196` 是历史列。
   - 规则 42 在 COURSE_RULES 里缺号(S1)。

8. **一件事落了四个家:全局 2.11、卡 14、反模式 48、原则 24。**
   - 全局 `~/.claude/CLAUDE.md` 2.11(中断后复查)。
   - `docs/CHECKPOINTS.md:105` 卡 14(操作清单)。
   - `docs/lessons/anti-patterns.md:417` 反模式 48(现象与根因)。
   - `docs/HARNESS.md` 原则 24(行为标准)。
   - 四处互相指向(卡 14 引反模式 48 与原则 24;反模式 48 写「进 HARNESS:新开(原则 24)」)。原则 24 自己写了与原则 17、22 分开立的理由。
   - 判断:分层有意,不是完全盖住。但项目 `CLAUDE.md` 第一层 B 没有对应条,只靠全局 2.11,这点我看到了没下结论。

9. **反模式 47 与已有条目自己写了同族。**
   - `docs/lessons/anti-patterns.md:413` 说与 22 号补案例、40 号同族,但分开立,并说明方向相反。
   - `docs/lessons/anti-patterns.md:415` 写「进 HARNESS:否(已覆盖,原则 19)」。
   - 判断:这是已经写明的不并,我没有新证据推翻。

10. **规则 87 的 LESSON_TEMPLATE 第 4 块措辞有变。**
    - `docs/LESSON_TEMPLATE.md:40` 现写「现场登进本节挂账(交付物清单『推到结课的事』),整节课结课时编号入库(规则 45、87)」。
    - 对照 `docs/COURSE_RULES.md:107` 规则 45 追加句,方向一致。
    - 我没找到矛盾。

11. **BACKLOG 的 S4 零引用列表仍长,约 49 条。** 参考,不是删并信号。

12. **反模式零引用仍是 11 条:** 2、6、8、9、10、11、13、20、26、28、40。参考列,与上次相同。

13. **BACKLOG 48 和 59 在 git log 里写「关闭」(6ec0803、4a9e3a0),条数不变仍是 84。**
    - `docs/BACKLOG.md` 里关闭的条目留在原号上,没有物理删除。
    - 这与 S2「缺号:无」一致。
    - 我没核 48、59 当前文字是否写明已关闭。

## 栏 4　可删/可并

候选清单:

1. `docs/BRIDGE-05-api-w6.md` 到 `docs/BRIDGE-05-api-w18.md`,共十三份,1963 行。
   - 可删的理由:`docs/BRIDGE-05-api-w19.md:6` 写「w6 到 w18 只作存档」,整节课结课时删(E11)。
   - 该留的理由:05-API 还没结课,存档用途未到期。
   - 删除时点是结课 E11,学生亲跑加 CONFIRM,不归我。

2. `docs/lessons/05-api-wbs.md` 整份(160 行)。
   - 它自己写的去留是「整节课结课时删」(`docs/lessons/05-api-wbs.md:3`)。
   - 现在不到时点,列出只是登记。

3. 规则 26(`docs/COURSE_RULES.md:64`)与项目宪法第一层 B 第 6 条意思重复。
   - 判断:可删(被完全盖住)。
   - 该留的理由:上次学生已拍「留」,已登进 `docs/BACKLOG.md` 第 83 条,随过七个必读时一起看。
   - 这次不再作为新候选,只记现状。

4. 原则 23(`docs/HARNESS.md`)与 `CLAUDE.md` 第二层 D「标准方针」。上次学生拍「两处都留」(问 679 A),本次不再列。

可并:无,理由如下。
- 规则总数没涨,没有新增规则需要对照旧规则。
- 新增反模式 47、48 和原则 24,各自写了与近邻条目分开立的理由,我没有找到「一条被另一条完全盖住」的证据(判断)。
- 卡 14、反模式 48、原则 24、全局 2.11 的关系见栏 3 发现 8,分层有意,不列可并。
- 规则 8、9、13、30、38、40 现在都有引用,不再是零引用候选。

## 栏 5　我拿不准的

1. 发现 1:w19 按 `.claude/agents/librarian.md:27` 已定不进送审命令清单,我无异议。
2. 发现 2:「本窗口目标」句改的时点,`docs/lessons/05-api-wbs.md:8` 没写;学生上次已拍照常改。
3. 发现 8:项目 `CLAUDE.md` 第一层 B 没有"中断后复查"这一条,只靠全局 2.11。要不要补,我拿不准,归学生判。
4. 栏 2:S4 规则零引用清单变空,我没追 8、9、13、30、38、40 是哪份文件新引了它们,也没核引用是真指向这些规则还是撞名。
5. 栏 2:上份栏 6 里 R1-596 第五点,我没重读。
6. `docs/lessons/05-api-cheatsheet.md` 从 342 行压到 20 行,`docs/lessons/05-api-wbs.md` 与 `docs/lessons/05-api-cheatsheet.md:4` 写旧补记删前逐句核过第二个家(问 691 B,R1-607)。我没读 R1-607,没核这句核对是否真做了,也没比对被删的 322 行去了哪里。
7. 我没读 `docs/BRIDGE-05-api-w19.md` 全文,只读到前 10 行。
8. 我没读 `docs/lessons/05-api-full.md` 新增 39 行全文,与其他文档有无矛盾没比。
9. 我没读 DECISIONS-R1 新增 13 条全文,职责 4 说不查旧号。
10. 我没逐条读 48 条反模式、84 条 BACKLOG,只读了反模式 47、48 和 BACKLOG 的 diff 摘要;`docs/HARNESS.md` 第五节「形状相同」判据整段也没读。
11. `docs/PENDING-TUNER-REFACTOR.md` 计入范围,521 行我没读,是否仍有保留价值没判断。
12. 发现 13:BACKLOG 48、59 的关闭方式,我只看 git log 提交信息,没读这两条当前文字。
13. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 栏 5 第 3 条与发现 8（项目 CLAUDE.md 第一层 B 补不补「中断后复查」）：问 695 A，不补；项目宪法开头写明继承全局通用规则，全局 2.11 已有。学生原话「695 选 A」。
- 发现 2（本窗口目标句过期）：开课第 5 件照常改，对照 1036 已落（512b64e）。学生原话「同意 1036」。
- 栏 4 第 1 到 4 条时点早已定（第 1、2 条结课 E11 删，第 3 条随 BACKLOG 83，第 4 条问 679 A 都留），本次不出题。栏 2 写 S7 出去三份，实为两份（上一份 S7 清单里没有 docs/lessons/05-api-cheatsheet.md），40 的总数不错；S4 规则零引用变空的来源没核。报告原文不改，以 DECISIONS-R1 R1-610 第三点为准。
- 本次是重派：第一次派单的报告栏 1 抄错两处，核对脚本第二项不过，撤回重派（问 692 A）；抄错一事登进交付物清单 G74（问 693 A）。学生原话「692 选 A；693 选 A」。

相关文件:
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/COURSE_RULES.md
- docs/HARNESS.md
- docs/CHECKPOINTS.md
- docs/BACKLOG.md
- docs/lessons/05-api-wbs.md
- docs/lessons/05-api-cheatsheet.md
- docs/lessons/anti-patterns.md
- docs/BRIDGE-05-api-w19.md
- docs/LESSON_TEMPLATE.md
- docs/PROJECT_STRUCTURE.md
- CLAUDE.md
- scripts/doc-check.sh