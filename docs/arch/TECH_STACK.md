# TECH_STACK · 技术栈选型

> 去留：长期。
> 本表为 MVP 选型，随课扩展（Lec 4 产出）。
> 方针：MVP 先跑通，扩展留接口。不为「以后可能用」提前堆，但每个选择留清晰扩展点。
> 每项标：象限（甜区/权衡/可有可无/排除）+ 驱动来源（约束驱动 / 教学驱动）。
> 行号出处指向 PRD.md / UI_DESIGN.md / CLAUDE.md，为 Lec 4 时点行号，文件后续编辑可能漂移。

## 一、已定选型（约束已锁，全部约束驱动）

语言
- TypeScript —— 甜区。全栈同语言、前后端共享类型；栈已锁、生态成熟。

工程
- pnpm workspaces（Monorepo）—— 甜区（兼服务 Lec 5 共享类型）。比 Turborepo/Nx 轻，无额外构建编排。
- Zod（数据校验）—— 甜区。前后端共享一份 schema，写一次两端复用（密码规则 PRD.md:149）。

前端
- Next.js（App Router）—— 甜区。10 个页面（UI_DESIGN.md:14）、受保护路由满足未登录重定向（PRD.md:168）、SSR 利于首屏。
- Tailwind CSS + shadcn/ui —— 甜区。设计已锁（UI_DESIGN.md:165-166）；三态所需组件齐备（UI_DESIGN.md:166）。

后端
- NestJS —— 甜区（结构偏重但已锁）。Guards 承载权限拦截（PRD.md:193-199），模块化 DI 适合多实体。

数据
- PostgreSQL —— 甜区。强一致 + 唯一约束（邮箱唯一 PRD.md:148）、多对多关系（user×project×role PRD.md:173）。
- Prisma（ORM）—— 甜区。类型安全直通 TS；migration 支持 EMC 演进。

部署
- Docker + Docker Compose —— 甜区。单 VPS 多服务编排，环境一致。此处「环境一致」指镜像与运行时一致，配置按环境不同（05-ARCH T23）。
- Nginx —— 甜区。反向代理 + TLS 终止。不托管静态资源，静态资源由前端 Next.js 服务进程自身发出（05-ARCH T9，原定三职责已收窄为两项）。

## 二、四个分叉的裁决（Michael 拍板，已验证）

1. 鉴权 → Session 存 PostgreSQL（经 Prisma）
   驱动：约束驱动。
   为什么：PRD 要登出立即失效（PRD.md:167-168）+ 角色改后即时生效（PRD.md:207），需服务端存状态，无状态 JWT 做不干净。DB session 用已有 PG 即满足，不为此拉起 Redis。
   对比上一项目：TaskFlow 用 JWT。本项目约束变了（多了即时失效），选型随约束变。

2. Redis → MVP 不引入，留接口
   驱动：暂非约束、暂无明确教学课节。
   为什么：鉴权走 DB session 后，Redis 在 MVP 无活可干。无缓存压力仍引入即过度设计，违反「不提前堆」方针。扩展点 #2 已留可替换接口。
   备注：若后续加专门缓存/Redis 教学课，再升级为引入（教学驱动），属「加课」决定。

3. 实时通信 → MVP 不做，通知表 + 刷新/轮询
   驱动：本版约束驱动；WebSocket 留 Lec 13（教学驱动）。
   为什么：PRD 验收只要「刷新可见」（PRD.md:23、PRD.md:42、PRD.md:71），主动推送 US-02b 已 P2 延后（PRD.md:96）。课程硬底线（CLAUDE.md:52）要「实时或通知」——通知表已满足「通知」支。WebSocket 作为教学驱动功能在 Lec 13 加入，扩展点 #1 已铺路。
   关键区分：实时这个功能，产品不需要，课程需要。两个时间线，不是两个打架的需求。
   修订（补课 05-API，问 469 A）：本版通知模块是空壳，表已建、MVP 内不产生任何通知（ARCHITECTURE 第一节决策 4）。本条与扩展点 1、第四节说的「本版通知表」只指表已建、做法是轮询；课程硬底线的「通知」那一支在 Lec 13 兑现。上面原文不改。

4. 数据校验 → Zod（已并入第一节）
   驱动：约束驱动。一份 schema 两端复用，贴合共享类型目标。

## 三、扩展点（为后续加课预留）
1. 通知层抽象：首版仅「站内通知表 + 轮询」；预留 NotificationChannel 接口，未来 US-02b 预警（PRD.md:94）、邮件（Out of Scope PRD.md:112）作为新 channel 接入，不改调用方。
2. 会话存储可替换：DB session 读写封装在独立 provider，未来换 Redis 只换实现不动业务。
3. 成员-角色多对多表：(user, project, role) 关系表（PRD.md:173），为未来多负责人（D4 首版单负责人 PRD.md:268）预留，不把负责人写成项目表单一外键。
4. 任务实体可挂载：tasks 主键稳定，后续子任务/附件/评论（PRD.md:114）以 task_id 外键挂载到任务，外键长在子表一侧，tasks 表本身无需预留字段；首版不建这些子表。（措辞修订于补课 05-ARCH：原措辞「任务表预留外键挂载位」易被读成 tasks 表上要有预留字段，architect 据此报过一次冲突，核查为措辞歧义，schema 无缺失。）
5. 共享类型包：packages/shared 承载 SHARED_TYPES，前后端引用同一份 DTO/枚举（任务状态 PRD.md:51、角色 PRD.md:206）。
6. Schema 演进走 EMC：Prisma migration 先扩展兼容、迁移、再收缩（信仰 3，CLAUDE.md:13）。

## 四、驱动来源小结
- 约束驱动：语言/工程/前端/后端/数据/部署全部；鉴权（DB session）；实时（本版通知表）。
- 教学驱动（非本版兑现）：WebSocket（Lec 13）。
- 延后留接口：Redis。

## 五、选型依据的约束（第 4 课拍板，写书时补记，问 732 A）
第 4 课选型前拍的，当时只有部署写进了本文件，其余三条没写。
- 规模：小规模团队级（5-50 人，低并发）。这是项目主人定的设计假设，不是用户验证过的数字；每个项目的任务数、成员数见 PRD「假设账本」。
- 团队：单人全栈，栈沿用上一项目（React/Node/TS/NestJS/Next.js/PostgreSQL/Prisma/Redis/Docker/Nginx）。
- 部署：单 VPS + Docker Compose + Nginx。
- 时间与成本：学习节奏，无硬期限；零预算，全开源自托管。
