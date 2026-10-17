# 补课 05-API　接口契约（下）

> 草稿。照问 491 A，每个窗口收尾把那个窗口学到的新东西写进来；整节课结课时照 book/OUTLINE.md 统稿成十节，你读过认了才算定稿。
> 现在收的是第六窗口（2026-10-17）的两块：一块是「怎样不漏掉一整块」这套做法，一块是这个窗口拍板的接口知识。
> 统稿时，前一块进第三节「原理」和第九节「换个项目还用得上的」，后一块按契约的小节编进第三、五节。

---

## 第一块　怎样不漏掉一整块

### 1. 出了什么事

这个窗口里，你问我「这节课还剩多少」。我答：契约分三块，第零节、第一节、第二节。你回了一句「第三节呢」。

契约其实有四节，第三节是「本节裁决汇总」，所有拍板的结论都登记在那里。我说漏了，因为我是凭印象答的，没有打开文件一节一节数。

这不是记性差这么简单。打个比方：搬家时有人问「还剩几箱」，你凭印象说「三箱」，可车上其实是四箱。少的那一箱，恰好是你一直顺手在装、从来没当成「待办」的那一箱。第三节就是这样：它是一路随拍随登的，从来不在「还没做」的清单上，于是就从印象里掉了。

**一句话结论：进度不能凭印象报，要对着一张完整的清单报，而且这张清单本身也要用机器核一遍。**

### 2. 第一层：交付物清单（工作分解结构）

项目管理里有一种做法，叫工作分解结构，英文缩写 WBS。意思是把一件大事要交的东西，一层一层拆到最小，列成一张总表。

它有一条最要紧的规矩，叫「100% 规则」。出处是项目管理协会（PMI）的《Practice Standard for Work Breakdown Structures》，原话是：「The 100% rule states that the WBS includes 100% of the work defined by the project scope」。意思是：这张表必须盖住全部工作，一项都不能少。

拿我们的契约举例，拆出来是这样：

- 契约第零节「管辖范围」。
- 契约第一节「全局约定」，再拆成九个小节：适用范围与标准、路径与前缀、会话凭据与跨站防护、请求格式、成功响应、退回性质与状态码、错误外壳、前端怎么读退回、所有响应共有的头。
- 契约第二节「接口清单」。
- 契约第三节「本节裁决汇总」。
- 契约以外的：两份笔记、书章、送审、删旧文件，等等。

拆到这么细，「第三节」就不可能被漏掉，因为它就写在表上。

我们的这张表放在 `docs/lessons/05-api-wbs.md`。它只管这一节课，整节课结束时，没做完的转进 BACKLOG，然后删掉。

### 3. 第二层：完成的定义

光有表还不够。表上每一项，要事先写明「做到什么样才算完」。

这个说法来自 Scrum 指南，叫「完成的定义」（Definition of Done）。原话是：「The Definition of Done is a formal description of the state of the Increment」。意思是：用白纸黑字写清楚，什么状态才叫做完了。

举个例子。契约第一节每个小节的完成定义是：这个小节涉及的裁决都写进了正文，没有一处还写着「待……定」，你读过、认了。这样我报进度时，每一项要么「完」，要么「没完」，有硬标准可对，不是我说了算。

### 4. 第三层：机器核对

清单是人写的，人写的清单也会漏。所以还要第三层：用一条命令，自动检查清单有没有盖住产物的全部组成。

我们清单的开头放了这条命令：

```
grep -E "^#{2,3} " docs/arch/API_CONTRACT.md | sed -E 's/^#+ //' | while IFS= read -r h; do grep -qF -- "$h" docs/lessons/05-api-wbs.md || echo "清单里缺：$h"; done
```

逐段说它在做什么：

- `grep -E "^#{2,3} " docs/arch/API_CONTRACT.md`：把契约里所有二级、三级标题挑出来。Markdown 里，以 `## ` 或 `### ` 开头的行就是标题。
- `sed -E 's/^#+ //'`：去掉开头的井号，只留标题文字。
- `while ... read -r h`：一个标题一个标题地拿出来。
- `grep -qF -- "$h" 清单文件`：在清单里找这个标题的原文，`-F` 表示按原文找，不当成规则表达式。
- `|| echo "清单里缺：$h"`：找不到，就打印出来。

**没有输出，才说明契约的每个标题都在清单里。** 有输出，就先补清单，再报进度。

这条命令我实跑过两次。正着跑，契约 12 个标题全在清单里，没有输出。反着跑，故意喂一个不存在的标题「四、不存在的一节」，它准确报出了「清单里缺：四、不存在的一节」；喂一个已有的标题，它不报。

