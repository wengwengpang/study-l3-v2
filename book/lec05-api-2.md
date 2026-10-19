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

## 第二块　第七窗口的接口知识

### 1. 邮箱不分大小写的唯一约束，三种写法

这一节只讲原理，选哪种要等架构师给选项、你拍板。API-55 定了比较时不分大小写，可现在数据库的约束是区分大小写的。PostgreSQL 有三种常见写法：

- citext 列：换成扩展里「不分大小写的文字」类型。官方页写「The citext module provides a case-insensitive character string type」，可同一页又建议「Consider using nondeterministic collations ... instead of this module」。
- 表达式唯一索引：在 lower(email) 上建唯一索引。官方原话是，它「would prevent creation of rows whose col1 values differ only in case」。
- 不区分大小写的排序规则：官方提醒「their use leads to a performance penalty」，有的模式匹配也用不了。

Prisma 的 schema 里查到能直接写的是第一种（@db.Citext，要先启用扩展）；另两种在 Prisma 文档里没找到 schema 写法，多半要在迁移文件里手写 SQL（未核），留给架构师在第八窗口核。

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
