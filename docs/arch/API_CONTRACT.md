# API_CONTRACT · 接口契约

> 项目：study-l3-v2（团队任务协作工具）
> 产出：补课 Lec 05-API。architect 角色推导，Michael 逐项拍板。
> 依据：docs/arch/ARCHITECTURE.md 四节、docs/design/PRD.md、prisma/schema.prisma。
> 本文随本课逐节追加。

## 零、本文件的管辖范围（API-1）

三份文件各管一段，每条信息只有一个家。

- PRD 管「能不能」：业务规则、谁能做什么、状态怎么流转、阈值是多少。
- 本文件管「怎么调」：接口清单、方法、路径、鉴权级别、退回性质到状态码的映射、
  响应外壳、以及管住全部接口的全局约定。
- 共享 Zod schema 管「长什么样」：字段名、类型、必填与否、取值范围。

本文件不写字段本体。每个接口点名它用哪个 schema，字段定义在 05-类型 产出。
理由：第二节取舍 4 已定「类型由 z.infer 从 Zod schema 推导，不手写 DTO」。
      契约文档若手写字段，等于换个文件继续手写 DTO，与取舍 4 相悖。
代价：schema 尚未产出前，本文件的 schema 名字指向尚不存在的东西。
      缓解：名字在本课定死，05-类型 按名字交货，名字即接缝。

响应外壳同此口径（API-3）：本文件写外壳要表达哪几样东西、各给前端什么用；
外壳的字段名、类型同样归共享 schema，本文件只点名外壳 schema 的名字。

## 一、全局约定

本节管住全部接口。第二节每个接口只写自己的方法、路径、鉴权级别和所用 schema，本节写过的不再重复（API-1）。

### 1. 适用范围与标准

- 本节对全部接口生效（API-1）。
- 字段名、类型、必填与否、取值范围不在本节。它们归共享 Zod schema（API-1、ARCHITECTURE 第二节取舍 4）。
- 本节点名的 schema 名字就是接缝。05-类型 按名字交货（API-1）。
- 本节提到的标准只写名字。原文出处与核对记录见 docs/arch/STANDARDS.md「登记表」（API-5）。
- 偏离主参考的地方，本节只写指针。理由见 docs/arch/STANDARDS.md「偏离登记」（API-10、API-20、API-22、API-33、API-57）。

### 2. 路径与前缀

- 所有接口挂在 `/api` 前缀下（API-6）。
- 前缀由后端统一加，只定义一处。Nginx 原样转发，不剥前缀（API-6）。
- 路径不带版本号（API-6）。
- 出现第二个调用方时，按当时的主参考加版本（API-6）。
- 路径段一律小写，单词之间用连字符（API-51 第六点）。
- 资源名用复数（API-51 第六点）。
- 只有一个的子资源（如本项目的负责人、任务的状态、项目的汇总）用单数，偏离 Zalando #134，理由见 docs/arch/STANDARDS.md「偏离登记」（API-57 修订）。
- 路径只写名词，不带动词；动作只用 HTTP 方法表达（API-58）。
- 接口都在 NestJS。本版 Next.js 不写 Route Handler（API-7）。
- 将来 Next.js 要写 Route Handler，不得用 `/api` 前缀（API-7）。
- 浏览器发请求用相对路径（`/api/...`），不写域名（API-13）。
- 只有服务端渲染配后端的内网地址（API-13、T15）。
- 本地开发由 Next.js rewrites 把 `/api` 转给本地后端。只在开发环境打开（API-12）。
- 任务类接口的路径嵌套项目 id（T2）。
- 路径参数不做格式校验，和查询参数分开处理（T3）。
- 路径 id 转不成数字，视为查不到，按「看不见」退回（决策 B、API-21）。
- 凡路径带项目 id 的写接口，项目一律以路径为准，不从请求体取（决策 D、API-51 第四点）。
- 请求体里多带了项目 id，按多余字段拒绝，回「参数不合法」，见第 4 小节（API-31、API-51 第四点）。

### 3. 会话凭据与跨站防护

凭据：
- 会话凭据只用 HttpOnly Cookie。放在请求头里的凭据一律不收（API-8）。
- Cookie 属性：Secure（本地也加）、HttpOnly、SameSite=Lax、不设 Domain、Path 为 `/`、Max-Age 与服务端会话期限一致（API-8、API-9）。
- 过期以服务端为准（API-8）。
- 会话固定 30 天。不续期，不设空闲超时（API-10、T4）。
- 这一条偏离 OWASP 会话管理，理由见「偏离登记」（API-10）。
- 纯读请求不写 sessions（T4）。
- 每次注册、登录都新建会话（API-8、API-53）。
- 注册、登录成功时，请求里带着的有效旧会话在同一次请求里先删掉；失败时照旧（API-8 补充，问 625 A）。
- 登出删掉服务端会话，并让浏览器清掉 Cookie（API-8）。
- 会话已经失效时调登出，照样回「未登录」，前端照常跳登录页（API-8 补充）。
- 服务端渲染把浏览器带来的 Cookie 原样转发给后端（API-8、T15）。

跨站请求伪造：
- 防护用 NestJS 自带的，要求 NestJS 12.1 起（API-11）。
- 先看 Sec-Fetch-Site。没有这个头，再比 Origin 与 Host（API-11）。
- GET、HEAD、OPTIONS 放行。所以这三种方法不得改数据（API-11）。
- 其余方法都要过这道检查，含部分更新用的 PATCH（API-11、API-50）。
- 被拒回 403，性质为「跨站被拒」，见本节第 6 小节（API-11、API-29）。
- 这道检查排在中间件与 Guard 之前（API-23）。
- 服务端渲染只发读请求（API-48）。
- 写请求一律从浏览器经 api client 发。本版不用 Next.js Server Actions（API-48）。
- SameSite=Lax 拦跨站的 POST、PUT、PATCH、DELETE（API-9、API-50）。
- SameSite=Lax 只作纵深防护，不替代这道检查（API-9）。
- 本地经 rewrites 转发后，Set-Cookie 与 Sec-Fetch-Site 是否原样，Lec 9 实测（API-12）。

身份与角色：
- 项目内角色由项目列表的每一项与项目详情下发，带「我在本项目的角色」（API-34、ARCHITECTURE 第二节决策 Q1）。
- 执行者拿到的项目信息，照 PRD 审定决策 D11、D17（API-34）。
- 前端拿到的角色只用来渲染入口，不构成授权（决策 Q1）。
- 角色只在本次页面上下文内使用，不做跨页面长缓存（决策 Q1）。
- 每个受限接口由后端 Guard 自己查成员表判定。前端传来的任何角色信息都不信（决策 Q1）。
- 当前用户身份由单设的「当前用户」接口下发，返回当前用户的 id 与邮箱（API-34）。
- 刷新页面与服务端渲染都靠这个接口取身份（API-34）。
- 注册、登录成功的响应带同一个用户形状，见第 5 小节（API-34、API-53）。
- 「当前用户」接口的路径、所属模块与 schema 名，随第二节接口清单定（API-34）。

### 4. 请求格式

媒体类型：
- 有请求体的接口只收 `application/json`（API-27）。
- 比对时忽略媒体类型的参数，`application/json; charset=utf-8` 也收（API-51 第三点）。
- Content-Type 不对，回「格式不支持」（API-27）。
- 这道检查用拦截器做，排在 Guard 之后、Pipe 之前（API-46）。
- 几种退回同时成立时谁先回，见第 6 小节（API-46）。
- 框架会不会在 Guard 之前自己回 415，未核。写后端代码时实测（API-27、API-46）。
- 「格式不支持」只看 Content-Type。请求体不是合法 JSON，回「参数不合法」，见第 6 小节（API-46、API-47）。

命名与校验：
- 字段名与查询参数名用 camelCase（API-22、ARCHITECTURE 第二节「命名规范」）。
- 这一条偏离主参考 Zalando 第 118、130 条，理由见「偏离登记」（API-22）。
- 请求体与查询参数的形状和类型，由后端自写的 Zod 管道按共享 schema 校验（T1、T3）。
- 校验不过，回「参数不合法」（API-14）。

多余字段：
- 请求体出现 schema 没列的字段，一律拒绝，回「参数不合法」（API-31）。
- 外壳用 ValidationProblemDetails，逐项列出多出来的键（API-31）。
- 不照 Zod 的默认把多余字段静默剔除（API-31）。
- 查询参数里出现 schema 没定义的参数，同样拒绝，回「参数不合法」，外壳与列法同上（API-56）。

必填与空白：
- 必填文本字段照下面两条处理。适用哪些字段、最大长度多少，归 schema（API-1、API-32）。
- 去掉首尾空白后为空的，按没填处理，回「参数不合法」（API-32）。
- 存的是去掉首尾空白后的值（API-32）。
- 密码不照上面两条：原样收，不去首尾空白，也不截断（API-32 补充，问 576 A）。
- 去空白在哪一层做，见 BACKLOG 79（ADR-DB-008）。

没传与 null：
- 新建接口里，可空字段没传与传 null 同义，都表示空（API-54）。
- 如新建任务不带负责人，和负责人传 null 一样（API-54）。
- 更新接口照 JSON Merge Patch（RFC 7396）的规则：没传的字段不改，传 null 表示清空（API-33）。
- null 只对可空字段有效，如任务的负责人、截止日期（API-33）。
- 对不可空字段传 null，回「参数不合法」（API-33）。
- 负责人把任务改回未分配，就是把负责人传 null（API-33、PRD 审定决策 D16）。
- 哪些字段可空，归 schema（API-1）。
- 更新请求仍只收 `application/json`，不用 RFC 7396 登记的 `application/merge-patch+json`。偏离理由见「偏离登记」（API-33、API-27）。

方法：
- 部分更新用 PATCH，请求体照上面的更新规则（API-50、API-33）。
- 整个替换一个资源用 PUT（API-50 补充，问 588 A）。

时间格式（请求与响应通用）：
- 时间点一律用 UTC，照 RFC 3339 写（API-41）。
- 日期与时刻之间用大写 T，结尾用大写 Z，如 `2019-07-30T06:43:40.252Z`（API-41）。
- 截止日期是纯日期，写成 `YYYY-MM-DD`，不带时刻与时区（API-41、ADR-DB-003 修订）。
- 本版没有接口收时间点。以后要收，也只收以 Z 结尾的写法（API-41）。

