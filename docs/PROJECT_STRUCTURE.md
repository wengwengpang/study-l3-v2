# 项目目录结构

> 记录目录树 + 每个关键文件一句话职责。每节课结课更新。

## 当前目录树（Lec 1 结课）

.
├── .claude/
│   └── agents/
│       ├── client.md        用户研究员角色，只提问和综合，不扮用户
│       └── persona.md       假设目标用户角色，AI 设定，未经真人验证
├── .gitignore
├── CLAUDE.md                项目宪法，三层结构，当前到第二层（方向）
└── docs/
    ├── COURSE_RULES.md          课程协作规则，37-56 号
    ├── PROJECT_STRUCTURE.md     本文件
    ├── TEACHING_STYLE.md        讲课范式单一信息源，桥梁指向它
    ├── design/
    │   └── USER_RESEARCH.md     用户研究报告，真需求与 AI 假设两栏物理分开
    └── lessons/
        ├── 00-full.md           第 0 课完整笔记
        ├── 00-cheatsheet.md     第 0 课速查卡
        ├── 01-full.md           第 1 课完整笔记
        ├── 01-cheatsheet.md     第 1 课速查卡
        └── anti-patterns.md     反模式库，1-22 号

## CLAUDE.md 追踪（规则 56）

- ~/.claude/CLAUDE.md
  全局通用宪法，跨所有项目生效。已完整：三大信仰、AI 行为协议、输出格式、反模式、方法论参考库。通用规则只住这里。

- ~/projects/study-l3-v2/CLAUDE.md
  本项目宪法，分三层随课程演进：
    第一层 通用协议 + 13 条陷阱（开课前已建）
    第二层 项目事实（Lec 1 起填，当前仅"方向：团队任务协作工具"）
    第三层 决策边界 D1-D7 + 权限（Lec 6 建）
