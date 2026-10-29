# 补课 05-API　接口契约（下）

> 统稿中（问 697 A）：照 book/OUTLINE.md 分三批写，第一批第一到三节，第二批第四、五节，第三批第六到十节；每批推一次，项目主人在 GitHub 读过认了才算定稿。
> 下面「---」以后的八块是统稿前的草稿，内容编进第三节后逐块删掉；文末「本草稿的依据」留到写第十节时并入。

## 一、本章位置

这一章属于第一篇「立项准备」，是补课 05-API 的下半。上半章弄清了接口契约管什么、不管什么，把还没定的事清点出来，拍了头两条，建起了契约文件的骨架。这一章把剩下的拍完，写出契约的正文。业务代码仍然不写。

**上一章交来什么。**

- 接口契约 `docs/arch/API_CONTRACT.md` 的骨架：第零节写明这份文件管什么，第一、二节标着「待定」，第三节登记了 API-1、API-2 两条裁决。
- 一份清点出来的待定项，已经按「定完写进哪」分好组：有的回需求文档，有的留在契约，有的交给后面的共享类型一节。
- 一条贯穿全章的口径（API-1）：契约只写接口这一层，每个接口点名它用的校验规则，字段本体不抄进来。
- 前几章的产物：架构文档四节、需求文档、数据库设计图，以及 architect、pm 两个角色。

**和第 6 课的关系。** 这一章用到第 6 课的决策边界最多。D1 范围取舍，比如账号自己的几样操作做不做。D2 数据结构演进，改表结构之前先回 architect。D3 权限与安全口径，比如执行者看得见什么。D7 没把握就停。D8 两份文档打架时只报不改。细的在第 6 课，这里只用它们的结论。

**这一章产出什么。**

- 契约第一节「全局约定」九个小节；第二节「接口清单」七个小节，列出 17 个接口；第三节汇总从 API-3 登记到 API-59。
- 新建的标准登记表 `docs/arch/STANDARDS.md`：每个领域照哪一份标准，偏离了写在哪。
- 需求文档里新定的审定决策 D10 到 D20，和几条澄清注记。
- 连带的数据改动：架构决策记录 ADR-DB-006 到 ADR-DB-008，数据库设计图跟着改的几处。

**下一章拿它做什么。** 契约里点了名的校验规则，交给补课 05-类型去写；它按名字交货，名字就是接缝。写明留给环境设计的几处，比如数据库的区域设置，交给补课 05-环境。第 10 课写后端、第 11 课写前端，都照这份契约。

## 二、学完能做到什么

1. 碰到一件接口上要定的事，能先找行业标准：选一份主参考，判它是必须、建议还是可选，没照做的写下理由。
2. 能为一组接口写出全局约定：路径怎么起，凭据放哪，请求收什么格式，成功和出错各回什么。
3. 能讲清两组容易混的退回：「看不见」回 404，「不许做」回 403；请求本身不对回 400，和目标资源的现状冲突回 409。
4. 能给一个接口写齐七样：方法与路径、鉴权级别、请求的校验规则、响应的校验规则、成功码、可能的退回、依据。也能把「本版没有接口的」列全。
5. 能让 AI 分两轮写一节长文档：先核对，拍完再起草；按小节落盘，落完逐字节比对。

## 三、原理

**为什么要有这一课。** 上半章打过比方：接口契约是前端和后端之间递的交接单。上半章定的是这张单子管什么，画好了框。这一章往框里填字。

填的字分两种。一种管所有的单子：抬头怎么写，凭据放哪，出了错怎么退回。这是契约第一节「全局约定」。另一种是每一张单子本身：找谁，带什么，会收到什么。这是第二节「接口清单」。先定前一种，后一种就短了：每个接口只写自己特有的几样，全局约定写过的不再重复。

不定会怎样？17 个接口，每个都得各自决定凭据放哪、出错回什么。17 处各定各的，到第 12 课前后端接起来时，就是 17 处可能对不上。

### 先认几个词

