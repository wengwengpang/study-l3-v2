# 附录 H　问题与解法

这一份收课上提出的课程做法类问题，一个问题写一个案例。你遇到同样的问题时，翻到对应的案例，照着做。

每个案例十一节，顺序固定：问题是什么，症状与实据，为什么会这样，行业怎么解决，考虑过哪几种，最后怎么做的，具体怎么用，有没有用，换个项目照着做，还没解决的，出处。

这个结构借自两样现成的做法。一样是事后复盘。Google 的 SRE 一书这样定义它：「A postmortem is a written record of an incident, its impact, the actions taken to mitigate or resolve it,」「the root cause(s), and the follow-up actions to prevent the incident from recurring.」出了什么事、影响多大、怎么处置、根因是什么、后续还要做什么，十一节里都有。另一样是文档写作框架 Diátaxis 里的「操作指南」：「How-to guides are about goals, projects and problems, not about tools.」它按读者要解决的问题排，不按知识的分类排。两句原文都在 2026-10-19 取回核过。

接口、数据库这类知识，写在各章正文里，不在这里。

| 案例 | 问题 | 出在哪 |
|---|---|---|
| 一 | 开课读得太多，中途会漂 | 补课 05-API 第七窗口 |
| 二 | 答进度时漏了一整块 | 补课 05-API 第六窗口 |

---

## 案例一　开课读得太多，中途会漂

### 一、问题是什么

2026-10-17，补课 05-API 第七窗口开课。项目主人提出：

> 我们现在新窗口开篇前加上必读的7个文件和自检要读的内容太多，导致你跑偏或忘记……你认真查下目前行业或有什么专业方法可以解决这问题？或者有没有印象图加深你印象，或关系图来组织？

这里的「你」指 Claude Code。每开一个新窗口，它先读三份开课资料和七个必读文件，再逐条过一遍开课自检，然后才开始上课。规矩都写在文件里，也都读过了，做到一半还是会忘。

### 二、症状与实据

先看要读多少。第七窗口开课时数过：开课读的文件共 2666 行，自动记忆另有 509 行。课程规则 81 条，反模式 46 条，开课自检编到第 20 项。规则文件的 547 个非空行里，有 127 行以「背景」「关系」「判定」这类词开头，讲的是来历和关系，不是要做的动作。反模式库 279 个非空行里，这类行有 96 行。

再看漏了什么。上一个窗口（第六窗口）收尾回顾时，记下了这些错：
- 报进度凭印象，漏了契约的一整节（见案例二）。
- 课程规则 77 要求拍板时当场判定的事，两次被推到了结课。
- 开课没有先带着重温上一个窗口。
- 数错的数七处。其中五处被提交前的计数闸门拦下，没有落进文件；两处是事后自查出来的。
- 用量过半以后，错误明显变多。

前三种，规矩明明写着，到时候没想起来，都在「只靠读」那一层。拦下来的五处，靠的都是命令。

第八窗口开课时又量了一次读量，用 wc -m 数字符，合计约 16.5 万字符。七个必读文件约占 45%。最大的单份不是必读文件，是 Claude Code 自动记忆里的一份会话流水账，约占 17.5%。照 Read 工具给那一份报的 token 数折算，整个开课约 14 万 token；这是折算，实数要看 /context。

### 三、为什么会这样

**一句话：开头读一遍，撑不住一个长会话。读进来的规矩会被越来越长的对话挤到中间，到用的时候想不起来。**

打个比方。早上把一整本员工手册读完，下午遇到一件事，手册里明明写了怎么办，却想不起来。不是没读，是读得太早、读得太多，中间又塞进了一整天的事。

Claude Code 官方的最佳实践页，把这件事放在全页最前面：「Most best practices are based on one constraint: Claude's context window fills up fast, and performance degrades as it fills.」又说：「When the context window is getting full, Claude may start "forgetting" earlier instructions or making more mistakes.」

几篇研究说的是同一件事：
- Liu 等人的《Lost in the Middle》发现，相关信息放在长输入的开头或结尾时，表现最好：「performance is often highest when relevant information occurs at the beginning or end of the input context」。开课读的规矩，会随着对话变长被挤到中间。这篇测的是从长文里找答案，搬到「守规矩」上，是推断。
- Chroma 的《Context Rot》（2025）：「model performance consistently degrades with increasing input length」。输入越长，表现越差。
- IFScale（2025）一次给出最多 500 条指令：「even the best frontier models only achieve 68% accuracy at the max density of 500 instructions.」要守的规矩越多，守得越差。

Anthropic 讲上下文管理的文章（2025-09-29）把它归成一句：上下文「must be treated as a finite resource with diminishing marginal returns」，越多越不值钱。

还有一层：规矩只增不减。每踩一个坑，就多一条规则或一条反模式，很少有删的时候。于是读量一窗比一窗大。

### 四、行业怎么解决

**一句话：不靠记性。规矩按时刻分成短检查单，到了那一刻再看；能交给机器的，交给机器。**

飞行员不会在起飞前把整本手册背下来。检查单按时刻分开：启动前一张，起飞前一张，降落前一张。美国联邦航空条例第 121.315 条要求：「The procedures must be designed so that a flight crewmember will not need to rely upon his memory for items to be checked.」

Anthropic 那篇文章推荐的也是这个方向，叫「just in time」：「agents built with the “just in time” approach maintain lightweight identifiers」。手边只留轻量的索引，用到的时候再取细节。

安全工程里有个瑞士奶酪模型。James Reason 2000 年在《英国医学杂志》上写，每一层防护都「more like slices of Swiss cheese, having many holes」。安全不靠哪一片没有洞，靠叠几片，让洞对不齐。他还说：「We cannot change the human condition, but we can change the conditions under which humans work」。改不了人会忘，能改的是让人不必记。

Claude Code 官方也把两类东西分开：写在 CLAUDE.md 里的话是建议，钩子是确定会执行的。最佳实践页原话：「Unlike CLAUDE.md instructions which are advisory, hooks are deterministic and guarantee the action happens.」钩子指南页说，钩子让「certain actions always happen rather than relying on the LLM to choose to run them」。记忆页还给了篇幅上限：「target under 200 lines per CLAUDE.md file. Longer files consume more context and reduce adherence.」
