# 05-ARCH 速查卡

## 六个模块（表的拥有者）
users→users｜auth→sessions｜authz→无表(只读)｜projects→projects+project_memberships｜tasks→tasks｜notifications→notifications
依赖单向：users 是地基，无依赖。跨模块只走对方 Service，不碰对方 Repository。

## 后端层序（NestJS 真实执行顺序）
Guard → Pipe → Controller → Service → Repository → Prisma
守卫在 Controller 之前。被 Guard 拒的请求，Controller 方法不会被调用。

## 权限落点（本课最值钱的一句）
不查业务表就能判的 → Guard（角色级）
必须先拿到记录才能判的 → Service（数据级）

## 共享层判据（四问全过才进 packages/shared）
1 前后端都真的用吗？
2 有 IO / env / 单侧框架依赖吗？有则不进
3 变的时候两端必须同时变吗？
4 是安全边界的执行点吗？是 → 规则可共享，但后端必须独立强制，共享层绝不能是唯一执行点

## 命名三层（边界在 Prisma 的 @map）
数据库列名 snake_case｜Prisma 与 TS camelCase｜API 字段 camelCase
snake_case 被关在数据库里，全链路不做转换。字段名不一致这类联调错误结构上不会发生。

## 机械层三条铁律（本课血的教训）
1 文件护栏只写 Edit(path) 与 Read(path)。写 Write(path) = 死规则，引擎不查
2 settings.json 必须显式写 defaultMode，不留空靠厂商默认值
3 改完权限文件必须验证：/permissions 看解析 → 实测受管路径 → 确认弹窗后答 No

## 新增编号
反模式 35 死规则｜36 未声明档位
规则 67 桥梁不覆盖持久文件｜69 拍板即扫传播面（68 留空未用）
决策边界新增 D8 文档口径冲突：只报不改

---

## 第三节 数据流 · 速查

**是什么**：让真实请求走进第一二节画的平面图，看哪扇门是墙。纸上走查，不是测试。
**判据**：覆盖每一种检查点，不是每一个接口。

**R2 读路径四道拦截**
R2-1 你登录了吗（读 sessions）
R2-2 你是这个项目的人吗（读 project_memberships，角色放进请求上下文）
R2-6 这条任务真属于这个项目吗（比对 task.projectId 与路径 id）
R2-7 这条任务是你的吗（执行者才比对 assigneeUserId；负责人跳过）
全程只读，不写任何表。

**W1 写路径三道拦截**
W1-2 你是负责人吗（Guard）
W1-3 请求体形状对吗（Pipe，自写 Zod 管道）
W1-5 assignee 是本项目成员吗（Service，跨模块调 ProjectsService）
唯一写的表是 tasks。

**十二条裁决一句话**
T1 自写 Zod 管道 / T2 路由嵌项目 id + Service 比对归属 / T3 路径 id 不校验、查询参数走管道 / T4 会话固定 30 天不续期 / T5 assignee 必须是项目成员 / T6 界线加「读不读请求体」这一维 / T7 决策 6 已延后
A 角色经请求上下文传 / B 路径 id 转不动当查不到 / C R2-8 取数方式留 05-API / D projectId 只从路径取 / E W1-5 退回参数不合法

**一句话要点**
鉴权用哪个 id 判，读写就必须用哪个 id。不一致就是漏洞。
决策可以对，理由可以是错的。理由传得比决策远。
子代理任务拆轮，一轮一件交付物，中断只丢正文不丢判断。

---

## 第四节 · 部署拓扑 速查

**一句话**：第二节画屋里家具怎么摆，第四节画小区平面图。图纸不是生效，真跑在 Lec 9。

**四个容器**
Nginx（传达室）/ 前端 Next.js 服务进程 / 后端 NestJS / PostgreSQL。
前端单起，为保住 SSR 与服务端重定向。

**Nginx 两职责**
反向代理 + TLS 终止。不托管静态资源，静态由前端自己发。

**分流方式**
同域名按路径前缀：根路径到前端，API 前缀到后端。一张证书，Cookie 同源，不配跨域。

**两条请求路径**
浏览器访问：公网 443 → Nginx 终止 TLS → 按前缀分流。
SSR 取数：前端容器内网直连后端，不回 Nginx。代价是两套后端地址 + 手工转发凭据。

**端口**
对外只有 Nginx 的 80/443。
数据库：开发暴露、生产不暴露。
前后端：开发暴露、生产不暴露。

**本地形态**
日常只有数据库进容器，前后端在宿主机跑。另留完整四容器配置，上线前验一次。

**三条留白**
TLS 签发续期 → Lec 15（引入签发组件属 D4 选型）。
备份方案 → BACKLOG，Lec 15 灾备。
环境变量密钥 → ENV_DESIGN。

**迁移**
人工触发的独立步骤，不随容器启动跑。理由是 D5：迁移不可逆，要喊主人加双确认。

**模块边界三条**
AuthGuard 属 auth 读 sessions；AuthzGuard 属 authz 读 project_memberships。
依赖图只记业务依赖，Guard 挂在路由上不计入。
authz 不依赖 auth，用户 id 经请求上下文取得。

**三条带走的教训**
产出短不等于决策少，估重量要数未决项。
拆两轮买的是选择权，一轮跑完 AI 会替你把取舍填掉。
立口径要回扫自己的过去，定义类裁决的传播面包含它的历史条目。

## 补记 · 回写执行

- 25 处回写全过，7 条验证通过。PENDING-REWRITES.md 已删。
- Guard 归属：AuthGuard 属 auth 读 sessions；AuthzGuard 属 authz 读 project_memberships。
- 依赖图口径：只记业务依赖（代码调 Service），路由挂 Guard 不计入。
- 两级权限尺子：只凭会话+路径+project_memberships 能判的归 Guard，要读请求体或业务记录的归 Service。
- 批量回写的做法：Edit 按内容匹配、一处一改一验、ask 弹窗审 diff。不用 sed（绕开护栏）。
- 验收预期写「逐行判，不得残留什么」，不写「应剩 N 行」（反模式 42 延伸）。