上半章认过接口、请求与响应、方法和路径、请求体、状态码这些词。这一章再补几个，只补本章用得上的。

**另外三种方法。** 上半章讲了 GET（取）和 POST（提交）。这一章还用到三种：PUT，把一个东西整个换掉；PATCH，只改一个东西的一部分；DELETE，删掉一个东西。

**头。** 请求和响应除了正文，开头还带一串「名字: 值」的附注，叫头。比如 `Content-Type: application/json` 说正文是什么格式；`Cache-Control: no-store` 叫中途经手的缓存别存这份响应。

**媒体类型。** 就是 Content-Type 的值，说明正文是哪种格式。本项目的接口只收 `application/json`，也就是 JSON 格式的文字。

**Cookie。** 浏览器替网站保管的一小段数据。网站在响应里让浏览器存下它，浏览器以后每次访问这个网站，都自动带上。

**会话。** 登录以后，后端在数据库里记一条「这个人已登录」，把这条记录的凭据放进 Cookie 交给浏览器。之后每次请求，后端看 Cookie 里的凭据，就认得是谁。本项目用的就是这种做法，第 4 课定的。

**跨站请求伪造。** 一个人登录着本项目，又打开了另一个网站。那个网站悄悄让他的浏览器朝本项目发一条请求，浏览器照常带上 Cookie，后端就以为是他本人要做的。防这件事的手段，下文叫跨站防护。

**查询参数。** 写在路径后面、问号之后的附加条件，比如 `?status=done`。

**幂等。** 同一个请求发一次和发好几次，对服务器的效果一样。比如移出一个成员，移一次和移两次，结果都是他不在项目里了。

**RFC。** 互联网的技术规范文档，每份有个编号，比如 HTTP 的语义写在 RFC 9110。下文说「照 RFC 某某」，指的就是这些文档。

**后端的几道关。** 本项目后端用 NestJS。一条请求进来，依次经过中间件、守卫（Guard）、拦截器、管道（Pipe），最后才到业务代码。上一章讲的 AuthGuard、AuthzGuard 就是守卫；校验规则在管道这一关执行。

**唯一约束。** 数据库给一列定的规矩：这一列里不许有两行的值相同。比如两个账号不能用同一个邮箱。

### 标准怎么用

打个比方。装修房子，电线怎么走有国家规范，照做就是；规范没管的，看行内通行的做法；两样都没有，才自己拿主意。

本项目定接口时照的就是这个顺序：先照行业标准，没有才照主流做法，再没有才自己定。这条方针写在规则书第二层 D；哪个领域照哪一份标准，登记在这一章新建的 `docs/arch/STANDARDS.md`。用法有五条。

- **按层定先后。** 标准分四层，依次是：协议层的正式规范，比如 HTTP 的 RFC；安全基线，比如 OWASP 的速查表；框架自己的约定，比如 NestJS 官方文档；设计规范，比如 Zalando 的接口设计指南。层与层说法冲突时，排在前面的层说了算。四层都没有，才自己定。
- **同一层先选一份主参考。** 接口设计规范有好几家，本项目选 Zalando RESTful API Guidelines 当主参考（API-5）。同一层几家说法不一，列出来，由项目主人拍。
- **每条分三档。** 必须的，照做；建议的，代价小就做；可选的，可以不做，但不把路堵死，记进待办。档次逐条判，写在用到它的那条裁决里。
- **偏离要登记。** 主参考要做、本项目没照做的，理由写进登记表的「偏离登记」，别处只写一个指针。比如会话固定 30 天、不设空闲超时，偏离了 OWASP 的会话管理（API-10）；字段名用 camelCase，偏离了 Zalando（API-22）。
- **说「标准」要拿得出原文。** 说「标准这么规定」，要能指出是哪一份、哪一句，而且当场核过。没核过的，不当标准用。

还有一句要记住：标准管怎么做，不管做多少。项目数量设不设上限、要不要做找回密码，是产品取舍，归项目主人；标准只管决定做了以后怎么做才对。

### 路径与前缀

