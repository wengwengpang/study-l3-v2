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
