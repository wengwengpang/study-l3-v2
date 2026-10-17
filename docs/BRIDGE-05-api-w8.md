# 桥梁 prompt · 05-API 续窗口（API 契约 · 第八窗口）

## 第 0 节 · 先读这段

本窗口是补课 05-API 的第八个窗口，同一节课。第七窗口先解决「开课读得多、中途漂移」：试点时刻检查单 docs/CHECKPOINTS.md 与决策记录目录 scripts/decision-index.sh；契约第一节正文没开工，第二节接口清单没开。
docs/ 下现有七份 05-API 桥梁：w2 到 w7 与本文件。以本文件为准。w2 到 w5 在本窗口第一件里删（问 473 A、495 A，清单 W4）；w6、w7 只作存档，整节课结课时删。

下个窗口用什么（问 509 A，R1-493）：主对话 Opus 5.5，/effort xhigh。学生上个会话已用 /model 把 xhigh 存成默认，开课时看一眼状态栏，不是 xhigh 再敲 /effort xhigh。权限模式是 manual（第七窗口学生曾切 auto 少弹窗，已切回，R1-495）；系统若提示变成 auto，照实报学生。

本节的进度、全部交付件、推到结课的事，一律看 docs/lessons/05-api-wbs.md（规则 87），本桥梁不另抄状态表。报「做到哪、还剩多少」之前，先跑它开头的覆盖核对命令，没有输出才开口。

本窗口起，每到一个时刻先读 docs/CHECKPOINTS.md 对应那一张卡，每条消息末尾照第 12 张卡写发前自查（试点第二个窗口，问 501 A、503 A、510 A）。第八窗口收尾回顾时定检查单留不留（D4）、钩子要不要提前（G41）、防重与跟随更新怎么做（G43）。

开课照 SESSION_START J 节做（检查单卡 1）：
- 重读必读文件照做（规则 55）。
- 体检闸门（J 节第 2 件的一到四步）要不要重做，本窗口没问过。前五次同课换窗口都选了不重做（问 358 A、394 A、413 A、453 A、498 A）。开课时先向学生确认一句，再照答复办。
- 第 5 件出大纲：照规则 87 从交付物清单导出；把清单文件头那句本窗口目标换成第八窗口的（W6）。
- 开课先用选择题带学生重温第七窗口，题目里写明「这是检验题，没有推荐项，请回字母」（检查单卡 4 第 7 条）。
- 开课提交号仍是 123325d，换窗口不变（SESSION_START M 节）。

逻辑顺序 vs 实际执行顺序（分不清就重蹈反模式 34）：
- 逻辑顺序：Lec 05 schema → 05-ARCH → 05-API → 05-类型 → 05-环境 → Lec 06 → Lec 07
- 实际执行：Lec 05 → Lec 06（已完成）→ 05-ARCH 四窗口（已完成）→ 05-API 第一到第七窗口（已完成）
            → 本窗口 05-API 第八窗口 → 05-类型 → 05-环境 → Lec 07

学生已掌握决策边界 D1-D8、settings.json 权限系统、可逆性×影响判据。别当他没上过 Lec 6。

## 第 1 节 · 这份桥梁是什么

05-API 第七窗口收尾产出，给同一节课的第八窗口用。
开课要拿哪些文件、怎么拿，照 SESSION_START A 节。冲突时听谁的，见规则 67。
开课必读七文件的权威清单在 docs/PROJECT_STRUCTURE.md 的「课程标准文件清单」小节。
整节课结课后删除本文件。

变更提醒：第二到六窗口新定的二十二条在桥梁 w7 第 1 节。其中已进检查单的，照检查单做，本桥梁不再抄（HARNESS 原则 1 补一层，第七窗口定）：行业标准、派单先查 STANDARDS、D8 推荐、拆法、验证拦提交、改 docs 先报弹窗、发前自查、推荐前搜旧裁决、交付物清单、说推就登、新做法三问、书随窗口写、窗口回顾、wc -l 数预期、一字不差。还没进检查单的，照下面做：
- 读文件按需，不卡 5 个；读前先报读哪几份、为什么，超过五份写一句理由（R1-390）。
- 每块原理先给加粗的一句话结论，细节可跳（R1-394）。
- 要学生切换主对话模型或 effort 时，「🔴」加粗写明切到哪、敲什么；子代理按定义文件的模型跑，写一句「不用你切」。
- 消息照教科书写法（问 378 A）：讲解连成段，先比方后术语；编号只留学生拍板要对得上的；选择题放在消息末尾。
- 判传播面看整行，不看截断的输出；长期文档里不写死会长的数。
- 引用 PRD 的审定决策写「PRD 审定决策 Dn」，引用宪法第三层 A 写「决策边界 Dn」（问 406 A）。
- 省 token 但不能影响项目（问 431 A）：对照原文、计数、出处、闸门一样不省。
第七窗口新加：提新办法前先在本项目里搜已有的做法（检查单卡 10 第 1 条，HARNESS 原则 1）；查决策记录的来历先跑 bash scripts/decision-index.sh R1 关键词（问 502 A）。