邮箱：
- 邮箱存用户输入的原样，只去掉首尾空白（API-55）。
- 注册查重、登录、按邮箱邀请成员时，整个地址不分大小写比较（API-55）。
- 这条规则由数据库列类型兜住：users.email 用 citext，带唯一约束（API-55、ADR-DB-008）。
- 三个入口照常按邮箱查，不各自处理大小写（ADR-DB-008）。

### 5. 成功响应

形状：
- 成功响应不加统一外包装（API-18）。
- 成功响应的媒体类型是 `application/json`（API-51 第二点）。出错时见第 7 小节。
- 单个资源直接返回对象（API-18）。
- 列表接口顶层也返回对象，数组放在其中一个字段里（API-18）。
- 这个字段叫什么归 schema，由 05-类型 定（API-18）。
- 响应里的时间格式见第 4 小节（API-41）。
- 前端解析响应时，容忍多出来的字段（API-31）。

状态码：
- 读取、更新成功回 200，带资源（API-25）。
- 转让负责人是例外：成功回 204，不带内容（API-52）。
- 转让成功后，前端重新取项目信息，按调用者的新角色渲染（API-52、API-34）。
- 新建成功回 201。响应体带新资源和它的 id（API-25）。
- 新资源有能读的地址时带 Location 头，没有就不带，如注册（API-25 补充，问 590 A）。
- 成功但没有内容回 204，如登出（API-25）。

注册与登录：
- 注册成功回 201，响应体带新建的用户（API-53）。
- 登录成功回 200，响应体带当前用户（API-53）。
- 登录虽然新建会话，仍回 200，不回 201（API-53）。
- 两处的用户形状与「当前用户」接口相同（API-53、API-34）。
- 注册、登录都新建会话。会话凭据只经 HttpOnly Cookie 下发（API-53、API-8）。
- 响应体里从不出现会话或它的 id（API-53）。

列表：
- 列表本版不分页，一次返回全部（API-40）。
- 后端按 id 升序返回，只为每次顺序一致（API-40）。
- 按截止日期排序、筛选在前端做（API-40）。
- 顶层是对象，以后加分页不改响应形状（API-40、API-18）。
- PRD 假设账本的规模被推翻时，加游标分页，见 BACKLOG（API-40）。

### 6. 退回性质与状态码

各层出错只抛退回性质，不直接写状态码（API-23）。
全局异常过滤器在一处把性质翻成状态码，照的就是下表（API-23）。
实现落点见 ARCHITECTURE 第二节「后端分层」第 6 条（API-23）。

| 退回性质 | 状态码 | 什么时候 | 依据 |
|---|---|---|---|
| 未登录 | 401 | 凭据缺失或无效；登录时凭据错 | API-14、API-16 |
| 看不见 | 404 | 项目不存在或不是成员；任务不存在、不属于本项目或不属于自己；路径 id 转不成数字；路径不存在 | API-15、API-21、API-47、T2、决策 B |
| 不许做 | 403 | 看得见，但这个动作不许做，如执行者调负责人专用的「改任务」接口 | API-14、API-21、API-35 |
| 跨站被拒 | 403 | 跨站请求伪造检查不过 | API-11、API-29 |
| 参数不合法 | 400 | 请求本身不合法，或它引用的别的资源不符合要求；如形状或类型不符、多出 schema 没列的字段、必填项去空白后为空、对不可空字段传 null、请求体不是合法 JSON、assignee 不是本项目成员 | API-14、API-31、API-32、API-33、API-38、API-47、T1、T5、决策 E |
| 冲突 | 409 | 与目标资源（或它所在集合）的当前状态冲突；如邮箱已被使用、已在项目中、唯一负责人移出自己；含并发写入撞上唯一约束 | API-14、API-28、API-37、API-38 |
| 格式不支持 | 415 | 有请求体，但 Content-Type 不是 `application/json` | API-27 |
| 内部错误 | 500 | 过滤器认不出的错误 | API-14、API-23 |

- 400 与 409 按目标资源分（API-38）：
  - 请求与它要新建、修改、删除的资源（或该资源所在的集合）的当前状态冲突，回 409「冲突」。
  - 请求本身不合法，或它引用的别的资源不符合要求，回 400「参数不合法」。
- 不用 422（API-14）。
- 框架自己拦下的退回（不是本项目代码抛的），能对上现有性质的就并进去（API-47）：
  - 路径不存在，算「看不见」（404）。
  - 请求体不是合法 JSON，算「参数不合法」（400）。
- 对不上的保留标准码，type 用 `about:blank`，见第 7 小节（API-47、API-14）。
- 两种都由后端收成第 7 小节的外壳（API-17）。
- 网关错误不经后端，不带本项目外壳（API-14）。
- 回 401 必须带 WWW-Authenticate 头，方案名为 `Session`（API-20）。
- challenge 只写方案名，不带 realm（API-51 第五点）。
- 这个方案名没在 IANA 登记，理由见「偏离登记」（API-20）。
- 并发写入撞上唯一约束时，由该表的 Repository 翻成「冲突」（API-28）。
- 注册时邮箱已被使用照回「冲突」：PRD「US-A01 用户注册」要求提示「该邮箱已被使用」；登录另行防枚举（API-16），两处有意分开。

改任务的两个接口（API-35）：
- 字段级权限变成路由级：改任务拆成负责人专用的「改任务」与两种角色都能调的「改状态」。路径随第二节接口清单定。
- 执行者调「改任务」，由 AuthzGuard 按角色回「不许做」（API-35）。
- 执行者用「改状态」改不分给自己的任务，回「看不见」。归属在 Service 里先判（API-35、API-15）。
- 往「改状态」多带别的字段，按多余字段回「参数不合法」，不回「不许做」（API-35、API-31）。

谁先回（API-46）：
- 几种退回同时成立时，先拦的先回。依次是：跨站检查、AuthGuard、AuthzGuard、Content-Type 检查、Pipe、Service。
- 不是成员的请求，不论 Content-Type 对错，都先回「看不见」（API-46、API-21）。
- 请求体由框架在 Guard 之前解析，不在上面的顺序里。不是合法 JSON 回「参数不合法」，项目在不在都回同样的 400（API-46、API-47）。
- 所以没登录时发来不合法的 JSON，先回「参数不合法」（400），不回「未登录」（401）。前端靠 401 跳登录页，这种情况跳不了（API-46 补充，问 592 A）。
- 解析时机写后端代码时实测（API-46）。

### 7. 错误外壳

- 所有接口出错都回 RFC 9457 形状，媒体类型为 `application/problem+json`（API-17）。
- 框架自带的退回，也由后端收成这个形状（API-17）。
- 外壳的 schema 名为 ProblemDetails（API-3、API-17、API-30）。
- 外壳表达五样东西，各给前端的用处如下（API-3、API-17）：
  - type：机读的问题类型。前端按它出中文提示（API-19）。
  - title、detail：文字说明。只作开发排查与兜底（API-19）。
  - status：状态码（API-17）。
  - instance：这一次出错的编号。生成规则见下面（API-26）。
  - 扩展部分：需要时加，如 400 时的逐项问题（API-17）。
- instance 由全局异常过滤器在每次出错时生成：一个随机 UUID，用第 4 版，写成 `urn:uuid:` 开头（API-26、API-23；版本见 API-26 补充，问 594 A）。
- 同一编号写进服务端日志。日志怎么记，留到讲可观测性那一课（API-26）。
- instance 的生成规则归本文件，schema 只定它是字符串（API-51 第一点）。
- 带逐项问题的 400 外壳，schema 名为 ValidationProblemDetails（API-17、API-30）。
- type 的字面值归共享 schema，名为 ProblemType（API-24、API-30）。
- 以上三个名字只定主体。写不写 Schema 后缀，照 05-类型 的命名规则（API-30）。
- 关于 type，本文件只定两件事：「退回性质 → 状态码」的映射，见本节第 6 小节（API-24）；`about:blank` 什么时候用，见下一条（API-47）。
- 框架拦下的退回对不上现有性质时，type 用 RFC 9457 登记的 `about:blank`，title 照该状态码的标准短语（API-47）。
- `about:blank` 这个字面值同样收进 ProblemType（API-24、API-47）。
- 401 的外壳不附任何字段指向（API-17）。
- 登录失败不区分是邮箱错还是密码错（API-16）。
- 不暴露堆栈（API-17）。

### 8. 前端怎么读退回

- 给用户看的中文提示，由前端按 type 出（API-19）。
- 前端不能指望每个出错响应都是 problem JSON（API-19）。
- 收到网关错误，按加载失败处理（API-14）。
- type 为 `about:blank` 的退回，出通用提示（API-47）。
- 「看不见」和「不许做」，界面上都显示「权限不足」（API-4、API-21）。
- 路径不存在也算「看不见」，所以前端打错路径时，界面同样显示「权限不足」（API-47、API-21）。
- 「跨站被拒」有单独的 type，前端另出提示（API-29）。
- 在登录页收到 401，显示「邮箱或密码不正确」（API-16）。
- 不在登录页收到 401，跳登录页（API-16）。
- 提交前的校验提示本来就在前端，不靠后端的 title、detail（API-19）。

### 9. 所有响应共有的头

- 所有接口的响应一律带 `Cache-Control: no-store`，含登录、注册（API-44）。
- 成功与出错都带（API-44）。
- 由后端统一加，不靠各接口自己写（API-44）。
- 挂在哪一层，写后端骨架时定。要盖住在中间件之前就退回的跨站被拒（API-44、API-23）。
- 也要盖住第 6 小节说的框架退回，如路径不存在、请求体不是合法 JSON。网关错误不经后端，不带这个头（API-44 补充，问 596 A）。
- no-store 只作多一层保护，不能单靠它保密（API-44）。

## 二、接口清单

本节列出本版全部 17 个接口，按代码所在的模块分组。每个接口写七样：方法与路径、鉴权级别、请求的 schema、响应的 schema、成功码、可能的退回性质、依据。退回只写性质，状态码照第一节第 6 小节的映射表；要靠专门的 type 才分得开的退回，标「专门的 type」，字面值归 ProblemType，本节不写。没标的，与同一性质的其他退回共用一个 type（API-24 补充，问 611 A、627 A）。

