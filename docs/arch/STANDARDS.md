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
| API 设计 | Zalando RESTful API Guidelines | https://opensource.zalando.com/restful-api-guidelines/ | API-5（docs/arch/API_CONTRACT.md「本节裁决汇总」） | 2026-10-15 |
| HTTP 语义（状态码、方法、认证头） | RFC 9110 HTTP Semantics | https://www.rfc-editor.org/rfc/rfc9110 | 协议层，必须照做；状态码见 API-14 到 API-16、API-25、API-27，401 的认证头见 API-20 | 2026-10-15（第 11、15 节） |
| 提交信息 | Conventional Commits | 见 CLAUDE.md 第一层 C | 已在 CLAUDE.md 第一层 C | 未核 |
| 会话管理 | OWASP Session Management Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html | API-8、API-9、API-10 | 2026-10-15 |
| 跨站请求伪造防护 | OWASP Cross-Site Request Forgery Prevention Cheat Sheet；实现用 NestJS 自带防护 | https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html ；https://docs.nestjs.com/security/csrf | API-11 | 2026-10-15 |
| Cookie 属性 | MDN Set-Cookie | https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie | API-8、API-9 | 2026-10-15 |
| 错误响应格式 | RFC 9457 Problem Details for HTTP APIs；主参考 Zalando #176、#177 | https://www.rfc-editor.org/rfc/rfc9457.html | API-17 | 2026-10-15 |
| 出错实例编号 | RFC 9562 UUID（URN 写法 urn:uuid:） | https://www.rfc-editor.org/rfc/rfc9562 | API-26 | 2026-10-15（第 4 节） |
| JSON 顶层结构 | 主参考 Zalando #167、#110（顶层用对象） | https://opensource.zalando.com/restful-api-guidelines/ | API-18 | 2026-10-15 |
| 授权（最小权限） | OWASP Authorization Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html | PRD 审定决策 D11（执行者可见范围，问 399 A）、D14（移出成员，问 405 B）、D15（编辑任务内容，问 428 A）、D17（执行者看不见项目负责人，问 430 A） | 2026-10-16（Enforce Least Privileges 一节） |
| 部分更新（PATCH 语义） | RFC 7396 JSON Merge Patch；主参考 Zalando #123 | https://www.rfc-editor.org/rfc/rfc7396 | API-33 | 2026-10-16（第 1 节） |
| 批量赋值防护 | OWASP Mass Assignment Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Mass_Assignment_Cheat_Sheet.html | API-31 | 2026-10-16 |

## 二、偏离登记

- 会话期限（API-10）：固定 30 天、无空闲超时，偏离 OWASP 会话管理「should implement an idle or inactivity timeout」与「absolute timeout」。理由：PRD D7 经项目主人确认；空闲超时要求读请求写 sessions，会推翻 T4；补救为登出即删服务端会话、角色改即时生效、Cookie 加 HttpOnly 与 Secure。将来风险变高时加空闲超时，见 BACKLOG。
- 401 认证方案名（API-20）：自定方案名 Session 没在 IANA HTTP Authentication Scheme Registry 登记，RFC 9110 第 11.1 节写的是「ought to be registered」，属建议档。理由：登记表 14 个方案里没有会话 Cookie 类的；登记要走 IETF 评审，本项目不对外提供接口，唯一调用方是自家前端，前端不读这个头（API-6）。核对 2026-10-15。
- 字段命名（API-22）：API 字段名与查询参数名用 camelCase，偏离 Zalando 第 118 条「MUST property names must be snake_case (and never camelCase)」与第 130 条（查询参数同）。理由：同层另一家主流规范微软 Azure 要求「DO use camel case for all JSON field names.」；Zalando 第 118 条自述「No established industry standard exists」；本项目前后端与 Prisma 都用 TypeScript，全链路不做命名转换（ARCHITECTURE 第二节「命名规范」）。核对 2026-10-15。
- 部分更新的媒体类型（API-33）：照 RFC 7396 的规则处理 null 与没传，但请求只收 application/json，不用它登记的 application/merge-patch+json。理由：唯一调用方是自家前端（API-6），换媒体类型要修订 API-27、改前端 api client，收益只是类型名对得上，规则本身照 RFC 7396 走。核对 2026-10-16。

## 三、待登记

- 代码风格：Lec 8。