## 第 2 节 · 学生背景

Michael：节奏快、批判性极强、文字太密看不懂。讲课详细直白、比方先行、分块、少图标、少堆编号代号。核心讲解走 3a-3d 骨架（规则 62）。规则 44：不让学生写长答案，每段讲完出一道选择题。

第七窗口里值得记的：
- 学生连着追问，引出本窗口全部产物：读得太多会漂、要分层或关系图（问 501）；办法是不是项目本来就有（R1-488）；是不是没法根治（R1-489）；要目录式记录（问 502）；检查单要不要防重跟随更新（问 512）；知识点进教科书附录、不和正文混（问 513）。
- 学生认了根治方向：能删的删，剩下的到点再读，读也不保险的交给命令或钩子，关键处由学生把关（R1-490）。
- 学生觉得 xhigh 比 high 好；收尾为少弹窗切过 auto，已切回 manual。
- 重温题没设推荐项时，学生回「按你推荐」（R1-492）；以后检验题写明请回字母。
- 学生要求每次收尾「保证能安全 exit」：工作区干净、没有只在对话里的东西、本机与远端一致。

## 第 3 节 · 项目当前状态

项目名：study-l3-v2，位于 ~/projects/study-l3-v2/（WSL2 Ubuntu，VS Code 连 WSL）。
一句话：团队任务协作工具，负责人 + 执行者两类用户。
阶段：Phase 0 立项。需求、UI、选型、数据建模、宪法、系统架构已完成；API 契约进行中。

API 契约（docs/arch/API_CONTRACT.md）四节的状态，以交付物清单第一节为准：第零节已完；第一节正文六处「待第 3 组定」都已有裁决，待起草，第 9 小节还没写进文件；第二节没开；第三节汇总到 API-55，随拍随登。

第七窗口新定（正本见所注文件）：
- 课程工具：docs/CHECKPOINTS.md 十三张卡（试点延长一窗，问 510 A）；scripts/decision-index.sh；发前自查已从自动记忆搬进检查单第 12 张卡。
- 框架：HARNESS 原则 1 补一层（新立之前先在本项目里搜）、原则 17 补一层（到点读卡、交给机器、关键处人把关）。
- 手册：docs/REFACTOR-HANDBOOK.md 第五节、第七节各加两条；学生已亲手复制到 ~/.claude/templates/。
- 清单：本窗口目标、D4 到 D6、G41 到 G44，G30 补一例；D1、W4、G39 改到第八窗口。
- 书：book/lec05-api-2.md 草稿加第三块（第七窗口新知识）；权限模式写进附录 A「设置与权限」，第八窗口写（D6）。

更早已定的关键结论（详见 ARCHITECTURE.md 与 TECH_STACK.md）：
- 鉴权走存在 PostgreSQL 里的 session，不是 JWT。会话固定 30 天，不续期，纯读不写 sessions（T4）。
- 服务端校验用项目自写的 Zod 管道（T1）。路径参数不经过管道（T3）。
- 两级权限界线（T6）：只凭会话凭据、路径项目 id、project_memberships 能判的归 Guard；要读请求体或业务记录才能判的归 Service。
- 全局异常过滤器是出错的唯一出口（API-23）。命名三层：DB 列 snake_case，Prisma、TS、API 全 camelCase（API-22）。

## 第 4 节 · 上一窗口做了什么

第七窗口一个会话（R1-487 到 R1-496，问 498 到 514，对照 519 到 555 共 37 份）。开课照 J 节，闸门照问 498 A 不重走，推了上个窗口留下的 24 条。没有派子代理。