为什么这一层最要紧？因为它不靠任何人记得。我们的反模式库里有一条（39 号）说的就是这个：靠机制才拿得到的东西，写进嘱咐里是拿不到的。

### 5. 说「以后再做」的事，当场登记

这个窗口还暴露了同一类的另一个毛病。课上我常说「这个放到结课再做」，到这时已经攒了三十五件。它们记在每个窗口的交接文件（桥梁）里，而桥梁每个窗口一份，每次都要重抄。抄六遍，哪次漏一条，那条就丢了。

管理上管这类事叫「行动项」（action item）。维基百科的定义是：「an action item is a documented event, task, activity, or action that needs to take place」，每一项要写负责人、计划什么时候完成。Scrum 在每轮结束时开回顾会，指南原话是：「The most impactful improvements are addressed as soon as possible.」「They may even be added to the Sprint Backlog for the next Sprint.」。回顾里发现要改的东西，不是记一笔就算了，要进下一轮的待办，和正事一起排、一起勾。

我们的做法：凡说「放到结课再做」，当场登进交付物清单的第五节「推到结课的事」，写一句话、出处、状态；不登，就不许说推。结课时逐条清：做完了写提交号，移进 BACKLOG 写编号，你定了不做就写那道问题的编号。三样之一，才算清完。

### 6. 交付物清单和 BACKLOG 有什么不同

用 Scrum 的两个词最好懂。

- BACKLOG 像 Scrum 的「产品待办」（Product Backlog）。指南的说法是「an emergent, ordered list of what is needed to improve the product」。它跨很多节课，装的是「该做、但这节课不做」的事。
- 交付物清单像 Scrum 的「这一轮的待办」（Sprint Backlog）。指南说它是「a highly visible, real-time picture of the work that the Developers plan to accomplish during the Sprint」。它只管这一节课，连已经做完的也列着，每项有完成标准和状态；结课时没做完的转进 BACKLOG，然后删掉。

两边之间只有一个接口，叫「移出」：这节课决定不做的项，从清单移进 BACKLOG，清单上标「移出」。

### 7. 从 Scrum 借来的几样

Scrum 整套做法的根，是三根支柱：「transparency, inspection, and adaptation」，看得见、常检查、随时调。对照我们：

- **产品目标**（Product Goal，「describes a future state of the product」）：我们有，导读和框架文件第一节写着最终要做成什么。
- **每轮目标**（Sprint Goal，「the single objective for the Sprint」）：以前只写在桥梁里。现在每个窗口开头，在交付物清单写一句本窗口目标，收尾时对着它看达没达到。
- **每轮回顾**（Sprint Retrospective，「plan ways to increase quality and effectiveness」）：以前只在整节课结课时问一句「哪段讲得太粗」。现在每个窗口收尾做一次，三问：哪里顺、哪里出错、改进项是什么，改进项当场登进清单。
- **每轮评审**（Sprint Review）和**待办梳理**（Backlog refinement）：先登进清单的「推到结课的事」，结课时判要不要变成规矩。待办梳理尤其要紧，我们的 BACKLOG 七十多条，只增不减。

### 8. 为什么开课时读过规则，还是会忘

你问过：控制我的就那几个文件，怎么还会犯这种错。照实说：每次开课要读的规则加起来约 2500 行，八十多条规则、四十多条反模式；读一遍，不等于做到中途还都记得。会话越长，规则越被对话内容淹没。

所以这套做法分三层摆放，各管一个时刻：

- **开课自检**：开场提醒一次。规则 57 第 19 项问「交付物清单建了吗」，第 20 项问「定下新做法时，会过三问吗」。
- **每条消息的自查**：每发一条消息都过一遍，比如「报进度前，先跑命令导出产物大纲」。
- **能跑的命令**：覆盖核对、提交前的计数闸门。不靠任何人记得。

还有一样常被忽略：**删减**。规则越多，越记不住。结课时要问一句「这节有哪些能删」，这一条也登进了清单。

### 9. 换个项目还用得上的

这一块全部都能带走，已经写进框架文件：HARNESS 原则 18 补了「全图从交付物清单导出，并用机器核对」，原则 5 补了「说推就当场登、到点逐条清」；课程规则 87 管每节课都要建清单。

可以带走的做法，一句话一样：

- 做一件长事，先列交付物清单，照 100% 规则拆到底。
- 每一项写完成的定义。
- 配一条能跑的覆盖核对命令，没输出才报进度。
- 说「以后再做」，当场登记，到点逐条清。
- 每轮开头写目标，结尾做回顾。

---

## 第二块　第六窗口拍板的接口知识

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