打个比方。路径像寄信的地址：先写哪个城市，再写哪条街、几号。本项目所有接口的地址，都从同一个「城市」开始，就是前缀 `/api`。

**前缀。** 所有接口挂在 `/api` 下，由后端统一加，只定义一处；前面的 Nginx 原样转发，不剥掉它（API-6）。这样定，是因为一个请求可能走三条路：上线后经 Nginx 转给后端；服务端渲染时，由前端服务直接找后端；本地开发时，由 Next.js 转发给本地的后端。三条路上的路径要长得一样（API-6、API-12、API-13）。浏览器发请求只写相对路径 `/api/...`，不写域名；只有服务端渲染才配后端的内网地址。

**不带版本号。** 接口设计规范几家说法不一，本项目照主参考，路径里先不带版本号。哪天出现第二个调用方，再照当时的主参考加（API-6）。

**写法。** 路径段一律小写，单词之间用连字符；资源名用复数，比如 `/api/projects`（API-51）。

**只写名词，不带动词。** Zalando 第 141 条：「The API describes resources, so the only place where actions should appear is in the HTTP methods.」动作只靠方法表达（API-58）。口语里是动词的接口，换成名词来写：注册是新建一个用户，`POST /api/users`；登录是新建一个会话，`POST /api/sessions`；登出是删掉当前这个会话，`DELETE /api/sessions/self`。NestJS 官方认证一页的例子写 auth 下的 sign-in，那是教程里的例子，不是框架的约定。

**只有一个的东西，用单数。** 有的子资源，一个上级只有一个：项目的负责人、任务的状态、项目的汇总。Zalando 第 134 条要求它们也写成集合：「modeled as a collection with cardinality 1」。同一层的 Google AIP-156 说法相反：「Singleton resources are always singular.」照集合写，改负责人、改状态两个接口的请求体都要多包一层数组，「状态们」还会被读成状态的历史。所以本项目写单数，比如 `/api/projects/{projectId}/owner`，这一条偏离登进了标准登记表（API-57）。

**self。** 「当前用户」「当前这个会话」没有一个现成的编号可写。Zalando 第 143 条是必须档，标题是「MUST identify resources and sub-resources via path segments」，同一条里写着：「Here, it is reasonable to use self as pseudo-identifier path segment.」所以 `GET /api/users/self`、`DELETE /api/sessions/self` 用 self 当编号，不算偏离。

**路径里的编号转不成数字。** 本项目的编号都是整数。路径里写了 `abc` 这类转不成数字的，当作查不到，回「看不见」（架构文档决策 B）。路径里有几种编号，就要定几种去处：项目 id 在 AuthzGuard 那一关退回；任务 id、成员的用户 id 在业务代码里退回。成员的用户 id 是后来才加进路径的，加路径时要回头补上它的去处。

**项目 id 只认路径。** 路径里带项目 id 的写接口，项目一律以路径为准，不从请求体里取。请求体里多带了项目 id，按多余的字段拒绝（架构文档决策 D、API-31）。

### 会话凭据与跨站防护

打个比方。游乐园进门验一次票，在手腕上扣一个手环；之后玩每个项目，工作人员看一眼手环就放行，不再验票。会话就是这个手环：后端在数据库里记下发出去的每一个，浏览器把它存在 Cookie 里，每次请求自动亮出来。

**凭据只放 HttpOnly Cookie。** 会话凭据只放在 Cookie 里，放在请求头里的凭据一律不收（API-8）。Cookie 设了 HttpOnly，页面上的脚本就读不到它。这样选有两个好处：服务端渲染时浏览器会带上 Cookie，第一屏就认得是谁；页面上的脚本偷不走凭据。代价是前面说的跨站请求伪造，要另加防护。

**Cookie 的几个属性。** Secure（本地开发也加）、HttpOnly、SameSite=Lax、不设 Domain、Path 为 `/`、Max-Age 与服务端会话的期限一致（API-8、API-9）。过期以服务端为准。

