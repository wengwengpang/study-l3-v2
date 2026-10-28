# 补课 05-API　接口契约（下）

> 草稿。每个窗口收尾，把那个窗口定下的接口知识写进来；课程做法类的问题写进附录 H（book/appendix-h.md）。整节课结课时照 book/OUTLINE.md 统稿成十节，项目主人读过认了才算定稿（问 491 A、515 A）。
> 现在收八块：第六窗口拍板的接口知识，第七窗口的邮箱约束三种写法，第十到十五窗口各一块接口知识。
> 统稿时，各块都按契约的小节编进第三、五节。

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
