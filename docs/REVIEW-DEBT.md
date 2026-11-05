# REVIEW-DEBT · 审查欠账表

> 用途：一处看全没送审的改动（审查欠账），每条记处置方式与处置状态。来历：BACKLOG 57 反方审，反方 8 到 10（DECISIONS-R1 R1-219、R1-220），问 192A、194A、195B、196A、197A。
> 去留：长期。二十条已全部了结（DECISIONS-R1 R1-261）；以后有没送审的改动，接着往下编号记。
> 编号：欠账 N。1 到 13 是重构时记下的「留给反方」（出处 DECISIONS-G1）；14 到 20 是 BACKLOG 57 这次查出、当时没记的（问 194A）；21 起是之后新记的。新号接着往下编。
> 范围：「未审范围」写起止提交，git log 起^..止 可重查；#n 指 git log --reverse 的行号。
> 怎么还（问 195B）：不逐提交补审，改审现在的文件。
>   第一包：CLAUDE.md、SESSION_START（原 COURSE_TUNER）、HARNESS、REFACTOR-HANDBOOK、PROJECT_STRUCTURE 五份全文，反方已审（DECISIONS-R1 R1-219）。审时没标出欠账在哪几处。
>   第二包：COURSE_RULES、BACKLOG、TEACHING_STYLE、LESSON_TEMPLATE 四份全文；KNOWLEDGE_BASE、anti-patterns、BRIDGE-05-api-w2 只补改过的那几个提交的 diff。反方已审（DECISIONS-R1 R1-231）。
>   不审（问 197A）：已删的 HANDOFF-refactor-w2、REFACTOR-BRIEF，与 PENDING-TUNER-REFACTOR。不审它们当年的内容对不对；只审现文件引它们引得对不对、现在还受不受它们约束（反方 15）。已删文件不再约束谁，搬出去的内容在现文件里，随现状审；PENDING 已封、只查不追加、开课不读，被常驻文件当出处引时，要原文照 SESSION_START M 节补拿流程导。
> 状态：现状已审写出处，只说那份文件现在的样子审过，不等于逐提交复审、欠账已还（反方 14）；指定 diff 已审写提交号与出处，只说那个提交的改动审过，不等于整份文件现在的样子审过（反方 27）；待审写哪一包；不审写依据。
> 了结：历史提交审没审过不追溯，接受这一限制（问 195B）；各行到了现状已审、指定 diff 已审或不审，就算了结。