第一节写过的不再重复（API-1）。第 1 到 3 小节是各接口共用的读法，第 4 到 6 小节逐个列接口，第 7 小节列本版没有接口的部分。

### 1. 鉴权级别

- 公开：不挂 AuthGuard。只有注册、登录两个接口（API-8 补充）。
- 只要登录：只挂 AuthGuard。路径里没有项目 id 的接口用这一档。AuthzGuard 要拿路径里的项目 id 查成员表，没有就判不了（API-2）。
- 本项目成员：挂 AuthGuard 与 AuthzGuard，负责人、执行者都放行。执行者只能碰分给自己的任务，这一条由 Service 判，判不过回「看不见」（API-35、API-42）。
- 只有负责人：挂 AuthGuard 与 AuthzGuard。执行者调用，由 AuthzGuard 回「不许做」（API-35、API-42）。

### 2. 各接口共有的退回

下面几种，各接口不再列。几种同时成立时谁先回，见第一节第 6 小节「谁先回」（API-46）。

- 内部错误：全部接口（API-14）。
- 看不见：路径不存在（API-47）。路径带项目 id 的接口，还有三种：项目不存在、调用者不是本项目成员、路径 id 转不成数字（API-15、API-21、决策 B）。
- 未登录：公开接口以外的全部接口（API-14）。
- 跨站被拒：GET 以外的全部接口。专门的 type（API-11、API-29）。
- 格式不支持：带请求体的全部接口（API-27）。
- 参数不合法：带请求体的全部接口。有四种：形状或类型不符；多出 schema 没列的字段，含请求体多带项目 id；必填项去空白后为空；请求体不是合法 JSON（API-14、API-31、API-32、API-47、决策 D）。GET 接口带了 schema 没定义的查询参数，也回这一种。本版 GET 接口都不收查询参数（API-56）。
- 冲突：写接口在并发下撞上数据库唯一约束（API-28）。撞的是注册、邀请成员那两条唯一约束的，回各自那一种专门的 type；撞的是「每个项目至多一个负责人」的（ADR-DB-006），回冲突的默认 type（API-28 补充，问 630 A）。

### 3. schema 名字

- 只定名字主体。写不写后缀，照 05-类型 为全部 schema 定的命名规则（API-1、API-30）。
- 请求体的名字写成「动作 + 资源 + Request」。动作跟着方法走：POST 写 Create，PATCH 写 Update，PUT 写 Replace（API-30 补充，问 626 A）。
- 响应用资源名。列表接口顶层是一个外壳对象，数组放在外壳的哪个字段里，归 schema（API-18）。
- 列表接口响应的外壳写成「List + 资源复数 + Response」，如 ListProjectsResponse（API-30 补充，问 631 A）。
- 列表的每一项与这个资源的详情同一形状，用同一个名字（API-30 补充，问 628 A）。
- 一个资源按调用者角色给不同形状时，仍用一个名字。几种形状在 schema 里怎么写，归 05-类型（API-30 补充，问 629 A）。

### 4. auth 模块

/api/users 下的两个接口（注册、当前用户），代码也在 auth（API-34 补充）。

#### 注册

- 方法与路径：`POST /api/users`
- 鉴权级别：公开
- 请求：CreateUserRequest
- 响应：User
- 成功：201，响应体带新建的用户。不带 Location（API-25 补充）。
- 退回：冲突（邮箱已被使用），专门的 type；并发下撞上邮箱唯一约束也回这一种（API-28 补充）。参数不合法（如密码不合规则）。
- 依据：US-A01；PRD 审定决策 D9；API-8 补充（问 613 B、625 A）、API-24 补充、API-25 补充、API-28 补充、API-32 补充、API-34、API-34 补充、API-38、API-53、API-55、API-58 已定。

#### 登录

- 方法与路径：`POST /api/sessions`
- 鉴权级别：公开
- 请求：CreateSessionRequest
- 响应：User
- 成功：200，响应体带当前用户。新建的会话不交给调用方，所以不回 201（API-53）。
- 退回：未登录（凭据错，不区分邮箱错还是密码错，API-16）。
- 依据：US-A02；PRD 审定决策 D7；API-8 补充（问 613 B、625 A）、API-10、API-16、API-20、API-34、API-53、API-55、API-58 已定。

#### 登出

- 方法与路径：`DELETE /api/sessions/self`。会话从 Cookie 里认，self 作伪编号，与当前用户接口是同一个 self 例外（API-34 补充）。会话的 id 不出现在任何响应里（API-53）。
- 鉴权级别：只要登录
- 请求：无
- 响应：无响应体
- 成功：204。删掉服务端会话，并让浏览器清掉 Cookie（第一节第 3 小节）。
- 退回：只有第 2 小节的共有退回。会话已经失效时回「未登录」（API-8 补充，问 614 A）。
- 依据：US-A03；API-8、API-8 补充（问 614 A）、API-25、API-34 补充、API-53、API-58 已定。

#### 当前用户

- 方法与路径：`GET /api/users/self`
- 鉴权级别：只要登录
- 请求：无
- 响应：User
- 成功：200
- 退回：只有第 2 小节的共有退回。
- 依据：US-A02；API-34、API-34 补充（问 606 A）、API-53。

### 5. projects 模块

#### 我所在的项目列表

- 方法与路径：`GET /api/projects`
- 鉴权级别：只要登录。只回调用者是成员的项目。由 Service 按当前用户过滤，不收过滤参数。这照 OWASP Authorization Cheat Sheet 的最小权限，必须档，与 API-42 同一思路。
- 请求：无
- 响应：ListProjectsResponse，每一项是 Project
- 成功：200
- 退回：只有第 2 小节的共有退回。
- 依据：PRD 权限矩阵「查看我所在的项目列表」一行；PRD 审定决策 D11、D17；API-2、API-18、API-34、API-40、API-42、API-58 已定。

#### 创建项目

- 方法与路径：`POST /api/projects`
- 鉴权级别：只要登录（API-2）
- 请求：CreateProjectRequest
- 响应：Project
- 成功：201，响应体带新项目，带 Location 指向这个项目的项目详情。创建者成为负责人（API-2）。
- 退回：参数不合法（如名称去空白后为空，API-32）。
- 依据：US-P01；PRD 审定决策 D4；API-2、API-25、API-32、API-34。

#### 项目详情

- 方法与路径：`GET /api/projects/{projectId}`
- 鉴权级别：本项目成员
- 请求：无
- 响应：Project。执行者那份只带名称与自己的角色（PRD 审定决策 D11、D17）；负责人那份带什么、两份是否同形，归 05-类型（API-1、API-34 补充）。
- 成功：200
- 退回：只有第 2 小节的共有退回。
- 依据：US-P02、US-R02；PRD 审定决策 D11、D17；API-34、API-34 补充（问 632 A）、API-52；ARCHITECTURE 第二节决策 Q1。

#### 成员列表

- 方法与路径：`GET /api/projects/{projectId}/members`
- 鉴权级别：只有负责人
- 请求：无
- 响应：ListMembersResponse，每一项是 Member，按用户 id 升序（第一节第 5 小节、API-59）
- 成功：200
- 退回：不许做（执行者）。
- 依据：US-P03；US-01（项目主页的成员任务状态区要用它，API-42 补充）；PRD 审定决策 D11；PRD 澄清注记 4；API-40、API-42、API-42 补充（问 609 B）、API-59。

#### 邀请成员

- 方法与路径：`POST /api/projects/{projectId}/members`
- 鉴权级别：只有负责人
- 请求：CreateMemberRequest
- 响应：Member
- 成功：201，响应体带新成员。不带 Location，因为没有读单个成员的接口（API-25 补充）。
- 退回：参数不合法（邀请的邮箱没有注册），专门的 type（API-38）。冲突（已在项目中），专门的 type；并发下撞上成员唯一约束也回这一种（API-28 补充）。不许做（执行者）。
- 依据：US-P02、US-R02；PRD 审定决策 D5、D10；API-24 补充、API-25 补充、API-28、API-28 补充、API-31、API-38、API-55、API-59。

#### 移出成员

- 方法与路径：`DELETE /api/projects/{projectId}/members/{userId}`。{userId} 用被移出者的用户 id（API-59）。
- 鉴权级别：只有负责人
- 请求：无
- 响应：无响应体
- 成功：204
- 退回：冲突（负责人移出自己，也就是移出唯一的负责人），专门的 type（API-37）。看不见（被移的人不是本项目成员，API-37 补充；{userId} 转不成数字，在 Service 里退回，ARCHITECTURE 第三节决策 B）。不许做（执行者，含移出自己，PRD 审定决策 D14）。
- 代码落点：随「成员移出编排」，建后端骨架时定（ARCHITECTURE 第一节「依赖方向」）。
- 依据：US-P04；PRD 审定决策 D14；API-25、API-37、API-37 补充（问 612 A）、API-38、API-59；ARCHITECTURE 第三节决策 B。

#### 转让负责人

- 方法与路径：`PUT /api/projects/{projectId}/owner`
- 鉴权级别：只有负责人
- 请求：ReplaceProjectOwnerRequest
- 响应：无响应体
- 成功：204（API-52）。转给自己也回 204，什么都不改（API-39）。
- 退回：参数不合法（新负责人不是本项目成员，API-39）。不许做（执行者）。
- 依据：US-R02；PRD 审定决策 D10、D17；API-36、API-36 补充（问 604 A）、API-39、API-50、API-52、API-57 修订、API-57 已定。

### 6. tasks 模块

项目汇总的路径挂在项目下，代码在 tasks（ARCHITECTURE 第一节决策 5）。

#### 任务列表

- 方法与路径：`GET /api/projects/{projectId}/tasks`
- 鉴权级别：本项目成员。Service 按角色过滤：负责人拿全项目任务，执行者只拿分给自己的（API-42）。
- 请求：无
- 响应：ListTasksResponse，每一项是 Task，按调用者角色给（API-43）。
- 成功：200
- 退回：只有第 2 小节的共有退回。
- 依据：US-03、US-06、US-07、US-02a、US-08；US-01（项目主页的成员任务状态区由前端拿本接口加成员列表拼，API-42 补充）；PRD 审定决策 D6、D11、D13；API-40、API-41、API-42、API-42 补充（问 609 B）、API-43；T2。

