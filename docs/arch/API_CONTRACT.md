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
- API-9 SameSite 取 Lax。拦跨站的 POST、PUT、DELETE；外链进来的页面请求仍带凭据。
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