| 欠账 | 来源 | 未审范围 | 涉及文件（今名） | 怎么还 | 状态 |
|---|---|---|---|---|---|
| 1 | G1 补遗 56 第二点（并 47、50、52、55） | D1 e67e892#178..8a1e501#222；E 段 5ec2991#230 | HANDOFF-refactor-w2（已删）、HARNESS、PENDING | HARNESS 第一包；HANDOFF、PENDING 不审 | HARNESS 现状已审（R1-219）；余不审（问 197A） |
| 2 | G1 补遗 62 第三点 | HARNESS 整份：#280 后 26 个提交，11 个从没送审 | HARNESS | 第一包 | 现状已审（R1-219） |
| 3 | G1 补遗 67 第一点、68 第三点 | 9777efa#296..1840087#304 | HARNESS、COURSE_RULES、CLAUDE.md | 第一包、第二包 | 现状已审（R1-231） |
| 4 | G1 补遗 89 第一点 | ae49d2d#372..fa153e7#383 | SESSION_START、COURSE_RULES | 第一包、第二包 | 现状已审（R1-231） |
| 5 | G1 补遗 96 第一点 | d21d02c#401..5ae39b0#411 | LESSON_TEMPLATE、SESSION_START、PROJECT_STRUCTURE、TEACHING_STYLE | 第一包、第二包 | 现状已审（R1-231） |
| 6 | G1 补遗 117 第三点 | c0ad29e#478..6935950#497 | COURSE_RULES、SESSION_START、anti-patterns、PROJECT_STRUCTURE、HARNESS | 第一包、第二包；anti-patterns 补 e11fa29 diff | 现状已审（R1-231）；anti-patterns 只是指定 diff 已审（e11fa29） |
| 7 | G1 补遗 122 第四点 | 8c0a001#508..0e16c99#511 | KNOWLEDGE_BASE | 补 b0cf33a diff | 指定 diff 已审（b0cf33a，R1-231） |
| 8 | G1 补遗 126 第三点 | 01e85c7#516..669aefd#520 | COURSE_RULES | 第二包 | 现状已审（R1-231） |
| 9 | G1 补遗 129 第四点 | 57f3431#521..b91a413#539 | BACKLOG | 第二包 | 现状已审（R1-231） |
| 10 | G1 补遗 144 问 11、145 11A | 7b0f8ef#586..5c4efd4#588 | REFACTOR-HANDBOOK | 第一包 | 现状已审（R1-219） |
| 11 | G1 补遗 147、148 第一点 | a9f0c2b#592..a77ed8e#599 | HARNESS | 第一包 | 现状已审（R1-219） |
| 12 | G1 补遗 158 第三点 | 推断 a77ed8e#599..4fef137#626；另两项核查：PENDING「已执行」对 git log，docs/lessons 等目录的引用扫描 | BACKLOG、BRIDGE-05-api-w2、COURSE_RULES、HARNESS、REFACTOR-HANDBOOK | 提交已由 G1 补遗 165 审过（子代理，半独立，范围 a77ed8e..020ce3f）；现状随第一、二包，BRIDGE 补 6066aac diff；两项核查 CC 跑，见文末 | 现状已审（R1-231）；BRIDGE-05-api-w2 只是指定 diff 已审（6066aac）；两项核查已跑（CC 自跑，不独立） |
| 13 | G1 补遗 161 问 28A、162 第二点 | b959dfb#661..cb0064c#665 | COURSE_RULES、REFACTOR-BRIEF（已删） | COURSE_RULES 第二包；REFACTOR-BRIEF 不审 | 现状已审（R1-231）；余不审（问 197A） |
| 14 | 本次查出：E4 学生补约定 | b7e38ca#344 | REFACTOR-BRIEF（已删） | 不审 | 不审（问 197A） |
| 15 | 本次查出：G2 审后返修 | d1cf6ef#357..845c70f#359 | SESSION_START、KNOWLEDGE_BASE | 第一包；KNOWLEDGE_BASE 补 4084025 diff | SESSION_START 现状已审（R1-219）；KNOWLEDGE_BASE 指定 diff 已审（4084025，R1-231） |
| 16 | 本次查出：G5 审后 | ba180b9#438..df31d03#445 | COURSE_RULES、BACKLOG、SESSION_START（删 O、M、I、H 节） | 第一包、第二包 | 现状已审（R1-231） |
| 17 | 本次查出：G6 审后 | 611b109#457..cb10fb4#460 | PROJECT_STRUCTURE、BACKLOG、SESSION_START | 第一包、第二包 | 现状已审（R1-231） |
| 18 | 本次查出：G1 补遗 131 第四点 | 无提交：CC 判「与 BACKLOG 6 不冲突」，未送审 | BACKLOG | 第二包 | 现状已审（R1-231） |
| 19 | 本次查出：G1 补遗 148 第二点 | 组末审查没写审到哪个提交，#546 到 598 覆盖不明 | 多份 | 第一包、第二包 | 现状已审（R1-231）；历史覆盖不追溯（问 195B） |
| 20 | 本次查出：第二次组末审查后的尾段 | fa6bcc5#654..d58f1c9#670，不含欠账 13 | HARNESS、BACKLOG、CLAUDE.md、PROJECT_STRUCTURE、PENDING | 第一包、第二包；PENDING 不审 | 现状已审（R1-231）；PENDING 不审（问 197A） |
| 21 | 复课前一轮 BACKLOG 70（DECISIONS-R1 R1-267、R1-268；问 224A） | 61e435d#1274..29c87d9#1285，对照 116 到 127 | COURSE_RULES | 复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 待审（05-API 结课审过一轮，读丢没审成，R1-660；05-类型结课送审包，一个对话只送一两包） |
| 22 | 复课前一轮 BACKLOG 50（DECISIONS-R1 R1-272 到 R1-275；照问 224A） | 8b38942#1298..524f7a4#1305，对照 133 到 140 | COURSE_RULES、LESSON_TEMPLATE | 复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 待审（05-API 结课审过一轮，读丢没审成，R1-660；05-类型结课送审包，一个对话只送一两包） |
| 23 | 复课前一轮：学生对框架的新说法进 HARNESS（DECISIONS-R1 R1-296、R1-297；问 257 乙、258 A） | d1c8cae#1353..fb46b37#1370，对照 159 到 176 | HARNESS | 复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 待审（05-API 结课审过一轮，读丢没审成，R1-660；05-类型结课送审包，一个对话只送一两包） |
| 24 | 复课前一轮：学生补五点进 HARNESS、规则 77 判据四（DECISIONS-R1 R1-298 到 R1-301；问 261 B、262 A、263 A） | f266f15#1377..e9bb8c2#1397，对照 181 到 199 | HARNESS、COURSE_RULES | 复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 待审（05-API 结课审过一轮，读丢没审成，R1-660；05-类型结课送审包，一个对话只送一两包） |
| 25 | 复课前一轮：候选进 HARNESS 第四节，新开原则 18、19，原则 3 补一层，另开问题 16（DECISIONS-R1 R1-295、R1-302、R1-303；问 264 A、265 B） | d02b5fd#1401..ef3a32b#1406，对照 201 到 206 | HARNESS | 判新开、并入，手册第五节点名要送审。复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 指定 diff 已审（d02b5fd..ef3a32b，R1-660） |
| 26 | 复课前一轮：规则 60 结课自检加一项，问本课答到 HARNESS 哪个待答问题（DECISIONS-R1 R1-302、R1-303；问 266 A） | 15c88e7#1409，对照 208 | COURSE_RULES | 复课第一节结课送审时一并送；试行期第一次送审另附的 git diff pre-trial-c -- docs/ 已含这一段 | 指定 diff 已审（15c88e7，R1-660） |
| 27 | 复课前一轮：Memory 的说法照官方记忆页更正，KNOWLEDGE_BASE 第六节一行、HARNESS 第三节其他待答问题 1 的前四行（DECISIONS-R1 R1-330 问 285 A、R1-331、R1-332） | 14b370e#1483..2fc6f08#1484，对照 245、246 | KNOWLEDGE_BASE、HARNESS | 复课第一节结课送审时一并送 | 待审（授权与范围审过，那句已改，等复核，R1-660；05-类型结课送审包。book/lec00.md 三处同一说法未改，送审时一并报） |
| 28 | 05-API 结课送审之后：M 节送审触发与审查包写法、规则 77 与 78 对齐、原则 13 补一层（DECISIONS-R1 R1-657、R1-658；问 714 A、715 B） | 4aeee95#2638..042a208#2643，对照 1091 到 1094、1096；另 d6ca57e、b396cbd、977c57f，对照 1099 到 1101 | SESSION_START、COURSE_RULES、HARNESS、KNOWLEDGE_BASE | 下一节（05-类型）结课送审时一并送 | 待审（05-类型结课送审包） |
| 29 | 写书第 1 章前：client、persona 照 AGENT_SPEC 补齐（DECISIONS-R1 R1-670 问 720 甲、R1-671） | 89ab4f1#2674..349f252#2675，对照 1108、1109；另一处 client.md 痛点分级，对照 1113（DECISIONS-R1 R1-677 记提交号） | .claude/agents/client.md、.claude/agents/persona.md | 下一节（05-类型）结课送审时一并送 | 待审（05-类型结课送审包） |
| 30 | 写书第 4 章时：CLAUDE.md 第二层 A 一句写明第二栏当时状态（DECISIONS-R1 R1-691、R1-692，问 734 A） | e4f38f3#2769，对照 1126 | CLAUDE.md | 下一节（05-类型）结课送审时一并送 | 待审（05-类型结课送审包） |