**30 天，不设空闲超时。** 会话固定 30 天，不续期，也不因为一段时间没动就过期（API-10）。这一条偏离了 OWASP 的会话管理速查表，理由登在标准登记表。将来出现敏感数据、多人共用设备这类情况，再加空闲超时，已记进待办。

**登录时换掉旧会话。** 注册、登录都会新建一个会话。这次请求里要是带着一个还有效的旧会话，同一次请求里先把它删掉。依据是 OWASP 会话管理速查表「Renew the Session ID After Any Privilege Level Change」一节：「the old or previous session ID must be destroyed」（API-8）。

**失败时不动旧会话。** 那一节的标题，说的是权限变化之后。登录时密码错了、注册时邮箱已被使用，权限都没变，所以只在成功时删旧会话，失败时照旧。原文没直接写失败的情形，这一条是从标题推出来的。反过来做，已登录的人在登录页输错一次密码，就被登出了。

**登出。** 删掉服务端的会话，并让浏览器清掉 Cookie。会话本来就已失效时调登出，照样回「未登录」，前端照常跳登录页（API-8）。

**跨站防护。** 用 NestJS 自带的防护，要求 NestJS 12.1 起（API-11）。它先看请求头 Sec-Fetch-Site；没有这个头，再比 Origin 与 Host。GET、HEAD、OPTIONS 三种方法直接放行，所以这三种方法不许改数据；其余方法都要过这道检查，PATCH 也在内。不过的回 403，退回性质叫「跨站被拒」（API-29）。SameSite=Lax 本身也能拦下跨站发来的写请求，但它只算多一层保护，替代不了这道检查（API-9）。

**写请求只从浏览器发。** 服务端渲染只发读请求；写请求一律从浏览器，经前端的请求封装发出。本版不用 Next.js 的 Server Actions（API-48）。

**角色怎么到前端。** 项目列表的每一项、项目详情，都带「我在本项目的角色」（API-34）。前端只拿它决定显示哪些入口，不当授权用；每个受限的接口，都由后端的守卫自己查成员表判定，前端传来的角色一概不信（架构文档决策 Q1）。当前登录的是谁，由单设的「当前用户」接口给（API-34）。

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

`Bob@example.com` 和 `bob@example.com` 是不是同一个邮箱？OWASP 邮箱校验速查表说，域名部分「always case-insensitive」，前面那部分「technically case-sensitive under SMTP, though many providers do not enforce this in practice」。它要求项目自己「Define an explicit comparison policy for the local part」，并且「Preserve the original email address as entered by the user」。

我们定的是：存用户输入的原样；查重、登录、邀请时，整个地址不分大小写比较。数据库要一条「不分大小写」的唯一约束，这一步下个窗口先请架构师定写法。

---

## 第二块　第七窗口的接口知识

### 1. 邮箱不分大小写的唯一约束，三种写法

这一节只讲原理，选哪种要等架构师给选项、你拍板。API-55 定了比较时不分大小写，可现在数据库的约束是区分大小写的。PostgreSQL 有三种常见写法：

- citext 列：换成扩展里「不分大小写的文字」类型。官方页写「The citext module provides a case-insensitive character string type」，可同一页又建议「Consider using nondeterministic collations ... instead of this module」。
- 表达式唯一索引：在 lower(email) 上建唯一索引。官方原话是，它「would prevent creation of rows whose col1 values differ only in case」。
- 不区分大小写的排序规则：官方提醒「their use leads to a performance penalty」，有的模式匹配也用不了。

Prisma 的 schema 里查到能直接写的是第一种（@db.Citext，要先启用扩展）；另两种在 Prisma 文档里没找到 schema 写法，多半要在迁移文件里手写 SQL（未核），留给架构师在第八窗口核。

## 第三块　第十窗口的接口知识

### 1. 邮箱最后选了 citext

第二块讲的三种写法之外，架构师又补了一种「小写影子列」：另存一列全小写的邮箱，对它建唯一约束。四种比下来选了 citext（ADR-DB-008）：

