# 补课 05-API　接口契约（下）

> 草稿。每个窗口收尾，把那个窗口定下的接口知识写进来；课程做法类的问题写进附录 H（book/appendix-h.md）。整节课结课时照 book/OUTLINE.md 统稿成十节，项目主人读过认了才算定稿（问 491 A、515 A）。
> 现在收两块：第六窗口拍板的接口知识，第七窗口的邮箱约束三种写法。
> 统稿时，两块都按契约的小节编进第三、五节。

---

## 第一块　第六窗口拍板的接口知识

这一块收这个窗口定下的接口口径，每条写清「定了什么」和「为什么」。编号是契约「本节裁决汇总」里的编号，原文以契约为准。

### 1. 列表不分页，但要知道门槛在哪（API-40）

分页，就是数据太多时一次只给一页。主参考 Zalando 第 159 条是「必须」级，但它有个门槛：「This holds true for all lists that are (potentially) larger than just a few hundred entries.」。只管可能超过几百条的列表。

我们的规模是一个假设：每个项目几百条任务以内。这正卡在门槛上，而且没有真人验证过。所以我们本版不分页，同时登记进 BACKLOG：假设被推翻，就照第 159、160 条加「游标分页」。第 160 条说要避免按页码（offset）分页。

这里要学的是：**标准里的「必须」，常带着适用门槛。用之前，先看门槛。**

### 2. 时间怎么写（API-41）

接口里的时间分两种。一种是「某一刻」，比如创建时间；一种是「某一天」，比如截止日期。

「某一刻」一律用世界标准时间，写成 `2019-07-30T06:43:40.252Z` 这样。Zalando 第 169 条原话：「APIs MUST use the upper-case T as a separator between date and time」，结尾用大写 Z。Z 就表示世界标准时间。JavaScript 自带的写法正好一样，MDN 原话：「The timezone is always UTC, as denoted by the suffix Z.」。

「某一天」写成 `2019-07-30`，不带时刻，不带时区。

### 3. 换成 Cookie 以后，缓存要自己管（API-44）

这是本窗口的跨场景题，你答对了。

在旧项目里，令牌放在 `Authorization` 请求头里。RFC 9111 第 3.5 节对这种请求有一条默认保护：共享缓存不能拿缓存的回应去应付别人。可我们的会话放在 Cookie 里，RFC 9111 第 7.3 节特意说：「Note that the Set-Cookie response header field does not inhibit caching;」。Cookie 没有这条默认保护。

所以我们规定：所有接口的响应都带 `Cache-Control: no-store`，叫缓存一律别存。OWASP 会话管理速查表也这么要求。同时要知道，RFC 9111 提醒过它「not a reliable or sufficient mechanism for ensuring privacy」，它是多一层保护，不是唯一一层。

这里要学的是：**换一种技术方案，原来白送的保护可能就没了，要重新核一遍。**

### 4. 谁先拦、拦下来回什么（API-46、API-47）

一个请求进了后端，要过好几道关。NestJS 官方的请求生命周期是：中间件、守卫（Guard）、拦截器、管道（Pipe），然后才到业务代码。我们的跨站检查排在最前面。

几道关同时不过，谁先拦就回谁的结果。我们把「格式不支持」（415）这道检查，放在守卫之后、管道之前。这样一个不是项目成员的人，不管格式对不对，先收到的都是「看不见」（404），这符合「不让你知道这个项目存在」的原则。

框架自己拦下的错误，比如路径不存在、请求体不是合法的 JSON，能对上我们已有的退回性质就并进去；对不上的，用 RFC 9457 登记的通用类型 `about:blank`。

### 5. 改一部分用 PATCH，整个换用 PUT（API-50）

Zalando 第 148 条说，PATCH 是「to update parts of the resource objects」，只改一部分。我们的改任务、改状态都是只改一部分，所以用 PATCH。转让负责人是把「本项目的负责人」整个换掉，所以用 PUT。

### 6. 响应里放什么，要想到谁在看（API-52、API-53）

转让负责人成功后，调用的人自己就成了执行者，按产品规定，执行者看不见负责人是谁。所以转让成功只回 204（成功、没有内容），不把新负责人带回去。RFC 9110 第 9.3.4 节允许：PUT 成功「MUST send either a 200 (OK) or a 204 (No Content)」。

登录成功回 200，响应里带当前用户，不带会话。会话凭据只放在 HttpOnly Cookie 里；放进响应体，页面上的脚本就能读到，HttpOnly 就白设了。

这里要学的是：**一个响应带什么，不只看「接口规范怎么说」，还要看「此刻谁在看、他该看什么」。**

