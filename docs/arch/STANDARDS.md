# STANDARDS · 本项目采用的标准

> 项目：study-l3-v2（团队任务协作工具）
> 去留：长期。
> 用途：登记本项目每个领域认哪一份主参考。单一信息源：别处要说「照什么标准」，指向本文件，不另抄。
> 做法（05-API 第二窗口问 339 A、343 A、345 A 定）：
> - 按层定先后：协议层正式标准 → 安全基线 → 框架约定 → 设计规范 → 都没有才自定。
> - 冲突：层与层冲突时，排在前面的层说了算：协议层压过安全基线，安全基线压过框架约定，框架约定压过设计规范。同层几家不一，列出来由项目主人拍，拍完记 ADR 或契约。
> - 每条标准分三档：必须（照做）、建议（便宜就做）、可选（不做但不堵死，记 BACKLOG）。档次按条判，写在用到它的那条裁决里；登记表不设档次栏。
> - 标准管怎么做，不管做多少；凡称「标准」须给原文出处并当场核过，没核过的标「未核」。
> - 偏离主参考的地方，理由写在本文件「偏离登记」，对应的 ADR 或契约条目只写指针。

## 一、登记表

| 领域 | 主参考 | 原文 | 拍板 | 核对 |
|---|---|---|---|---|
| API 设计 | Zalando RESTful API Guidelines | https://opensource.zalando.com/restful-api-guidelines/ | API-5（docs/arch/API_CONTRACT.md「本节裁决汇总」） | 2026-10-15；2026-10-26（#143） |
| HTTP 语义（状态码、方法、认证头） | RFC 9110 HTTP Semantics | https://www.rfc-editor.org/rfc/rfc9110 | 协议层，必须照做；状态码见 API-14 到 API-16、API-25、API-27、API-37 到 API-39、API-52、API-53，401 的认证头见 API-20；方法见 API-50（主参考 Zalando #148），challenge 不带 realm 见 API-51 | 2026-10-15（第 11、15 节）；2026-10-17（第 11.5 节）；2026-10-21（第 9.3.4 节）；2026-10-23（第 9.2.2、15.3.1 节） |
| PATCH 方法 | RFC 5789 PATCH Method for HTTP | https://www.rfc-editor.org/rfc/rfc5789 | API-35 补充（问 608 A：成功码与带什么不限死，例子回 204） | 2026-10-23（第 2、2.1 节） |
| 提交信息 | Conventional Commits | 见 CLAUDE.md 第一层 C | 已在 CLAUDE.md 第一层 C | 未核 |
| 会话管理 | OWASP Session Management Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html | API-8（含补充，问 613 B、614 A、625 A）、API-9、API-10、API-44 | 2026-10-15；2026-10-17（Web Content Caching and Clear-Site-Data 一节）；2026-10-23（Renew the Session ID After Any Privilege Level Change、Logout Button 两节） |
| 跨站请求伪造防护 | OWASP Cross-Site Request Forgery Prevention Cheat Sheet；实现用 NestJS 自带防护 | https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html ；https://docs.nestjs.com/security/csrf | API-11 | 2026-10-15 |
| Cookie 属性 | MDN Set-Cookie | https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie | API-8、API-9 | 2026-10-15 |
| 错误响应格式 | RFC 9457 Problem Details for HTTP APIs；主参考 Zalando #176、#177 | https://www.rfc-editor.org/rfc/rfc9457.html | API-17、API-47 | 2026-10-15；2026-10-17（第 4.2.1 节） |
| 出错实例编号 | RFC 9562 UUID（URN 写法 urn:uuid:） | https://www.rfc-editor.org/rfc/rfc9562 | API-26 | 2026-10-15（第 4 节）；2026-10-21（第 5.4、5.7 节） |
| JSON 顶层结构 | 主参考 Zalando #167、#110（顶层用对象） | https://opensource.zalando.com/restful-api-guidelines/ | API-18 | 2026-10-15 |
| 授权（最小权限） | OWASP Authorization Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html | PRD 审定决策 D11（执行者可见范围，问 399 A）、D14（移出成员，问 405 B）、D15（编辑任务内容，问 428 A）、D17（执行者看不见项目负责人，问 430 A）、API-42（列表按角色过滤，问 457 A） | 2026-10-16（Enforce Least Privileges 一节） |
| 部分更新（PATCH 语义） | RFC 7396 JSON Merge Patch；主参考 Zalando #123 | https://www.rfc-editor.org/rfc/rfc7396 | API-33、API-54 | 2026-10-16（第 1 节） |
| 批量赋值防护 | OWASP Mass Assignment Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Mass_Assignment_Cheat_Sheet.html | API-31 | 2026-10-16 |
| 列表分页 | 主参考 Zalando #159、#160 | https://opensource.zalando.com/restful-api-guidelines/ | API-40（本版不分页，压在规模假设上） | 2026-10-17 |
| 日期与时间格式 | RFC 3339；主参考 Zalando #169、#238 | https://www.rfc-editor.org/rfc/rfc3339 | API-41、ADR-DB-003 修订 | 2026-10-16（RFC 3339 第 2、5.6 节）；2026-10-17（Zalando #169、#238） |
| HTTP 缓存 | RFC 9111 HTTP Caching | https://www.rfc-editor.org/rfc/rfc9111 | API-44（no-store 只作多一层保护） | 2026-10-17（第 5.2.2.5 节） |
| JSON 媒体类型 | RFC 8259；主参考 Zalando #167 | https://www.rfc-editor.org/rfc/rfc8259 | API-51 第二、三点 | 2026-10-17（IANA 一节） |
| 路径写法 | 主参考 Zalando #129、#134、#141 | https://opensource.zalando.com/restful-api-guidelines/ | API-51 第六点；只有一个的子资源写单数、偏离 #134，见 API-57 修订与「偏离登记」；#141（URL 不带动词）定为全局约定见 API-58，API-36、API-50 也引了它 | 2026-10-16（#141）；2026-10-17（#129、#134）；2026-10-23（#134 单例与 self 例外、#141、#143 self） |
| 后端框架行为 | NestJS 官方文档：请求生命周期、Guards、异常过滤器 | https://docs.nestjs.com/faq/request-lifecycle ；https://docs.nestjs.com/guards ；https://docs.nestjs.com/exception-filters | API-23、API-46 | 2026-10-15（Guards、异常过滤器）；2026-10-17（请求生命周期） |
| 错误处理 | OWASP Error Handling Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Error_Handling_Cheat_Sheet.html | API-49 | 2026-10-17 |
| 邮箱比较 | OWASP Email Validation and Verification Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Email_Validation_and_Verification_Cheat_Sheet.html | API-55 | 2026-10-17（Case Sensitivity、Email Canonicalization 两节） |
| 认证（密码规则） | OWASP Authentication Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html | API-32 补充（问 576 A）；PRD 审定决策 D20（问 649 A、650 A） | 2026-10-20；2026-10-23（Implement Proper Password Strength Controls 一节）；2026-10-28（同一节：最短 15 位、组成规则、最长 64 位） |
| schema 命名（请求体、列表项） | 框架约定：NestJS 官方 CRUD 生成器；设计规范：Google AIP-133、AIP-132 | https://docs.nestjs.com/recipes/crud-generator ；https://google.aip.dev/133 ；https://google.aip.dev/132 | API-30 补充（问 626 A、628 A、631 A） | 2026-10-26 |
| 共享校验 schema | 安全基线：OWASP Input Validation Cheat Sheet；框架约定：Zod 官方文档、NestJS 官方 Pipes 一页、pnpm 官方 Workspaces 一页 | https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html ；https://zod.dev/api ；https://docs.nestjs.com/pipes ；https://pnpm.io/workspaces | ARCHITECTURE 第二节取舍 4、API-31；其余随 05-类型 补 | 2026-11-05（Zod 4.6，api 页前半；Pipes 页 Object schema validation、Binding validation pipes、Schema based validation；Workspace protocol；Common Pitfalls、Parse Safely, Then Validate；网页代理取回，用到时再核） |
| 邮件地址长度 | RFC 5321 SMTP 第 4.5.3.1 节；RFC 3696 勘误 1690 | https://www.rfc-editor.org/rfc/rfc5321 ；https://www.rfc-editor.org/errata/eid1690 | TYPE-17、TYPE-23（docs/arch/SHARED_TYPES.md） | 2026-11-06（RFC 5321 第 4.5.3.1 节写长度按字节计，本地部分 64、域名 255、路径 256 含标点；勘误 1690 状态 Verified，地址上限 254 字符；RFC 6531 读到第 5 节，没写国际化地址的长度怎么算；网页代理取回；同日第二次取回逐字相同，另核第 4.1.2 节 Path 的写法含一对尖括号） |
| 模块解析（相对导入的扩展名） | 框架约定：TypeScript 官方 Modules Reference | https://www.typescriptlang.org/docs/handbook/modules/reference.html | TYPE-22（docs/arch/SHARED_TYPES.md） | 2026-11-06（2026-11-05 版：nodenext 下 import 不支持省略扩展名的相对路径；bundler 省略与不省略都支持；网页代理取回，用到时再核） |
| 数据库与 ORM | 框架约定：PostgreSQL 官方文档（citext 一页）；Prisma 官方文档在锁版本时补（BACKLOG 74） | https://www.postgresql.org/docs/current/citext.html | ADR-DB-008（问 572 A）；偏离见「偏离登记」 | 2026-10-17；2026-10-28（18.6 版，LC_CTYPE 一句与 nondeterministic collations 一句） |
| 界面无障碍（文字对比度、不只靠颜色、点击目标、表格结构） | W3C WCAG 2.2，AA 级；表格写法照 W3C WAI Tables Tutorial | https://www.w3.org/TR/WCAG22/ ；https://www.w3.org/WAI/tutorials/tables/ | 问 727 A | 2026-11-04（SC 1.4.1、1.4.3、1.4.10、1.4.11、2.4.7、2.5.8、3.2.3、3.3.1、4.1.3；Tables Tutorial 2023-02-16 版） |
| 界面原型 | 主流做法：GOV.UK Service Manual「Making prototypes」；NN/g「UX Prototypes: Low Fidelity vs. High Fidelity」 | https://www.gov.uk/service-manual/design/making-prototypes ；https://www.nngroup.com/articles/ux-prototype-hi-lo-fidelity/ | 问 726 A | 2026-11-04（GOV.UK 2016-10-18 版，约束不到本项目，作参考；NN/g 2016-12-18 版） |
| 界面状态与走查 | 主流做法：NN/g「Skeleton Screens 101」「Designing Empty States in Complex Applications: 3 Guidelines」「How to Conduct a Heuristic Evaluation」 | https://www.nngroup.com/articles/skeleton-screens/ ；https://www.nngroup.com/articles/empty-state-interface-design/ ；https://www.nngroup.com/articles/how-to-conduct-a-heuristic-evaluation/ | 第 3 章引用；骨架屏的出入见 BACKLOG 86 | 2026-11-04（2023-06-04 版，2026-09-02 复审；2021-09-19 版；2023-06-25 版） |
| 架构决策记录 | 主流做法：Nygard「Documenting Architecture Decisions」；AWS Prescriptive Guidance「Architectural decision record process」；Microsoft Azure Well-Architected「Maintain an architecture decision record (ADR)」。adr.github.io 没有把它称为正式标准 | https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions ；https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html ；https://learn.microsoft.com/en-us/azure/well-architected/architect-role/architecture-decision-record | 问 733 A；偏离见「偏离登记」 | 2026-11-05（Nygard 2011-11-15 版；微软 2026-04-10 版） |
| 鉴权方案的依据（JWT 与会话失效） | RFC 7519 JSON Web Token；OWASP JSON Web Token Cheat Sheet | https://www.rfc-editor.org/rfc/rfc7519 ；https://cheatsheetseries.owasp.org/cheatsheets/JSON_Web_Token_Cheat_Sheet.html | ADR-001 | 2026-11-05（RFC 7519 全文没有吊销机制；OWASP「JWT revocation」一节） |
| 选型原则 | 主流做法，只作旁证：Fowler「Yagni」；McKinley「Choose Boring Technology」；NN/g「Using Prioritization Matrices to Inform UX Decisions」。6 必问、四象限是本课程自定，没有对应标准 | https://martinfowler.com/bliki/Yagni.html ；https://mcfunley.com/choose-boring-technology ；https://www.nngroup.com/articles/prioritization-matrices/ | 第 4 章引用 | 2026-11-05（Fowler 2015-05-26 版；McKinley 2015-03-30 版；NN/g 2018-05-27 版） |
| AI 代理的权限与人工审批 | 安全基线：OWASP LLM06:2025 Excessive Agency；主流做法，只作旁证：Amazon 2015 致股东信（单向门、双向门）、Anthropic「Beyond permission prompts」（审批疲劳）。人在环内、人在环上是行业常见叫法，不是标准 | https://genai.owasp.org/llmrisk/llm062025-excessive-agency/ ；https://www.sec.gov/Archives/edgar/data/1018724/000119312516530910/d168744dex991.htm ；https://www.anthropic.com/engineering/claude-code-sandboxing | 第 6 章引用；决策边界见 CLAUDE.md 第三层 A | 2026-11-05（Anthropic 2025-10-20 版） |
| 配置文件的安全风险 | 主流做法：Check Point Research「Caught in the Hook」（CVE-2025-59536、CVE-2026-21852）；框架约定：Claude Code 官方权限页、设置页 | https://research.checkpoint.com/2026/rce-and-api-token-exfiltration-through-claude-code-project-files-cve-2025-59536/ ；https://code.claude.com/docs/en/permissions ；https://code.claude.com/docs/en/settings | 第 6 章引用；BACKLOG 9、88 | 2026-11-05（Check Point 2026-02-25 版；Claude Code 2.1.318） |

