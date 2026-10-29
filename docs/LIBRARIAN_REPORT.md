**资料体检报告（第十三次体检）**

我先读了 `.claude/agents/librarian.md`,再读了上一份报告 `docs/LIBRARIAN_REPORT.md`(第十二次体检)。`git log --oneline -- docs/LIBRARIAN_REPORT.md` 有输出,最新是 fa7a28b,文件在,所以不是首次体检。任务消息没有要我少查或跳过什么。

## 栏 1　脚本原样输出

下面是 `bash scripts/doc-check.sh` 的输出,没删没改没转述。

```
== 资料体检 2026-10-29 09:26:50  提交 acbab16  未提交改动 0 处
== 范围：60 份文件

== S1、S2 编号清单
  规则（COURSE_RULES）：共 85 条，最大号 87；缺号：42 68 ；重号：无
  其中占位（已废、不存在、留空）：2 3 21 34 
  1-36 块分组小标题漂移：无
  反模式（anti-patterns）：共 46 条，最大号 46；缺号：无；重号：无
  BACKLOG：共 82 条，最大号 82；缺号：无；重号：无
  原则（HARNESS 第四节）：共 22 条，最大号 22；缺号：无；重号：无
  问题（HARNESS 第三节）：共 16 条，最大号 16；缺号：无；重号：无
  决策边界 D（CLAUDE.md）：共 8 条，最大号 8；缺号：无；重号：无
  规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）：共 12 条，最大号 20；缺号：无；重号：无
  DECISIONS-R1 条目：共 582 条，最大号 582；缺号：无；重号：无
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
  反模式 1-13 ← docs/COURSE_RULES.md:435（常驻）
  BACKLOG：无
  原则：无
  问题：无
  R1：无
  补遗 132-170 ← docs/PENDING-TUNER-REFACTOR.md:169（历史）

== S4 常驻文件里从没被引用过的号
  规则（删并候选，不含占位，删不删学生判）：8(历史0 产品0) 9(历史0 产品0) 13(历史0 产品0) 26(历史0 产品0) 30(历史0 产品0) 38(历史4 产品0) 40(历史1 产品0) 
  反模式（参考，不是删并信号）：2(历史0 产品0) 6(历史0 产品0) 8(历史0 产品0) 9(历史0 产品0) 10(历史0 产品0) 11(历史0 产品0) 13(历史0 产品0) 20(历史0 产品0) 26(历史0 产品0) 28(历史0 产品0) 40(历史5 产品0) 
  BACKLOG（参考，不是删并信号）：1(历史0 产品0) 2(历史0 产品0) 3(历史0 产品0) 9(历史1 产品0) 10(历史0 产品0) 11(历史0 产品0) 12(历史0 产品0) 13(历史0 产品0) 14(历史0 产品0) 15(历史4 产品0) 16(历史1 产品0) 17(历史2 产品0) 18(历史0 产品0) 19(历史0 产品0) 20(历史1 产品0) 22(历史0 产品1) 23(历史1 产品1) 24(历史0 产品1) 25(历史0 产品1) 26(历史0 产品0) 28(历史0 产品0) 29(历史0 产品0) 30(历史1 产品0) 32(历史2 产品0) 34(历史3 产品0) 35(历史3 产品1) 36(历史2 产品0) 37(历史2 产品0) 38(历史0 产品0) 39(历史2 产品0) 40(历史0 产品0) 41(历史0 产品0) 42(历史0 产品0) 44(历史0 产品0) 47(历史0 产品0) 51(历史0 产品0) 52(历史0 产品0) 53(历史0 产品0) 54(历史0 产品0) 55(历史0 产品0) 56(历史0 产品0) 62(历史0 产品0) 64(历史0 产品0) 65(历史0 产品0) 66(历史0 产品0) 67(历史0 产品0) 75(历史0 产品0) 76(历史0 产品0) 77(历史0 产品2) 78(历史0 产品0) 80(历史0 产品2) 81(历史2 产品1) 82(历史2 产品1) 
  原则（参考，不是删并信号）：无

== S5 各文件行数
    9865 total
     794 docs/arch/API_CONTRACT.md
     774 docs/lessons/05-api-full.md
     644 docs/COURSE_RULES.md
     639 docs/arch/ARCHITECTURE.md
     521 docs/PENDING-TUNER-REFACTOR.md
     433 docs/KNOWLEDGE_BASE.md
     402 docs/HARNESS.md
     361 docs/design/PRD.md
     331 docs/lessons/anti-patterns.md
     322 docs/lessons/05-api-cheatsheet.md
     230 docs/design/UI_DESIGN.md
     229 docs/BRIDGE-05-api-w6.md
     219 docs/lessons/05-arch-full.md
     190 docs/BRIDGE-05-api-w8.md
     175 CLAUDE.md
     159 docs/SESSION_START.md
     159 docs/PROJECT_STRUCTURE.md
     157 docs/lessons/05-api-wbs.md
     157 docs/BRIDGE-05-api-w7.md
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
      94 docs/BACKLOG.md
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
  起点：上次报告提交 fa7a28b
  A	docs/BRIDGE-05-api-w17.md

== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）
  共 60 份，缺 40 份
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

**范围变了(先说这个)。** 脚本范围由 71 份变 60 份。`scripts/doc-check.sh:3` 与 `:10` 现在排除 `docs/web_course*` 和 `docs/vide_coding.md`(问 321 A)。外来样本是 12 份,少的 11 份里有这些,w17 是新增,所以净减 11。

**规则总数:**
- 脚本数 85 条,上次 85 条,没涨。最大号 87、缺号 42 68、占位 2 3 21 34 都没变。
- `docs/COURSE_RULES.md` 643 变 644 行(`git diff fa7a28b HEAD --stat` 里 9 行改动,净加 1)。条数没涨,所以不存在「涨了要对应删并」的问题。

**其他清单变化:**
- DECISIONS-R1 576 变 582,新增 6 条。它是历史记录,不查旧号。
- 反模式 46、BACKLOG 82、原则 22、问题 16、D 条 8、规则 57 自检项 12、补遗 170 都没变。
- S3 指空引用由几十行降到 2 行:只剩规则 42 ← `docs/LESSON_TEMPLATE.md:23`(常驻)和 `docs/PENDING-TUNER-REFACTOR.md:196`(历史)。降的原因是外来样本被排除,不是文件里的引用被改了。
- S4 规则零引用由 `8 9 13` 变 `8 9 13 26 30 38 40`。**判断:** 新增的 26、30、38、40 多半是范围缩小的副作用,原来被外来样本里的「规则 N」撞名顶着。我没逐号验证。
- S7 缺「去留:」67 份变 40 份,缺口减 27 份。多出「去留:」的有 `CLAUDE.md`、`docs/COURSE_RULES.md`、`docs/HARNESS.md`、`docs/BACKLOG.md`、`.claude/agents/librarian.md` 等(librarian.md 的 diff 里加了 `> 去留:长期。`),还有被排除的外来样本。w17 新增、没有「去留:」。

**各文件行数:**
- 文件数不同,total 不可比(9865 对 53433)。
- `docs/BRIDGE-05-api-w17.md` 新增 141 行。
- `docs/lessons/05-api-full.md` 727 变 774,加 47。
- `docs/lessons/05-api-cheatsheet.md` 301 变 322,加 21。
- `CLAUDE.md` 172 变 175,加 3。
- `docs/TEACHING_STYLE.md` 73 变 75,加 2。
- 各加 1 行:`docs/arch/API_CONTRACT.md` 793 变 794、`docs/arch/ARCHITECTURE.md` 638 变 639、`docs/KNOWLEDGE_BASE.md` 432 变 433、`docs/HARNESS.md` 401 变 402、`docs/design/PRD.md` 360 变 361、`docs/design/UI_DESIGN.md` 229 变 230、`docs/SESSION_START.md` 158 变 159、`docs/PROJECT_STRUCTURE.md` 158 变 159、`docs/BACKLOG.md` 93 变 94、`docs/arch/DECISIONS.md` 86 变 87、`docs/arch/TECH_STACK.md` 64 变 65、`.claude/agents/librarian.md` 50 变 51。
- `docs/lessons/05-api-wbs.md` 行数不变(157),但 `--stat` 里有 40 行改动,是状态格更新。
- 自 fa7a28b 起共 30 个提交(`git log fa7a28b..HEAD | wc -l`)。

**上一份「学生选择」的复查:**
- 上一份(fa7a28b 存档)栏 6 写着「空着,由 CC 照学生原话填」。
- 自 fa7a28b 起,`git log` 里没有「体检报告栏 6 照学生原话填」的提交,所以没有可逐条复查的新选择。
- 上一份栏 5 没有留下需要复查的编号选择。
- 上次发现 2(`docs/lessons/05-api-wbs.md:8` 目标句过期):**没落,又转了一圈。** 第 8 行现在是「第十六窗口,桥梁 w16 第 5 节」,而 w17 已建(见栏 3 发现 2)。
- 更早遗留,我只核文件现状:
  - 问 321(把外来样本排出体检范围):**已落**(`scripts/doc-check.sh:3`、`:10`)。
  - 问 323(缺「去留:」的文件顺手补):部分落。缺口 67 变 40,见 S7。
  - 规则 57 第 12 项三处不对齐(G49):没落。`docs/lessons/05-api-wbs.md` 里 G49 仍在待做,时点是结课 E9。
  - 旧桥梁整节课结课时删:没落,时点未到。w6 到 w16 十一份存档加 w17 一份现行。
  - 问 333(改管理员定义文件还是改核对脚本):没落,时点未到。

## 栏 3　发现

1. **S6 新增 `docs/BRIDGE-05-api-w17.md`(141 行)。** 要不要进 SESSION_START M 节送审命令清单,学生判。`.claude/agents/librarian.md:27` 写 docs/BRIDGE-*.md 是一次性桥梁,已定不进(问 567 A),只列不问。

2. **「本窗口目标」句再次对不上。**
   - `docs/lessons/05-api-wbs.md:8` 写「第十六窗口,桥梁 w16 第 5 节」。
   - `docs/BRIDGE-05-api-w17.md:1`、`:6` 已是第十七窗口,且写「以本文件为准」。
   - 判断:开课时才改是常态,不是错。改不改、何时改,学生判。

3. **桥梁数字对得上。**
   - `docs/BRIDGE-05-api-w17.md:6` 写「docs/ 下现有十二份 05-API 桥梁:w6 到 w16 只作存档」。
   - `ls docs/` 里 BRIDGE 共 12 份(w6 到 w17)。
   - 十一份存档合计 229+157+190+129+133+137+138+140+143+140+140=1676 行。

4. **S7 缺「去留:」的 40 份分类。**
   - 12 份 BRIDGE:w6 到 w17。BRIDGE 一次性,按职责 1 只列。
   - 5 份 `.claude/agents/`:architect、client、designer、persona、pm。
   - 其余是 `docs/lessons/` 下各课 full/cheatsheet 和 `docs/AGENT_SPEC.md`、`docs/LESSON_TEMPLATE.md`、`docs/PENDING-TUNER-REFACTOR.md`、`docs/PROJECT_STRUCTURE.md`、`docs/REFACTOR-HANDBOOK.md`、`docs/design/USER_RESEARCH.md`。

5. **S4 新零引用规则 26、30、38、40 的原文。** 判断都标判断,删不删学生判。
   - 规则 26(`docs/COURSE_RULES.md:64`):「CC 汇报时要逐条对着审查清单说,不许『全部完成』一句带过。」
     - 与 `CLAUDE.md` 第一层 B 第 6 条(汇报要逐条,对着审查清单一条条说,不许一句「全部完成」带过)意思相同。
     - 与全局 2.6 也同意思。
     - 判断:规则 26 被项目宪法和全局宪法完全盖住(可删候选)。我没验证规则 26 在 COURSE_RULES 里是否承担「课程规则」独有的角色。
   - 规则 30(`docs/COURSE_RULES.md:73`):「CC 弹权限请求一律人工看一眼再批。不要图省事全同意。」
     - 我没找到被其他条完全盖住的出处,留。
   - 规则 38、40:S4 显示历史引用 4 和 1、产品 0。这次我没读原文,见栏 5。
   - 规则 8(`docs/COURSE_RULES.md:34`「每步要讲『为什么这么做』」)、规则 9(`:35`「每步要讲『具体怎么做』」)、规则 13(`:42`「每节课开头要有『我们在哪』的地图」)与上次相同,零引用。上次学生拍的是留,我这次没有新理由推翻。
   - 规则 8 与 9 同主题(每步怎么讲)。判断:是并列的两层,不是互相盖住。

6. **规则 42 仍是指空引用。**
   - `docs/LESSON_TEMPLATE.md:23` 第 4 条写「(已废。原『模式归属』块按乙写,抄规则 42……规则 42 已废」。
   - 这是对已废规则的历史说明,不是误引。
   - 规则 42 在 COURSE_RULES 里缺号(S1)。

7. **BACKLOG 的 S4 零引用列表大幅变长**(上次约 35 条,这次约 53 条),原因同发现 5 的范围缩小。这个列表是参考,不是删并信号。BACKLOG 77、80 产品引用各 2,81、82 有引用,不在零引用之列。

8. **反模式零引用**由「无」变为 11 条:2、6、8、9、10、11、13、20、26、28、40。同样是范围缩小的副作用,参考列,不是删并信号。

9. **密码规则的 D20 与 D9 并存**(上次发现 5 的延续,无变化)。
   - `docs/design/PRD.md` 里 D20 取代 D9,原文不改。
   - `CLAUDE.md` 第二层 B 已写 D20。
   - 学生已拍板,我只记录。

10. **`docs/HARNESS.md` 头部计数。** 行数 401 变 402,条数 22 没变。我没重读头部计数行,只看到 S1 数 22 条,[假设:头部计数行与上次相同]。

## 栏 4　可删/可并

候选清单:

1. `docs/BRIDGE-05-api-w6.md` 到 `w16.md`,共十一份,1676 行。
   - 可删的理由:`docs/PROJECT_STRUCTURE.md` 目录树写「已用完,只作存档,整节课结课时删」,w17 已接棒(`docs/BRIDGE-05-api-w17.md:6`)。
   - 该留的理由:05-API 还没结课,存档用途未到期。
   - 删除时点按文件自己写的结课,不是现在。删除走学生亲跑与 CONFIRM,不归我。

2. `docs/lessons/05-api-wbs.md:8` 的「本窗口目标」句(第十六窗口)。
   - 判断:w17 开课后会过期,现在算不上错。
   - 该留的理由:W6 要求收尾时对着目标说达没达到,第十六窗口的收尾记录还可能被引用。
   - 改不改、何时改,学生判。

3. `docs/lessons/05-api-wbs.md` 整份(157 行)。
   - 它自己写的去留是「整节课结课时删」(`docs/lessons/05-api-wbs.md:3`)。现在不到时点,列出只是登记。

4. **规则 26(`docs/COURSE_RULES.md:64`)是新增候选,判断:可删。**
   - 理由:被 `CLAUDE.md` 第一层 B 第 6 条完全盖住。
   - 该留的理由:COURSE_RULES 是课程规则书,可能有独立的出处链。其他文档可能按「规则 26」点名。S4 显示常驻 0、历史 0、产品 0,没有点名。
   - 删不删学生判。

可并:无。理由:
- 规则总数没涨,没有新增规则需要对照旧规则。
- 规则 8 与 9 同主题但是并列两层,没有看出一条被另一条完全盖住(判断)。
- 规则 8、9、13 的零引用,本次没有新理由推翻上次学生的「留」。

## 栏 5　我拿不准的

1. 发现 1:w17 按 `.claude/agents/librarian.md:27` 已定不进送审命令清单,我无异议。
2. 发现 2、栏 4 第 2 条:「本窗口目标」句是 w17 开课时改,还是现在改,规则 W6 没写时点,我标不准。
3. 发现 5:规则 38(历史引用 4)、规则 40(历史引用 1)我没读原文,所以不知道它们该不该留。
4. 发现 5:我没验证规则 26、30 的零引用是真零,还是 S4 在统计时被范围变化改了口径。
5. 发现 7、8:范围缩小导致 S4 零引用大增,我没逐条验证哪些是撞名顶着的虚引用。
6. 规则 57 第 12 项三处不对齐(G49)的现状:我只核了 `docs/lessons/05-api-wbs.md` 的状态,没重读 `docs/COURSE_RULES.md` 里相关行。
7. 我没读 `docs/BRIDGE-05-api-w17.md` 全文,只引了 :1、:6。
8. 我没读 `docs/lessons/05-api-full.md` 新增 47 行、`docs/lessons/05-api-cheatsheet.md` 新增 21 行、`CLAUDE.md` 新增 3 行、`docs/TEACHING_STYLE.md` 新增 2 行的全文,与其他文档有无矛盾没比。
9. 我没读 DECISIONS-R1 新增 6 条全文,职责 4 说不查旧号。
10. 我没逐条读 46 条反模式、82 条 BACKLOG,也没读 `docs/HARNESS.md` 第五节套「形状相同」判据。
11. `docs/PENDING-TUNER-REFACTOR.md` 计入范围,但 521 行我没读,它内含对规则 42、补遗 132-170 的历史引用,是否仍有保留价值我没判断。
12. 任务消息没有要我少查或跳过什么。

## 栏 6　学生选择

- 发现 2 与栏 4 第 2 条（本窗口目标句过期）：开课第 5 件照常改，对照 922 已落（d5efa83）。学生原话「同意 922」。
- 发现 5 与栏 4 第 4 条（S4 新零引用的规则 26、30、38、40）：问 663 A，四条都留；规则 26 与项目宪法第一层 B 第 6 条重复，和规则 29、36 同类，随交付物清单 E9 逐条过七个必读时一起看。学生原话「663 选 A」。
- 栏 2 写 G49「没落」：实际已完（对照 871、872，ab578a2）。报告原文不改，以 DECISIONS-R1 R1-583 第五点为准。

相关文件:
- .claude/agents/librarian.md
- docs/LIBRARIAN_REPORT.md
- docs/PROJECT_STRUCTURE.md
- docs/COURSE_RULES.md
- docs/lessons/05-api-wbs.md
- docs/BRIDGE-05-api-w17.md
- docs/LESSON_TEMPLATE.md
- docs/design/PRD.md
- docs/HARNESS.md
- CLAUDE.md
- scripts/doc-check.sh