#### 任务详情

- 方法与路径：`GET /api/projects/{projectId}/tasks/{taskId}`
- 鉴权级别：本项目成员。执行者只能看分给自己的，由 Service 判（API-15）。
- 请求：无
- 响应：Task，按调用者角色给（API-43）。
- 成功：200
- 退回：看不见（任务不存在、不属于本项目，或执行者看的不是分给自己的任务，API-4、API-15；{taskId} 转不成数字，在 Service 里退回，ARCHITECTURE 第三节决策 B）。
- 依据：US-03、US-06、US-07、US-08；API-4、API-15、API-43；T2、决策 B。

#### 创建任务

- 方法与路径：`POST /api/projects/{projectId}/tasks`
- 鉴权级别：只有负责人
- 请求：CreateTaskRequest
- 响应：Task
- 成功：201，响应体带新任务，带 Location 指向这个任务的任务详情（API-25）。
- 退回：参数不合法（任务负责人不是本项目成员，决策 E）。不许做（执行者）。
- 依据：US-03、US-06、US-08、US-02a；PRD 审定决策 D2、D3；API-25、API-31、API-32、API-38、API-41、API-43、API-54；T5、决策 D、决策 E；ADR-DB-006（分配要拿的锁，见 ARCHITECTURE 第一节「依赖方向」）、ADR-DB-007。

#### 改任务

- 方法与路径：`PATCH /api/projects/{projectId}/tasks/{taskId}`
- 鉴权级别：只有负责人（API-35）
- 请求：UpdateTaskRequest。没传与 null 照第一节第 4 小节（API-33）。
- 响应：Task
- 成功：200
- 退回：
  - 参数不合法，有三种。任务负责人不是本项目成员（决策 E）。对不可空字段传 null（API-33）。请求体带了状态：状态归改状态接口，按多余字段处理（API-31、API-35）。
  - 看不见（任务不存在或不属于本项目；{taskId} 转不成数字，在 Service 里退回，ARCHITECTURE 第三节决策 B）。
  - 不许做（执行者）。
- 依据：US-02a、US-06、US-08；PRD 审定决策 D3、D15、D16；API-33、API-35、API-38、API-43、API-50；决策 B、决策 E；ADR-DB-006、ADR-DB-007。

#### 改状态

- 方法与路径：`PATCH /api/projects/{projectId}/tasks/{taskId}/status`
- 鉴权级别：本项目成员。执行者只能改分给自己的，由 Service 先判归属（API-35）。
- 请求：UpdateTaskStatusRequest
- 响应：Task，与任务详情同一形状，按调用者角色给（API-35 补充）。
- 成功：200。改成原来的值也回 200，不算状态变化（PRD 澄清注记 12）。
- 退回：看不见（任务不存在、不属于本项目，或执行者改的不是分给自己的任务，API-35；{taskId} 转不成数字，在 Service 里退回，ARCHITECTURE 第三节决策 B）。参数不合法（请求体带了状态以外的字段，API-35）。
- 依据：US-07；PRD 审定决策 D12、D13；PRD 澄清注记 12；API-35、API-35 补充（问 608 A）、API-43、API-50、API-57 修订、API-57 已定；决策 B。

#### 项目汇总

- 方法与路径：`GET /api/projects/{projectId}/summary`
- 鉴权级别：只有负责人（API-42）
- 请求：无
- 响应：ProjectSummary。内容范围见 API-42 补充。
- 成功：200
- 退回：不许做（执行者）。
- 依据：US-04 第一、二条；API-25、API-42、API-42 补充（问 609 B、634 B）、API-57 修订、API-57 已定；ARCHITECTURE 第一节决策 5。

### 7. 本版没有接口的

- users：本版没有接口。/api/users 下的接口，代码在 auth（API-34 补充）。
- authz：横切模块，落在 AuthzGuard，没有接口（ARCHITECTURE 第一节）。
- notifications：本版是空壳，没有接口（API-45）。
- 任务删除、项目删除、成员自行退出：本版都不做（PRD 审定决策 D18、D8、D14）。
- 把成员直接改为执行者：本版没有这个操作，改角色只有转让负责人一种（PRD 审定决策 D10、PRD 澄清注记 15、API-36、API-37）。
- 改密码、改邮箱、找回密码、注销账号：本版都不做（PRD 审定决策 D19）。
- 跨项目总览（US-05）、卡点主动预警（US-02b）、项目风险提示（US-04 第三条）：本版延后（PRD 澄清注记 5、6，API-45）。

## 三、本节裁决汇总

- API-1 字段的唯一真相是共享 Zod schema。本文件只写接口层与全局约定，
  每个接口点名所用 schema，不写字段本体。
- API-2 创建项目不依赖项目内角色。任何已登录用户均可创建，创建者自动成为该项目负责人。
  接口只挂 AuthGuard，不挂 AuthzGuard。
  理由：AuthzGuard 需要「当前用户 id + 路径项目 id」查成员表才能判角色，
        而创建项目时项目尚不存在，路径里没有项目 id，该 Guard 无从判起。
        角色按项目划分，脱离项目不存在角色身份，故「创建项目」一栏在权限矩阵里不成立。
  依据：PRD「US-P01 创建项目」的验收标准写明已登录用户提交即创建成功，创建者自动成为负责人。
        它与权限矩阵「创建项目：负责人可、执行者否」一行同在 PRD「二之二」一节，来源同为 pm 推导，
        同经项目主人审定，两处不分轻重。取前者，凭的是上面的理由：矩阵那一行问的问题不成立。
  回填：PRD 权限矩阵该行改标「不适用」，PRD 错误边界「执行者尝试创建项目」一条删除。
  未定：项目数量上限。本版不设，见 BACKLOG。
- API-3 响应外壳的字段同样归共享 Zod schema。本文件只写外壳要表达哪几样东西、各给前端什么用，
  并点名外壳 schema 的名字。
  由来：第零节把「响应外壳」列给本文件，又写「字段归 schema」，两句读出两个答案
        （第二窗口 architect 核对报出），项目主人裁定按 API-1 同一口径分开。
- API-4 任务不存在与任务不属于自己，界面一律按权限态处理，显示「权限不足」。
  依据：PRD「错误 / 边界规则回填（补课 05-ARCH 定）」一节，属 D3。
  澄清：UI_DESIGN 任务详情一句「按错误态或权限态处理」按失败原因分读：
        网络或服务出错走错误态；不存在、不属于自己走权限态。
  落点：UI_DESIGN 末尾澄清注记；ARCHITECTURE 第二节「三态落点」、CLAUDE.md 第二层 C 同一句改写。
        本文件只登记编号。
- API-5 设计规范主参考：Zalando RESTful API Guidelines。拿不准时先看它；不照单全收，每条按三档判。
  登记：docs/arch/STANDARDS.md。
- API-6 API 前缀 /api。Nginx 原样转发，不剥前缀；后端用 NestJS setGlobalPrefix 统一加，只定义一处。不加版本号。
  理由：浏览器经 Nginx、服务端渲染直连、本地直连三条路上，后端收到的路径同一形状；
        版本号属可选档，唯一调用方是同仓同发的自家前端，主参考 Zalando 也主张尽量不做版本、不进 URL。
  不堵死：出现第二个调用方时，按当时主参考加版本。Nginx 配置写法留 Lec 9。
- API-7 本版不在 Next.js 写 Route Handler。接口都在 NestJS，前端只经 api client 调后端。
  将来要写，不得用 /api 前缀：生产上会被 Nginx 转给后端，本地不会，两边表现不一。
- API-8 会话凭据用 HttpOnly Cookie，只接受 Cookie，不接受请求头携带（OWASP 会话管理）。
  Cookie 属性：Secure（本地也加）、HttpOnly、SameSite 显式写（API-9）、不设 Domain、Path 为 /、
  Max-Age 与服务端会话期限一致，过期以服务端为准。登出删服务端会话并让浏览器清 Cookie；每次登录新建会话。
  服务端渲染把浏览器带来的 Cookie 原样转发（T15）。
  补充（第十二窗口，问 613 B）：注册、登录的请求里带着一个有效的旧会话时（已登录又去注册或登录，换不换账号都算），同一次请求里先删掉旧会话，再新建会话。两个接口照旧是公开接口，不挂 AuthGuard，只是多读一次 Cookie。依据：OWASP Session Management Cheat Sheet「Renew the Session ID After Any Privilege Level Change」一节「the old or previous session ID must be destroyed」（必须），该节指认证是最常见的必须换新会话的场景。没选：不管旧会话、留到过期（核对轮 architect 的推荐，当时标了这一节未核），违反上面的必须；已登录时拒绝注册与登录，想换账号要先登出，前端多一种拒绝。
  补充（第十二窗口，问 614 A）：会话已经失效（过期或被删）时调登出，照样经 AuthGuard 回 401「未登录」，前端照 API-16 跳登录页；不为登出开公开接口的特例。依据：OWASP Session Management Cheat Sheet「Logout Button」一节「the web application must invalidate the session at least on server side.」，会话已失效，服务端没有可作废的；401 的意思保持一个（API-14）。没选：登出不挂 AuthGuard、一律回 204 并清 Cookie，登出成了要另外记住的特例接口。
  补充（第十三窗口，问 625 A）：上面「先删掉旧会话」只在注册、登录成功时做；失败时（凭据错、邮箱已被使用、参数不合法）旧会话照旧，人还是原来的登录状态。依据：OWASP Session Management Cheat Sheet 那一节管的是「after any privilege level change」，失败时权限没变，原文不管这一种（推导）。没选：请求一来就删，成败都删，已登录的人在登录页输错一次密码就被登出。
- API-9 SameSite 取 Lax。拦跨站的 POST、PUT、PATCH、DELETE（PATCH 由 API-50 补）；外链进来的页面请求仍带凭据。
  只作纵深防护，正式防护见 API-11。
- API-10 会话固定 30 天，不设空闲超时（PRD D7、T4）。偏离 OWASP 会话管理的空闲超时与绝对超时建议，
  理由登记在 docs/arch/STANDARDS.md「偏离登记」。