落盘（每处一对照一提交，数对才提交）：新建 docs/CHECKPOINTS.md（分两段）、scripts/decision-index.sh（对照 520，学生说了「帮我改」）；docs/HARNESS.md 原则 1、17（规则 78，学生说了「帮我改」并读过）；docs/REFACTOR-HANDBOOK.md；docs/lessons/05-api-wbs.md；两份笔记补记；book/lec05-api-2.md；目录树；DECISIONS-R1；自动记忆发前自查改成指针。

新规则：无。新反模式：无，候选在清单第五节（G30 补一例）。号段见各自文件头。

学到的能力（大白话）：开头读一遍规则撑不住长会话，要按时刻分卡、到点再读；提新办法前先在自己项目里搜；每一层防护都有洞，能交给命令和钩子的不靠记性；记录的目录从正文现场生成，不另写。

## 第 5 节 · 本窗口要做什么

目标：先清第一件，再派 architect 起草契约第一节正文，分段带学生读完、落盘。用量允许再开第二节接口清单的核对轮。
学完后会做什么：能派一个查不了网页的角色做技术选型并备齐原文；能照 100% 规则清点一批要删的文件；能照检查单到点读卡。

第一件，按序：
1. 用选择题重温第七窗口（写明是检验题）。
2. 邮箱不分大小写的唯一约束（清单 D1，API-55，决策边界 D2）：派 architect，派单原文在下面，第七窗口已给学生看过但没发。派前照检查单卡 2 重核：派单里点名的七份文件这期间改过没有，引的原文还对不对；有变就先改派单再给学生看，学生说「发」才派。回来照卡 3 取全文、核对，再出 schema 与 ADR 对照。
3. 删减清单（清单 W4）：第一批是桥梁 w2 到 w5 与 book/notes/sample4-05api.md。照检查单卡 8 逐份做；学生回 CONFIRM 后亲手跑删除命令；目录树跟着改。
4. 示例邮箱改 example.com 写法（清单 G39）：PRD 澄清注记 14、book/lec05-api-2.md。
5. 教科书附录 A「设置与权限」一项（清单 D6，问 513 A、514 A）：对官方权限模式页核原文，照 book/OUTLINE.md 附录 A 的写法。

然后派 architect 起草第一节正文：先给学生看派单。派单要带上核对报告第二问（每条裁决进哪个小节）、第三问（现有 14 句怎么改）、第四问（落点三行追加「已落」），以及问 480 到 485 的写法（DECISIONS-R1 R1-472、R1-473）。正文分段读，读完再落盘；过一百行拆提交。

收尾回顾时要定：检查单留不留（D4）、钩子要不要提前（G41）、检查单的防重与跟随更新（G43）。

邮箱约束派单原文（第七窗口写，R1-492；建议模型 opus，定义文件定，不用学生切）：

