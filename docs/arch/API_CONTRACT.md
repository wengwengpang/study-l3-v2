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
- 偏离主参考的地方，本节只写指针。理由见 docs/arch/STANDARDS.md「偏离登记」（API-10、API-20、API-22）。

### 2. 路径与前缀

- 所有接口挂在 `/api` 前缀下（API-6）。
- 前缀由后端统一加，只定义一处。Nginx 原样转发，不剥前缀（API-6）。
- 路径不带版本号（API-6）。
- 出现第二个调用方时，按当时的主参考加版本（API-6）。
- 接口都在 NestJS。本版 Next.js 不写 Route Handler（API-7）。
- 将来 Next.js 要写 Route Handler，不得用 `/api` 前缀（API-7）。
- 浏览器发请求用相对路径（`/api/...`），不写域名（API-13）。
- 只有服务端渲染配后端的内网地址（API-13、T15）。
- 本地开发由 Next.js rewrites 把 `/api` 转给本地后端。只在开发环境打开（API-12）。
- 任务类接口的路径嵌套项目 id（T2）。
- 路径参数不做格式校验，和查询参数分开处理（T3）。
- 路径 id 转不成数字，视为查不到，按「看不见」退回（决策 B、API-21）。
- 新建任务归哪个项目，只从路径里的项目 id 取，不从请求体取（决策 D）。
- 请求体里多带了项目 id，剔除还是拒绝：待第 3 组定。

### 3. 会话凭据与跨站防护

凭据：
- 会话凭据只用 HttpOnly Cookie。放在请求头里的凭据一律不收（API-8）。
- Cookie 属性：Secure（本地也加）、HttpOnly、SameSite=Lax、不设 Domain、Path 为 `/`、Max-Age 与服务端会话期限一致（API-8、API-9）。
- 过期以服务端为准（API-8）。
- 会话固定 30 天。不续期，不设空闲超时（API-10、T4）。
- 这一条偏离 OWASP 会话管理，理由见「偏离登记」（API-10）。
- 纯读请求不写 sessions（T4）。
- 每次登录新建会话（API-8）。
- 登出删掉服务端会话，并让浏览器清掉 Cookie（API-8）。
- 服务端渲染把浏览器带来的 Cookie 原样转发给后端（API-8、T15）。

跨站请求伪造：
- 防护用 NestJS 自带的，要求 NestJS 12.1 起（API-11）。
- 先看 Sec-Fetch-Site。没有这个头，再比 Origin 与 Host（API-11）。
- GET、HEAD、OPTIONS 放行。所以这三种方法不得改数据（API-11）。
- 被拒回 403，性质为「跨站被拒」，见本节第 6 小节（API-11、API-29）。
- 这道检查排在中间件与 Guard 之前（API-23）。
- SameSite=Lax 只作纵深防护，不替代这道检查（API-9）。
- 本地经 rewrites 转发后，Set-Cookie 与 Sec-Fetch-Site 是否原样，Lec 9 实测（API-12）。

身份与角色：
- 项目内角色在进入项目时，随项目上下文一并返回（ARCHITECTURE 第二节决策 Q1）。
- 前端拿到的角色只用来渲染入口，不构成授权（决策 Q1）。
- 角色只在本次页面上下文内使用，不做跨页面长缓存（决策 Q1）。
- 每个受限接口由后端 Guard 自己查成员表判定。前端传来的任何角色信息都不信（决策 Q1）。
- 当前用户身份与项目内角色，由哪个接口的哪个响应下发：待第 3 组定。

### 4. 请求格式

- 有请求体的接口只收 `application/json`（API-27）。
- Content-Type 不对，回「格式不支持」（API-27）。
- 框架会不会自动回 415，未核。写后端代码时实测（API-27）。
- 字段名与查询参数名用 camelCase（API-22、ARCHITECTURE 第二节「命名规范」）。
- 这一条偏离主参考 Zalando 第 118、130 条，理由见「偏离登记」（API-22）。
- 请求体与查询参数的形状和类型，由后端自写的 Zod 管道按共享 schema 校验（T1、T3）。
- 校验不过，回「参数不合法」（API-14）。
- 必填、空值、多余字段剔除还是拒绝：待第 3 组定。
- 时间格式与时区：待第 3 组定。