- API-11 跨站请求伪造防护用 NestJS 自带的（12.1 起，enableCsrfProtection）：先看 Sec-Fetch-Site，
  没有再比 Origin 与 Host；GET、HEAD、OPTIONS 放行，故这三种方法不得改数据；拒绝返回 403。
  要求 NestJS 12.1 起，版本锁定见 BACKLOG。
- API-12 本地开发由 Next.js rewrites 把 /api 转给本地后端，只在开发环境打开，本地与生产同源。
  Set-Cookie 与 Sec-Fetch-Site 经转发是否原样，Lec 9 实测。
- API-13 浏览器发请求用相对路径（/api/...），不写域名；只有服务端渲染配后端内网地址
  （T15 的「两套地址」改为一套）。
- API-14 状态码：401 未登录（凭据缺或无效）；403 看得见但不许做（含跨站请求伪造被拒，API-11）；
  400 参数不合法（含业务规则校验，不用 422）；409 与现有数据冲突（如邮箱已被使用、已在项目中）；500 内部错误。
  依据：RFC 9110 第 15 节；主参考 Zalando（#220 用最具体的码，422 不要用）。框架自带的退回保留标准码。
  网关错误不带本项目错误外壳，前端按加载失败处理。
  已核（第三窗口）：401 带什么头见 API-20。
- API-15 看不见的资源一律 404：任务不存在或不属于自己；项目不存在或不是成员。看得见但动作不许做回 403。
  依据：RFC 9110 404「or is not willing to disclose that one exists」。界面文字仍为「权限不足」（API-4），
  前端按错误外壳里的原因出文字。
- API-16 登录凭据错误回 401，错误外壳不区分邮箱错还是密码错（PRD 防枚举）。
  前端：在登录页收到 401 显示「邮箱或密码不正确」；不在登录页收到 401 跳登录页。
- API-17 错误外壳照 RFC 9457（application/problem+json）：type 标问题类型（机读原因），title、detail 为说明，
  status 为状态码，instance 标这一次出错；需要时加扩展部分（如 400 时的逐项问题）。所有接口出错都回此形状，
  框架自带的退回由后端统一收成此形状。401 不附任何字段指向。不暴露堆栈。字段归共享 schema（API-3）。
  依据：RFC 9457；主参考 Zalando #176（MUST support problem JSON）、#177（不暴露堆栈）。
- API-18 成功响应不加统一外包装。单个资源直接返回对象；列表接口顶层也返回对象，数组放在其中一个字段里，
  字段名归 schema（05-类型定）。分页留第 3 组。
  依据：主参考 Zalando #167、#110（顶层用对象，为以后扩展）。
- API-19 给用户看的中文提示由前端按 type 出；后端 title、detail 只作开发排查与兜底。
  依据：Zalando #176「clients must be robust and not rely on a Problem JSON object being returned」；
  网关错误不带本项目外壳；前端提交前的校验提示本来就在前端。
- API-20 回 401 必须带 WWW-Authenticate 头，至少一个 challenge（RFC 9110 第 11.6.1、15.5.2 节，MUST）。
  本项目用自定的方案名 Session：说的是缺一个会话，不暗示凭据放 Authorization 头（RFC 9110 第 11.3 节），也不与 IANA 已登记的方案重名。
  理由：登记表上没有会话 Cookie 类方案；写 Basic，浏览器会弹自带的账号密码框（MDN），绕开前端登录页；
        Chrome 只认 Basic、Digest、NTLM、Negotiate 四种方案，自定名不在其中，不会弹框（推导）。
  没选：未登录改回 403、不带头（Django REST framework 的做法），要推翻 API-14 一行与 API-16；
        回 401 不带头，违反 MUST。
  偏离：自定方案名没在 IANA 登记，理由登记在 docs/arch/STANDARDS.md「偏离登记」。
- API-21 退回性质「权限不足」拆成两个：「看不见」回 404（资源不存在，或不让你知道它存在，API-15）；
  「不许做」回 403（看得见但动作不许做，API-14）。界面文字照旧都显示「权限不足」（API-4）。
  由来：第三窗口 architect 核对报出，ARCHITECTURE 第二、三节一个性质名对着两个状态码。
  落点：ARCHITECTURE 第二节例子块、第三节走查改用新名字；本文件第一节的映射表用新名字。
- API-22 API 的字段名与查询参数名用 camelCase（ARCHITECTURE 第二节「命名规范」）。
  偏离主参考 Zalando 第 118 条（JSON 属性名 MUST 用 snake_case）与第 130 条（查询参数同），
  理由登记在 docs/arch/STANDARDS.md「偏离登记」。
- API-23 各层出错只抛「退回性质」，不直接写状态码。全局异常过滤器一处把性质映射成状态码，
  收成 RFC 9457 形状（API-17），401 时补 WWW-Authenticate（API-20）。
  Guard 拒绝时必须抛错，不得只返回 false：返回 false 时框架固定抛 ForbiddenException、回 403，
  会把 401、404 都变成 403（NestJS 官方文档 Guards 一页）。
  过滤器挂在全局：跨站请求伪造检查排在中间件与 Guard 之前，被拒的请求只有全局过滤器接得到
  （NestJS 官方文档 CSRF 一页）。
  错误类型与过滤器放在后端一个横切目录，名字建后端骨架时定。
  理由：映射与本文件第一节的表一一对应，改一处就够；Service 不沾状态码，守住 ARCHITECTURE 第二节
        Service「不做：解析 HTTP」。
  没选：各层直接抛框架自带的 HTTP 异常，状态码散在各层；错误类型各模块自带，同一性质多处定义。
  落点：ARCHITECTURE 第二节「后端分层」第 6 条。
- API-24 错误外壳的 type 字段分开管：本文件第一节列「退回性质 → 状态码」的映射；
  type 的字面值归共享 schema，本文件点名那份 schema，名字见 API-30。与 API-1、API-3 同一口径。
  由来：第零节「本文件管退回性质到状态码的映射」与「取值范围归 schema」两句，
        对 type 能读出两个答案（第三窗口 architect 核对报出）。
  补充（第十三窗口，问 611 A、627 A）：第二节每个接口写退回性质，并标出哪几种要专门的 type，只标要不要，字面值照本条仍归 ProblemType。每种退回性质默认一个 type；只有前端要在同一性质里分出不同提示的，才另起专门的 type。依据：前端照 type 出提示（API-19）；第一节第 8 小节「跨站被拒」有单独的 type，也是按性质给。没选：只写退回性质、不标 type；写 type 字面值（要推翻本条）；每个接口的每种退回各给一个 type；没标的一律用 about:blank（要推翻 API-47）。
- API-25 成功码照 RFC 9110 三分：读取、更新回 200，带资源；新建回 201，响应体带新资源与它的 id，
  新资源有能读的地址时带 Location 头，没有就不带（如登录新建的会话）；成功但没有内容回 204（如登出）。
  依据：RFC 9110 第 15.3.1、15.3.2、15.3.5 节；主参考 Zalando：POST 新建
        「SHOULD return 201 and the new resource object (including the resource identifier)」，
        Location 头在响应体带了新资源时 SHOULD、没带时 MUST。
  修订（同窗口）：原写「并带 Location 头」，改为有能读的地址才带。RFC 9110 第 15.3.2 节允许不带，此时以请求的地址为准。
  修订（第六窗口，问 478 A）：括号里的例子「如登录新建的会话」不再成立：登录回 200、响应体带当前用户，会话只经 Cookie（API-53）。上面原文不改。
  补充（第十一窗口，问 590 A）：注册回 201 不带 Location。能读到这个用户的只有「当前用户」接口，那个地址随会话指向不同的人，不是这个用户自己的地址。RFC 9110 第 15.3.2 节写不带时「by the target URI」，新资源就以注册接口的地址为准，读起来别扭，接受。见第一节第 5 小节。
- API-26 错误外壳的 instance 填每次出错生成的随机编号，写成 urn:uuid: 开头（RFC 9562 第 4 节的 URN 写法）。
  由全局异常过滤器生成（API-23），同一编号写进服务端日志；日志怎么记，留到讲可观测性那一课。
  依据：RFC 9457 第 3.1.5 节，instance 标「the specific occurrence of the problem」，打不开时只作唯一标识；
        「it is RECOMMENDED that absolute URIs be used」。urn:uuid: 是绝对 URI，又不用写域名（API-13）。
  没选：填请求路径，标的是资源不是这一次；相对路径加编号，RFC 说相对写法「can cause confusion」。
  补充（第十一窗口，问 594 A）：随机编号用 UUID 第 4 版，见第一节第 7 小节。依据：RFC 9562 第 5.4 节「UUIDv4 is meant for generating UUIDs from truly random or pseudorandom numbers.」。没选第 7 版：按时间有序，不是纯随机。
- API-27 有请求体的接口只收 application/json。Content-Type 不对回 415，性质名「格式不支持」，
  同样经全局异常过滤器收成 RFC 9457 形状。本条在 API-14 的码表上加一行。
  依据：RFC 9110 第 15.5.16 节；主参考 Zalando 状态码表 415
        「The client did not provide a supported content-type for the request body」。
  未核：框架默认会不会自动回 415。假设要自己加一道检查，写后端代码时实测。
- API-28 并发写入撞上数据库唯一约束时，由该表的 Repository 接住，翻成「冲突」往上抛，
  经全局异常过滤器回 409（API-23）。Service 先查后写照常做，唯一约束是最后一道防线。
  理由：Repository 是这张表唯一的读写出口（ARCHITECTURE 第二节「一表一主」），知道每条唯一约束对应什么；
        Service 不用懂数据库的错误码。
  没选：统一出口认数据库错误，分不清撞的是哪条约束；不翻，落成 500，给用户错的提示。
  未定：Prisma 报这类错的错误码随版本不同，版本未锁（见 BACKLOG），写代码时按锁定的版本查官方错误参考。
  补充（第十三窗口，问 630 A）：撞的是 users.email、成员表「用户 + 项目」这两条唯一约束的，回注册、邀请成员各自那一种专门的 type（「邮箱已被使用」「已在项目中」），与先查就查到时同一个提示；撞的是「每个项目至多一个负责人」的（ADR-DB-006），回冲突的默认 type。依据：上面理由里「Repository 知道每条唯一约束对应什么」。没选：一律回冲突的默认 type，同一件事两种提示。