说明：
- 推断四处：欠账 1 的 E 段与返修已审终点、欠账 3 与 10 的已审终点、欠账 12 的范围（DECISIONS-R1 R1-224）。
- 重叠：欠账 2 是 HARNESS 总账，与 1、3、6、11、12、20 重叠；6、7、8 原文都写「补遗 56 欠账」，概念上属欠账 1。
- 不进本表的两类：「对照全文不落盘」一族（G1 补遗 122 第三点、127 第 20 项、148 第三点第 4 项、153、154）归 BACKLOG 57，见反方 11、12；「判否不送审」是手册第五节定的做法，不算欠账。

欠账 12 两项核查（CC 自跑，2026-10-08，命令可重跑）：

核查一，PENDING「已执行」行里的提交号是否都在 git 里。只核提交号存在，不核提交内容对不对得上。

```
grep '已执行' docs/PENDING-TUNER-REFACTOR.md | grep -oE '\b[0-9a-f]{7}\b' | sort -u | while read h; do git cat-file -e "$h^{commit}" 2>/dev/null || echo "缺 $h"; done
```

结果：含「已执行」的行 23 行，其中提交号去重 43 个，全在，无「缺」。不带提交号的 5 行：23、35、519 行是说明与标题；140 行写「见该条」，278 行指 6.0.2 与补遗 136、137，都是指针。

核查二，已删、改名的文件在常驻文件以外的目录有没有人引。补遗 143、163 已扫过常驻文件、CLAUDE.md、.claude/。

```
git grep -n -E 'COURSE_TUNER|HANDOFF-refactor-w2|BACKLOG-重构窗口交接|REFACTOR-BRIEF|调节器' -- docs/lessons docs/design docs/arch prisma
```

结果：2 处。docs/lessons/04-full.md 第 25 行「调节器 I 节」，是历史课程笔记，不改。docs/lessons/anti-patterns.md 第 300 行「调节器 P 节」，在反模式的「现象」里讲当年的事；anti-patterns 是常驻文件，读的人照名去找会找不到。反方第二包判要补（反方 21），已补今名（对照 58，DECISIONS-R1 R1-235）。
