# DECISIONS · ADR-Lite 决策记录

> 每条三行：背景 / 决策 / 后果。后果诚实写代价，明确写「放弃了什么」。
> 决策内容以 docs/arch/TECH_STACK.md 定稿为准（Lec 4 产出）。
> 行号为 Lec 4 时点，文件后续编辑可能漂移。

## ADR-001 · 鉴权用 DB session 而非 JWT
- 背景：PRD 要求登出立即失效（PRD.md:167-168）、角色改后即时生效（PRD.md:207），需服务端可控的会话状态；无状态 JWT 在「主动失效」上做不干净。
- 决策：会话存 PostgreSQL（经 Prisma），用已有 PG 承载，不为此引入新组件。
- 后果：换来即时失效与即时权限变更的可控性；代价是每次请求多一次 DB 往返（比 JWT 纯签名校验重），且会话状态需自己维护清理。放弃了 JWT 的无状态与水平扩展便利。

## ADR-002 · Redis 在 MVP 延后引入
- 背景：鉴权改走 DB session 后（见 ADR-001），Redis 在 MVP 已无明确职责；无缓存压力、无专门教学课节。
- 决策：MVP 不引入 Redis，会话读写封装在独立 provider（扩展点 #2），留可替换接口。
- 后果：换来更少的运维组件、更简单的环境，守住「不提前堆」方针；代价是会话查询直压主库 PG，未来真出现缓存/会话压力时需补一次引入改造。放弃了「现在就备好缓存层」的前置便利。

## ADR-003 · 实时通信 MVP 延后，WebSocket 留 Lec 13（教学驱动与约束驱动分离）
- 背景：PRD 验收只要「刷新可见」（PRD.md:23、42、71），主动推送 US-02b 已 P2 延后（PRD.md:96）；课程硬底线要「实时或通知」（CLAUDE.md:52），通知表已满足「通知」这一支。
- 决策：MVP 做通知表 + 刷新/轮询，不做实时推送；WebSocket 作为教学驱动功能留到 Lec 13，先铺扩展点 #1。这是教学驱动与约束驱动的分离——实时这个功能产品当前不需要（约束驱动），课程后续需要（教学驱动），是两条时间线而非互相打架的需求。
- 后果：换来 MVP 范围收敛、不背 WebSocket 的连接管理与状态同步复杂度；代价是用户需手动刷新/靠轮询才能看到更新，体验不如实时，轮询有额外请求开销。放弃了 MVP 阶段的即时推送体验。

## ADR-004 · 数据库选 PostgreSQL 而非 MySQL
- 背景：需要强一致 + 唯一约束（邮箱唯一 PRD.md:148）、以及 user×project×role 多对多关系建模（PRD.md:173）。
- 决策：选 PostgreSQL 作为主库，配 Prisma 做类型安全 ORM 与 migration。
- 后果：换来更严谨的约束与关系表达、对复杂查询与未来演进更友好；代价是若团队更熟 MySQL 则有一次性上手成本。放弃了 MySQL 的广泛默认部署便利。

## ADR-005 · 数据校验用 Zod 而非 class-validator
- 背景：项目目标是前后端共享一份类型（packages/shared 扩展点 #5）；密码等规则需两端一致校验（PRD.md:149）。
- 决策：用 Zod 写一份 schema 前后端共享复用，而非 NestJS 默认的 class-validator 装饰器。
- 后果：换来「写一次、两端复用」与从 schema 直接推导 TS 类型；代价是偏离 NestJS 默认范式，需自接 Zod 管道（如 ZodValidationPipe），生态示例不如 class-validator 顺手。放弃了 NestJS 官方默认校验链的开箱即用。

---

## ADR-DB-001 · 主键策略：自增整数
- 背景：小型团队内部协作工具，单 VPS 部署，PRD 无公开分享链接/离线创建/跨库合并/分布式写入需求。PostgreSQL + Prisma 已定。
- 决策：6 张表统一自增整数主键（Int @id @default(autoincrement())）。
- 后果：换来调试简单、索引小、排查直观；放弃 UUID 的不可预测性与分布式友好，ID 可被猜到、不适合未来跨库合并。

## ADR-DB-002 · 删除策略：MVP 硬删除，软删除入 BACKLOG
- 背景：PRD 首版不做项目删除（删项目连带删任务属高风险），无删用户/删任务/移除成员故事。
- 决策：全表不加 deleted_at，MVP 不设业务删除入口。项目主人拍板 C 方案：软删除留待将来真出现删除故事时，用 Expand-Migrate-Contract 演进（见 BACKLOG 第 8 条）。
- 后果：换来查询不必过滤 deleted_at、避免唯一约束与软删数据冲突；放弃内建恢复/回收站，将来恢复误删需靠备份或迁移。
- 备注：本决策曾被 architect 包装成"理所当然的技术结论"，经拆解后由主人按演进哲学重新拍板（反模式 33）。

## ADR-DB-003 · 时间存储：timestamptz 带时区
- 背景：30 天登录态、任务截止、长时间无进展判断、未读预警时间均参与业务判断。
- 决策：所有时间字段 Prisma DateTime + @db.Timestamptz(6)，落 PostgreSQL timestamptz。
- 后果：换来统一绝对时间语义，便于多时区转换；代价是 UI 层须明确时区/日期口径，不能把库时间直接当本地时间显示。

## ADR-DB-004 · onDelete 级联策略：三类区别对待
- 背景：MVP 无业务删除故事，onDelete 是"万一"防护栏。无脑全 Restrict 过于一刀切，局部全级联误删杀伤大。
- 决策：按数据性质分三类——
  - sessions.user → Cascade（会话属随人数据，人删则清）。
  - tasks.assignee → SetNull（任务资产保全，删用户后变未认领；assignee_user_id 因此可空）。
  - 其余业务外键（task→project、membership→user/project、notification→user/task）→ Restrict（防无声连坐删除）。
- 后果：贴合"数据资产不无声蒸发"安全直觉；代价是将来做删除功能时，Restrict 的外键需先写清理逻辑。

## ADR-DB-005 · 三个不单独成表的实体与几处字段口径（补记）
- 背景：Lec 5 定字段时，roles、invitations、任务状态历史要不要单独成表，以及几处字段口径，由主人拍板。课上说这些裁决要进决策文件，结课只追加了 ADR-DB-001~004，它们只留在 docs/lessons/05-full.md「排除字段」一节与 schema 里。
- 决策：三样都不单独成表。角色是 project_memberships 上的 role 枚举字段（MemberRole：owner / executor）；加成员是负责人填已注册用户的邮箱、指定角色，直接写一行 project_memberships，不存待接受的邀请；任务只存当前状态，另加 status_updated_at 记最后一次变更时间，供判断长时间无进展。tasks.description 必填（architect 初判可空，主人拍板必填）；tasks.status 默认 not_started。priority、display_name、created_by 不加。
- 后果：换来表少、查询简单，不为 PRD 没定义的需求建表；放弃了自定义角色、发邀请等对方接受、回看任务状态轨迹三样能力，将来真有这类需求再加表。
- 备注：复课前照课堂记录补记，没有新做决策（DECISIONS-R1 R1-343 问 296 A）。