- API-29 跨站请求伪造被拒单列一种退回性质「跨站被拒」，也回 403，type 单独一个；前端出什么提示由前端定（API-19）。
  统一出口认得出它：本项目代码只抛退回性质（API-23），Guard 不许只返回 false，
  所以过滤器收到的框架 ForbiddenException 只可能来自跨站检查（推导，写后端代码时实测）。
  理由：自家前端正常不会触发这道检查，真被拦多半是代理或转发出了问题；显示「权限不足」会把排查带偏。
  没选：并入「不许做」；当成框架自带的退回处理（框架自带退回的 type 还没定）。
- API-30 错误外壳相关的三个 schema 定名字主体：ProblemDetails（外壳）、ValidationProblemDetails（400 时带逐项问题的外壳）、
  ProblemType（type 的取值）。写不写 Schema 后缀，照 05-类型 为全部 schema 定的命名规则。
  理由：名字是本文件与 05-类型 的接缝（API-1），主体对得上即可；后缀牵涉全部 schema，归 05-类型。
        主体取 RFC 9457 的原词 problem details。
  参考：Zod 官方「基本用法」页的例子，schema 与类型同名、不带后缀（Player）；该页没有命名规定，只作 05-类型 的参考。
  补充（第十三窗口，问 626 A）：第二节其余 schema 同样只定主体。请求体照方法起名：POST 写 Create，PATCH 写 Update，PUT 写 Replace，后接资源名，再加 Request，如 CreateUserRequest。依据：NestJS 官方 CRUD 生成器给的是 CreateUserDto、UpdateUserDto；Google AIP-133「The request message must match the RPC name, with a `Request` suffix.」。PUT 写 Replace 是推导，AIP 没有对应的标准方法。没选：照业务词起，如 RegisterRequest、LoginRequest，名字与路径对不上。
  补充（第十三窗口，问 628 A、629 A）：列表的每一项与这个资源的详情同一形状、同一个名字；一个资源按调用者角色给不同形状时仍用一个名字，几种形状怎么写归 05-类型（API-1）。依据：Google AIP-132「The response should usually include fully-populated resources unless there is a reason to return a partial response」；改状态回整个任务（API-35 补充），前端可直接替换列表那一行。没选：列表另设摘要形状；按角色分两个名字。
  补充（第十三窗口，问 631 A）：列表接口响应的外壳也照方法起名，写「List + 资源复数 + Response」，如 ListProjectsResponse、ListMembersResponse、ListTasksResponse。依据：Google AIP-132「The request and response messages must match the RPC name, with `Request` and `Response` suffixes.」，与问 626 A 同一家同一思路。没选：照起草稿写「资源名 + List」（ProjectList、MemberList、TaskList），请求按动作、列表按资源，两套规则。
- API-31 请求体出现 schema 没列的字段，一律拒绝，回「参数不合法」（400），外壳逐项列出多出来的键（ValidationProblemDetails）。
  请求体里多带的项目 id 同样拒绝；新任务归哪个项目仍只从路径取（决策 D）。响应方向反过来：前端解析响应时容忍多出来的字段。
  依据：主参考 Zalando #109「Unknown input fields in payload or URL should not be ignored;」「servers should provide error feedback to clients via an HTTP 400 response code.」；
        #108 客户端「Be tolerant with unknown fields in the payload」；OWASP Mass Assignment「Explicitly allow-list fields」。
  没选：静默剔除（Zod 默认），前端多传了不报错，错误被藏住；剔除加敏感键黑名单，OWASP 说黑名单不能当唯一防护。
  落点：第一节第 2、4 小节两处「待第 3 组定」，第五批起草时写。
  已落（第一节第 2、4、5 小节）。第 5 小节是响应方向的「前端解析响应时容忍多出来的字段」，上面落点没列。
- API-32 标题、描述、项目名称都必填：去掉首尾空白后为空的，回「参数不合法」；存的是去掉首尾空白后的值。最大长度归 05-类型 在 schema 里定。
  依据：ADR-DB-005「tasks.description 必填」（Lec 5 主人拍板）；PRD「US-P01 创建项目」名称必填；PRD 澄清注记 13。Zalando #109 建议给字符串定长度范围。
  没选：描述可为空串；都允许空串。
  补充（第十窗口，问 481 A）：第一节只写必填的规则，适用哪些字段归 schema（API-1），见第一节第 4 小节「必填与空白」。
  补充（第十窗口，问 576 A）：密码不照上面的规则：原样收，不去首尾空白，也不截断，见第一节第 4 小节。依据：OWASP Authentication Cheat Sheet「Allow usage of all characters including unicode and whitespace.」「Do not silently truncate passwords.」
- API-33 更新接口照 JSON Merge Patch（RFC 7396）的规则：没传的字段不改，传 null 表示清空。null 只对可空字段有效（任务的负责人、截止日期），对不可空字段传 null 回「参数不合法」。
  负责人把任务改回未分配（PRD 审定决策 D16），就是把负责人传 null。媒体类型仍只收 application/json（API-27），偏离理由见 docs/arch/STANDARDS.md「偏离登记」。
  依据：RFC 7396「Null values in the merge patch are given special meaning to indicate the removal of existing values in the target.」；
        主参考 Zalando #123 要求 null 与没传同义，并写明「The only exception to this rule is JSON Merge Patch」。
  没选：另收 application/merge-patch+json，要修订 API-27；null 与没传同义，清空另设接口。
- API-34 当前用户身份与项目内角色分开下发。单设「当前用户」接口，返回当前用户的 id 与邮箱，刷新页面与服务端渲染都靠它取身份；注册、登录成功的响应带同一个用户形状。
  项目列表的每一项与项目详情带「我在本项目的角色」；执行者拿到的项目信息照 PRD 审定决策 D11、D17。
  理由：US-A02 要求刷新后仍能读到「我是谁」，UI_DESIGN 页 3 要显示当前身份；角色随项目响应取得，不做跨页面长缓存（ARCHITECTURE 第二节决策 Q1）。
  参考：GitHub「Get the authenticated user」（GET /user），同类产品做法，只作参考。
  没选：只靠登录响应、前端自存，刷新就丢；身份塞进项目信息，项目列表页拿不到。
  落点：第一节第 3 小节「待第 3 组定」，第五批起草时写；路径、所属模块与 schema 名随接口清单定。
  已落（第一节第 3 小节）。路径、所属模块与 schema 名照旧随接口清单定。
  补充（第十二窗口，问 606 A）：路径为 GET /api/users/self，照 Zalando #134、#143 的 self 例外，不算偏离；代码放 auth 模块：注册已在 auth，/api/users 下的路由在同一个模块，auth 依赖 users 这条线本来就有，不加新依赖。schema 名照旧随接口清单定。
  补充（第十三窗口，问 632 A）：项目详情与项目列表的每一项都叫 Project；执行者那份只带名称与自己的角色（PRD 审定决策 D11、D17），负责人那份带什么、两份是否同形，归 05-类型（API-1）。没选：第二节写定「两种角色同一形状」，D17 只管执行者，那是推导。
- API-35 改任务拆两个接口。负责人专用的「改任务」接口管标题、描述、截止日期、负责人，执行者调用时由 AuthzGuard 按角色回「不许做」；
  「改状态」接口两种角色都能调，执行者只能改分给自己的任务，归属在 Service 里判，先判「看不见」（ARCHITECTURE 第三节 R2-6、R2-7 同一顺序）。两个接口的请求体都照 API-31、API-33。
  理由：PRD 审定决策 D15、D16 与权限矩阵把内容与分配划给负责人，状态两种角色都能改；按 T6，只凭角色能判的归 Guard，字段级权限变成路由级。
  后果：执行者往「改状态」接口多带别的字段，按 API-31 回「参数不合法」，不是「不许做」。
  没选：一个接口由 Service 按字段判（GitHub 是一个接口，但对无权字段悄悄扔掉，与 API-31 相反）；内容、分配、状态拆三个。
  落点：第一节第 6 小节「待第 3 组定」，第五批起草时写；路径随接口清单定。
  已落（第一节第 6 小节）。路径照旧随接口清单定。
  补充（第十二窗口，问 608 A）：改状态写成任务下只有一个的子资源「状态」，用 PATCH（API-57 修订、API-50）。成功回 200，带整个任务，形状与任务详情相同、按角色给：负责人那份带后端重算过的「可能卡住」（API-43），执行者那份不带。这是 API-25「更新回 200，带资源」的一种读法：带的是被改的子资源所在的任务。依据：主参考 Zalando #148「Successful PATCH requests return 200 or 204 (if the resource was updated — with or without returning the resource)」；RFC 9110 第 15.3.1 节的表里没有 PATCH；RFC 5789「Note that other success codes could be used as well.」。没选：只带状态子资源本身，负责人要再取一次才看得到重算后的「可能卡住」；回 204，每次改状态都多一次往返。
- API-36 转让负责人用 PUT 写「本项目的负责人」这个子资源，请求体放新负责人的 userId；只有负责人能调。
  一个事务内改两行：原负责人降为执行者，新负责人升为负责人；加行锁，防止两个转让同时发生。
  转让完成后调用者已是执行者，按 PRD 审定决策 D11 看不见成员列表，响应不带成员列表，具体回什么随接口清单定。
  依据：PRD 审定决策 D10；主参考 Zalando #141「MUST keep URLs verb-free」、#138「create an article lock with PUT or POST instead of using a lock action.」。
  没选：动作式 POST，路径带动词，违反 #141；借通用的改成员角色接口隐式降级，副作用出人意料。
  已定：转给非成员、转给自己见 API-39；路径写法随接口清单定。
  已定（第六窗口，问 477 A）：成功回什么见 API-52。
  补充（第十二窗口，问 604 A）：「本项目的负责人」是只有一个的子资源，照 API-57 修订写单数；请求体照上面原话，放新负责人的 userId。
