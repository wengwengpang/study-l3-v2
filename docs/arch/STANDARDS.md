# STANDARDS · 本项目采用的标准

> 项目：study-l3-v2（团队任务协作工具）
> 去留：长期。
> 用途：登记本项目每个领域认哪一份主参考。单一信息源：别处要说「照什么标准」，指向本文件，不另抄。
> 做法（05-API 第二窗口问 339 A、343 A、345 A 定）：
> - 按层定先后：协议层正式标准 → 安全基线 → 框架约定 → 设计规范 → 都没有才自定。
> - 冲突：层与层冲突时，排在前面的层说了算：协议层压过安全基线，安全基线压过框架约定，框架约定压过设计规范。同层几家不一，列出来由项目主人拍，拍完记 ADR 或契约。
> - 每条标准分三档：必须（照做）、建议（便宜就做）、可选（不做但不堵死，记 BACKLOG）。
> - 标准管怎么做，不管做多少；凡称「标准」须给原文出处并当场核过，没核过的标「未核」。
> - 偏离主参考的地方，理由写在本文件「偏离登记」，对应的 ADR 或契约条目只写指针。

## 一、登记表

| 领域 | 主参考 | 原文 | 拍板 | 核对 |
|---|---|---|---|---|
| API 设计 | Zalando RESTful API Guidelines | https://opensource.zalando.com/restful-api-guidelines/ | API-5（docs/arch/API_CONTRACT.md「本节裁决汇总」） | 2026-10-15 |
| HTTP 语义（状态码、方法） | RFC 9110 HTTP Semantics | https://www.rfc-editor.org/rfc/rfc9110 | 协议层，必须照做；状态码见 API-14 到 API-16 | 2026-10-15（第 15 节） |
| 提交信息 | Conventional Commits | 见 CLAUDE.md 第一层 C | 已在 CLAUDE.md 第一层 C | 未核 |
| 会话管理 | OWASP Session Management Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html | API-8、API-9、API-10 | 2026-10-15 |
| 跨站请求伪造防护 | OWASP Cross-Site Request Forgery Prevention Cheat Sheet；实现用 NestJS 自带防护 | https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html ；https://docs.nestjs.com/security/csrf | API-11 | 2026-10-15 |
| Cookie 属性 | MDN Set-Cookie | https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie | API-8、API-9 | 2026-10-15 |
| 错误响应格式 | RFC 9457 Problem Details for HTTP APIs；主参考 Zalando #176、#177 | https://www.rfc-editor.org/rfc/rfc9457.html | API-17 | 2026-10-15 |
| JSON 顶层结构 | 主参考 Zalando #167、#110（顶层用对象） | https://opensource.zalando.com/restful-api-guidelines/ | API-18 | 2026-10-15 |

## 二、偏离登记

- 会话期限（API-10）：固定 30 天、无空闲超时，偏离 OWASP 会话管理「should implement an idle or inactivity timeout」与「absolute timeout」。理由：PRD D7 经项目主人确认；空闲超时要求读请求写 sessions，会推翻 T4；补救为登出即删服务端会话、角色改即时生效、Cookie 加 HttpOnly 与 Secure。将来风险变高时加空闲超时，见 BACKLOG。

## 三、待登记

- 代码风格：Lec 8。
