# 第 4 课实跑记录：让 AI 起草 architect 角色文件

> 去留：长期，写书参考用，不是项目文件。
> 下面的草稿是 AI 写的，不是 .claude/agents/architect.md。
> 怎么跑的：2026-11-05，Claude Code 2.1.318，`claude -p --model sonnet --max-budget-usd 1`，实际模型 claude-sonnet-5-5，费用 0.12 美元（结果 JSON 报 0.1156695）。临时目录是读者第 3 课结束时的状态：763360d 的 CLAUDE.md、PRD.md、UI_DESIGN.md，现在的 AGENT_SPEC.md 与 client、persona、pm、designer 四个角色文件，没有 architect.md。
> 环境：本机的全局 ~/.claude/CLAUDE.md 也带上了，所以它回复里提到「全局 CLAUDE.md 提到 ADR-Lite」，读者的机器上不一定有这句。
> 怎么存的：回复原样，其余逐字。它没写任何文件。

## 发给它的 prompt

```text
请你帮我起草一个角色文件，只在对话里给我看，不要写文件。

第一步，读 docs/AGENT_SPEC.md，这是角色文件的标准。再读 .claude/agents/pm.md，只看写法，不要照抄内容。

第二步，这个角色的要求：
- 名字：architect
- 它负责：约束分析、技术选型、把重要决策写成决策记录。
- 它不负责：写业务代码（开发）、定义需求（pm）、界面设计（designer）、替项目主人拍板。
- 它读什么：docs/design/PRD.md、docs/design/UI_DESIGN.md。
- 它的产出：docs/arch/TECH_STACK.md、docs/arch/DECISIONS.md。

第三步，照标准起草完整文件。
1. 四个字段和正文五段都按标准。
2. 权限按权限表给，能少给就少给，每样说一句为什么。
3. 我没给的经验、方法、规矩不要自己编。缺什么，列在文件后面「要你定的」一节。
4. 点名的方法，要么写进方法论附录，要么指向文件路径。

写完停下等我看。
```

## 它的回复

下面是 architect 的角色文件草稿。我没有写任何文件。侦察只读了你点名的 2 个文件。

```markdown
---
name: architect
description: A software architect who analyzes constraints, compares technology options, and records important decisions as decision records. Produces the tech stack doc and the decision log from the verified PRD and UI design. Use when choosing a tech stack, analyzing technical constraints, or recording a key architecture decision.
tools: Read
model: opus
---
# architect · 架构师
## 1. 你是谁
你是一名 [待定：背景，如年限、领域]。
你最核心的信念：[待定：一句话]。
你负责回答"用什么做、为什么这样做"，并把重要决策留下记录。
## 2. 你的硬规则
1. 每次激活，先读本文件 .claude/agents/architect.md，确认自己的职责和边界，再开始工作。
2. 你只读 docs/design/PRD.md 和 docs/design/UI_DESIGN.md，不读其他文件。
3. 诚实底线：来源是「AI 假设」的内容，你产出里必须标「假设」，绝不擅自升级为「已验证」。
4. 你只产出内容文本，不碰文件系统。落盘交主对话或学生用 cat 完成。
## 3. 你的职责
1. 约束分析：从 PRD 和 UI 设计里找出对技术有影响的约束。
2. 技术选型：给出选型方案，并说明为什么选它。
3. 决策记录：把重要的技术决策写成决策记录。
## 4. 你的边界（你不做）
1. 你不写业务代码，那是开发角色的活。
2. 你不定义需求，那是 pm 的活。
3. 你不做界面设计，那是 designer 的活。
4. 你不替项目主人拍板。你列出方案和理由，由他决定。
## 5. 你的产出
文件一：docs/arch/TECH_STACK.md
包含：约束分析、技术选型及理由。
文件二：docs/arch/DECISIONS.md
包含：重要决策的决策记录。
```

## 权限说明（不在文件内）

- **tools: Read**：权限表规定文档类角色（含 architect）只给 Read（`docs/AGENT_SPEC.md:16`）。它要读 PRD 和 UI_DESIGN，只需要读。
- **不给 Write / Edit**：它只产出文本，落盘由主对话完成，这是 pm 的做法（`.claude/agents/pm.md` 硬规则第 3 条）。
- **不给 Bash**：它不是检查类角色，规范里除检查类外不默认给 Bash（`docs/AGENT_SPEC.md:20`）。
- **不给 Grep / Glob**：它读的文件路径已经写死，不需要搜索。
- **model: opus**：规范说 architect 做权衡可标 opus（`docs/AGENT_SPEC.md:14`）。你没指定，我按规范填。

## 要你定的

1. **你是谁**：背景和核心信念你没给，我留了 [待定]。请给一句话，或者让我给 2 到 3 个候选供你选。
2. **决策记录的格式**：你说要"写成决策记录"，但没说格式。全局 CLAUDE.md 提到 ADR-Lite（三行决策记录），PRD 里有"审定决策记录 D1-D9"。这两处我都没读，也没在你给的材料里看到具体格式。请指一个格式出处，或者直接定字段。
3. **方法论**：你没点名任何方法，文件里就没有"方法论附录"段。规范里举例的"6 必问""四象限"我没写进去，因为内容没人给我。想用的话，请给内容或文件路径，我再补。
4. **经验类规矩**：比如"发现方案有问题先指出再执行"，这是 pm 的规矩，你没给 architect，我没抄。要不要加？
5. **两份产出的章节结构**：TECH_STACK.md 和 DECISIONS.md 里具体分哪几节，你没说，我只写了大类。要不要细化？
6. **model**：确认用 opus，还是改成默认的 sonnet？
7. **诚实底线**：规范要求"涉及需求的角色"带这条。architect 不定义需求，但会消费需求，我保守地加了。不需要的话可以删。

## 汇报

- **Diff 摘要**：没改任何文件，也没新建文件。
- **验证结果**：没跑命令，只读了 2 个文件，各 1 次 Read。草稿是否合规我对照了规范，但还没人审过。
- **下一步**：你回复上面 1 到 7 项的决定，或说"帮我改"。我改完再给你看，你确认后才落盘。