- 规则落在列的类型上，Prisma 的 schema 写得出（@db.Citext），注册、登录、邀请三处照常按邮箱查。
- 库还没建，改列类型没有迁移成本。
- 代价是多依赖一个 PostgreSQL 扩展；比较规则还随数据库的区域设置，官方原话「citext's case-folding behavior depends on the LC_CTYPE setting of your database」，所以区域设置要在环境设计里定死。

影子列没选：数据库只保证小写那份不重复，不分大小写要靠程序每次都转对，漏一处就拦不住。PostgreSQL 官方建议考虑的排序规则也没选：它有性能代价，有的模式匹配用不了，Prisma 那边还要手写 SQL。

### 2. 密码不去首尾空白

契约规定必填文本去掉首尾空白再存，密码不能这样做。OWASP 认证速查表写「Allow usage of all characters including unicode and whitespace.」，又写「Do not silently truncate passwords.」。用户设的密码里有空格，服务端悄悄去掉，下次照原样输入就登不上。所以密码原样收（问 576 A）。

### 3. 没定义的查询参数也拒绝

请求体里多出没定义的字段要拒绝（API-31），查询参数同理。主参考 Zalando 第 109 条原话：「Unknown input fields in payload or URL should not be ignored」（问 578 A）。

## 第四块　第十一窗口的接口知识

### 1. 注册回 201，但不带 Location

注册新建了一个用户，所以回 201；可这个用户没有自己的地址，能读到他的只有「当前用户」接口，而那个地址随会话指向不同的人。RFC 9110 第 15.3.2 节允许不带 Location，原话是新资源由 Location「or, if no Location header field is received, by the target URI」标识。不带时，标准把注册接口的地址当作新资源的标识，读起来别扭，这个代价接受了（问 590 A）。

### 2. 部分更新用 PATCH，整个替换用 PUT

两种方法分工照标准本义。RFC 9110 第 9.3.4 节：「The PUT method requests that the state of the target resource be created or replaced」。主参考 Zalando 第 148 条：「PUT requests are used to update (and sometimes to create) entire resources – single or collection resources.」用 PUT 只传改动的字段，没传的会被当成「换成空」，所以部分更新只能用 PATCH（问 588 A）。

### 3. 没登录时发坏 JSON，先回 400

请求体由框架在查身份之前解析，写坏的 JSON 在这一步就被挡下，回「参数不合法」。所以没登录的人发坏 JSON，收到的是 400 而不是 401，前端靠 401 跳登录页的逻辑这时不会触发。这是从解析顺序推出来的，写后端代码时要实测（问 592 A）。

### 4. 出错编号用 UUID 第 4 版

错误外壳里的 instance 是每次出错的随机编号。RFC 9562 第 5.4 节：「UUIDv4 is meant for generating UUIDs from truly random or pseudorandom numbers.」第 7 版按时间有序，日志里好排，但不是纯随机，和「随机编号」的定义对不上，没选（问 594 A）。

### 5. 「不缓存」要盖住框架自己挡下的退回

所有响应都带 Cache-Control: no-store。框架自己挡下的退回，比如路径不存在、JSON 写坏，可能绕过统一加头的那一层；挂在哪一层，要把这几种都盖住。网关错误不经后端，本来就不带（问 596 A）。

## 第五块　第十二窗口的接口知识

### 1. 路径不带动词，登录看成「新建一个会话」

主参考 Zalando 第 141 条：「The API describes resources, so the only place where actions should appear is in the HTTP methods.」这一条定为全局约定（API-58）。口语里是动词的接口，换成名词来写：注册是新建一个用户，POST /api/users；登录是新建一个会话，POST /api/sessions；登出是删掉当前会话，DELETE /api/sessions/self。NestJS 官方认证一页的例子写 auth 下的 sign-in，那是教程例子，不是框架约定。

### 2. 只有一个的子资源，两家规范说法相反