## 二、偏离登记

- 会话期限（API-10）：固定 30 天、无空闲超时，偏离 OWASP 会话管理「should implement an idle or inactivity timeout」与「absolute timeout」。理由：PRD D7 经项目主人确认；空闲超时要求读请求写 sessions，会推翻 T4；补救为登出即删服务端会话、角色改即时生效、Cookie 加 HttpOnly 与 Secure。将来风险变高时加空闲超时，见 BACKLOG。
- 401 认证方案名（API-20）：自定方案名 Session 没在 IANA HTTP Authentication Scheme Registry 登记，RFC 9110 第 11.1 节写的是「ought to be registered」，属建议档。理由：登记表 14 个方案里没有会话 Cookie 类的；登记要走 IETF 评审，本项目不对外提供接口，唯一调用方是自家前端，前端不读这个头（API-6）。核对 2026-10-15。
- 字段命名（API-22）：API 字段名与查询参数名用 camelCase，偏离 Zalando 第 118 条「MUST property names must be snake_case (and never camelCase)」与第 130 条（查询参数同）。理由：同层另一家主流规范微软 Azure 要求「DO use camel case for all JSON field names.」；Zalando 第 118 条自述「No established industry standard exists」；本项目前后端与 Prisma 都用 TypeScript，全链路不做命名转换（ARCHITECTURE 第二节「命名规范」）。核对 2026-10-15。
- 部分更新的媒体类型（API-33）：照 RFC 7396 的规则处理 null 与没传，但请求只收 application/json，不用它登记的 application/merge-patch+json。理由：唯一调用方是自家前端（API-6），换媒体类型要修订 API-27、改前端 api client，收益只是类型名对得上，规则本身照 RFC 7396 走。核对 2026-10-16。
- 只有一个的子资源用单数（API-57 修订）：本项目的负责人、任务的状态、项目的汇总写单数，偏离 Zalando 第 134 条「The special case of a resource singleton must be modeled as a collection with cardinality 1」（必须）。理由：同一层另一家 Google AIP-156（https://google.aip.dev/156，状态 Approved）「Singleton resources are always singular.」；照复数写，两个写接口的请求体要多一层只含一个元素的数组，改状态还要把 PATCH 改成 PUT，「状态们」会被读成状态的历史；唯一调用方是同仓同发的自家前端（API-6），将来放开多负责人时改路径代价小。核对 2026-10-23。
- 邮箱不分大小写用 citext（ADR-DB-008）：没照 PostgreSQL 文档 citext 一页「Consider using nondeterministic collations (see Section 23.2.2.4) instead of this module.」改用不区分大小写的排序规则，属建议档。理由：排序规则有性能代价、部分模式匹配用不了、要手写 SQL；citext 写得进 schema，注册查重、登录、按邮箱邀请成员三个入口照常查（问 572 A）。代价是多依赖一个 PostgreSQL 扩展，比较随数据库的 LC_CTYPE（BACKLOG 80）。核对 2026-10-28。
- 注册时提示邮箱已被使用（PRD「US-A01 用户注册」）：偏离 OWASP Authentication Cheat Sheet「Authentication and Error Messages」一节，该节把「This user ID is already in use.」列为错误例，正确例是「A link to activate your account has been emailed to the address provided.」。理由：PRD 已定提示「该邮箱已被使用」，登录另行防枚举，两处有意分开（DECISIONS-R1 R1-407）；正确例要发激活邮件，首版不发邮件（PRD Out of Scope「邮件/短信通知」），做不到统一回复。代价：别人能探出某邮箱注册过（问 730 A）。核对 2026-11-04。
- 决策记录的改法（docs/arch/DECISIONS.md 文件头，问 733 A）：已接受的条目要变时，原文不动，在它下面加修订、更正或后续一行，不新开一条，也不设状态字段。偏离 AWS「Changes to an existing ADR requires creating a new ADR」、微软「If a decision changes, write a new record that supersedes the original and link the two together.」与 Nygard「If a decision is reversed, we will keep the old one around, but mark it as superseded.」。原文不动这一半，照做了微软的「Don't go back and edit accepted records.」。理由：读一条就能看全它后来怎么变，已有的行不用动。代价：现在算数的结论要读到这一条末尾，也不能一眼看出哪些条目后来变过。核对 2026-11-05。
- ProblemType 的性质名用小写加连字符（TYPE-24）：偏离 Zalando 第 240 条「Enum values (using `enum`, `x-extensible-enum` or extensible enums using `examples`) need to consistently use the upper-snake case format」，属建议档（SHOULD）。理由：ProblemType 的值是整条 URI，前缀与 about:blank 改不了，整值写不成大写蛇形；该条的理由是把枚举值和属性等分开，urn: 开头的值本来分得开；和路径段写法一致（API-51 第六点）。about:blank 是 RFC 9457 定的值，落在该条例外「case sensitive values sourced from outside of the API specification scope」里，不算偏离。核对 2026-11-06。

## 三、待登记

- 代码风格：Lec 8。