- API-37 唯一负责人移出自己，回 409「冲突」，配一个专门的 type，前端据此提示「需先转让负责人身份」（PRD「US-P04 移出项目成员」与错误规则）。
  首版单负责人，且没有通用的改角色接口（API-36），「把唯一负责人直接降为执行者」从接口上触发不了，本条只管移出这一种。
  依据：RFC 9110 第 15.5.10 节「This code is used in situations where the user might be able to resolve the conflict and resubmit the request.」：先转让即可化解。
  没选：400 配专门 type；403「不许做」，前端会显示「权限不足」，与 PRD 要求的提示对不上。
  补充（第十二窗口，问 612 A）：移出一个本来就不是本项目成员的人（如负责人连点两下「移出」、手里的成员列表是旧的），回「看不见」404，与 API-15 同一口径；界面显示「权限不足」（API-4），与 API-47 已接受的后果同类。依据：主参考 Zalando #148「Failed DELETE requests will usually generate 404 (if the resource cannot be found)」；RFC 9110 第 9.2.2 节的幂等管的是「the intended effect on the server」，第二次删回 404 不违反幂等。没选：当成功回 204，前端分不清「刚移出」与「本来就不在」；回 409，目标资源不存在，谈不上与它的当前状态冲突（API-38）。
- API-38 400 与 409 按「目标资源」分：请求与它要新建、修改、删除的资源（或该资源所在的集合）的当前状态冲突，回 409「冲突」；请求本身不合法，或它引用的别的资源不符合要求，回 400「参数不合法」。
  对照现有：邮箱已被使用、已在项目中、唯一负责人移出自己（API-37）回 409；assignee 不是本项目成员（决策 E）、转给非成员（API-39）回 400。
  依据：RFC 9110 第 15.5.10 节「due to a conflict with the current state of the target resource.」；第 15.5.1 节「due to something that is perceived to be a client error」。
  没选：「客户端改参数能过回 400、要先改服务端状态才能过回 409」（第 3 组核对提出），邮箱已被使用、已在项目中换参数就能过，会推翻 API-14、API-16；不写判据、逐条定。
- API-39 转让负责人的两种边界：转给不是本项目成员的人，回 400「参数不合法」（API-38，与决策 E 同一思路）；转给自己（调用者本来就是负责人），当作成功，什么都不改。
  理由：和改状态时「改成原值不算变化」同一口径（PRD 澄清注记 12）。成功时回什么随接口清单定。
  没选：转给自己回 400。
- API-40 列表本版不分页，一次返回全部。后端按 id 升序返回，只为每次顺序一致；按截止日期排序、筛选在前端做（US-08）。
  依据：PRD 假设账本的规模（每个项目任务几百条以内、成员十人以内，问 419 A）。主参考 Zalando #159 是必须档，但只管「(potentially) larger than just a few hundred entries」的列表，本版规模在这道门槛下。
  不堵死：顶层是对象（API-18），以后加分页不改响应形状。规模假设被推翻时，照 Zalando #159、#160 加游标分页，见 BACKLOG。
  没选：现在就做游标分页，排序筛选要移到后端，负责人进度视图（US-01「无需翻页」）要另开接口；offset 分页，Zalando #160 要求避免。
- API-41 时间点一律输出 UTC，照 RFC 3339 写，日期与时刻之间用大写 T，结尾用大写 Z，如 2019-07-30T06:43:40.252Z。截止日期是纯日期，写成 YYYY-MM-DD（ADR-DB-003 修订，问 420 A）。
  本版没有接口收时间点；以后要收，也只收以 Z 结尾的写法。
  依据：主参考 Zalando #169（必须）「APIs MUST use the upper-case T as a separator between date and time」，结尾用大写 Z，并建议「only use times without offsets」；#238 date-time 一行「UTC time defined in RFC 3339」。
  没选：输入另收带偏移的写法、由后端换成 UTC；输出带用户所在时区的偏移，后端没存用户时区。
  补充（第十窗口，问 482 A）：时间格式整条写进第一节第 4 小节，请求与响应通用；第 5 小节放指针。
- API-42 任务列表只设一个接口，由 Service 按角色强制过滤：执行者只拿到分给自己的任务，负责人拿到全项目任务。项目汇总（US-04）与成员列表（US-P03）是负责人专用接口，执行者调用时由 AuthzGuard 回「不许做」（403），因为他看得见这个项目（API-21）。
  理由：PRD 审定决策 D6 单页面按角色渲染、D11 执行者可见范围；过滤不靠前端传什么；与 API-35 同一条界线（T6）。
  依据：OWASP Authorization Cheat Sheet 最小权限（必须）。
  没选：拆「全部」「我的」两个列表接口；一个接口要执行者自带 assignee=me 参数，等于把安全过滤交给前端。
  补充（第十二窗口，问 609 B）：项目汇总只给 US-04 的四个数：任务总数、已完成、进行中、未开始。页面上的成员任务状态区（US-01「展示每位成员当前任务及状态」）不由汇总供数，由前端拿任务列表（负责人拿全项目任务）加成员列表来拼：按负责人分组，没有任务的成员也列出。理由：US-01 要的是任务和状态，不是计数，列表里现成都有；本版列表不分页（API-40），排序、分组本来就在前端做；不添新的响应形状。没选：汇总多带按成员分的计数，满足不了 US-01，形状白白变大；不设汇总接口、四个数也由前端数，要推翻本条「项目汇总是负责人专用接口」半句，列表将来分页后前端就数不全。
  补充（第十四窗口，问 634 B）：项目主页上的完成率由前端算，拿汇总里的「已完成」除以「任务总数」；汇总仍只给上面四个数。这段代码只有前端用，不进 packages/shared（ARCHITECTURE 共享层判据第 1 问）。任务总数为 0 时照 UI_DESIGN 页 5 负责人空态（汇总显示 0，引导创建第一个任务），前端不做除法。没选：后端算，汇总多带一个完成率，要另定任务总数为 0 时回什么。将来 US-04 第三条（PRD 澄清注记 5 延后）若做成后端判风险，到时在汇总里加字段，只加不改。
- API-43 「可能卡住」由后端按服务端时钟算，只放进负责人看得到的任务响应；执行者的响应不带这一项（PRD 权限矩阵「查看未认领 / 卡住标记」一行）。计时照 PRD 审定决策 D13，从最近一次状态变化与最近一次分配两者中较晚的那个起算；分配时间记在 tasks 新加的一列，写法见 docs/arch/DECISIONS.md ADR-DB-007。
  理由：规则只有一份，前端不用各算一遍；执行者拿不到这个标记。
  没选：前端拿时间戳自己算，规则两边各一份，执行者的响应也得带上时间戳。
- API-44 所有接口（含登录、注册）的响应一律带 Cache-Control: no-store，成功与出错都带。由后端统一加，不靠各接口自己写；挂在哪一层写后端骨架时定，要盖住在中间件之前就退回的跨站被拒（API-23）。
  理由：PRD 要「刷新就看到最新的」，被缓存的列表会违反它；响应里有会话凭据与项目数据。
  依据：OWASP Session Management Cheat Sheet「Use Cache-Control: no-store on responses containing session identifiers or sensitive session data.」；RFC 9111 第 5.2.2.5 节提醒它「not a reliable or sufficient mechanism for ensuring privacy」，只作多一层保护。
  没选：只给登录、注册发；不定，交给浏览器默认。
  补充（第十一窗口，问 596 A）：也要盖住框架自己挡下的退回（路径不存在、请求体不是合法 JSON）；网关错误不经后端，不带这个头，见第一节第 9 小节。属推导，挂在哪一层写后端骨架时实测。
- API-45 本版契约不列通知接口。notifications 模块本版是空壳（ARCHITECTURE 第一节决策 4），唯一的通知类型「可能卡住」预警属 US-02b，已延后；Lec 13 做 US-02b 时再加接口。
  理由：写没人调用的接口，违反「MVP 先跑通，不为以后可能用提前堆」（CLAUDE.md 第二层 D）。
  没选：列出接口标「本版不实现」，前端可能当真去调；本版就做通知列表与已读，推翻决策 4。
- API-46 「格式不支持」（415）的检查放在 Guard 之后、Pipe 之前，用拦截器做。几种退回同时成立时，先拦的先回：跨站检查、AuthGuard、AuthzGuard、这道格式检查、Pipe、Service。不是成员的请求，不论格式对错，都先回「看不见」（API-21）。
  依据：NestJS 官方「请求生命周期」一页，中间件、Guard、拦截器（进控制器前）、Pipe 依次执行。
  没选：放在中间件里、排在 Guard 前，非成员也会先收到 415；不单独检查，格式不对时请求体解析成空，由 Zod 回 400，API-27 落空。
  补充（第六窗口，问 479 A）：这里的「格式」只指 Content-Type。请求体不是合法 JSON，由框架在 Guard 之前解析失败、回 400（API-47）；解析在任何查询之前，不论项目在不在都回同样的 400，不泄露项目在不在。解析时机写后端代码时实测。
  补充（第十一窗口，问 592 A）：照上面这条补充推下去，没登录时发来不合法的 JSON，先回「参数不合法」（400），不回「未登录」（401），前端这时跳不了登录页，写进第一节第 6 小节「谁先回」。属推导，解析时机写后端代码时实测。
- API-47 框架自己拦下的退回（不是本项目代码抛的），能对上现有性质的就并进去：路径不存在算「看不见」（404），请求体不是合法 JSON 算「参数不合法」（400）。对不上的保留标准码，type 用 RFC 9457 登记的 about:blank，title 照该状态码的标准短语；前端对它出通用提示。
  依据：RFC 9457 第 4.2.1 节；API-14、API-17、API-19。
  没选：全部单设一种「框架退回」type，前端分不开路径不存在与 JSON 坏了；全部用 about:blank。
  补充（第十窗口，问 484 A）：about:blank 什么时候用由本文件定（第一节第 7 小节），这个字面值同样收进 ProblemType（API-24）。
  补充（第十窗口，问 485 A）：路径不存在算「看不见」，所以前端打错路径时界面同样显示「权限不足」，见第一节第 8 小节；接受这个后果，不单设 type。
- API-48 服务端渲染只发读请求。写请求一律从浏览器经 api client 发（ARCHITECTURE 第二节前端分层「数据访问层」），本版不用 Next.js Server Actions。
  理由：跨站检查只守浏览器这一条写路径；服务端渲染直连后端时不带 Sec-Fetch-Site 与 Origin，按 NestJS 官方 CSRF 一页会被放行（推导，见 API-29 同类说明）。
  没选：允许 Server Actions 发写请求，写路径变两条，跨站防护要另想办法。