### 5. 成功响应

- 成功响应不加统一外包装（API-18）。
- 单个资源直接返回对象（API-18）。
- 列表接口顶层也返回对象，数组放在其中一个字段里（API-18）。
- 这个字段叫什么归 schema，由 05-类型 定（API-18）。
- 读取、更新成功回 200，带资源（API-25）。
- 新建成功回 201。响应体带新资源和它的 id（API-25）。
- 新资源有能读的地址时带 Location 头，没有就不带，如登录新建的会话（API-25）。
- 成功但没有内容回 204，如登出（API-25）。
- 列表的排序、筛选、分页：待第 3 组定。

### 6. 退回性质与状态码

各层出错只抛退回性质，不直接写状态码（API-23）。
全局异常过滤器在一处把性质翻成状态码，照的就是下表（API-23）。
实现落点见 ARCHITECTURE 第二节「后端分层」第 6 条（API-23）。

| 退回性质 | 状态码 | 什么时候 | 依据 |
|---|---|---|---|
| 未登录 | 401 | 凭据缺失或无效；登录时凭据错 | API-14、API-16 |
| 看不见 | 404 | 项目不存在或不是成员；任务不存在、不属于本项目或不属于自己；路径 id 转不成数字 | API-15、API-21、T2、决策 B |
| 不许做 | 403 | 看得见，但这个动作不许做 | API-14、API-21 |
| 跨站被拒 | 403 | 跨站请求伪造检查不过 | API-11、API-29 |
| 参数不合法 | 400 | 形状或类型不符；业务规则不过，如 assignee 不是本项目成员 | API-14、T1、T5、决策 E |
| 冲突 | 409 | 与现有数据冲突，如邮箱已被使用、已在项目中；含并发写入撞上唯一约束 | API-14、API-28 |
| 格式不支持 | 415 | 有请求体，但 Content-Type 不是 `application/json` | API-27 |
| 内部错误 | 500 | 过滤器认不出的错误 | API-14、API-23 |

- 业务规则不过也回 400，不用 422（API-14）。
- 框架自带的退回保留标准码，只把形状收成本节第 7 小节的外壳（API-14、API-17）。
- 网关错误不经后端，不带本项目外壳（API-14）。
- 回 401 必须带 WWW-Authenticate 头，方案名为 `Session`（API-20）。
- 这个方案名没在 IANA 登记，理由见「偏离登记」（API-20）。
- 并发写入撞上唯一约束时，由该表的 Repository 翻成「冲突」（API-28）。
- 注册时邮箱已被使用照回「冲突」：PRD「US-A01 用户注册」要求提示「该邮箱已被使用」；登录另行防枚举（API-16），两处有意分开。
- 任务更新拆几个接口、字段级权限被拒回哪个性质：待第 3 组定。

### 7. 错误外壳

- 所有接口出错都回 RFC 9457 形状，媒体类型为 `application/problem+json`（API-17）。
- 框架自带的退回，也由后端收成这个形状（API-17）。
- 外壳的 schema 名为 ProblemDetails（API-3、API-17、API-30）。
- 外壳表达五样东西，各给前端的用处如下（API-3、API-17）：
  - type：机读的问题类型。前端按它出中文提示（API-19）。
  - title、detail：文字说明。只作开发排查与兜底（API-19）。
  - status：状态码（API-17）。
  - instance：这一次出错的编号。服务端日志记同一个编号，写法见 API-26（API-26）。
  - 扩展部分：需要时加，如 400 时的逐项问题（API-17）。
- 带逐项问题的 400 外壳，schema 名为 ValidationProblemDetails（API-17、API-30）。
- type 的字面值归共享 schema，名为 ProblemType（API-24、API-30）。
- 以上三个名字只定主体。写不写 Schema 后缀，照 05-类型 的命名规则（API-30）。
- 本文件只定「退回性质 → 状态码」，见本节第 6 小节（API-24）。
- 401 的外壳不附任何字段指向（API-17）。
- 登录失败不区分是邮箱错还是密码错（API-16）。
- 不暴露堆栈（API-17）。

