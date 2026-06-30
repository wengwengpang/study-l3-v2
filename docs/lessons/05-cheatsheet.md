# Lec 5 速查卡 · 数据建模

## 主线
architect 三步推 schema，逐段审，不一次甩出：
1 推实体（不写字段）→ 2 设字段+三决策（不连关系）→ 3 连关系+出 Prisma。
每步给死停止条件。

## 6 张表
users / sessions / projects / project_memberships(中间表,唯一约束) / tasks / notifications。

## 三决策
- 主键：自增整数（小项目单库，不用 UUID）。
- 删除：MVP 硬删，软删除进 BACKLOG，将来 EMC 演进。
- 时间：timestamptz 带时区。

## onDelete 三类
- 会话随人走 → Cascade。
- 任务资产保全 → SetNull（assignee 必须可空）。
- 其余 → Restrict（防无声连坐）。

## 一句话口诀
- 实体从 PRD 名词推，每个追来源。
- PRD 没定义的字段不许加，入"待确认"。
- 看着顺的技术结论，先问"有没有藏着该我拍的取舍"（反模式 33）。
- architect 只 Read，schema 由 cat 落盘。

## 产物
prisma/schema.prisma（6 model+3 enum）。
