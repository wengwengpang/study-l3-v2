# STANDARDS · 本项目采用的标准

> 项目：study-l3-v2（团队任务协作工具）
> 去留：长期。
> 用途：登记本项目每个领域认哪一份主参考。单一信息源：别处要说「照什么标准」，指向本文件，不另抄。
> 做法（05-API 第二窗口问 339 A、343 A、345 A 定）：
> - 按层定先后：协议层正式标准 → 安全基线 → 框架约定 → 设计规范 → 都没有才自定。
> - 冲突：上下层冲突，上层让下层；同层几家不一，列出来由项目主人拍，拍完记 ADR 或契约。
> - 每条标准分三档：必须（照做）、建议（便宜就做）、可选（不做但不堵死，记 BACKLOG）。
> - 标准管怎么做，不管做多少；凡称「标准」须给原文出处并当场核过，没核过的标「未核」。
> - 偏离主参考的地方，写进对应 ADR 或契约并带理由，本文件只列指针。

## 一、登记表

| 领域 | 主参考 | 原文 | 拍板 | 核对 |
|---|---|---|---|---|
| API 设计 | Zalando RESTful API Guidelines | https://opensource.zalando.com/restful-api-guidelines/ | API-5（docs/arch/API_CONTRACT.md「本节裁决汇总」） | 2026-10-15 |
| HTTP 语义（状态码、方法） | RFC 9110 HTTP Semantics | https://www.rfc-editor.org/rfc/rfc9110 | 协议层，必须照做 | 未核，第 4 段用到时核 |
| 提交信息 | Conventional Commits | 见 CLAUDE.md 第一层 C | 已在 CLAUDE.md 第一层 C | 未核 |

## 二、偏离登记

无。

## 三、待登记

- 会话凭据、Cookie、跨站请求伪造防护：05-API 第二窗口第 3 段定，安全类主参考候选 OWASP。
- 错误响应格式：05-API 第二窗口第 5 段定，候选 RFC 9457。
- 代码风格：Lec 8。
