# 项目目录结构
> 记录目录树 + 每个关键文件一句话职责。每节课结课更新（规则 50/52）。

## 当前目录树（Lec 4 结课 · architect + 技术选型完成）
.
├── .claude/
│   ├── agents/
│   │   ├── architect.md     架构师角色，只 Read，model: opus，Lec 4 建。6必问+四象限+ADR，含方法论附录（防反模式25）
│   │   ├── client.md        用户研究员角色，只提问和综合，不扮用户
│   │   ├── designer.md      产品设计师角色，只 Read，三态 UI + 极简主义，守 D1-D9
│   │   ├── persona.md       假设目标用户角色，AI 设定，未经真人验证
│   │   └── pm.md            产品经理角色（边界守护者），只 Read，含隐性基础需求检查（反模式 29）
│   └── worktrees/           CC worktrees 功能留下的空目录，git 不跟踪，无内容
├── .gitignore
├── CLAUDE.md                项目宪法，三层结构，当前到第二层 D（技术选型关键结论）
└── docs/
    ├── AGENT_SPEC.md            角色文件标准图纸，含方法论落点通则（Lec 4 加）
    ├── BACKLOG.md              跨课待办清单，开课必读第 7 个（规则 65）
    ├── COURSE_RULES.md          课程协作规则，37-65 号
    ├── KNOWLEDGE_BASE.md        课程知识库（课本副本，置于项目内便于 CC 取用）
    ├── LESSON_TEMPLATE.md       段落骨架标准图纸，讲段落必依据
    ├── PROJECT_STRUCTURE.md     本文件
    ├── TEACHING_STYLE.md        讲课手感标准，与 LESSON_TEMPLATE 搭档
    ├── arch/                    架构产物目录，Lec 4 建
    │   ├── DECISIONS.md         ADR-Lite 决策记录 ADR-001~005（背景/决策/后果）
    │   └── TECH_STACK.md        技术栈选型 + 四象限理由 + 四分叉裁决 + 扩展点
    ├── design/
    │   ├── PRD.md               产品需求文档，十七条 + Lec 3 澄清注记 ×3 + 待验证盲区
    │   ├── UI_DESIGN.md         UI 设计，五大节，Lec 3 建
    │   └── USER_RESEARCH.md     用户研究报告，真需求与 AI 假设两栏物理分开
    └── lessons/
        ├── 00-full.md ~ 03-full.md          第 0-3 课完整笔记
        ├── 00-cheatsheet.md ~ 03-cheatsheet.md  第 0-3 课速查卡
        ├── 04-full.md           第 4 课完整笔记（architect + 选型）
        ├── 04-cheatsheet.md     第 4 课速查卡
        └── anti-patterns.md     反模式库，1-32 号

## 课程标准文件清单（图纸目录）
新老师开课前须读，开课必读共 7 个文件（规则 58 六文件 + BACKLOG，规则 65）：
- docs/COURSE_RULES.md          课程规则 37-65
- docs/lessons/anti-patterns.md 反模式库 1-32
- docs/TEACHING_STYLE.md        讲课手感：语气/密度/比方
- docs/PROJECT_STRUCTURE.md     项目结构现状（本文件）
- docs/AGENT_SPEC.md            角色文件标准（建角色依据）
- docs/LESSON_TEMPLATE.md       授课段落骨架（讲段落依据）
- docs/BACKLOG.md               跨课待办清单（规则 65 新增）
- 桥梁格式                     见调节器 H 节九节

## CLAUDE.md 追踪（规则 56）
- ~/.claude/CLAUDE.md
  全局通用宪法，跨项目生效。已完整：三大信仰、AI 行为协议、输出格式、反模式、方法论库（含「信息分层落盘」）。
- ~/projects/study-l3-v2/CLAUDE.md
  本项目宪法，三层随课程演进：
    第一层 通用协议 + 13 条陷阱（开课前已建）
    第二层 项目事实：A 方向（Lec 1）+ B 已确认需求十七条（Lec 2）+ C UI 设计关键结论（Lec 3）+ D 技术选型关键结论（Lec 4）
    第三层 决策边界 D1-D7 + 权限（Lec 6 建，未建）
