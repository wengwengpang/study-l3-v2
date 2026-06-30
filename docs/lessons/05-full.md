# Lec 5 完整笔记 · 数据建模（schema 设计）

## 一句话
用 architect 把 PRD 十七条 + UI + 已定技术栈，三步推成 6 张表的 Prisma schema。

## 学到的能力
- 从 PRD 名词推导实体清单（名词法），每个实体能追到 PRD 来源。
- 给实体设字段，区分「PRD 明确的」「pm 推导的基础需求」「AI 建议补充待确认」三类。
- 定三个全表统一决策，每条走 ADR-Lite（背景/决策/后果，后果写明放弃什么）。
- 把实体连成关系网（一对多 / 多对多中间表 / 弱关联），落成能跑的 Prisma schema。
- 识别 AI 藏在「合理技术结论」里的越权取舍，把决策权要回来。

## 三步法（本课主线）
建模是复杂产物，拆三步逐段审，不一次甩出（规则 51）：
1. 推实体：只列实体，不写字段。
2. 设字段 + 定三决策：不连关系、不写 Prisma。
3. 连关系 + 出 Prisma：第一次产出机器能执行的文件。
每步给 architect 死停止条件，防它一口气全写完（规则 43）。

## 6 张表
- users：账号身份。
- sessions：DB session 登录态，user 删则 Cascade。
- projects：任务与成员的容器。
- project_memberships：users×projects 多对多中间表，承载项目内角色，(user_id,project_id) 唯一。
- tasks：任务本体，含 status / status_updated_at / due_at；assignee 可空，user 删则 SetNull（任务变未认领，资产保全）。
- notifications：站内卡点预警，recipient 与 task 弱关联。

## 三决策（ADR-DB-001~003）
- 主键：自增整数。理由：小型内部工具、单 VPS、无分布式/合并需求。放弃 UUID 的不可预测与分布式友好。
- 删除：MVP 硬删除，不预留 deleted_at。软删除入 BACKLOG（C 方案），将来用 EMC 演进。放弃内建恢复/回收站。
- 时间：timestamptz 带时区，落 Prisma DateTime + @db.Timestamptz(6)。放弃无时区的表面简单。

## onDelete 三类区别对待（B 方案）
- sessions→user：Cascade（会话随人走）。
- tasks.assignee→user：SetNull（任务资产保全，变未认领）。
- 其余业务外键：Restrict（防无声连坐删除）。
比方：会话是随身物品（人没了清掉），任务是公司资产（员工走了留下），项目是大楼（不能想拆就无声铲平）。

## 排除字段（守住 PRD 边界，防反模式 19）
priority、display_name、created_by、invitations 表、roles 表、任务历史表——PRD 未定义，一律不加或入待确认。

## Level 1 对应
网页版 TaskFlow 凭经验直接列 6 表、直接拍三决策。本课升级：每张表追到 PRD、每个决策配 ADR、结合本项目重判而非照搬，第一次产出带 Prisma 语法的真文件。

## 用到的知识点
角色 4 architect、补丁 16 四象限、补丁 7 ADR-Lite、协议 2 有预算侦察、协议 3 证据契约、协议 5 ≤3 澄清、协议 6 影响分析、协议 9 一致性、协议 13 EMC（软删除演进）、强化 14 决策边界、强化 16 决策权属。

## 本课新增
- 反模式 33：把"属于主人的取舍"包装成"理所当然的技术结论"（硬删除那步）。
- BACKLOG 第 8 条：软删除演进待办。
- ADR-DB-001~003 + onDelete 策略，落 DECISIONS.md。

## 产物
- prisma/schema.prisma（6 model + 3 enum + 关系 + onDelete）。
- docs/arch/DECISIONS.md 追加 ADR-DB-001~003 + onDelete 决策。
- CLAUDE.md 第二层追加 E（数据模型关键结论）。
