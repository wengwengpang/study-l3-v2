# 项目目录结构
> 记录目录树 + 每个关键文件一句话职责。每节课结课更新（规则 50/52）。

## 当前目录树（补课 05-ARCH 结课 · 架构收尾第一节完成）
.
├── .claude/
│   ├── agents/
│   │   ├── architect.md     架构师角色，只 Read，model: opus，Lec 4 建
│   │   ├── client.md        用户研究员角色，只提问和综合，不扮用户
│   │   ├── designer.md      产品设计师角色，只 Read，三态 UI + 极简主义
│   │   ├── persona.md       假设目标用户角色，AI 设定，未经真人验证
│   │   └── pm.md            产品经理角色，只 Read，含隐性基础需求检查
│   ├── settings.json        权限系统 defaultMode + allow/ask/deny 三档，机械层护栏（Lec 6 建，05-ARCH 修，学生亲写，规则 66）
│   └── worktrees/           CC worktrees 空目录，git 不跟踪
├── .gitignore
├── CLAUDE.md                项目宪法，三层结构，当前到第三层 A（决策边界 D1-D8）
├── prisma/
│   └── schema.prisma       Prisma 数据模型，6 model + 3 enum + onDelete（Lec 5 建）
└── docs/
    ├── AGENT_SPEC.md            角色文件标准图纸
    ├── BACKLOG.md              跨课待办清单（第 9 条 Lec 6 加）
    ├── COURSE_RULES.md          课程协作规则，37-69 号 （68 留空未用）
    ├── KNOWLEDGE_BASE.md        课程知识库副本
    ├── LESSON_TEMPLATE.md       段落骨架标准图纸
    ├── PROJECT_STRUCTURE.md     本文件
    ├── TEACHING_STYLE.md        讲课手感标准，一至八节
    ├── arch/
    │   ├── ARCHITECTURE.md      系统架构：第一节模块划分 + 第二节分层（补课 05-ARCH 建，三四节待补）
    │   ├── DECISIONS.md         ADR-Lite 决策记录 ADR-001~005
    │   └── TECH_STACK.md        技术栈选型 + 四象限
    ├── design/
    │   ├── PRD.md               产品需求文档
    │   ├── UI_DESIGN.md         UI 设计
    │   └── USER_RESEARCH.md     用户研究报告
    └── lessons/
        ├── 00-full.md ~ 05-full.md          第 0-5 课完整笔记
        ├── 00-cheatsheet.md ~ 05-cheatsheet.md  第 0-5 课速查卡
        ├── 06-full.md           第 6 课完整笔记（决策边界 + 权限系统）
        ├── 06-cheatsheet.md     第 6 课速查卡
        ├── 05-arch-full.md      补课 05-ARCH 完整笔记（模块划分 + 分层）
        ├── 05-arch-cheatsheet.md 补课 05-ARCH 速查卡
        └── anti-patterns.md     反模式库，1-36 号

## 课程标准文件清单（开课必读 7 个，规则 58 六文件 + BACKLOG）
- docs/COURSE_RULES.md          课程规则 37-69（68 留空未用）
- docs/lessons/anti-patterns.md 反模式库 1-36
- docs/TEACHING_STYLE.md        讲课手感（一至八节）
- docs/PROJECT_STRUCTURE.md     项目结构现状（本文件）
- docs/AGENT_SPEC.md            角色文件标准
- docs/LESSON_TEMPLATE.md       授课段落骨架
- docs/BACKLOG.md               跨课待办清单
- 桥梁格式                     见调节器 H 节

## CLAUDE.md 追踪（规则 56）
- ~/.claude/CLAUDE.md
  全局通用宪法，跨项目生效。已完整。
- ~/projects/study-l3-v2/CLAUDE.md
  本项目宪法，三层：
    第一层 通用协议 + 13 陷阱（开课前建）
    第二层 项目事实：A 方向 + B 需求十七条 + C UI 结论 + D 选型结论 + E 数据模型结论
    第三层 A 决策边界 D1-D8（Lec 6 建 D1-D7，补课 05-ARCH 加 D8 文档口径冲突）✓
  配套机械层：.claude/settings.json 权限三档 + defaultMode（Lec 6 建，补课 05-ARCH 修：删三条死规则、rm 收紧、加 Edit(docs/arch/**)、显式声明 defaultMode）✓
  说明：第三层「语义层 D1-D7 在 CLAUDE.md，机械层 allow/ask/deny 在 settings.json」，两轴垂直。

## 补课链进度（规则 49 课数弹性）
Lec 5 只做了数据库 schema，architect 其余四件架构产物拆出延后，随后先上了 Lec 6 宪法课。
补课链四节，回头补齐 architect 架构收尾：
- 05-ARCH  系统架构   ✓ 已完成第一节模块划分 + 第二节分层架构
- 05-API   API 契约   待开
- 05-类型  共享类型   待开
- 05-环境  环境设计   待开
补完后重开 Lec 7 Monorepo 初始化（含 SG-1）。
注意区分：逻辑顺序上补课链排在 Lec 6 之前，实际执行在 Lec 6 之后（反模式 34）。
ARCHITECTURE.md 尚缺第三节数据流、第四节部署拓扑，由 05-ARCH 续课补齐。
