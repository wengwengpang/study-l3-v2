# 项目目录结构

> 记录目录树 + 每个关键文件一句话职责。每节课结课更新。

## 当前目录树（Lec 2 前置整改）

.
├── .claude/
│   └── agents/
│       ├── client.md        用户研究员角色，只提问和综合，不扮用户
│       └── persona.md       假设目标用户角色，AI 设定，未经真人验证
├── .gitignore
├── CLAUDE.md                项目宪法，三层结构，当前到第二层（方向）
└── docs/
    ├── AGENT_SPEC.md            角色文件标准图纸，建角色必依据
    ├── COURSE_RULES.md          课程协作规则，37-58 号
    ├── LESSON_TEMPLATE.md       段落骨架标准图纸，讲段落必依据
    ├── PROJECT_STRUCTURE.md     本文件
    ├── TEACHING_STYLE.md        讲课手感标准，与 LESSON_TEMPLATE 搭档
    ├── design/
    │   └── USER_RESEARCH.md     用户研究报告，真需求与 AI 假设两栏物理分开
    └── lessons/
        ├── 00-full.md           第 0 课完整笔记
        ├── 00-cheatsheet.md     第 0 课速查卡
        ├── 01-full.md           第 1 课完整笔记
        ├── 01-cheatsheet.md     第 1 课速查卡
        └── anti-patterns.md     反模式库，1-23 号

## 课程标准文件清单（图纸目录）

这些是"怎么上课/怎么建产物"的图纸，新老师开课前须读：
- docs/AGENT_SPEC.md       角色文件长什么样（建角色依据）
- docs/LESSON_TEMPLATE.md  授课段落的骨架顺序（讲段落依据）
- docs/TEACHING_STYLE.md   讲课手感：语气/密度/比方
- docs/COURSE_RULES.md     课程规则 37+
- docs/lessons/anti-patterns.md  反模式库
- 桥梁格式               见调节器 H 节九节
开课必读共 6 个文件（规则 55 的 4 个 + AGENT_SPEC + LESSON_TEMPLATE，见规则 58）。

## CLAUDE.md 追踪（规则 56）

- ~/.claude/CLAUDE.md
  全局通用宪法，跨所有项目生效。已完整：三大信仰、AI 行为协议、输出格式、反模式、方法论参考库。通用规则只住这里。

- ~/projects/study-l3-v2/CLAUDE.md
  本项目宪法，分三层随课程演进：
    第一层 通用协议 + 13 条陷阱（开课前已建）
    第二层 项目事实（Lec 1 起填，当前仅"方向：团队任务协作工具"）
    第三层 决策边界 D1-D7 + 权限（Lec 6 建）