Zalando 第 134 条要单例也写成集合：「modeled as a collection with cardinality 1」。Google AIP-156 写：「Singleton resources are always singular.」本项目有三个单例：项目的负责人、任务的状态、项目的汇总。照集合写，两个写接口的请求体都要多一层数组，「状态们」还会被读成状态的历史，所以写单数，偏离登进 STANDARDS（API-57 修订）。第一次拍板时只数了负责人这一个单例，理由站不住，重拍了一次。

### 3. PATCH 成功后带什么，标准没限死

Zalando 第 148 条：「Successful PATCH requests return 200 or 204 (if the resource was updated — with or without returning the resource)」。RFC 5789 的例子回 204，又写「other success codes could be used as well」。改状态会让「可能卡住」重新计时，这个标记只在后端算，所以改状态回 200，带整个任务（API-35 补充）。

### 4. 删一个本来就不在的成员，回 404

Zalando 第 148 条：「Failed DELETE requests will usually generate 404 (if the resource cannot be found)」。DELETE 是幂等的，但 RFC 9110 第 9.2.2 节的幂等管的是「the intended effect on the server」，不管每次回什么码（API-37 补充）。

### 5. 登录时把旧会话删掉

OWASP 会话管理一页「Renew the Session ID After Any Privilege Level Change」一节：「the old or previous session ID must be destroyed」。所以注册、登录的请求里带着有效的旧会话时，同一次请求里先删掉它，再新建（API-8 补充）。

## 第六块　第十三窗口的接口知识

### 1. 失败时不动旧会话

第五块第 5 条说，登录时把旧会话删掉。那一条依据的 OWASP 一节，标题是「Renew the Session ID After Any Privilege Level Change」，管的是权限变化之后。登录密码错、注册邮箱已被使用，权限都没变，所以只在成功时删旧会话，失败时旧会话照旧（API-8 补充）。原文没直接说失败的情形，这一条是推出来的。反过来做，已登录的人在登录页输错一次密码就被登出。

### 2. 请求体与列表响应怎么起名

两层标准说法一致。框架层，NestJS 官方 CRUD 生成器给的是 CreateUserDto、UpdateUserDto。设计规范层，Google AIP-133 写「The request message must match the RPC name, with a `Request` suffix.」；AIP-132 写「The request and response messages must match the RPC name, with `Request` and `Response` suffixes.」，例子是 ListBooksResponse。所以请求体写「动作 + 资源 + Request」，如 CreateUserRequest；列表响应写「List + 资源复数 + Response」，如 ListProjectsResponse（API-30 补充）。只照请求那一半、列表另写 TaskList，就成了两套规则。

### 3. 列表项和详情用同一个形状

AIP-132 还写：「The response should usually include fully-populated resources unless there is a reason to return a partial response」。所以列表每一项与详情同一形状、同一个名字。改状态回来的整个任务，前端可以直接替换列表里那一行（API-30 补充）。同一个资源按调用者角色给不同形状时，也用一个名字，几种形状在 schema 里怎么写，归共享类型那一层。

### 4. type 按退回性质给，要分提示的才另起

前端照错误外壳里的 type 出中文提示。同一种退回性质提示一样，就共用一个 type；同一性质里要分出不同提示的，才另起专门的 type。比如同是 409「冲突」，「邮箱已被使用」要单独提示（API-24 补充）。并发下两个请求同时写，后到的撞上数据库唯一约束，回的 type 与先查就查到时一样，用户看到同一个提示（API-28 补充）。

### 5. self 是规范自己给的例外

Zalando 第 143 条是必须档，标题「MUST identify resources and sub-resources via path segments」。同一条里写：「Here, it is reasonable to use self as pseudo-identifier path segment.」所以登出 DELETE /api/sessions/self、当前用户 GET /api/users/self 用 self 当编号，不算偏离。

### 6. 路径里的每一种编号都要有去处

路径里有几种编号，就要定几种「转不成数字」的去处。本项目有三种：项目 id 在 AuthzGuard 退回，任务 id 和成员的用户 id 在 Service 退回，都按「看不见」回 404（ARCHITECTURE 决策 B 及其补充）。成员的用户 id 是后来才加进路径的，加路径时要回头补上它的去处。