### 8. 前端怎么读退回

- 给用户看的中文提示，由前端按 type 出（API-19）。
- 前端不能指望每个出错响应都是 problem JSON（API-19）。
- 收到网关错误，按加载失败处理（API-14）。
- 「看不见」和「不许做」，界面上都显示「权限不足」（API-4、API-21）。
- 「跨站被拒」有单独的 type，前端另出提示（API-29）。
- 在登录页收到 401，显示「邮箱或密码不正确」（API-16）。
- 不在登录页收到 401，跳登录页（API-16）。
- 提交前的校验提示本来就在前端，不靠后端的 title、detail（API-19）。

## 二、接口清单

（本节待定。）

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
- API-25 成功码照 RFC 9110 三分：读取、更新回 200，带资源；新建回 201，响应体带新资源与它的 id，
  新资源有能读的地址时带 Location 头，没有就不带（如登录新建的会话）；成功但没有内容回 204（如登出）。
  依据：RFC 9110 第 15.3.1、15.3.2、15.3.5 节；主参考 Zalando：POST 新建
        「SHOULD return 201 and the new resource object (including the resource identifier)」，
        Location 头在响应体带了新资源时 SHOULD、没带时 MUST。
  修订（同窗口）：原写「并带 Location 头」，改为有能读的地址才带。RFC 9110 第 15.3.2 节允许不带，此时以请求的地址为准。
  修订（第六窗口，问 478 A）：括号里的例子「如登录新建的会话」不再成立：登录回 200、响应体带当前用户，会话只经 Cookie（API-53）。上面原文不改。
- API-26 错误外壳的 instance 填每次出错生成的随机编号，写成 urn:uuid: 开头（RFC 9562 第 4 节的 URN 写法）。
  由全局异常过滤器生成（API-23），同一编号写进服务端日志；日志怎么记，留到讲可观测性那一课。
  依据：RFC 9457 第 3.1.5 节，instance 标「the specific occurrence of the problem」，打不开时只作唯一标识；
        「it is RECOMMENDED that absolute URIs be used」。urn:uuid: 是绝对 URI，又不用写域名（API-13）。
  没选：填请求路径，标的是资源不是这一次；相对路径加编号，RFC 说相对写法「can cause confusion」。
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
- API-31 请求体出现 schema 没列的字段，一律拒绝，回「参数不合法」（400），外壳逐项列出多出来的键（ValidationProblemDetails）。
  请求体里多带的项目 id 同样拒绝；新任务归哪个项目仍只从路径取（决策 D）。响应方向反过来：前端解析响应时容忍多出来的字段。
  依据：主参考 Zalando #109「Unknown input fields in payload or URL should not be ignored;」「servers should provide error feedback to clients via an HTTP 400 response code.」；
        #108 客户端「Be tolerant with unknown fields in the payload」；OWASP Mass Assignment「Explicitly allow-list fields」。
  没选：静默剔除（Zod 默认），前端多传了不报错，错误被藏住；剔除加敏感键黑名单，OWASP 说黑名单不能当唯一防护。
  落点：第一节第 2、4 小节两处「待第 3 组定」，第五批起草时写。
- API-32 标题、描述、项目名称都必填：去掉首尾空白后为空的，回「参数不合法」；存的是去掉首尾空白后的值。最大长度归 05-类型 在 schema 里定。
  依据：ADR-DB-005「tasks.description 必填」（Lec 5 主人拍板）；PRD「US-P01 创建项目」名称必填；PRD 澄清注记 13。Zalando #109 建议给字符串定长度范围。
  没选：描述可为空串；都允许空串。
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
- API-35 改任务拆两个接口。负责人专用的「改任务」接口管标题、描述、截止日期、负责人，执行者调用时由 AuthzGuard 按角色回「不许做」；
  「改状态」接口两种角色都能调，执行者只能改分给自己的任务，归属在 Service 里判，先判「看不见」（ARCHITECTURE 第三节 R2-6、R2-7 同一顺序）。两个接口的请求体都照 API-31、API-33。
  理由：PRD 审定决策 D15、D16 与权限矩阵把内容与分配划给负责人，状态两种角色都能改；按 T6，只凭角色能判的归 Guard，字段级权限变成路由级。
  后果：执行者往「改状态」接口多带别的字段，按 API-31 回「参数不合法」，不是「不许做」。
  没选：一个接口由 Service 按字段判（GitHub 是一个接口，但对无权字段悄悄扔掉，与 API-31 相反）；内容、分配、状态拆三个。
  落点：第一节第 6 小节「待第 3 组定」，第五批起草时写；路径随接口清单定。