### 7. 邮箱要定一个比较规则（API-55）

`Bob@x.com` 和 `bob@x.com` 是不是同一个邮箱？OWASP 邮箱校验速查表说，域名部分「always case-insensitive」，前面那部分「technically case-sensitive under SMTP, though many providers do not enforce this in practice」。它要求项目自己「Define an explicit comparison policy for the local part」，并且「Preserve the original email address as entered by the user」。

我们定的是：存用户输入的原样；查重、登录、邀请时，整个地址不分大小写比较。数据库要一条「不分大小写」的唯一约束，这一步下个窗口先请架构师定写法。

---

## 第三块　开课读得太多，中途会漂（第七窗口）

### 1. 出了什么事

第七窗口一开课，你问：新窗口开课前要读七个必读文件，还要过自检，内容太多，会跑偏、会忘；上个窗口就出过这种事，约束明明写在文件里，还是忘了。能不能分层读，或者用关系图来组织。

我数了一下：开课读的文件 2666 行，自动记忆 509 行；规则 81 条、反模式 46 条、自检 20 项。

### 2. 为什么读过还会忘

**结论：开头读一遍，撑不住整个长会话。**

先打个比方。你早上把一整本员工手册读了一遍，下午遇到一件事，手册里明明写了怎么办，你却想不起来。不是没读，是读得太早、读得太多，中间又塞进了一整天的事。

三篇研究说的是同一件事：

- Liu 等人的《Lost in the Middle》（TACL）发现，相关信息在长上下文的开头或结尾时表现最好（「performance is often highest when relevant information occurs at the beginning or end of the input context」），放在中间就明显变差。开课读的规则，会随着对话变长被挤到中间。这篇测的是检索问答，搬到「守规则」上是推断。
- Chroma 的《Context Rot》（2025）：「model performance consistently degrades with increasing input length」，输入越长越钝。
- IFScale（2025）：同时给 500 条指令时，「even the best frontier models only achieve 68% accuracy」，要守的规矩越多，守得越差。

Anthropic 讲上下文管理的文章（2025-09-29）把这归成一句：上下文是「a finite resource with diminishing marginal returns」。Claude Code 官方的最佳实践说得更直白：「If Claude keeps doing something you don't want despite having a rule against it, the file is probably too long and the rule is getting lost.」

### 3. 解法：按时刻分卡，到点再读

**结论：规则按「什么时候用」分成短检查单，到了那一刻先读那一张。**

飞行员不会起飞前把整本手册背下来。检查单按时刻分开：发动机启动前一张，起飞前一张，降落前一张。美国联邦航空条例第 121.315 条的原话是：「The procedures must be designed so that a flight crewmember will not need to rely upon his memory for items to be checked.」这和你说的「不是靠人脑死记，是需要时可查可看」是一个意思。Anthropic 那篇文章推荐的做法也叫「just in time」：手边留轻量的索引，用到时再取细节。

我们的落法是 docs/CHECKPOINTS.md：十三张卡，从「开课」「派子代理前」一路排到「整节课结课」，每张不超过九条，只写要做的动作和正本在哪，不抄正文。用法有两种：动手前「先读再做」，每条消息末尾「做完对一遍」。原来的「发前自查」就是第 12 张卡。

### 4. 先在自己项目里搜

这个办法一提出来，你就问：是不是项目里本来就有，只是没留意。确实大半本来就有：发前自查本来就是按时刻记的；锚点第三行「这一步我最可能犯什么错」每步提醒一次；知识库里有强化 4「条件触发」和补丁 13「动手前后检查」；每条规则的「进自检」判定行早写了它在哪一刻起作用。只是散在各处，没收拢。

教训：**提新办法之前，先在自己项目里搜。** 不搜，就会再立一份，成了重复。这一条写进了框架文件 HARNESS 原则 1。

### 5. 能不能根治

你接着问：这么多重要的内容，AI 的这些毛病是不是没法根治。

**结论：记性根治不了，「靠记性」可以根治。**

安全工程里有个瑞士奶酪模型。James Reason 在 2000 年的《英国医学杂志》上写，每一层防护都「more like slices of Swiss cheese, having many holes」。安全不靠哪一片没有洞，靠叠几片，让洞对不齐。他还说：「We cannot change the human condition, but we can change the conditions under which humans work.」

我们的防护层由弱到强：开头读一遍，到点读卡，命令判对错，钩子自动跑，你把关。第六窗口漏过去的错，全在「只靠读」那一层；拦下来的，全靠命令。

