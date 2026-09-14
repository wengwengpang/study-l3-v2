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