- API-36 转让负责人用 PUT 写「本项目的负责人」这个子资源，请求体放新负责人的 userId；只有负责人能调。
  一个事务内改两行：原负责人降为执行者，新负责人升为负责人；加行锁，防止两个转让同时发生。
  转让完成后调用者已是执行者，按 PRD 审定决策 D11 看不见成员列表，响应不带成员列表，具体回什么随接口清单定。
  依据：PRD 审定决策 D10；主参考 Zalando #141「MUST keep URLs verb-free」、#138「create an article lock with PUT or POST instead of using a lock action.」。
  没选：动作式 POST，路径带动词，违反 #141；借通用的改成员角色接口隐式降级，副作用出人意料。
  已定：转给非成员、转给自己见 API-39；路径写法随接口清单定。
  已定（第六窗口，问 477 A）：成功回什么见 API-52。
- API-37 唯一负责人移出自己，回 409「冲突」，配一个专门的 type，前端据此提示「需先转让负责人身份」（PRD「US-P04 移出项目成员」与错误规则）。
  首版单负责人，且没有通用的改角色接口（API-36），「把唯一负责人直接降为执行者」从接口上触发不了，本条只管移出这一种。
  依据：RFC 9110 第 15.5.10 节「This code is used in situations where the user might be able to resolve the conflict and resubmit the request.」：先转让即可化解。
  没选：400 配专门 type；403「不许做」，前端会显示「权限不足」，与 PRD 要求的提示对不上。
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
- API-42 任务列表只设一个接口，由 Service 按角色强制过滤：执行者只拿到分给自己的任务，负责人拿到全项目任务。项目汇总（US-04）与成员列表（US-P03）是负责人专用接口，执行者调用时由 AuthzGuard 回「不许做」（403），因为他看得见这个项目（API-21）。
  理由：PRD 审定决策 D6 单页面按角色渲染、D11 执行者可见范围；过滤不靠前端传什么；与 API-35 同一条界线（T6）。
  依据：OWASP Authorization Cheat Sheet 最小权限（必须）。
  没选：拆「全部」「我的」两个列表接口；一个接口要执行者自带 assignee=me 参数，等于把安全过滤交给前端。
- API-43 「可能卡住」由后端按服务端时钟算，只放进负责人看得到的任务响应；执行者的响应不带这一项（PRD 权限矩阵「查看未认领 / 卡住标记」一行）。计时照 PRD 审定决策 D13，从最近一次状态变化与最近一次分配两者中较晚的那个起算；分配时间记在 tasks 新加的一列，写法见 docs/arch/DECISIONS.md ADR-DB-007。
  理由：规则只有一份，前端不用各算一遍；执行者拿不到这个标记。
  没选：前端拿时间戳自己算，规则两边各一份，执行者的响应也得带上时间戳。
- API-44 所有接口（含登录、注册）的响应一律带 Cache-Control: no-store，成功与出错都带。由后端统一加，不靠各接口自己写；挂在哪一层写后端骨架时定，要盖住在中间件之前就退回的跨站被拒（API-23）。
  理由：PRD 要「刷新就看到最新的」，被缓存的列表会违反它；响应里有会话凭据与项目数据。
  依据：OWASP Session Management Cheat Sheet「Use Cache-Control: no-store on responses containing session identifiers or sensitive session data.」；RFC 9111 第 5.2.2.5 节提醒它「not a reliable or sufficient mechanism for ensuring privacy」，只作多一层保护。
  没选：只给登录、注册发；不定，交给浏览器默认。