```
请先读你的定义文件 .claude/agents/architect.md，确认身份、职责、边界，再开始。

本轮只做一件事：给 users 表的邮箱定「不分大小写的唯一约束」的写法，出选项与推荐，供项目主人拍板。只读，不改任何文件，不写代码。

背景（已定，不重议）：
- API-55（docs/arch/API_CONTRACT.md「本节裁决汇总」里 API-55 一条）：存用户输入的原样（去掉首尾空白后）；注册查重、登录、按邮箱邀请成员时，整个地址不分大小写比较；数据库要有不分大小写的唯一约束，写法属决策边界 D2，先回你定。
- 现在 prisma/schema.prisma 的 User 模型是 email String @unique，区分大小写。
- 先例：docs/arch/DECISIONS.md 的 ADR-DB-006，部分唯一索引的写法随 BACKLOG 74 锁 Prisma 版本时定，锁的版本支持就写进 schema，否则迁移里手写 SQL（问 441 C）。Prisma 版本至今没锁（docs/BACKLOG.md 第 74 条）。
- API-28：撞上唯一约束，由该表的 Repository 翻成「冲突」，回 409。

本轮必须重新读下列文件，只读这些。超过五份，是因为这条约束同时牵涉 schema、决策记录、契约、标准、需求与待办：
1. .claude/agents/architect.md
2. prisma/schema.prisma
3. docs/arch/DECISIONS.md（ADR-DB-001 到 007，重点 004、006）
4. docs/arch/API_CONTRACT.md（只看「本节裁决汇总」里 API-28、API-32、API-55）
5. docs/arch/STANDARDS.md（先查它：列出本轮适用的标准，给出处，标档次）
6. docs/design/PRD.md（US-A01、US-A02、US-P02，与「澄清注记（补课 05-API 补）」第 14 条）
7. docs/BACKLOG.md（第 74 条）

你读不了网页。下面是主对话 2026-10-17 用 WebFetch 取回的官方原文，只当材料用；你要用的说法这里没有，就写「未核」，不凭印象补：
- PostgreSQL 18 citext 一页：「The citext module provides a case-insensitive character string type, citext.」「Consider using nondeterministic collations (see Section 23.2.2.4) instead of this module.」「citext's case-folding behavior depends on the LC_CTYPE setting of your database.」「citext is not as efficient as text」「However, citext is slightly more efficient than using lower to get case-insensitive matching.」「This module is considered "trusted", that is, it can be installed by non-superusers」。
- PostgreSQL 18 表达式索引一页：「a common way to do case-insensitive comparisons is to use the lower function」；在 lower(col1) 上建索引，若声明 UNIQUE，「it would prevent creation of rows whose col1 values differ only in case」；「Index expressions are relatively expensive to maintain」。
- PostgreSQL 18 排序规则一页（nondeterministic）：「Nondeterministic comparison may determine strings to be equal even if they consist of different bytes.」；例子「CREATE COLLATION case_insensitive (provider = icu, locale = 'und-u-ks-level2', deterministic = false);」；「Foremost, their use leads to a performance penalty.」「certain operations are not possible with nondeterministic collations, such as some pattern matching operations.」
- Prisma（文档为 Prisma ORM 7）schema 参考：String 的 PostgreSQL 原生类型有 citext 一行，属性 @db.Citext，注「Only available if Citext extension is enabled」；datasource 块有 extensions 字段，「PostgreSQL extensions to enable.」（这个字段在 Prisma 7 是否仍是预览功能，未核）。
- Prisma「不支持的数据库功能」一页：「To add an unsupported feature to your database, you must customize a migration」，用 --create-only 生成迁移、改 migration.sql 再应用；手改之后 Prisma Migrate 会不会把它当漂移，页面没写（未核）。
- Prisma「大小写」一页：PostgreSQL 默认区分大小写，「use the mode: 'insensitive' property on a per-field basis」；「citext columns are always case-insensitive and are not affected by mode」；性能上建议「Create an expression index for Prisma Client queries that use equals or not」。mode: 'insensitive' 用在 equals 上生成什么 SQL，页面没写（未核）。

请回答：
1. 候选写法至少列三种（citext 列、lower(email) 上的唯一表达式索引、不区分大小写的排序规则），每种写清：schema 里写得出还是写不出、迁移里要不要手写 SQL、注册查重与登录时 Prisma 查询怎么写、对「存原样」有没有影响、和 BACKLOG 74 锁版本的关系、代价。用四象限放一放。
2. 推荐哪种，一句理由；标明哪些是你核过的、哪些是假设（标「待确认（假设）」）。
3. 推荐那种的 schema 改法写成新旧对照（只写 User 模型里要变的行）；迁移要手写的 SQL 写出草稿，标「草稿，写代码时按锁定版本实测」。
4. ADR 怎么记：新开一条还是给现有某条加修订行；给 ADR-Lite 三行草稿（背景 / 决策 / 后果，后果写放弃了什么）。
5. 「去掉首尾空白」该在哪一层做（schema 校验、Service、数据库），只指出它和本约束的关系，不重议 API-55。
6. 有没有挡路的事：和 ADR-DB-004、ADR-DB-006、API-28 或别的已定条目打架的，先指出再继续。

规矩：
- 发现冲突先指出再继续；遇到含取舍的细节先指出，不要默默选（反模式 33）。
- 引用文件给「文件路径:行号」。
- 只出这一份报告，不起草别的。答完这六问就停。
```

离结课的估计（[假设]）：第八窗口清第一件并起草、读第一节；第九窗口做第二节接口清单；第十窗口整节课结课；之后另开会话统稿书章。
整节课结课要做的，见交付物清单第四节 E1 到 E12 与第五节 G1 到 G44，本桥梁不再抄（规则 87）。