所以方向是四样：能删的删；剩下的到点再读；读也不保险的，交给命令、交给钩子；关键处由你把关。检查单上每条都标了靠什么守：【命令】有现成命令判对错，【读】只能靠读卡照做，【你】由你把关；现在没有一条由钩子守。剩下的洞，看得见。这一条写进了 HARNESS 原则 17。

### 6. 记录要能回溯

你还要一种能追查的记录：什么时候、在哪、做了什么，像书一样前面是目录、后面是正文。

正文我们早有了：git log 记每次改动，DECISIONS-R1 记每次拍板。缺的是目录。行业里的做法是目录从正文生成，不另写：管理架构决策记录的工具 adr-tools，源码里就有生成目录（_adr_generate_toc）和关系图（_adr_generate_graph）的命令。Keep a Changelog 也提醒：「Using commit log diffs as changelogs is a bad idea: they're full of noise.」直接拿 git log 当目录，太吵。

我们的落法是 scripts/decision-index.sh，从决策记录的标题行现场打印「编号 | 日期 | 提交号 | 标题」。比如跑 bash scripts/decision-index.sh R1 开课，就列出每个窗口是哪天开的；再跑 git show --stat 加提交号，看那一次改了哪些文件。

### 7. 邮箱不分大小写的唯一约束，三种写法

这一节只讲原理，选哪种要等架构师给选项、你拍板。API-55 定了比较时不分大小写，可现在数据库的约束是区分大小写的。PostgreSQL 有三种常见写法：

- citext 列：换成扩展里「不分大小写的文字」类型。官方页写「The citext module provides a case-insensitive character string type」，可同一页又建议「Consider using nondeterministic collations ... instead of this module」。
- 表达式唯一索引：在 lower(email) 上建唯一索引。官方原话是，它「would prevent creation of rows whose col1 values differ only in case」。
- 不区分大小写的排序规则：官方提醒「their use leads to a performance penalty」，有的模式匹配也用不了。

Prisma 的 schema 里查到能直接写的是第一种（@db.Citext，要先启用扩展）；另两种在 Prisma 文档里没找到 schema 写法，多半要在迁移文件里手写 SQL（未核），留给架构师在第八窗口核。

### 8. 换个项目还用得上的

- 规则多了，按「什么时候用」分成短卡，到点再读。
- 每条标靠什么守住，看得见还剩多少洞。
- 提新办法之前，先在自己项目里搜。
- 能交给命令和钩子的，不靠记性。
- 记录的目录从正文生成，不另写。

---

## 本草稿的依据

以下原文都在 2026-10-17 用网页取回核过：

- PMI《Practice Standard for Work Breakdown Structures》第二版的 100% 规则，经维基百科「Work breakdown structure」条目转引。
- Scrum 指南（scrumguides.org）：Definition of Done、Product Backlog、Sprint Backlog、Product Goal、Sprint Goal、Sprint Review、Sprint Retrospective、Backlog refinement、三支柱。
- 维基百科「Action item」条目。
- Zalando RESTful API Guidelines：第 129、134、141、148、159、160、167、169、238 条。
- RFC 3339、RFC 8259、RFC 9110（第 9.3.4、11.5 节）、RFC 9111（第 3.5、5.2.2.5、7.3 节）、RFC 9457（第 4.2.1 节）。
- OWASP 速查表：会话管理、错误处理、邮箱校验。
- NestJS 官方文档「请求生命周期」；MDN「Date.prototype.toISOString」。
- 第三块（第七窗口取）：Anthropic《Effective context engineering for AI agents》；Claude Code 文档 Best practices、How Claude remembers your project、Automate actions with hooks；Liu 等《Lost in the Middle》；Chroma《Context Rot》；Jaroslawicz 等《How Many Instructions Can LLMs Follow at Once?》；14 CFR 121.315（康奈尔法学院镜像）；Reason《Human error: models and management》（PMC 镜像）；adr-tools 说明页与源码目录；Keep a Changelog 1.1.0；PostgreSQL 18 文档 citext、表达式索引、排序规则三页；Prisma 7 文档 schema 参考、不支持的数据库功能、大小写三页。
- 第三块没核到原文的：WHO 手术安全检查单的三个暂停点；《清单革命》里讲的「先读再做、做完对一遍」（只见二手摘录）。

「追溯核对」这个叫法没有取原文，是推导。覆盖核对命令在本机实跑过，正反各一次。

项目里的出处：docs/DECISIONS-R1.md 的 R1-453 到 R1-481；契约 API-40 到 API-55；课程规则 87；HARNESS 原则 5、18。第三块见 R1-487 到 R1-493；docs/CHECKPOINTS.md；scripts/decision-index.sh；HARNESS 原则 1、17。