- API-45 本版契约不列通知接口。notifications 模块本版是空壳（ARCHITECTURE 第一节决策 4），唯一的通知类型「可能卡住」预警属 US-02b，已延后；Lec 13 做 US-02b 时再加接口。
  理由：写没人调用的接口，违反「MVP 先跑通，不为以后可能用提前堆」（CLAUDE.md 第二层 D）。
  没选：列出接口标「本版不实现」，前端可能当真去调；本版就做通知列表与已读，推翻决策 4。
- API-46 「格式不支持」（415）的检查放在 Guard 之后、Pipe 之前，用拦截器做。几种退回同时成立时，先拦的先回：跨站检查、AuthGuard、AuthzGuard、这道格式检查、Pipe、Service。不是成员的请求，不论格式对错，都先回「看不见」（API-21）。
  依据：NestJS 官方「请求生命周期」一页，中间件、Guard、拦截器（进控制器前）、Pipe 依次执行。
  没选：放在中间件里、排在 Guard 前，非成员也会先收到 415；不单独检查，格式不对时请求体解析成空，由 Zod 回 400，API-27 落空。
  补充（第六窗口，问 479 A）：这里的「格式」只指 Content-Type。请求体不是合法 JSON，由框架在 Guard 之前解析失败、回 400（API-47）；解析在任何查询之前，不论项目在不在都回同样的 400，不泄露项目在不在。解析时机写后端代码时实测。
- API-47 框架自己拦下的退回（不是本项目代码抛的），能对上现有性质的就并进去：路径不存在算「看不见」（404），请求体不是合法 JSON 算「参数不合法」（400）。对不上的保留标准码，type 用 RFC 9457 登记的 about:blank，title 照该状态码的标准短语；前端对它出通用提示。
  依据：RFC 9457 第 4.2.1 节；API-14、API-17、API-19。
  没选：全部单设一种「框架退回」type，前端分不开路径不存在与 JSON 坏了；全部用 about:blank。
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
- API-51 六项照标准的小项（问 476 A）：
  一，instance 的生成规则（API-26）归本文件，schema 只定它是字符串；与 API-3、API-24 同一分法。
  二，成功响应的媒体类型是 application/json（主参考 Zalando #167），出错时是 application/problem+json（API-17）。
  三，比对请求的媒体类型时忽略参数，application/json; charset=utf-8 也收（RFC 8259「No "charset" parameter is defined for this registration.」）。
  四，凡路径带项目 id 的写接口，项目一律以路径为准，请求体多带的按 API-31 拒绝；决策 D 从新建任务推广到全部写接口。
  五，401 的 challenge 只写方案名 Session，不带 realm（RFC 9110 第 11.5 节：realm 留给要标明保护范围的方案，本项目只有一个保护范围）。
  六，路径段一律小写，单词之间用连字符，资源名用复数（主参考 Zalando #129、#134，均为必须）。
- API-52 转让负责人成功回 204，不带内容；前端重新取项目信息，按调用者的新角色渲染（API-34）。这是 API-25「更新成功回 200 带资源」的例外。
  理由：转让完成后调用者已是执行者，按 PRD 审定决策 D17 看不见项目负责人；照 API-25 带回新负责人，就把他刚失去权限看的东西给了他。
  依据：RFC 9110 第 9.3.4 节，PUT 改成功「MUST send either a 200 (OK) or a 204 (No Content)」。
  没选：回 200 只带调用者的新角色，要为它单设响应形状；照 API-25 带新负责人，违反 D17。
- API-53 注册成功回 201，响应体带新建的用户；登录成功回 200，响应体带当前用户。两者都新建会话，会话凭据只经 HttpOnly Cookie 下发（API-8），响应体里从不出现会话或它的 id。用户的形状与「当前用户」接口相同（API-34）。
  理由：注册新建的资源就是用户；登录新建的会话调用方拿不到，算不上交给调用方的新资源。会话放进响应体，页面脚本就能读到，HttpOnly 白设。
  没选：登录也回 201、响应体带用户，作为例外写明，读的人会以为拿到了新资源；登录回 204、前端再调当前用户接口，多一次往返。
