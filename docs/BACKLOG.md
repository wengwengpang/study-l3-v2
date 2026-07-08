# BACKLOG.md · 跨课待办清单

> 用途：跨课待办，独立于桥梁（桥梁只活一节课，反模式 24）。
> 格式：编号 | 类型 | 一句话 | 何时做
> 类型：下沉 / 收敛 / 取经 / 加课
> 维护：开课必读 7 个（规则 58 六文件 + 本文件）；结课逐条问有无新待办（规则 54 配套）。

1 | 取经 | 抄 Superpowers 的 eval 思路，验证规则真不真生效 | 结课收敛
2 | 取经 | 抄 Spec Kit 的跨工具持久 spec + 自动一致性检查 | 结课收敛
3 | 取经 | 抄 BMAD 的就绪闸 PASS/CONCERNS/FAIL 做成真机制 | 结课收敛
4 | 收敛 | 给 harness 加减法机制（规则只增不减的洞） | 结课收敛
5 | 收敛 | 给规则加验证机制（未验证散文的洞） | 结课收敛
6 | 加课 | 补一节 plugin 收尾课，把 harness 抽成可移植 plugin | Lec 19 后
7 | 下沉 | diff<100、提交格式、git status 等做成 hook | Lec 8
8 | 下沉 | 软删除：MVP 选硬删除未预留 deleted_at，将来出现删除故事时用 Expand-Migrate-Contract 演进（加列→改查询过滤→数据迁移），注意软删除与 email/(user_id,project_id) 唯一约束的冲突 | 出现删除故事时（大概率 Lec 13 功能迭代）
9 | 下沉 | 配置文件是攻击面：settings.json / hooks 能在同意前自动跑代码（见 CVE、PyPI 蠕虫经 SessionStart hook）。上 hooks 时加防护，settings.json 权限文件纳入 code review | Lec 8（上 hooks 时）
9 | 下沉 | 配置文件是攻击面：settings.json / hooks 能在同意前自动跑代码（见 CVE、PyPI 蠕虫经 SessionStart hook）。上 hooks 时加防护，settings.json 权限文件纳入 code review | Lec 8（上 hooks 时）
