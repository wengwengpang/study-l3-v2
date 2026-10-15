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

（本节待定，05-API 第 2 组拍板后填。）

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