- API-49 出错时，前端只在「内部错误」（500）的错误块里把 instance 编号给用户看：小字显示，可复制，用户报障时报这个编号，服务端日志里是同一个（API-26）。其余错误不显示编号，用户看提示就知道原因。
  理由：UI 调性「克制、清晰、低干扰」（CLAUDE.md 第二层 C）；编号是随机的，不泄露实现细节（OWASP Error Handling Cheat Sheet 只要求提示通用、不暴露实现细节）。
  没选：所有出错都显示；都不显示，报障时对不上日志。
  落点：UI_DESIGN 文末澄清注记。
- API-50 部分更新用 PATCH，「改任务」「改状态」两个接口（API-35）都是；转让负责人仍用 PUT（API-36），它整个替换「本项目的负责人」这个子资源。API-9 所列被 SameSite=Lax 拦下的方法补上 PATCH。
  依据：主参考 Zalando #148「MUST use HTTP methods correctly」，PATCH「to update parts of the resource objects」；更新规则照 API-33。
  没选：用 PUT，整个替换与「没传不改」对不上；用 POST，路径要带动作，违反 Zalando #141。
  补充（第十一窗口，问 588 A）：推广成全局约定：整个替换一个资源用 PUT，见第一节第 4 小节「方法」。依据：RFC 9110 第 9.3.4 节「The PUT method requests that the state of the target resource be created or replaced」；主参考 Zalando #148「PUT requests are used to update (and sometimes to create) entire resources – single or collection resources.」
- API-51 六项照标准的小项（问 476 A）：
  一，instance 的生成规则（API-26）归本文件，schema 只定它是字符串；与 API-3、API-24 同一分法。
  二，成功响应的媒体类型是 application/json（主参考 Zalando #167），出错时是 application/problem+json（API-17）。
  三，比对请求的媒体类型时忽略参数，application/json; charset=utf-8 也收（RFC 8259「No "charset" parameter is defined for this registration.」）。
  四，凡路径带项目 id 的写接口，项目一律以路径为准，请求体多带的按 API-31 拒绝；决策 D 从新建任务推广到全部写接口。
  五，401 的 challenge 只写方案名 Session，不带 realm（RFC 9110 第 11.5 节：realm 留给要标明保护范围的方案，本项目只有一个保护范围）。
  六，路径段一律小写，单词之间用连字符，资源名用复数（主参考 Zalando #129、#134，均为必须）。
  补充（第十三窗口，问 623 A）：第六点「资源名用复数」以 API-57 修订为准：只有一个的子资源（本项目的负责人、任务的状态、项目的汇总）写单数，偏离 #134。本条原文不改。
- API-52 转让负责人成功回 204，不带内容；前端重新取项目信息，按调用者的新角色渲染（API-34）。这是 API-25「更新成功回 200 带资源」的例外。
  理由：转让完成后调用者已是执行者，按 PRD 审定决策 D17 看不见项目负责人；照 API-25 带回新负责人，就把他刚失去权限看的东西给了他。
  依据：RFC 9110 第 9.3.4 节，PUT 改成功「MUST send either a 200 (OK) or a 204 (No Content)」。
  没选：回 200 只带调用者的新角色，要为它单设响应形状；照 API-25 带新负责人，违反 D17。
- API-53 注册成功回 201，响应体带新建的用户；登录成功回 200，响应体带当前用户。两者都新建会话，会话凭据只经 HttpOnly Cookie 下发（API-8），响应体里从不出现会话或它的 id。用户的形状与「当前用户」接口相同（API-34）。
  理由：注册新建的资源就是用户；登录新建的会话调用方拿不到，算不上交给调用方的新资源。会话放进响应体，页面脚本就能读到，HttpOnly 白设。
  没选：登录也回 201、响应体带用户，作为例外写明，读的人会以为拿到了新资源；登录回 204、前端再调当前用户接口，多一次往返。
- API-54 新建接口里，可空字段「没传」与「传 null」同义，都表示空，如新建任务不带负责人。更新接口照 API-33 区分两者。
  依据：主参考 Zalando #123（null 与没传同义，JSON Merge Patch 例外）。
  没选：新建时只许不传、传 null 回「参数不合法」。
- API-55 邮箱的比较规则：存用户输入的原样（去掉首尾空白后）；注册查重、登录、按邮箱邀请成员时，整个地址不分大小写比较。数据库要有不分大小写的唯一约束，Prisma schema 写不出，写法属决策边界 D2，先回 architect 定（下个窗口）。
  依据：OWASP Email Validation and Verification Cheat Sheet「Domain part: always case-insensitive」，本地部分「technically case-sensitive under SMTP, though many providers do not enforce this in practice」，并要求「Define an explicit comparison policy for the local part」「Preserve the original email address as entered by the user」。
  没选：只把域名转小写，本地部分大小写不同就是两个账号；整个地址转小写再存，不保留原样。
  修订（第十窗口，问 574 甲）：选 citext 后（ADR-DB-008，问 572 A），不分大小写的唯一约束写得进 Prisma schema（@db.Citext）；「Prisma schema 写不出」只对 lower(email) 唯一索引那条路成立。扩展怎么启用随 BACKLOG 74 定。上面原文不改。
- API-56 查询参数里出现 schema 没定义的参数，同样拒绝，回「参数不合法」（400），外壳照 API-31 逐项列出多出来的参数名（问 578 A）。
  依据：主参考 Zalando #109「Unknown input fields in payload or URL should not be ignored;」，URL 含查询参数；本版列表不收参数（API-40），选它几乎没有代价。
  没选：忽略没定义的查询参数，前端把参数名拼错时，错误被藏住。
  落点：第一节第 4 小节「多余字段」。
- API-57 只有一个的子资源，也照 Zalando #134 写成复数集合，规定集合里恰好一个。「本项目的负责人」就是这样：转让用 PUT 整个替换这个集合（API-50），请求体是一个对象，里面一个字段放只含一个元素的数组；字段名与「恰好一个」归 schema（05-类型，API-1）。被换下的原负责人变回执行者，仍是 API-36 那个事务里改两行。
  依据：主参考 Zalando #134（必须）「The special case of a resource singleton must be modeled as a collection with cardinality 1 including definition of maxItems = minItems = 1 for the returned array structure to make the cardinality constraint explicit.」。例外只有 self：编号从登录信息里来时，用它作伪编号（#134、#143）。负责人的编号不从登录信息里来，套不上。
  理由：照主参考做，不添偏离；代价只落在这一个接口的请求体上；首版单负责人（PRD 审定决策 D10），将来放开时路径不用改。
  没选：照 Google AIP-156「Singleton resources are always singular.」写单数，偏离 #134 必须档，要登偏离、第一节第 2 小节加例外句；不设子资源、改项目本身，推翻 API-36、API-50，原负责人被降成执行者变成改项目的副作用。
  未定：「当前用户」接口（API-34）的编号从登录信息里来，落在 self 例外里，路径随接口清单定。
  修订（第十二窗口，问 604 A）：推翻上面的复数写法，改写单数。只有一个的子资源（本项目的负责人、任务的状态、项目的汇总）写单数，偏离 #134，理由登在 docs/arch/STANDARDS.md「偏离登记」。转让负责人照旧用 PUT 整个替换这个子资源，请求体照 API-36 原话放新负责人的 userId，不再包数组；改状态照旧用 PATCH，API-50 不动。上面原文不改。
  由来：上面理由里「代价只落在这一个接口的请求体上」不成立（第十二窗口 architect 核对轮报出）：改状态（API-35 要它和改任务分开路径）、项目汇总也是只有一个的子资源。照复数写，两个写接口的请求体都要多一层数组，改状态还得把 PATCH 改成 PUT，「状态们」也会被读成状态的历史。依据：同一层 Google AIP-156「Singleton resources are always singular.」。
  已定（第十二窗口，问 606 A）：「当前用户」接口的路径与所属模块，见 API-34 补充。
  已定（第十三窗口，问 607 A）：转让负责人 PUT /api/projects/{projectId}/owner，见第二节第 5 小节。
  已定（第十四窗口，问 607 A）：改状态 PATCH /api/projects/{projectId}/tasks/{taskId}/status，项目汇总 GET /api/projects/{projectId}/summary，见第二节第 6 小节。
- API-58 路径只写名词，不带动词；动作只用 HTTP 方法表达。全部接口适用，写进第一节第 2 小节。登录、登出、注册这类口语里是动词的接口，按资源来写，具体名字随接口清单定。
  依据：主参考 Zalando #141（必须）「The API describes resources, so the only place where actions should appear is in the HTTP methods.」「In URLs, use only nouns.」。同一行登记的 #129、#134 已是全局约定（API-51 第六点）；API-36、API-50 已引 #141。
  参考：NestJS 官方认证一页的例子在 auth 下写 sign-in、sign-up，页内没说这是约定，只当教程例子，不压过主参考（判断）。
  没选：不写全局约定，第二节逐个接口落实（第十窗口起草稿的推荐，当时理由是没有裁决可挂）；写全局约定，但登录、登出、注册现在就定为例外，那几个接口还没核对。
  已定（第十三窗口，问 605 A）：注册 POST /api/users，登录 POST /api/sessions，登出 DELETE /api/sessions/self，见第二节第 4 小节。
  已定（第十三窗口，问 605 A）：项目列表 GET /api/projects，后端只回调用者是成员的项目，见第二节第 5 小节。
- API-59 项目成员这个子资源叫 members，路径里的编号用用户 id：成员列表与邀请成员用 /api/projects/{projectId}/members，移出成员用 /api/projects/{projectId}/members/{userId}。
  理由：PRD 与界面都叫「成员」；编号用用户 id，与任务的 assignee、转让负责人的请求体（API-36）是同一种 id；成员表在「用户 + 项目」上有唯一约束，一个用户在一个项目里只有一行，用户 id 就能定位。
  没选：memberships 加成员表自己的 id；memberships 加用户 id。
  由来：第十二窗口 architect 核对轮第一组第 8 条，问 610 A；第十三窗口照问 624 A 编号。{userId} 转不成数字的退回见第二节第 5 小节「移出成员」。
