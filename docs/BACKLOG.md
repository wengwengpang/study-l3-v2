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
10 | 下沉 | 沙箱（sandboxing）：权限规则管得住 CC 的文件工具与 Bash 重定向，管不住自己打开文件的子进程（如 python 脚本）。OS 级封堵需启用沙箱 | Lec 8（与第 9 条同组）
11 | 下沉 | PreToolUse hook：ask 档对 Bash 路径的覆盖范围官方文档未写死，未能查证。hook 是唯一能罩住每个工具调用、不受模式与规则影响的手段 | Lec 8（与第 9、10 条同组）
12 | 下沉 | lint 限制跨模块 import Repository，让「一表一主」从语义层约定变成机械层的墙。Repository 本身挡不住别的模块直接注入 Prisma | Lec 8
13 | 加课 | 角色变更后主动通知前端刷新。当前 Q1 方案下角色改动即时生效于后端，但前端入口需下次取数才更新 | Lec 13（实时/通知那节）
14 | 收敛 | 前端除路由层外的目录组织未定。Next.js 官方对非路由文件不做规定，ARCHITECTURE 与 TECH_STACK 两份均未写 | Lec 7 建骨架前
15 | 收敛 | KNOWLEDGE_BASE 里 backend 角色写的是 JWT 鉴权 + class-validator 校验，本项目实际是 DB session + Zod。照知识库建角色会建错 | Lec 10 建 backend 角色前
16 | 收敛 | 任务标题、描述的必填与空值规则未定义。schema 两列非空（prisma/schema.prisma:83-84），但允不允许空字符串无出处；项目名称有必填规则（PRD.md:221），任务无对应条目 | 回填 PRD，05-API 前
17 | 收敛 | 请求体多出的字段（如 projectId、status），Zod 管道是剔除还是拒绝，未定义 | 05-API
18 | 下沉 | sessions.token_hash 无唯一约束也无索引（prisma/schema.prisma:43），但每个请求都按它查一次，等于全表扫 | Lec 9 做 migration 时
19 | 下沉 | 过期会话的清理机制未定义。T4 定了不续期，但没定过期记录何时删 | Lec 9 或更后
20 | 收敛 | 未认领任务（assigneeUserId 为空）执行者是否可见，PRD 无明文。第三节 R2-7 按「算不相等」即不可见处理，属推导。任务列表接口会再撞上 | 05-API
21 | 收敛 | ARCHITECTURE.md 第二节六处措辞待回写（详见第三节末「本节暴露的问题」1-6）：Guard 可调范围 vs sessions 归属、ValidationPipe 措辞、Pipe 未提查询参数与路径参数、两级权限旧界线含假理由、决策 6 仍列待定、assignee 依赖措辞。另 UI_DESIGN 页 5 风险提示区需补延后注记（PRD 注记 5 已裁决，页 5 漏扫，属规则 69 立规之前的历史遗留） | 05-API 开课时先处理