---

## 第七块　第十四窗口的接口知识

### 1. 一个词在同一个接口里只指一样东西

「负责人」在这个项目里有两个意思：一是项目角色，派活、看全局的那一方；二是一个任务分给了谁。创建任务这个接口，鉴权级别写「只有负责人」，指的是项目角色。退回里要说「分给的人不是本项目成员」，如果也写「负责人」，读的人就分不清。PRD 澄清注记 10 定了读法：说任务分给谁，写「任务负责人」。契约写到 tasks 组时照它改写（第二节第 6 小节）。

### 2. 能由别的数算出来的，接口里不必再给

项目主页要显示完成率。汇总接口已经给了四个数：任务总数、已完成、进行中、未开始。完成率就是「已完成」除以「任务总数」，前端一除就有，后端没有别处要用它，所以接口里不另给（API-42 补充）。这段算法也不放进前后端共享的那一层：判断标准第一问是「前后端是不是都真的用它」，只有前端用，就不进。任务总数为 0 时，页面本来就有空态，汇总显示 0，并引导去建第一个任务，前端不做除法。将来要在后端判断项目风险时，再往汇总里加一个字段，只加不改，老的前端不受影响。

### 3. 「本版没有接口的」也要列全

接口清单最后一小节，列本版没有接口的东西（第二节第 7 小节）。它分三类：没有接口的模块，是 users、authz、notifications；本版不做、所以没有接口的操作，是删任务、删项目、成员自己退出、把成员直接改成执行者，以及用户对自己账号的四样操作；本版延后的功能。列这一节，是为了让写后端、写前端的人不去写、不去调根本不存在的接口，也不把「没做」当成「漏了」补上。

用户对自己账号的四样操作，是改密码、改邮箱、找回密码、注销账号。需求文档里一句都没提，「不做」的清单里也没写。认证这块的主参考 OWASP Authentication Cheat Sheet 有三节讲这些，开头分别是：「When developing a change password feature, ensure to have:」「It is common for an application to have a mechanism that provides a means for a user to gain access to their account in the event they forget their password.」「User email addresses often change.」。三句讲的都是做的话该怎么做，没有写必须提供。本版定为都不做，并写明后果：忘了密码就进不去，也没有管理员能代为重置（PRD 审定决策 D19）。

### 4. 示例里的域名用 example.com

文档里的示例邮箱原先写成 Bob@x.com。x.com 是一个真实在用的域名，拿它当示例，照着测试就可能把请求发到别人的服务器上。RFC 2606 第 3 节写：「The Internet Assigned Numbers Authority (IANA) also currently has the following second level domain names reserved which can be used as examples.」，保留的是 example.com、example.net、example.org。示例邮箱都改成了 example.com 的写法。

---

## 第八块　第十五窗口的接口知识

### 1. 密码规则照认证的安全基线定

注册接口要校验密码。本项目原来定「至少 8 位，含字母和数字」。认证这一块的主参考是 OWASP Authentication Cheat Sheet，它在「Implement Proper Password Strength Controls」一节写了三样：

- 「If MFA is not enabled passwords shorter than 15 characters are considered to be weak」：没开多因素认证时，少于 15 位就算弱；开了多因素认证，门槛是 8 位。
- 「There should be no requirement for upper or lower case or numbers or special characters.」：不该要求大小写、数字或特殊字符。
- 「"Maximum" password length should be "at least 64 characters" to allow passphrases」：最长至少允许 64 位，好用一整句话当密码。

本项目没有多因素认证，于是改为最短 15 位、最长不少于 64 位、不限字符种类（PRD 审定决策 D20，取代 D9）。长度比字符种类管用：「Password1」满足旧规则，却在泄露密码表里排得很靠前；一句没有数字的长话，难猜得多。

注册接口的契约只点名这条决策，不抄规则本身，规则的正本在需求文档。拦常见与泄露过的密码、强度提示、哈希算法与具体上限，本版没做，记在待办里。

### 2. 偏离了主参考的建议，要登进偏离登记

邮箱不分大小写的唯一约束，本项目用 PostgreSQL 的 citext 类型。PostgreSQL 文档 citext 一页写「Consider using nondeterministic collations (see Section 23.2.2.4) instead of this module.」，建议考虑改用不区分大小写的排序规则。这是一条建议，项目没照它走，理由是排序规则有性能代价、部分模式匹配用不了、要手写 SQL，而 citext 写得进 schema。

标准登记表的规矩是：偏离主参考的地方，理由写在登记表的「偏离登记」里，决策记录只写指针。这一条当初只写进了决策记录，登记表里连 PostgreSQL 这一栏都没有。补登之后，别处说「照什么标准」，都指到同一处。

### 3. 核过一句不等于核过整节

密码规则这一处打架，原先登记时只核了「不该要求字母数字」一句。这次把整节取回来读，才看见最短长度也对不上。要拿一节标准下结论，就把整节读完；只核过的那一句，只能当那一句的依据。

## 本草稿的依据

以下原文都在 2026-10-17 用网页取回核过：

- Zalando RESTful API Guidelines：第 129、134、141、148、159、160、167、169、238 条。
- RFC 3339、RFC 8259、RFC 9110（第 9.3.4、11.5 节）、RFC 9111（第 3.5、5.2.2.5、7.3 节）、RFC 9457（第 4.2.1 节）。
- OWASP 速查表：会话管理、错误处理、邮箱校验。
- NestJS 官方文档「请求生命周期」；MDN「Date.prototype.toISOString」。
- 第二块（第七窗口取）：PostgreSQL 18 文档 citext、表达式索引、排序规则三页；Prisma 7 文档 schema 参考、不支持的数据库功能、大小写三页。
- 第三块（第十窗口取）：OWASP Authentication Cheat Sheet（2026-10-20）。
- 第四块（第十一窗口取，2026-10-21）：RFC 9110 第 9.3.4、15.3.2 节；RFC 9562 第 5.4 节；Zalando 第 148 条。
- 第五块（第十二窗口取，2026-10-23）：Zalando 第 134、141、143、148 条；Google AIP-156；RFC 5789 第 2、2.1 节；RFC 9110 第 9.2.2、15.3.1 节；OWASP 会话管理（Renew the Session ID After Any Privilege Level Change、Logout Button 两节）；NestJS 官方认证一页。
- 第六块（第十三窗口取，2026-10-26）：Google AIP-132、AIP-133；Zalando 第 143 条；NestJS 官方 controllers、CRUD 生成器两页。
- 第七块（第十四窗口取，2026-10-27）：OWASP Authentication Cheat Sheet（Change Password Feature、Implement Secure Password Recovery Mechanism、Changing A User's Registered Email Address 三节）；RFC 2606 第 3 节。
- 第八块（第十五窗口取，2026-10-28）：OWASP Authentication Cheat Sheet（Implement Proper Password Strength Controls 一节）；PostgreSQL 18.6 文档 citext 一页。

项目里的出处：docs/DECISIONS-R1.md 的 R1-453 到 R1-481；契约 API-40 到 API-55。第二块见 R1-492 第四点，第三块见 R1-525、R1-527 与 ADR-DB-008。第四块见 R1-530 到 R1-533 与契约汇总里第十一窗口的补充行。第五块见 R1-537 到 R1-543 与契约汇总里第十二窗口的补充、修订行。第六块见 R1-546 到 R1-551 与契约汇总里第十三窗口的补充、已定行和 API-59。第七块见 R1-555 到 R1-560 与契约第二节第 6、7 小节、API-42 补充（问 634 B）、PRD 审定决策 D19。第八块见 R1-569 到 R1-572、PRD 审定决策 D20 与 docs/arch/STANDARDS.md「偏离登记」。原先的「怎样不漏掉一整块」「开课读得太多，中途会漂」两块已挪进附录 H（book/appendix-h.md），出处跟着搬了过去（问 515 A、516 A）。
