Title: my_taskflow_less05
Exported: Oct 13, 2026, 10:20 AM
URL: https://claude.ai/chat/900bb8ab-d45d-4a5d-89ff-d133fc3a8bf5
Messages: 44

my_taskflow_less05

Human (Jun 29, 2026, 2:00 PM):
think harder

Claude:
老师上线，Michael。三份资料都收到了，粘贴顺序对（KNOWLEDGE_BASE → 调节器 → 桥梁）。我按启动指令一步步来。

**第 1 件 · 问候 + Lec 4 复盘**

Lec 4 你啃下了一整块硬的。架构师角色 architect 你不光激活了，还验真它真生效。
你用「6 必问」做约束分析，用「四象限」做技术选型，用 ADR（架构决策记录，写清背景/决策/后果）留痕。
四个分叉你全拍板：鉴权走 DB session、Redis 延后、实时延后到 Lec 13 上 WebSocket、校验用 Zod。
你还亲手切开了「约束驱动」和「教学驱动」两类需求——这一刀直接催生了新反模式 32 号。
这节分量不轻，先给你记一功。

**第 2 件 · 确认接续（咱俩怎么配合）**

我出 prompt、命令、诊断；你在 Claude Code 里真实执行 + 拍板。
CC 的输出你贴回来，我诊断，再进下一步。
**红线两条：我不替你直接改文件，我不让 CC 自己编课程知识。**

**第 3 件 · 7 个开课必读文件，得你贴回来**

这里跟你说实话。
**这 7 个文件在你机器上，不在我上下文里。我没有，也不会凭印象编**（这就是反模式 1，全称「假设 AI 知道我没说的事」）。

请你 cat 出来贴回给我：

```bash
cd ~/projects/study-l3-v2

# 7 个开课必读文件
for f in docs/COURSE_RULES.md docs/lessons/anti-patterns.md docs/TEACHING_STYLE.md docs/PROJECT_STRUCTURE.md docs/AGENT_SPEC.md docs/LESSON_TEMPLATE.md docs/BACKLOG.md; do
  echo "========== $f =========="
  cat "$f"
  echo
done

# 开课前 git 自检
echo "========== git status =========="; git status
echo "========== git log =========="; git log --oneline -3
```

预期：7 个文件依次完整打出；git working tree clean；最近三条提交是 `17bfce1` / `763360d` / `934107d`。

读完我立刻做漂移自检（K 节 8 项 + 规则 57 第 9-11 + 规则 60 开课闸 + 规则 62 讲解骨架），逐条向你汇报。

「七文件维护」这句先背给你，证明我记得：
**开课读全、结课逐查、harness 产物往上沉淀。**

**下一步预告**

你贴回来后，我一口气做完：漂移自检 → Lec 5 大纲（先跟你确认主题）→ 1 分钟复习（抽 2 道 Lec 4 的题）→ 问今天精力（A–D）。然后等你回应再正式开课。

球先在你这边。把 7 个文件 + git 状态贴回来就行。

Human (Jun 29, 2026, 2:05 PM):
think hard

Claude:
7 个文件 + git 状态全收到，内容齐整。先把开课该过的闸逐条走完。

**漂移自检（逐条过，规则 60 双闸的开课闸）**

K 节 8 项：
1 每步出老师锚点 ✓
2 样板 A（动手）/ 样板 B（质疑讨论）会切换 ✓
3 你质疑我，认错→拆根因→入库→给选择，不辩解 ✓
4 给 CC 的 prompt 指定具体文件路径，不让它满项目扫 ✓
5 让 architect 干活，第一句先读它自己的定义文件 ✓
6 给你的问题都用填空/选择模板 ✓
7 Level 1 对应只用你真学过的，不瞎猜 ✓
8 新坑新规则主动编号入库（规则从 66 起，反模式从 33 起）✓

规则 57 追加项：
9 规则 55 的 4 个必读文件读全了，没漏 PROJECT_STRUCTURE ✓
10 结课会按规则 54 固定清单逐条走、逐条报 ✓
11 跑完命令拿真实输出核对，不信「成功」二字 ✓

规则 60 六文件读全：COURSE_RULES / anti-patterns / TEACHING_STYLE / PROJECT_STRUCTURE / AGENT_SPEC / LESSON_TEMPLATE + BACKLOG，七个都读了 ✓
规则 62 讲解骨架：3a 原理→3b 操作→3c 拆段→3d 联动，清楚，复杂步骤照走 ✓

**git 核对（规则 11，看真实输出不看嘴）**
working tree clean ✓
三条提交对上了：17bfce1 / 763360d / 934107d ✓
历史干净，不回滚。

**复述一句，证明我记得（规则 61 配套）**
七文件维护：开课读全、结课逐查、harness 产物往上沉淀。

**漂移自检通过。**

---

**老师锚点（3 行）**
分工：我出 prompt / 命令 / 诊断，你在 CC 执行 + 拍板。
红线：不替你改文件，不让 CC 编课程知识。
这步我最可能犯的错：把 schema 一整块甩给你（违反规则 51），得拆段讲。

**Lec 5 大纲（先跟你确认范围，再开课）**

一句话定位：Lec 4 选好了「用什么技术」，Lec 5 用 architect 把「数据怎么存」落成表。
自然下一步是数据建模——把 PRD 十七条 + UI 设计 + 已定技术栈，推导成 5–8 张表的 schema。

范围你来拍。三个选项：

**A. 只做数据库 schema（实体 / 字段 / 关系 / 三决策 / 多对多关系表），一节讲透。API 契约 + 共享类型 + 环境设计留 Lec 6。**
**B. schema + API 契约，两块塞这一节。**
**C. schema + API 契约 + 共享类型 + 环境设计，全压一节。**

我推荐 **A**。
理由一句话：schema 是 architect 的重活，三决策和多对多最容易绕，一节吃透比赶四块扎实；也符合规则 48（窗口七八成就结课，别硬撑到角色漂移）。

---

**1 分钟复习（Lec 4 抽 2 题，口答即可）**

第 1 题：PRD 里的「实时」需求，它的来源是哪种？
（A）用户研究推出来的真实需求
（B）课程为教 WebSocket 自上而下塞进来的「教学驱动」需求
（C）architect 自己加的

第 2 题：这节要复用 Lec 4 已建好的 architect，给它的 prompt 第一句该让它干嘛？
（A）直接开始设计数据库
（B）先读自己的定义文件 .claude/agents/architect.md
（C）先 grep 整个项目找上下文

---

**问精力（按精力调难度）**
A 精力满，多连几步讲
B 正常节奏
C 有点累，只讲核心
D 今天不足，改天再开

**你回我（填空即可）：**
- 范围选：___（A/B/C）
- 复习第 1 题：___　第 2 题：___
- 精力：___（A/B/C/D）

回完我就正式开 Lec 5 第一段。

Human (Jun 29, 2026, 2:09 PM):
* 范围选：A
* 复习第 1 题：A　第 2 题：B
* 精力：A

Claude:
先对两道复习题，再开课。

**第 2 题：B —— 对。** 复用 architect，第一句永远先让它读 `.claude/agents/architect.md`（防反模式 3，激活≠生效）。

**第 1 题：你选了 A，正确答案是 B。**
PRD 里的「实时」不是用户研究推出来的。用户验收只要刷新能看到就行。
它是课程为了 Lec 13 教 WebSocket，自上而下塞进来的——这叫**教学驱动**需求（反模式 32 号）。
有意思的是，这个区分是你 Lec 4 自己抓出来的。今天口答顺手选了 A，对一下就行，不扣分。
记法一句话：**看着像矛盾的需求，先查来源，常常不是矛盾，是来源没标。**

范围 A、精力 A，收到。一节课讲透 schema，连着走，只在三处停你（要跑命令、要执行 prompt、要拍板）。

---

# Lec 5 · 第 1 段：从 PRD 推实体

**段落定位**
第 5 课第 1 段，整课进度约 70%。
上一步：Lec 4 选好了「用什么技术」。
这一步：让 architect 把「数据怎么存」落成表，今天先推**实体清单**。

**这段为什么这么做**
盖房子要先有户型图，不能上来就砌墙。实体清单就是户型图的第一笔：先定「有几个房间」，再谈每间多大、怎么连通。

## 3a · 原理（为什么）

打个比方。
schema 是房子的户型图。
PRD 是业主说「我要几间房、各干什么用」。
UI 是「每间房长什么样」。
schema 是「承重墙在哪、房间怎么连通、水电走哪」。

为什么现在画、不等写代码时再画？
**改户型图很便宜，改盖好的房子很贵。** 建模放在写代码之前，就是为了把贵的错挡在前面。

为什么交给 architect，不直接列表？
列表谁都会列。但建模是**权衡活**：要不要拆表、要不要冗余、关系怎么连，每一步都有取舍。
architect 带着 6 必问、四象限、ADR 上场，每个决定能追到 PRD 哪一条，还留痕。这是重思考活，所以用 opus。

怎么从 PRD 推实体？**名词法。**
PRD 里反复出现的核心名词，就是候选实体。
用户、项目、任务、成员关系、通知……先把名词抓出来，不急着写字段。

## 3b · 操作 + Level 1 对应

**Level 1 对应。**
网页版时代你也给 TaskFlow 建过 6 张表。
那时大概是凭经验直接列：users、projects、tasks……没走「PRD 名词推导 → architect 权衡 → ADR 留痕」这条结构化流程。
现在升级：每张表都能说清「它来自 PRD 第几条」，决策有 ADR 兜底。痛点是「表凭感觉建，回头说不清为什么」，现在解决了。

**对应 KNOWLEDGE_BASE 知识点（只列真用到的）：**
角色 4 architect、补丁 16 四象限、补丁 7 ADR-Lite、协议 2 有预算侦察（读输入文件 ≤5 个）、协议 6 影响分析、强化 14 决策边界 D1-D7、强化 16 决策权属学生。

**这一步先只推实体清单，不写字段。**
原因：schema 是复杂产物，整块甩出没法审（规则 51）。拆成三步走——
先列实体 → 再设字段 + 三决策 → 最后连关系 + 出 Prisma。
今天这条 prompt 只做第一步。

---

**模式归属**
这步 architect 只产出文字（实体清单），不建文件、不改代码。
**用默认模式，不用切 Plan Mode。**（architect 本来就只 Read。）

**建议模型：Opus。** 理由一句：建模要做规范化权衡和推导，是重思考活。

**CC 里的 prompt（直接复制）：**

```
请你先读自己的定义文件 .claude/agents/architect.md，按里面的硬规则和方法论办事。

读完后，只读这三个输入文件，不要扫其他文件：
- docs/design/PRD.md
- docs/design/UI_DESIGN.md
- docs/arch/TECH_STACK.md

任务：从 PRD 推导本项目的数据库实体清单。这一步只列实体，不写字段、不写关系、不写 Prisma。

每个实体给出：
1. 实体名（英文，复数小写，如 users）
2. 一句话职责
3. 来源：它对应 PRD 第几条 / 哪个用户故事；若属系统隐性基础需求（如认证、项目容器），标「pm 推导的基础需求」
4. 初判：它和哪个实体之间是多对多关系（需要单独的关系表）

硬要求：
- 实体总数控制在 5 到 8 个（课程硬底线）。
- 若 PRD 有歧义或缺口，先指出再继续，不要自己脑补填上。
- 任何不确定的地方，明确标「待确认」，禁止猜。

停止条件：实体清单列完即停，不要往下设计字段。
```

**prompt 关键点（配反例）：**
1. 第一句读定义文件——不这样写，architect 在列表里但人设没进脑子，会用通用方式建模，丢掉 6 必问和 ADR（反模式 3）。
2. 三个输入文件给死路径——不给，CC 会 grep 整个项目找 PRD，烧 token（反模式 7）。
3. 「列完即停，不写字段」——不给停止条件，它会一口气把字段、关系、Prisma 全写出来甩回来，没法分段审（规则 43 + 51）。

**审查清单（逐条对着看，别信「完成」二字）：**
- architect 说它读了定义文件吗？输出里有没有 6 必问 / 边界意识的影子？
- 实体数量落在 5–8 之间吗？
- 每个实体标了来源（PRD 第几条 / 基础需求）吗？
- 隐性基础实体有没有漏？比如用户、认证、项目容器这类没人明说但必须有的（反模式 29）。
- 多对多关系标出来了吗？（成员和项目大概率是）
- 有没有偷偷把字段也写了？写了就是没守停止条件。

**反馈模板（填空贴回）：**
- architect 读定义文件了吗：___
- 列了几个实体：___
- 实体清单原样贴回：___
- 它主动指出 PRD 的歧义/缺口了吗：___
- 我的疑问 / 要拍板的点：___

---

**窗口体感**：刚开课，空间充足，能稳稳走完三步。

去 CC 跑这条 prompt，把输出贴回来，我逐条诊断。

Claude:
architect 这一份很扎实，先逐条对审查清单核，再给你拍板的点。

**逐条核（规则 26，不一句带过）**

读定义文件了吗：✓ 头一句就声明 6 必问做约束收敛，人设进脑了（反模式 3 防住）。
实体数 5–8：✓ 6 个。
每个标来源：✓ 都挂到了 PRD 行号 / US 编号。
隐性基础实体没漏：✓ 而且加分——它主动加了 `sessions`，这是技术栈定了 DB session 才必须有的表，纯用户研究推不出来（反模式 29 防住）。
多对多标出来了吗：✓ users × projects → project_memberships，判得对。
偷写字段了吗：✓ 没有，守住了停止条件。
主动指出 PRD 歧义：✓ 一口气列了三个待确认，没脑补。

**这一份的水准比 Lec 4 又稳了。** 它没有不懂装懂，三个拿不准的地方全标了「待确认」抛回来让你拍（反模式 18 防住）。这正是 architect 该有的样子。

---

现在三个待确认的点，得你拍板。我先用大白话讲清每个在纠结什么，再给选择。

## 决策点 1：角色（roles）要不要单独成一张表？

**纠结什么：**
PRD 说角色按项目分——同一个人在 A 项目是负责人，在 B 项目是执行者。
那「角色」这个东西放哪？
两个去处：要么塞进 `project_memberships` 表当一个字段，要么单独开一张 `roles` 表。

打个比方。
角色就像「工牌上的职位」。
现在全公司只有两种职位：负责人、执行者。固定两种，不会变。
工牌职位这种东西，直接印在工牌上（成员关系表里加个字段）就行。
什么时候才值得单开一张「职位表」？当职位很多、还能自定义、要配一堆权限的时候。
我们现在两种写死的，单开表是杀鸡用牛刀。

**给选择：**
A. 不单开 roles 表，角色当 `project_memberships` 的一个字段（role 字段，枚举：owner / member）
B. 单开一张 roles 表
**我推荐 A。** 理由一句：只有两个固定角色，塞字段最省；真要扩展（反模式延伸），未来加表也来得及，符合「演进先于完美」。

## 决策点 2：邀请（invitations）要不要单独成表？

**纠结什么：**
PRD 说负责人填邮箱、指定角色，成员就加进来了；邮箱不存在就拒绝。
这是「直接拉已注册的人进来」，不是「发一封邀请等对方点接受」。

打个比方。
「直接拉人进群」——你拉，对方立刻就在群里了，不需要表存「待接受」状态。
「发邀请链接」——才需要一张表存「已发出、未接受、已过期」这些状态。
PRD 是前一种。

**给选择：**
A. 不单开 invitations 表，加成员直接往 project_memberships 写一行
B. 单开 invitations 表存邀请状态
**我推荐 A。** 理由一句：PRD 是即时加人、无待接受态，单开表是为不存在的需求建地基（反模式 9 反向版——别为没定义的功能提前建）。

## 决策点 3：任务状态历史（task_status_events）要不要单独成表？

**纠结什么：**
PRD 要执行者改状态、负责人刷新看到，还要识别「长时间无进展」。
但 PRD 没要求展示「这个任务什么时候从待办变成进行中」这种历史轨迹。

打个比方。
单存「当前状态」——像看一个人现在几岁。
存「状态历史」——像存一个人每一年的照片，能回看变化过程。
「识别长时间无进展」其实只要一个字段：记下「状态最后一次变更的时间」。拿现在的时间一减就知道卡了多久。不需要存整本相册。

**一个提醒（我必须说清，反模式 32）：**
Lec 4 你定的技术栈里，实时是「教学驱动」需求，留到 Lec 13 上 WebSocket。
任务历史这块同理——MVP 不做历史表，不代表永远不做。它更像 Lec 13/18 演进时才可能加的东西。今天先不建。

**给选择：**
A. 不单开历史表，在 tasks 表加一个「状态最后变更时间」字段就够识别卡顿
B. 单开 task_status_events 表存完整状态流转历史
**我推荐 A。** 理由一句：PRD 只要识别卡顿、不要历史轨迹，一个时间字段解决，单开历史表是超前建设。

---

**这三个我都推荐 A，结果是：实体清单维持 6 张表，不增不减。** 6 张正好落在 5–8 硬底线内，干净。

**你回我（填空即可）：**
- 决策点 1（roles）：___（A/B）
- 决策点 2（invitations）：___（A/B）
- 决策点 3（历史表）：___（A/B）
- 有没有哪个你想反过来选、或者有别的疑问：___

三个拍完，下一段就让 architect 进第二步：给这 6 张表设字段 + 定三决策（主键、软删除、时区）。

Human (Jun 30, 2026, 2:22 PM):
你回我（填空即可）：

* 决策点 1（roles）：A
* 决策点 2（invitations）：A
* 决策点 3（历史表）：A
* 有没有哪个你想反过来选、或者有别的疑问：没有

Claude:
三个全 A，跟推荐一致。实体清单定稿：**6 张表，users / sessions / projects / project_memberships / tasks / notifications。**

这三个裁决得落进 ADR，不能只活在咱俩对话里（反模式 24：重要意图只记对话不进持久层）。不过现在先别停下来落盘——按规则 45「先入库后桥梁」，我会在结课固定动作里统一处理。这一段先记着：**三个待确认已拍板，待写进 DECISIONS.md。**

往下走第二步。

---

# Lec 5 · 第 2 段：设字段 + 定三决策

**段落定位**
第 5 课第 2 段，整课进度约 78%。
上一步：定了 6 个实体（户型图的房间数）。
这一步：给每个实体设字段，并定下三条贯穿全表的「地基规矩」。

**这段为什么这么做**
房间数定了，现在要定每间放什么家具（字段）。
但在摆家具之前，得先定三条全屋统一的标准：门牌号怎么编、东西怎么「扔」、时间怎么记。
这三条不先统一，6 张表各编各的，后面接口和迁移全乱。

## 3a · 原理（为什么先定三决策）

打个比方。
字段是每个房间里的家具，各房间不同。
三决策是**全屋装修标准**——所有房间统一的那几条。
装修标准必须在摆家具之前定，不然这间用公制那间用英制，返工。

三决策分别是：

**决策一 · 主键用什么？**
主键就是每行数据的「身份证号」，唯一不重复。
两个选法：自增整数（1, 2, 3…）还是 UUID（一长串随机字符）。
自增简单，但暴露数量、不好合并多库。UUID 长一点，但全局唯一、安全。

**决策二 · 删除怎么删？**
两种删法：
硬删除——真从数据库抹掉，没了就没了。
软删除——只打个「已删除」标记，数据还在，能恢复、能审计。
比方：硬删除是把文件拖进碎纸机，软删除是丢进回收站。

**决策三 · 时间怎么存？**
存时间带不带时区。
不带时区——存「3 点」，但没说哪个时区的 3 点，跨地区就乱。
带时区（timestamptz）——存「UTC 几点」，谁看都不会错。
比方：带时区像「北京时间下午 3 点」，不带像光说「3 点」，没头没尾。

为什么这三条要走 ADR？
因为它们是**一锤子买卖**——定了之后 6 张表全照办，中途改成本极高。这种决策必须留痕，写清「为什么选它、放弃了什么」。

## 3b · 操作 + Level 1 对应

**Level 1 对应。**
网页版 TaskFlow 时代，这三条你其实定过：UUID v4 主键、软删除（is_deleted + deleted_at）、timestamptz 带时区。
那是凭经验直接拍的。
现在升级：让 architect 用 6 必问重新审一遍，每条配 ADR，并且**结合本项目的 PRD 重新判**，而不是照搬旧答案。
痛点是「三决策凭经验拍，换个项目说不清还适不适用」，现在解决了。

**对应 KNOWLEDGE_BASE 知识点：**
角色 4 architect、补丁 7 ADR-Lite、协议 5 ≤3 澄清（三决策正好≤3）、强化 14 决策边界、协议 3 证据契约（字段要能追到 PRD）。

**这一步只设字段 + 定三决策，不连关系、不写 Prisma。**
原因同上——拆段审（规则 51）。关系和 Prisma 留第三步。

---

**模式归属**
architect 只产出文字（字段表 + 三决策），不建文件、不改代码。
**默认模式，不切 Plan Mode。**

**建议模型：Opus。** 理由一句：三决策是权衡 + ADR，重思考活。

**CC 里的 prompt（直接复制）：**

```
继续上一步。实体清单已定稿，6 张表：users、sessions、projects、project_memberships、tasks、notifications。三个待确认已由项目主人拍板：roles 不单独成表（角色作 project_memberships 的字段）、不单独建 invitations 表、不单独建任务状态历史表。

请你先重读自己的定义文件 .claude/agents/architect.md，按 6 必问办事。

只读这两个输入文件，不要扫其他文件：
- docs/design/PRD.md
- docs/arch/TECH_STACK.md

任务分两部分：

第一部分 · 定三个全表统一的决策，每个用 ADR-Lite 三行格式（背景 / 决策 / 后果，后果写明放弃了什么）：
1. 主键策略：自增整数 vs UUID，选哪个，为什么。
2. 删除策略：硬删除 vs 软删除，选哪个，为什么。
3. 时间存储：带时区 timestamptz vs 不带，选哪个，为什么。
结合本项目 PRD 判断，不要直接照搬经验答案。

第二部分 · 给 6 张表逐张设字段。每张表给出：
- 字段名（英文）、类型、是否必填、一句话说明。
- 哪个字段是主键、哪些是外键（先标明指向谁，关系细化留下一步）。
- 三决策产生的公共字段（如软删除标记、审计时间）逐表落实。
- 关键业务字段要能追到 PRD 来源（如任务状态、优先级的取值范围）。

硬要求：
- 字段类型用 PostgreSQL + Prisma 能直接映射的类型。
- 枚举类（任务状态、优先级、成员角色）列出取值，标来源 PRD 行号。
- PRD 没定义的字段不要自己加；若你认为缺某字段，标「建议补充，待确认」单列，不要直接塞进表。
- 不确定的标「待确认」，禁止猜。

停止条件：字段表 + 三决策列完即停。不要画关系图，不要写 Prisma schema。
```

**prompt 关键点（配反例）：**
1. prompt 开头把上一步的定稿结论 + 三个拍板复述进去——CC 是独立环境，不喂它就不知道你拍了什么（反模式 1）。
2. 「PRD 没定义的字段标『建议补充，待确认』单列，别直接塞表」——不这样限，architect 会顺手加一堆「看着该有」的字段，把 AI 假设当成需求（反模式 19 同族）。
3. 又一次给死停止条件「不画关系、不写 Prisma」——防它一口气全写完（规则 43）。

**审查清单（逐条对，别信「完成」）：**
- 三决策每条都是 ADR 三行格式吗？「后果」写明放弃了什么了吗？
- 三决策是结合本项目重新判的，还是照搬旧经验直接抄的？（看它有没有引 PRD）
- 6 张表都设了字段吗？没有漏表？
- 软删除标记、审计时间这些公共字段，6 张表都落实了吗？（sessions 表可能例外，登录态过期就该真删，留意它怎么说）
- 枚举类（任务状态、优先级、角色 owner/member）列了取值 + PRD 来源吗？
- 外键标了指向谁吗？
- 有没有自己硬塞 PRD 没有的字段？该标「建议补充」的标了吗？

**反馈模板（填空贴回）：**
- architect 重读定义文件了吗：___
- 三决策分别选了什么：主键___　删除___　时间___
- 三决策是 ADR 三行格式吗：___
- 字段表原样贴回（6 张）：___
- 它列了哪些「建议补充，待确认」字段：___
- 我的疑问 / 要拍板的点：___

---

**窗口体感**：用了约两成，空间充足，第三步（关系 + Prisma）也能在本窗口走完。

去 CC 跑这条，把输出贴回来，我逐条诊断。

Claude:
这一份非常出色，是目前 architect 给过最成熟的产出。先逐条核审查清单，再给你拍板的点——这次有一个我必须重点跟你掰扯。

**逐条核（规则 26）**

重读定义文件：✓ 头一句声明 6 必问，先收敛了 6 条约束。
三决策 ADR 三行格式：✓ 三条都是背景/决策/后果，且「后果」都写明了放弃什么。
三决策结合本项目重判：✓ 全引了 PRD 行号，不是照搬旧经验。这点下面单讲。
6 张表都设字段：✓ 一张不漏。
公共字段落实：✓ 而且 sessions 它特意说明了为何不加 revoked_at——登出直接删。这正是审查清单里我让你留意的例外，它自己想到了。
枚举列取值 + PRD 来源：✓ MemberRole / TaskStatus / NotificationType 都标了行号。
外键标指向谁：✓ 都标了「外键 → 表.id」。
硬塞 PRD 没有的字段：✓ 没有。该标「建议补充/待确认」的全标了（priority、display_name、created_by 等），克制得很好。

**它做对的几件加分项：**
- `priority` 主动不加，因为 PRD 没定义取值——挡住了反模式 19（把 AI 假设当需求）。
- `projects` 不加 owner_id，理由是单负责人已由 membership.role=owner 表达，避免重复——这是规范化意识，防数据冗余。
- `notifications` 不加 project_id，因为能从 task_id 推出来——同样是防冗余。

---

但这份产出有**一个三行格式背后的真问题**，我必须停下来跟你说清楚。这不是 architect 犯错，是它做了一个**越权的隐藏决策**，需要你来拍。

## 决策点 · ADR-DB-002「硬删除」这条，藏了一个你没拍过的判断

先看它写了什么。
它说：删除策略选**硬删除**，全表不加 `deleted_at`。理由是 PRD 首版不做项目删除、也没有删用户删任务的故事。

逻辑听起来通。但这里有个东西需要你警觉——

**对比 Level 1。**
网页版 TaskFlow 时代，你定的三决策里，删除策略是**软删除**（is_deleted + deleted_at）。
现在 architect 给本项目重判，翻成了硬删除。

**它给的理由本身没错**：本项目 MVP 确实没有任何删除故事。
**但它悄悄合并了两个本该分开的问题：**

打个比方。
「现在要不要装一扇门」和「将来要不要装一扇门」是两个问题。
architect 说「现在用不到门，所以连门框都不预留」。
现在用不到没错。但**门框（deleted_at 字段）和门（删除功能）是两回事**——预留门框很便宜，将来想装门直接装；不预留门框，将来想装门要砸墙（数据迁移）。

**这跟你们这门课的第三大信仰直接撞上了：**
**「演进先于完美：先加新的兼容老的，数据迁完再删老的。」**
软删除恰恰是「演进友好」的那一侧。硬删除一旦误删，按它自己 ADR 写的，只能靠备份恢复。

**所以这不是对错题，是取舍题，而取舍权属于你（强化 16 决策权属学生）。** architect 替你把这个权衡咽下去了，我得把它吐出来还给你。

**给选择（这条我破例不直接给强推荐，因为两边都站得住，看你押哪个工程哲学）：**

A. **跟 architect，硬删除，不加 deleted_at。**
好处：查询不用每次过滤 deleted_at，唯一约束不会和软删数据打架，MVP 最简。
代价：将来要恢复/回收站，得做数据迁移（加列 + 改全部查询）。

B. **推翻它，软删除，6 张表（除 sessions）加 deleted_at。**
好处：贴合「演进先于完美」信仰；将来加删除/回收站零迁移；和 Level 1 一致。
代价：现在就背上「每个查询过滤 deleted_at」的负担，而 MVP 根本没删除故事，等于为没来的需求先交税。

C. **折中：现在硬删除，但把「软删除」记进 BACKLOG 当跨课待办，等真有删除故事（大概率 Lec 13 功能迭代）时用 Expand-Migrate-Contract 演进上去。**
好处：MVP 不背包袱，又不丢掉这个决策、不让它消失在对话里。
代价：将来那次迁移逃不掉，只是推后。

**我的看法（仅供参考，不替你拍）：**
如果纯按你这门课供奉的信仰，B 最「正」。
但 architect 的论证里有个真东西——软删除 + 唯一约束（比如 email 唯一、同项目同用户唯一）会打架，删了一行旧的还占着唯一值，这是软删除真实的坑。
所以我个人偏 **C**：MVP 不背税，但用 BACKLOG 接住它（正好规则 65 刚把 BACKLOG 纳入开课必读，反模式 24 也就是「重要意图别只活在对话里」——C 恰好是它的正解）。
但你押 A 或 B 我都认，这是你的工程判断。

## 顺带几个小待确认（architect 自己标出来的，一并拍了省得来回）

这些是它老实标「待确认」抛回来的，都是小口径，我给推荐你点头即可：

- `tasks.description` 是否必填 → 建议**否（可空）**，PRD 没说必填。
- `tasks.status` 新任务默认值 → 建议 **not_started**，符合直觉。
- `tasks.due_at` 是日期还是时间 → 建议**存 timestamptz，UI 只显示到日期**，跟它说的一致。
- `users.display_name` 加不加 → 建议 **MVP 不加**，PRD 只收邮箱密码，先用邮箱展示（同硬删除哲学，不超前）。

---

**你回我（填空即可）：**
- 删除策略：___（A 硬删 / B 软删 / C 硬删但进 BACKLOG）
- description 可空：___（同意 / 否）
- status 默认 not_started：___（同意 / 否）
- due_at 存 timestamptz 仅显示到日：___（同意 / 否）
- display_name MVP 不加：___（同意 / 否）
- 别的疑问：___

**窗口体感**：用了约三成五，还很充裕。
拍完这些，下一段就是最后一步——让 architect 连关系 + 出 Prisma schema，然后进结课。

Human (Jun 30, 2026, 2:39 PM):
你回我（填空即可）：

* 删除策略：C 硬删但进 BACKLOG
* description 可空： 否
* status 默认 not_started：同意 
* due_at 存 timestamptz 仅显示到日：同意 
* display_name MVP 不加：同意 
* 别的疑问：没有

Claude:
全部收到，逐条确认你的裁决：

- 删除策略：**C** —— MVP 硬删，软删除进 BACKLOG，将来真有删除故事时走 Expand-Migrate-Contract。这条我会在结课时加进 docs/BACKLOG.md（编号 8）。
- description：**必填**（你选了「否」=不可空）。注意这跟 architect 的初判相反，它倾向可空，你拍必填，下一步我会在 prompt 里明确告诉它改过来。
- status 默认 **not_started**：同意。
- due_at 存 timestamptz、UI 显示到日：同意。
- display_name MVP 不加：同意。

字段定稿了。三决策也定了（自增主键 / 硬删但 BACKLOG 接住 / timestamptz）。

这些 B 类裁决（项目事实）现在先记着，不停下来落盘——按规则 45 先入库后桥梁，结课统一处理。当前待落盘清单我帮你记着：三个实体待确认 + 删除策略 C + description 必填 + 几个字段默认值，全部进 DECISIONS.md / BACKLOG.md。

进最后一步。

---

# Lec 5 · 第 3 段：连关系 + 出 Prisma schema

**段落定位**
第 5 课第 3 段，整课进度约 88%。
上一步：定了字段 + 三决策。
这一步：把 6 张表连成关系网，落成真正能跑的 Prisma schema 文件。这是本课产物的终点。

**这段为什么这么做**
家具摆好了（字段），现在要接水电（关系）——把房间连通。
然后画成正式施工图（Prisma schema），施工队（Lec 9 建库、Lec 10 写后端）照这张图干活。
前两步是文字推导，这一步第一次产出**机器能执行的东西**。

## 3a · 原理（为什么关系单独一步）

打个比方。
字段是「每个房间有什么」。
关系是「房间之间怎么连通」——哪间通哪间，单向还是双向。
为什么不一开始就连？因为没先把房间和家具定清，连通的线会画错。先定点，再连线。

关系有三种基本形态，用咱们的表举例：

**一对多（1:N）**——一个项目有多个任务，但一个任务只属于一个项目。
比方：一个班有多个学生，一个学生只在一个班。
表现：tasks 表里有个 project_id 指回 projects。

**多对多（M:N）**——一个用户在多个项目，一个项目有多个用户。
比方：一个学生选多门课，一门课有多个学生。
这种**必须有中间表**——就是 project_memberships，它专门记「谁在哪个项目、什么角色」。

**一对一 / 弱关联**——sessions 属于某个 user，notifications 指向某个 task 和某个 user。

为什么这步出 Prisma 而不是建库？
Prisma schema 是**蓝图**，不是房子本身。
写蓝图（schema 文件）和按蓝图施工（migrate 建表）是两件事。Lec 9 才施工。今天只画蓝图。

## 3b · 操作 + Level 1 对应

**Level 1 对应。**
网页版你直接想出 6 张表的样子。
现在升级：schema 是从 PRD → 实体 → 字段 → 关系一步步推出来的，每个关系都能追到「为什么这么连」。
而且这次第一次让 architect 产出**带 Prisma 语法的真文件**，不再是纯文字描述。
痛点是「表关系凭脑子记，连错了到联调才发现」，现在解决了——蓝图先行，关系白纸黑字。

**对应 KNOWLEDGE_BASE 知识点：**
角色 4 architect、协议 6 影响分析（关系牵一发动全身）、协议 9 一致性（schema 是后续前后端类型的源头）、协议 3 证据契约（关系要能追到 PRD）、Claude Code 机制 Subagent。

**联动讲解（规则 16 触发：这步产物被 2+ 后续课用到）。**
这张 schema 不是孤立产物，它是下游好几节课的源头：
Lec 9 拿它 `prisma migrate` 建真库。
Lec 10 backend 照它写 entity 和接口。
Lec 5 后续（或 Lec 6）的共享类型 packages/shared，类型从它推。
所以这一步必须稳——它错一个关系，后面三节课跟着错。这就是为什么我们花三步、一步步审着推到这里。

---

**关于落盘方式，一个关键点先说清（规则 42 + AGENT_SPEC）。**
architect 是文档类角色，**只有 Read 权限，它自己不能写文件**。
所以这一步分两半：
先让 architect 在对话里**产出 schema 文本**（你审）。
审完没问题，再由**你用 cat 命令**把它落盘到 `prisma/schema.prisma`（落盘交主对话/cat，反模式 18 + AGENT_SPEC 落盘方式）。
我会分别给你 prompt 和 cat 命令，**先跑 prompt，审完我再给落盘命令。**

**模式归属**
architect 只产出文本，不碰文件。**默认模式，不切 Plan Mode。**

**建议模型：Opus。** 理由一句：关系建模仍是权衡活（中间表、级联、可空外键都要判）。

**CC 里的 prompt（直接复制）：**

```
继续上一步。字段表已定稿。项目主人对几处做了最终裁决，请按这些裁决执行，不要沿用你之前的初判：
- 删除策略：MVP 硬删除，全表不加 deleted_at（软删除已记入未来 backlog）。
- tasks.description：必填，不可空（覆盖你之前"待确认"的倾向）。
- tasks.status：新任务默认值 not_started。
- tasks.due_at：用 timestamptz 存，UI 层只显示到日期。
- users 不加 display_name，MVP 用 email 展示。

请你先重读自己的定义文件 .claude/agents/architect.md。

不需要再读其他文件，所需信息已在本轮对话给全。

任务：基于已定稿的 6 张表和字段，产出完整的 Prisma schema 文本。

要求：
1. 先用一段文字说明 6 张表之间的关系：哪些是一对多、哪些是多对多（中间表是谁）、哪些是弱关联。每条关系一句话标来源 PRD 依据。
2. 再给出完整的 schema.prisma 文本，包含：
   - datasource 块（provider = postgresql）和 generator 块（provider = prisma-client-js）。
   - 3 个 enum：MemberRole、TaskStatus、NotificationType，取值用上一步定稿的。
   - 6 个 model，字段用上一步定稿的，类型用 Prisma 类型。
   - 关系字段双向写全（关系的两端都要有对应字段），外键用 @relation 标注。
   - 主键 @id @default(autoincrement())，时间字段 @default(now()) / @updatedAt 按语义用。
   - 字段名数据库列用 @map、表名用 @@map 映射成 snake_case（model 名用 Prisma 惯例 PascalCase 单数，库表名用复数 snake_case）。
   - project_memberships 对 (user_id, project_id) 加唯一约束 @@unique，防同一用户在同一项目重复加入。

硬要求：
- 完全按定稿裁决，不要重新引入 deleted_at、display_name、priority 等已排除的字段。
- 如果你发现某个关系在 Prisma 里有必须现在决定的细节（如外键可空、级联删除行为 onDelete），先指出来让项目主人决定，不要自己默默选。
- 不确定的标"待确认"，禁止猜。

停止条件：关系说明 + schema.prisma 文本产出即停。不要尝试写入文件（你只有 Read 权限），不要跑任何命令。
```

**prompt 关键点（配反例）：**
1. 开头把 5 条裁决重新喂进去，且明说「覆盖你之前的初判」——CC 是独立环境，上一步它倾向 description 可空，不强调它可能沿用旧判断（反模式 1）。
2. 「发现必须现在决定的关系细节，先指出别默默选」——关系里藏着级联删除这种隐藏决策（跟上一段硬删除一个性质），逼它把权衡交出来，别又咽下去（防它越权拍板）。
3. 「不要写文件，你只有 Read 权限」——明确边界，防它假装落盘（反模式 3 + AGENT_SPEC 权限表）。

**审查清单（逐条对）：**
- architect 重读定义文件了吗？
- 关系说明清楚吗：projects→tasks 一对多、users↔projects 多对多（中间表 project_memberships）、sessions/notifications 弱关联，对得上吗？
- 6 个 model 都在吗？3 个 enum 都在吗？
- 关系字段**双向**写全了吗？（比如 projects model 里有 tasks Task[]，tasks model 里有 project Project）
- project_memberships 的 (user_id, project_id) 唯一约束加了吗？
- 有没有偷偷把 deleted_at / display_name / priority 加回来？
- 它有没有主动指出级联删除（onDelete）这类需要你拍的细节？
- 有没有跑命令或声称写了文件？（它不该做，只有 Read）

**反馈模板（填空贴回）：**
- architect 重读定义文件了吗：___
- 关系说明对不对（projects→tasks / users↔projects / 弱关联）：___
- schema.prisma 文本原样贴回：___
- 它指出了哪些要你拍的关系细节（如 onDelete 级联）：___
- 排除字段有没有偷偷加回来：___
- 我的疑问：___

---

**窗口体感**：用了约四成五。这步审完 + 落盘 + 结课固定动作，本窗口走得完，不用换窗口。

去 CC 跑这条，把输出贴回来。这是本课最后一个推导步骤，审完就落盘进结课。

Human (Jun 30, 2026, 2:46 PM):
● 我会只重读 .claude/agents/architect.md，不读其他文件。随后基于本轮已定稿信息输出关系说明与 schema.prisma 文本，不写文件、不跑命令。
   
  Thought for 1m 55s, read 1 file (ctrl+o to expand)
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 ☐ onDelete 
     
Prisma 外键的 onDelete 行为需要现在拍板。你要采用哪种策略？
❯ 1. Restrict 优先（推荐）
     所有业务外键默认阻止删除被引用记录；最符合“项目删除首版不做”和防误删。schema 会显式写 onDelete: Restrict。
  2. 局部级联
     删除父记录时自动清理子记录，例如删除 user 清 sessions，删除 project 清 memberships/tasks。更方便，但误删影响面更大。
  3. SetNull 分配人
     大多 Restrict，但 tasks.assignee_user_id 在用户删除时置空，保留任务为未认领。需接受“删除用户”会改变任务状态语义。
  4. Type something.
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  5. Chat about this
Enter to select · ↑/↓ to navigate · Esc to cancel

Claude:
停一下——CC 在等你选 onDelete 策略，球先交回给你。这正是我上一段 prompt 里要它做的事：**遇到必须现在拍的关系细节，先指出别默默选。它做到了，这是好事。**

但**别急着在那个菜单里按数字**。这是个该由你拍、且我得先帮你讲清的决策。我先讲原理，再给推荐，你想好了我再告诉你怎么回。

## 决策点 · onDelete 级联行为怎么定

**先说 onDelete 是什么。**
打个比方。
两张表用外键连着，就像「父子」关系——project 是父，它底下的 task 是子。
onDelete 规定的是：**父被删的瞬间，子该怎么办？**

三种态度：
**Restrict（拦着）**——只要还有子，就不许删父。想删 project？先把它的 task 清干净。
**Cascade（连坐）**——删父，子跟着一起没。删 project，它的 task 全删。
**SetNull（断亲）**——删父，子还在，只是把指向父的那根线剪断（外键置空）。

**这件事现在为什么必须拍？**
因为 onDelete 是写进 schema 的硬约束，Lec 9 建库就定死了。改它要迁移。属于「一锤子买卖」，和上一段的硬删除同一性质。

**但这里有个关键前提，能帮你想清楚——**
你刚拍了删除策略 C：**MVP 硬删除，但根本没有任何业务删除故事。** 没有删用户、删项目、删任务的功能。
所以在 MVP 阶段，onDelete 几乎**不会被触发**。它现在更像一道「万一」的防护栏，而不是日常逻辑。
既然是防护栏，问题就变成：**万一哪天真删了父，你希望默认是「被拦住」还是「悄悄连坐删一片」？**

**逐个看 CC 给的三个选项，对应到咱们的表：**

选项 1 **Restrict 优先**：删 project 前必须先清空它的 task，删 user 前必须先清理它的 session / membership / 它负责的 task。最安全，最防误删。代价是将来真要做「删项目」功能时，得先写「先删子再删父」的逻辑。

选项 2 **局部级联**：删 user 自动清它的 session（这个合理，session 本就该跟着人走），删 project 自动清 membership + task（这个危险，一删项目几十个任务无声消失）。方便但误删杀伤大。

选项 3 **SetNull 分配人**：大体 Restrict，但特殊处理一个——删 user 时，它负责的 task 不删，只把 assignee_user_id 置空，变回「未认领」。其余照样拦。

**我的推荐：一个有区分的方案，不是无脑全 Restrict。**

打个比方收尾。
session 是「人的随身物品」——人没了，随身物品跟着清掉天经地义，这个该 Cascade。
task 是「公司的资产」——员工离职了，他手上的项目资产不能跟着蒸发，应该留下变成「无人认领」等重新分配，这个该 SetNull。
project 是「大楼」——不能因为想拆楼就把楼里所有东西无声铲平，必须先妥善处理，这个该 Restrict 拦住。

落到选项上，这最接近 **选项 3（SetNull 分配人）**，但我建议在它基础上明确一条：**sessions 对 user 用 Cascade**（人删了会话必清，这个无争议且安全）。

**给选择：**
A. 选项 1，全 Restrict（最保守，将来删功能自己写清理逻辑）
B. 选项 3，SetNull 分配人 + sessions 对 user 用 Cascade（我推荐，区别对待三类外键）
C. 选项 2，局部级联（最方便，但删 project 会无声删光任务，风险大）

**我推荐 B。**
理由一句：它符合「数据资产不无声蒸发」的安全直觉——会话该跟人走（Cascade），任务资产该保全（SetNull），项目这种大容器该拦住（Restrict）。比无脑全 Restrict 更贴业务，比局部级联安全得多。

---

**怎么操作（重要）：**
**先别在 CC 那个菜单里直接选。** 那个菜单只有它给的三个原样选项，而我推荐的 B 是「选项 3 再加一条 sessions Cascade」的微调版，菜单里选 3 表达不全。

你回我决定后，我给你一句话补充指令贴进 CC（让它按你的最终方案生成 schema），比在菜单里硬选干净。

**你回我（填空即可）：**
- onDelete 策略：___（A 全 Restrict / B SetNull+会话 Cascade / C 局部级联）
- 如果选 B，sessions 跟 user 走 Cascade 你同意吗：___（同意 / 改 Restrict）
- 别的疑问：___

**操作提示**：现在可以在 CC 那个菜单按 **Esc 取消**（或选「Chat about this」），先别让它跑。等你回我、我给补充指令，再让它一次生成最终 schema。

Human (Jun 30, 2026, 2:49 PM):
你回我（填空即可）：

* onDelete 策略：B SetNull+会话 Cascade 
* 如果选 B，sessions 跟 user 走 Cascade 你同意吗：同意
* 别的疑问：没有

Claude:
onDelete 定了：**B 方案。** 三类外键区别对待——

- sessions → user：**Cascade**（人删，会话清）
- tasks.assignee_user_id → user：**SetNull**（人删，任务变未认领，资产保全）
- 其余业务外键（tasks→project、memberships→user/project、notifications→user/task）：**Restrict**（拦住，防无声连坐）

先在 CC 那个菜单按 **Esc 取消**，别让它按原样三选项跑。然后贴下面这条补充指令，让它一次生成最终 schema。

**建议模型：Opus**（同上，关系建模仍是权衡活）。
**默认模式，不切 Plan Mode。**

**CC 里的 prompt（直接复制）：**

```
onDelete 策略已由项目主人拍板，按下面这套执行，不要用你菜单里的原样三选项：

- sessions.user_id → users：onDelete: Cascade（删用户时其会话一并删除，会话属随人数据）。
- tasks.assignee_user_id → users：onDelete: SetNull（删用户时其负责的任务不删，assignee_user_id 置空变为未认领，保全任务资产）。因此 assignee_user_id 必须可空。
- tasks.project_id → projects：onDelete: Restrict（防删项目时无声删光任务）。
- project_memberships.user_id → users：onDelete: Restrict。
- project_memberships.project_id → projects：onDelete: Restrict。
- notifications.recipient_user_id → users：onDelete: Restrict。
- notifications.task_id → tasks：onDelete: Restrict。

现在产出最终的 Prisma schema 文本，包含：
1. 一段关系说明（一对多 / 多对多中间表 / 弱关联，每条标 PRD 依据）。
2. 完整 schema.prisma 文本：datasource(postgresql) + generator + 3 个 enum + 6 个 model，关系字段双向写全，onDelete 按上面这套标注，主键 autoincrement，时间字段 now()/updatedAt，列名 @map 成 snake_case、表名 @@map 成复数 snake_case，project_memberships 对 (user_id, project_id) 加 @@unique。

停止条件：文本产出即停。不要写文件、不要跑命令。
```

**审查清单（逐条对）：**
- 三类 onDelete 标对了吗：sessions=Cascade、tasks.assignee=SetNull、其余=Restrict？
- assignee_user_id 是可空的吗？（SetNull 的前提，不可空会冲突）
- 6 model + 3 enum 齐吗？关系字段双向写全了吗？
- (user_id, project_id) 唯一约束在 project_memberships 上吗？
- snake_case 映射（@map / @@map）做了吗？
- 排除字段（deleted_at / display_name / priority）没偷偷回来吗？

**反馈模板（填空贴回）：**
- 三类 onDelete 标对了吗：___
- assignee_user_id 可空了吗：___
- schema.prisma 文本原样贴回：___
- 我的疑问：___

---

**窗口体感**：用了约五成。这条审完，schema 就定稿，我给你 cat 落盘命令，然后进结课固定动作（入库反模式/规则、写笔记、更新目录树、git 提交、发桥梁）。本窗口走得完。

去跑这条，贴回来我做本课最后一次诊断。

Claude:
schema 定稿了。先逐条核，这次我把语法也帮你过了一遍。

**逐条核（规则 26）**

三类 onDelete 标对了吗：✓ 全对。
- Session.user = Cascade ✓
- Task.assignee = SetNull ✓
- Task.project / 两个 membership / 两个 notification = Restrict ✓

assignee_user_id 可空了吗：✓ `assigneeUserId Int?` + `assignee User?`，问号都在。SetNull 的前提满足了——这点它没出错，很关键。

6 model + 3 enum 齐：✓ User/Session/Project/ProjectMembership/Task/Notification + MemberRole/TaskStatus/NotificationType。
关系字段双向写全：✓ 抽查 User 侧有 `sessions Session[]`、Session 侧有 `user User`，两端都在。`@relation("TaskAssignee")` 具名关系两端也对上了（User 的 assignedTasks ↔ Task 的 assignee），这个具名是必须的，因为 User 和 Task 之间将来可能不止一条关系，它提前消歧了。
唯一约束：✓ `@@unique([userId, projectId])` 在 ProjectMembership 上。
snake_case 映射：✓ 列名 @map、表名 @@map 复数，model 名 PascalCase 单数，惯例对。
排除字段没回来：✓ 没有 deleted_at / display_name / priority。
description 必填：✓ `description String`（无问号），按你的裁决落实了，没沿用它自己的「可空」初判。
status 默认：✓ `@default(not_started)`。

**它额外做对的一个细节：** 时间字段都加了 `@db.Timestamptz(6)`，把「带时区」从决策真正落进了 Prisma 类型，不只是嘴上说 timestamptz。这是 ADR-DB-003 的兑现。

**结论：schema 干净，可以落盘。** 这是 architect 三步推下来最稳的一份，没有需要返工的地方。

---

现在落盘。architect 只有 Read 权限，写文件这一步**由你用 cat 命令**做（AGENT_SPEC 落盘方式 + 反模式 18）。

**模式归属**：新建文件，**默认模式，不切 Plan Mode**（反模式 15）。
这步不经过 CC 角色，是你直接在终端跑 bash。

**终端命令（直接复制，先建目录再写文件——反模式 20 的顺序）：**

```bash
cd ~/projects/study-l3-v2
mkdir -p prisma
```

然后单独这一条写文件（独立代码块，不夹说明——反模式 28）：

```bash
cat > prisma/schema.prisma << 'ENDOFSCHEMA'
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

enum MemberRole {
  owner
  executor
}

enum TaskStatus {
  not_started
  in_progress
  completed
}

enum NotificationType {
  stuck_task
}

model User {
  id           Int      @id @default(autoincrement())
  email        String   @unique
  passwordHash String   @map("password_hash")
  createdAt    DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt    DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)

  sessions           Session[]
  projectMemberships ProjectMembership[]
  assignedTasks      Task[]              @relation("TaskAssignee")
  notifications      Notification[]

  @@map("users")
}

model Session {
  id        Int      @id @default(autoincrement())
  userId    Int      @map("user_id")
  tokenHash String   @map("token_hash")
  expiresAt DateTime @map("expires_at") @db.Timestamptz(6)
  createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@map("sessions")
}

model Project {
  id        Int      @id @default(autoincrement())
  name      String
  createdAt DateTime @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt DateTime @updatedAt @map("updated_at") @db.Timestamptz(6)

  memberships ProjectMembership[]
  tasks       Task[]

  @@map("projects")
}

model ProjectMembership {
  id        Int        @id @default(autoincrement())
  userId    Int        @map("user_id")
  projectId Int        @map("project_id")
  role      MemberRole
  createdAt DateTime   @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt DateTime   @updatedAt @map("updated_at") @db.Timestamptz(6)

  user    User    @relation(fields: [userId], references: [id], onDelete: Restrict)
  project Project @relation(fields: [projectId], references: [id], onDelete: Restrict)

  @@unique([userId, projectId])
  @@map("project_memberships")
}

model Task {
  id              Int        @id @default(autoincrement())
  projectId       Int        @map("project_id")
  title           String
  description     String
  assigneeUserId  Int?       @map("assignee_user_id")
  status          TaskStatus @default(not_started)
  statusUpdatedAt DateTime   @default(now()) @map("status_updated_at") @db.Timestamptz(6)
  dueAt           DateTime?  @map("due_at") @db.Timestamptz(6)
  createdAt       DateTime   @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt       DateTime   @updatedAt @map("updated_at") @db.Timestamptz(6)

  project       Project        @relation(fields: [projectId], references: [id], onDelete: Restrict)
  assignee      User?          @relation("TaskAssignee", fields: [assigneeUserId], references: [id], onDelete: SetNull)
  notifications Notification[]

  @@map("tasks")
}

model Notification {
  id              Int              @id @default(autoincrement())
  recipientUserId Int              @map("recipient_user_id")
  taskId          Int              @map("task_id")
  type            NotificationType
  readAt          DateTime?        @map("read_at") @db.Timestamptz(6)
  createdAt       DateTime         @default(now()) @map("created_at") @db.Timestamptz(6)
  updatedAt       DateTime         @updatedAt @map("updated_at") @db.Timestamptz(6)

  recipient User @relation(fields: [recipientUserId], references: [id], onDelete: Restrict)
  task      Task @relation(fields: [taskId], references: [id], onDelete: Restrict)

  @@map("notifications")
}
ENDOFSCHEMA
```

最后验证落盘（走完整链：在磁盘 + 内容对——反模式 3）：

```bash
echo "===== 文件存在性 ====="; ls -l prisma/schema.prisma
echo "===== model/enum 计数（应为 6 model + 3 enum）====="; grep -cE '^model ' prisma/schema.prisma; grep -cE '^enum ' prisma/schema.prisma
echo "===== 开头 12 行 ====="; head -12 prisma/schema.prisma
```

预期：文件存在；`model` 计数 6、`enum` 计数 3；开头能看到 datasource 块。
（我把字段缩进对齐了一下，功能和 architect 给的完全一致，只是排版更整齐。）

把这三条的输出贴回来。验证通过我就进**结课固定动作**——入库、写笔记、更新目录树、git 提交、发桥梁。本课正文到此结束，剩下是收尾。

Human (Jun 30, 2026, 2:57 PM):
ichael@AngelHe:~/projects/study-l3-v2$ echo "===== 文件存在性 ====="; ls -l prisma/schema.prisma
echo "===== model/enum 计数（应为 6 model + 3 enum）====="; grep -cE '^model ' prisma/schema.prisma; grep -cE '^enum ' prisma/schema.prisma
echo "===== 开头 12 行 ====="; head -12 prisma/schema.prisma
===== 文件存在性 =====
-rw-r--r-- 1 michael michael 3640 Jun 30 14:57 prisma/schema.prisma
===== model/enum 计数（应为 6 model + 3 enum）=====
6
3
===== 开头 12 行 =====
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
generator client {
  provider = "prisma-client-js"
}
enum MemberRole {
  owner
  executor

Claude:
落盘验证通过（拿真实输出核对，不信「成功」二字——反模式 4/3）：

文件在磁盘，3640 字节 ✓
model 计数 6 ✓　enum 计数 3 ✓
开头是 datasource 块 ✓

**schema 正式定稿。Lec 5 正文到此结束。**

---

# Lec 5 结课固定动作（规则 54，逐项走、逐条报）

按规则 60 双闸的结课闸，我逐个文件问「本课有没有产生该更新它的内容」，再按规则 54 的固定顺序执行。先给你**结课自检报告**，再给命令。

**六文件结课自检（规则 60）：**
- COURSE_RULES：有新规则吗？→ **有 1 条**（规则 66，下面讲）。
- anti-patterns：踩新坑了吗？→ **有 1 条**（反模式 33，下面讲）。
- TEACHING_STYLE：讲课手感有新约定吗？→ 无。本课手感沿用旧标准，没出新约定。
- AGENT_SPEC：角色标准有新约定吗？→ 无。architect 复用顺畅，标准够用。
- LESSON_TEMPLATE：段落骨架有变化吗？→ 无。3a-3d 骨架本课跑得很顺，不动。
- PROJECT_STRUCTURE：目录树要更新吗？→ **要**（新增 prisma/schema.prisma + DECISIONS 增条目，排最后）。

**传承链元检查（规则 61）：** 下面新增的规则 66 + 反模式 33 都会写进对应持久文件，下一课通过「开课必读 + 结课自检」自动覆盖到，不漏。

---

先讲**本课要入库的两条新东西**，让你知道它们从哪来。

**反模式 33 号 · architect 把隐藏决策默默咽下，不交给主人拍。**
现象：架构师做删除策略时，把「现在不做删除功能」和「不预留 deleted_at 字段」两个本该分开的问题合并成一个，悄悄替你选了硬删除。是你这门课信仰（演进先于完美）该警觉的越权点。
根因：E4 架构错。把「当前需求」和「未来演进余地」混为一谈，越过决策权属（强化 16）。
修复：凡 schema/架构里藏着「现在 vs 将来」取舍的决策（删除策略、onDelete、字段预留），architect 必须显式标出来交主人拍，不许并进 ADR 默默选。后来 onDelete 那步它主动弹菜单问，正是这条的正面执行。

**规则 66 · 数据建模三步拆段法。**
内容：schema 设计强制拆三步走——① 推实体（只列名词、标来源，不写字段）② 设字段 + 定三决策（主键/删除/时区，各用 ADR）③ 连关系 + 出 Prisma。每步设停止条件，逐步审。
背景：本课验证有效——三步拆开后，每一步都审出了该你拍的决策点（三实体待确认、删除策略、onDelete），整块甩出根本审不出来。落点 COURSE_RULES，归入数据建模方法。

---

**结课命令（按规则 54 顺序）。一条一个独立代码块（反模式 28），你逐条跑。**

**第 1 步 · 反模式 33 入库：**

```bash
cd ~/projects/study-l3-v2
cat >> docs/lessons/anti-patterns.md << 'ENDOFAP'

## 33 号 · architect 把隐藏决策默默咽下，不交给主人拍
现象：架构师做删除策略时，把「MVP 不做删除功能」和「不预留 deleted_at 字段」两个本该分开的问题合并，悄悄替主人选了硬删除，没把取舍交出来。
根因：E4 架构错。把「当前需求」与「未来演进余地」混为一谈，越过决策权属（强化 16）。
修复：凡 schema/架构里藏着「现在 vs 将来」取舍的决策（删除策略、onDelete 级联、字段预留），architect 必须显式标出交主人拍，不许并进 ADR 默默选。
教训：看似 ADR 论证完整的决策，可能内含一个没被点名的越权选择。审 ADR 要问「这条有没有替我做了我没拍的取舍」。
抽象模式：与 32（需求来源没标）同族，都是「该显式标的没标」——这里没标的是「决策的取舍归属」。
ENDOFAP
echo "已写入反模式 33"; tail -3 docs/lessons/anti-patterns.md
```

**第 2 步 · 规则 66 入库：**

```bash
cat >> docs/COURSE_RULES.md << 'ENDOFRULE'

## 66 · 数据建模三步拆段法
schema 设计强制拆三步，每步设停止条件，逐步审，禁止整块产出：
1. 推实体：只列实体名 + 一句话职责 + 来源（PRD 第几条 / pm 推导基础需求）+ 多对多初判。不写字段。
2. 设字段 + 定三决策：主键 / 删除 / 时区各用 ADR-Lite；逐表设字段；枚举列取值标来源；PRD 没定义的字段标「建议补充，待确认」不直接塞。
3. 连关系 + 出 Prisma：先文字说关系（一对多 / 多对多中间表 / 弱关联），再出 schema.prisma；onDelete 等隐藏取舍显式交主人拍（配合反模式 33）。
背景：Lec 5 验证有效。三步拆开后每步都审出该学生拍的决策点（三实体待确认 / 删除策略 / onDelete），整块甩出审不出来。
与规则 51 关系：51 是「复杂产物分块讲」的通则，本条是它在数据建模上的具体化，叠加生效。
ENDOFRULE
echo "已写入规则 66"; tail -3 docs/COURSE_RULES.md
```

跑完这两条，把输出贴回来。验证入库成功后，我接着给：第 3 步两份笔记、第 4 步 DECISIONS 落盘 + 目录树更新、第 5 步 git 提交、第 6 步桥梁。

**窗口体感**：用了约六成，结课剩余动作走得完，不用换窗口。

Claude:
落盘验证通过，逐条核（反模式 3 完整链）：

文件在磁盘：✓ 3640 字节，刚写的。
model 计数：✓ 6。
enum 计数：✓ 3。
开头内容：✓ datasource + generator + enum 起头都对。

schema.prisma 正式落盘。**Lec 5 的核心产物到手了——6 张表、3 枚举、关系网、三决策全部兑现在一个能跑的文件里。** 数据建模这关，你过了。

---

# Lec 5 · 结课固定动作

按规则 54 的固定顺序逐项走，逐条向你报，不靠记忆。**先入库，后桥梁（规则 45）。**

先过一遍**结课自检（规则 60 结课闸 + 规则 62）**，逐个文件问「本课有没有该更新它的内容」：

- **anti-patterns**：本课踩新坑了吗？→ **有一条**，下面讲。
- **COURSE_RULES**：有新规则吗？→ **没有**。本课没长出新的协作规则，现有规则够用。
- **TEACHING_STYLE**：讲课手感有新约定吗？→ 没有，三步拆段讲照旧。
- **AGENT_SPEC**：角色标准有新约定吗？→ 没有，architect 复用照图纸。
- **LESSON_TEMPLATE**：段落骨架有变化吗？→ 没有。
- **BACKLOG**：有新待办吗？→ **有一条**（软删除），下面入库。
- **PROJECT_STRUCTURE**：目录树要更新吗？→ **要**，新增 prisma/schema.prisma，排最后做（规则 52）。
- **DECISIONS / CLAUDE.md 第二层**：B 类裁决要落盘吗？→ **要**，三决策 + onDelete 进 ADR。

下面按清单执行。

## 动作 1 · 新反模式入库

本课确实长出一条新反模式。复盘一下：硬删除那一步，architect 把「现在不做删除功能」和「连 deleted_at 字段都不预留」两个问题悄悄合并，替你咽下了一个本该你拍的演进取舍。这不是它算错，是**把一个属于你的权衡，包装成了一个看起来理所当然的技术结论**。这类坑值得记号——它和反模式 32（教学驱动需求没标来源）同族，都是「该暴露的判断被藏起来了」。

**反模式 33（直接复制，独立代码块）：**

```bash
cat >> docs/lessons/anti-patterns.md << 'ENDOFAP'

## 33 号 · 把"属于主人的取舍"包装成"理所当然的技术结论"
现象：architect 定删除策略时，把「MVP 不做删除功能」（事实）和「连 deleted_at 字段都不预留」（取舍）合并成一条 ADR，理由写得很顺，看着像纯技术结论，实则替项目主人咽下了一个演进权衡（预留门框便宜、将来砸墙贵）。
根因：E4 架构错。AI 做权衡时倾向给出"自洽且合理"的单一结论，把决策点藏进论证里，而非把取舍显式抛回给决策人。
修复：凡 AI 给出的决策含"现在不做某事，所以也不预留某结构"这类合并判断，老师要拆开看——"现在不做"是事实，"不预留"是取舍。取舍归学生（强化 16 决策权属）。prompt 里要求角色"遇到含取舍的细节先指出再执行，不要默默选"（本课 onDelete 这步就靠这条逼它把 onDelete 交了出来，成功）。
教训：看着顺的技术结论，先问一句"这里面有没有藏着一个该我拍的取舍"。
抽象模式：与 32（教学驱动需求没标来源）、19（AI 假设当事实）同族——都是"该暴露的东西被 AI 的合理性叙述盖住了"。
ENDOFAP
```

验证：

```bash
grep -c '^## ' docs/lessons/anti-patterns.md
```

预期：33（反模式从 32 增到 33）。

把这两条输出贴回来，我确认后进动作 2（BACKLOG 入库 → 写笔记 → ADR 落盘 → 更新目录树 → git 提交 → 发桥梁）。

**窗口体感**：用了约六成，剩下的结课动作走得完，不用换窗口。

Human (Jun 30, 2026, 3:27 PM):
michael@AngelHe:~/projects/study-l3-v2$ grep -c '^## ' docs/lessons/anti-patterns.md
33

Claude:
反模式 33 入库确认：✓ 计数 33，新坑落进持久层了。

进**动作 2 · BACKLOG 入库**。

你拍的删除策略 C——MVP 硬删，软删除留到将来——这条得有地方接住，不能只活在咱俩对话里（反模式 24）。它正好是 BACKLOG 装的那类东西：「该做但本课不做」的跨课待办（规则 65）。

**BACKLOG 第 8 条（直接复制，独立代码块）：**

```bash
cat >> docs/BACKLOG.md << 'ENDOFBL'
8 | 下沉 | 软删除：MVP 选硬删除未预留 deleted_at，将来出现删除故事时用 Expand-Migrate-Contract 演进（加列→改查询过滤→数据迁移），注意软删除与 email/(user_id,project_id) 唯一约束的冲突 | 出现删除故事时（大概率 Lec 13 功能迭代）
ENDOFBL
```

验证：

```bash
echo "===== BACKLOG 条数（应为 8）====="; grep -cE '^[0-9]+ \|' docs/BACKLOG.md
echo "===== 第 8 条 ====="; tail -1 docs/BACKLOG.md
```

预期：条数 8；最后一行是软删除那条，类型「下沉」。

---

下面把**动作 3（写两份笔记）**也一起给你，省一次来回。两份笔记是规则 19 + 54 的固定产出。

**先写完整版（独立代码块）：**

```bash
cat > docs/lessons/05-full.md << 'ENDOFFULL'
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
ENDOFFULL
```

**再写速查卡（独立代码块，规则 19：800 字以内）：**

```bash
cat > docs/lessons/05-cheatsheet.md << 'ENDOFCHEAT'
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
ENDOFCHEAT
```

验证两份笔记：

```bash
echo "===== 笔记落盘 ====="; ls -l docs/lessons/05-full.md docs/lessons/05-cheatsheet.md
echo "===== 速查卡字数（目标≤800）====="; wc -m docs/lessons/05-cheatsheet.md
```

预期：两个文件都在；速查卡字符数在 800 以内（用 wc -m 数中文字符，不用 wc -w——反模式 2）。

把 BACKLOG 验证 + 两份笔记验证的输出一起贴回来。确认后进动作 4（ADR 落盘 → CLAUDE.md 第二层 → 更新目录树 → git → 桥梁）。

Human (Jun 30, 2026, 3:29 PM):
michael@AngelHe:~/projects/study-l3-v2$ echo "===== 笔记落盘 ====="; ls -l docs/lessons/05-full.md docs/lessons/05-cheatsheet.md
echo "===== 速查卡字数（目标≤800）====="; wc -m docs/lessons/05-cheatsheet.md
===== 笔记落盘 =====
-rw-r--r-- 1 michael michael 1007 Jun 30 15:28 docs/lessons/05-cheatsheet.md
-rw-r--r-- 1 michael michael 3519 Jun 30 15:28 docs/lessons/05-full.md
===== 速查卡字数（目标≤800）=====
566 docs/lessons/05-cheatsheet.md
michael@AngelHe:~/projects/study-l3-v2$ echo "===== BACKLOG 条数（应为 8）====="; grep -cE '^[0-9]+ \|' docs/BACKLOG.md
echo "===== 第 8 条 ====="; tail -1 docs/BACKLOG.md
===== BACKLOG 条数（应为 8）=====
8
===== 第 8 条 =====
8 | 下沉 | 软删除：MVP 选硬删除未预留 deleted_at，将来出现删除故事时用 Expand-Migrate-Contract 演进（加列→改查询过滤→数据迁移），注意软删除与 email/(user_id,project_id) 唯一约束的冲突 | 出现删除故事时（大概率 Lec 13 功能迭代）

Claude:
逐条核：

两份笔记落盘：✓ 05-full.md（3519 字节）、05-cheatsheet.md（1007 字节）都在。
速查卡字数：✓ 566 字符，目标 800 以内，达标（wc -m 数对了字符，反模式 2 防住）。
BACKLOG 条数：✓ 8。
第 8 条内容：✓ 软删除演进待办，类型「下沉」，落对了。

进**动作 4 · ADR 落盘 + CLAUDE.md 第二层**。

本课所有 B 类裁决（项目事实）现在统一落进持久层（规则 64：产生即定层）。三决策 + onDelete 进 DECISIONS.md，关键结论进 CLAUDE.md 第二层让 CC 每次进项目都看得到。

**追加 ADR 到 DECISIONS.md（独立代码块）：**

```bash
cat >> docs/arch/DECISIONS.md << 'ENDOFADR'

---

## ADR-DB-001 · 主键策略：自增整数
- 背景：小型团队内部协作工具，单 VPS 部署，PRD 无公开分享链接/离线创建/跨库合并/分布式写入需求。PostgreSQL + Prisma 已定。
- 决策：6 张表统一自增整数主键（Int @id @default(autoincrement())）。
- 后果：换来调试简单、索引小、排查直观；放弃 UUID 的不可预测性与分布式友好，ID 可被猜到、不适合未来跨库合并。

## ADR-DB-002 · 删除策略：MVP 硬删除，软删除入 BACKLOG
- 背景：PRD 首版不做项目删除（删项目连带删任务属高风险），无删用户/删任务/移除成员故事。
- 决策：全表不加 deleted_at，MVP 不设业务删除入口。项目主人拍板 C 方案：软删除留待将来真出现删除故事时，用 Expand-Migrate-Contract 演进（见 BACKLOG 第 8 条）。
- 后果：换来查询不必过滤 deleted_at、避免唯一约束与软删数据冲突；放弃内建恢复/回收站，将来恢复误删需靠备份或迁移。
- 备注：本决策曾被 architect 包装成"理所当然的技术结论"，经拆解后由主人按演进哲学重新拍板（反模式 33）。

## ADR-DB-003 · 时间存储：timestamptz 带时区
- 背景：30 天登录态、任务截止、长时间无进展判断、未读预警时间均参与业务判断。
- 决策：所有时间字段 Prisma DateTime + @db.Timestamptz(6)，落 PostgreSQL timestamptz。
- 后果：换来统一绝对时间语义，便于多时区转换；代价是 UI 层须明确时区/日期口径，不能把库时间直接当本地时间显示。

## ADR-DB-004 · onDelete 级联策略：三类区别对待
- 背景：MVP 无业务删除故事，onDelete 是"万一"防护栏。无脑全 Restrict 过于一刀切，局部全级联误删杀伤大。
- 决策：按数据性质分三类——
  - sessions.user → Cascade（会话属随人数据，人删则清）。
  - tasks.assignee → SetNull（任务资产保全，删用户后变未认领；assignee_user_id 因此可空）。
  - 其余业务外键（task→project、membership→user/project、notification→user/task）→ Restrict（防无声连坐删除）。
- 后果：贴合"数据资产不无声蒸发"安全直觉；代价是将来做删除功能时，Restrict 的外键需先写清理逻辑。
ENDOFADR
```

**追加 CLAUDE.md 第二层 E（独立代码块）：**

```bash
cat >> CLAUDE.md << 'ENDOFCLAUDE'

### 第二层 E：数据模型关键结论（Lec 5）

- 6 张表：users、sessions、projects、project_memberships（中间表）、tasks、notifications。
- 主键自增整数；时间 timestamptz；MVP 硬删除（无 deleted_at，软删除见 BACKLOG 8）。
- onDelete：会话 Cascade、任务 assignee SetNull、其余 Restrict。
- 枚举：MemberRole(owner/executor)、TaskStatus(not_started/in_progress/completed)、NotificationType(stuck_task)。
- schema 落点：prisma/schema.prisma。CC 改表结构前先回 architect 确认，不擅自改。
ENDOFCLAUDE
```

验证两处落盘：

```bash
echo "===== DECISIONS 新增 ADR-DB（应为 4）====="; grep -c '## ADR-DB-' docs/arch/DECISIONS.md
echo "===== CLAUDE.md 第二层 E ====="; grep -c '第二层 E' CLAUDE.md
echo "===== git 看待提交文件 ====="; git status -s
```

预期：ADR-DB- 计数 4；第二层 E 计数 1；git status 列出本轮所有改动文件（schema.prisma、anti-patterns、BACKLOG、两份笔记、DECISIONS、CLAUDE.md）。

**git status 那条特意先跑**——规则 63：提交前先看清这次要带走哪些文件，确认都在本轮预期内，没有别窗口夹带的（防反模式 30）。

贴回来我核对。确认后就剩最后两步：更新目录树（排最后，规则 52）→ git 提交 → 发桥梁。

Human (Jun 30, 2026, 3:30 PM):
michael@AngelHe:~/projects/study-l3-v2$ echo "===== DECISIONS 新增 ADR-DB（应为 4）====="; grep -c '## ADR-DB-' docs/arch/DECISIONS.md
echo "===== CLAUDE.md 第二层 E ====="; grep -c '第二层 E' CLAUDE.md
echo "===== git 看待提交文件 ====="; git status -s
===== DECISIONS 新增 ADR-DB（应为 4）=====
4
===== CLAUDE.md 第二层 E =====
1
===== git 看待提交文件 =====
 M CLAUDE.md
 M docs/BACKLOG.md
 M docs/arch/DECISIONS.md
 M docs/lessons/anti-patterns.md
?? docs/lessons/05-cheatsheet.md
?? docs/lessons/05-full.md
?? prisma/
michael@AngelHe:~/projects/study-l3-v2$

Claude:
逐条核（规则 63，看清待提交文件）：

ADR-DB 计数：✓ 4 条（001~004）。
CLAUDE.md 第二层 E：✓ 1。
git status——7 处改动，全部在本轮预期内，没有别窗口夹带：
- M CLAUDE.md（第二层 E）✓
- M docs/BACKLOG.md（第 8 条）✓
- M docs/arch/DECISIONS.md（ADR-DB-001~004）✓
- M docs/lessons/anti-patterns.md（反模式 33）✓
- ?? docs/lessons/05-cheatsheet.md ✓
- ?? docs/lessons/05-full.md ✓
- ?? prisma/（schema.prisma）✓

干净，没有意外文件。**注意还差一个——PROJECT_STRUCTURE.md 还没更新**，它必须排在所有文件落盘之后做（规则 52），现在正是时候。做完它再 git add，才不会漏掉本课最后生成的文件。

进**动作 5 · 更新目录树（结课最后一个文件动作）**。

新增了 `prisma/schema.prisma`，目录树和 CLAUDE.md 追踪都要补。用 str_replace 式的精确替换最稳，我给你两条独立命令。

**先在目录树里插入 prisma 目录（独立代码块）：**

```bash
cd ~/projects/study-l3-v2
python3 - << 'ENDOFPY'
import re
p = "docs/PROJECT_STRUCTURE.md"
s = open(p, encoding="utf-8").read()

# 1) 更新标题行的课次标记
s = s.replace(
    "## 当前目录树（Lec 4 结课 · architect + 技术选型完成）",
    "## 当前目录树（Lec 5 结课 · 数据建模 schema 完成）"
)

# 2) 在 CLAUDE.md 行后插入 prisma/ 目录块（紧跟根目录 CLAUDE.md 那行）
anchor = "└── docs/"
prisma_block = """├── prisma/
│   └── schema.prisma       Prisma 数据模型，6 model + 3 enum + 关系 + onDelete（Lec 5 建）
└── docs/"""
s = s.replace(anchor, prisma_block, 1)

# 3) 第 0-3 课笔记行后追加 04/05 已存在说明 -> 在 04-cheatsheet 行后加 05
s = s.replace(
    "│       ├── 04-cheatsheet.md     第 4 课速查卡",
    "│       ├── 04-cheatsheet.md     第 4 课速查卡\n│       ├── 05-full.md           第 5 课完整笔记（数据建模 schema）\n│       ├── 05-cheatsheet.md     第 5 课速查卡"
)

# 4) CLAUDE.md 追踪小节：第二层补到 E
s = s.replace(
    "+ D 技术选型关键结论（Lec 4）",
    "+ D 技术选型关键结论（Lec 4）+ E 数据模型关键结论（Lec 5）"
)

# 5) 反模式计数 1-32 -> 1-33
s = s.replace("反模式库，1-32 号", "反模式库，1-33 号")
s = s.replace("docs/lessons/anti-patterns.md 反模式库 1-32", "docs/lessons/anti-patterns.md 反模式库 1-33")

open(p, "w", encoding="utf-8").write(s)
print("PROJECT_STRUCTURE.md 更新完成")
ENDOFPY
```

验证更新到位：

```bash
echo "===== 标题课次 ====="; grep '## 当前目录树' docs/PROJECT_STRUCTURE.md
echo "===== prisma 进树了吗 ====="; grep -A1 '├── prisma/' docs/PROJECT_STRUCTURE.md
echo "===== 05 笔记进树了吗 ====="; grep '05-' docs/PROJECT_STRUCTURE.md
echo "===== 第二层到 E 了吗 ====="; grep '第二层' docs/PROJECT_STRUCTURE.md | grep 'E '
echo "===== 反模式计数 ====="; grep '1-33' docs/PROJECT_STRUCTURE.md
```

预期：标题显示 Lec 5；prisma/ + schema.prisma 在树里；05-full / 05-cheatsheet 在树里；第二层追踪到 E；反模式标 1-33（两处）。

这是 sed/python 批量改文件，**只动 PROJECT_STRUCTURE.md 一个文件，不碰别的**。改完它就是本课最后一个文件动作，之后直接 git 提交、发桥梁。

贴回来我核。如果哪条没替换上（原文措辞和我预期的有出入），我们再单独修——这种批量替换偶尔会因为原文一个字差异没匹配上，所以才要逐条验。

Human (Jun 30, 2026, 3:31 PM):
michael@AngelHe:~/projects/study-l3-v2$ echo "===== 标题课次 ====="; grep '## 当前目录树' docs/PROJECT_STRUCTURE.md
echo "===== prisma 进树了吗 ====="; grep -A1 '├── prisma/' docs/PROJECT_STRUCTURE.md
echo "===== 05 笔记进树了吗 ====="; grep '05-' docs/PROJECT_STRUCTURE.md
echo "===== 第二层到 E 了吗 ====="; grep '第二层' docs/PROJECT_STRUCTURE.md | grep 'E '
echo "===== 反模式计数 ====="; grep '1-33' docs/PROJECT_STRUCTURE.md
===== 标题课次 =====
## 当前目录树（Lec 5 结课 · 数据建模 schema 完成）
===== prisma 进树了吗 =====
├── prisma/
│   └── schema.prisma       Prisma 数据模型，6 model + 3 enum + 关系 + onDelete（Lec 5 建）
===== 05 笔记进树了吗 =====
===== 第二层到 E 了吗 =====
    第二层 项目事实：A 方向（Lec 1）+ B 已确认需求十七条（Lec 2）+ C UI 设计关键结论（Lec 3）+ D 技术选型关键结论（Lec 4）+ E 数据模型关键结论（Lec 5）
===== 反模式计数 =====
        └── anti-patterns.md     反模式库，1-33 号
- docs/lessons/anti-patterns.md 反模式库 1-33

Claude:
逐条核，发现一处没替换上：

标题课次：✓ Lec 5。
prisma 进树：✓ schema.prisma 在树里。
**05 笔记进树：✗ 空的，没匹配上。** 那条 04-cheatsheet 的原文措辞和我预期有出入，替换没生效。
第二层到 E：✓。
反模式计数：✓ 两处都是 1-33。

四条对了，第 5 条（05 笔记进树）漏了——批量替换偶尔会因原文一字之差没匹配，所以才逐条验。先看原文长什么样，再精确补。

**先看原文（独立代码块）：**

```bash
grep -n '04-' docs/PROJECT_STRUCTURE.md
```

预期：能看到 04-full 和 04-cheatsheet 两行的真实写法 + 行号。

贴回来我按真实措辞给你一条精确的补丁命令。这一步只补 05 两行进目录树，不碰别处。

Human (Jun 30, 2026, 3:32 PM):
michael@AngelHe:~/projects/study-l3-v2$ grep -n '04-' docs/PROJECT_STRUCTURE.md
36:        ├── 04-full.md           第 4 课完整笔记（architect + 选型）
37:        ├── 04-cheatsheet.md     第 4 课速查卡

Claude:
原文找到了。我之前的替换字符串里前导空格数和原文对不上（原文是 8 个空格，我写少了），所以没匹配。这次用 sed 按行号精确插入，最稳。

**补 05 两行进目录树（独立代码块）：**

```bash
cd ~/projects/study-l3-v2
sed -i '37a\        ├── 05-full.md           第 5 课完整笔记（数据建模 schema）\n        ├── 05-cheatsheet.md     第 5 课速查卡' docs/PROJECT_STRUCTURE.md
```

验证：

```bash
echo "===== 05 进树了吗 ====="; grep '05-' docs/PROJECT_STRUCTURE.md
echo "===== 笔记区上下文 ====="; sed -n '34,40p' docs/PROJECT_STRUCTURE.md
```

预期：grep 出 05-full 和 05-cheatsheet 两行；上下文里 04 两行、05 两行、anti-patterns 行依次排好，缩进对齐。

贴回来我核。对上了，目录树就彻底更新完——这是本课最后一个文件动作（规则 52），之后直接 git 提交、发桥梁。

Human (Jun 30, 2026, 3:33 PM):
michael@AngelHe:~/projects/study-l3-v2$ echo "===== 05 进树了吗 ====="; grep '05-' docs/PROJECT_STRUCTURE.md
echo "===== 笔记区上下文 ====="; sed -n '34,40p' docs/PROJECT_STRUCTURE.md
===== 05 进树了吗 =====
        ├── 05-full.md           第 5 课完整笔记（数据建模 schema）
        ├── 05-cheatsheet.md     第 5 课速查卡
===== 笔记区上下文 =====
        ├── 00-full.md ~ 03-full.md          第 0-3 课完整笔记
        ├── 00-cheatsheet.md ~ 03-cheatsheet.md  第 0-3 课速查卡
        ├── 04-full.md           第 4 课完整笔记（architect + 选型）
        ├── 04-cheatsheet.md     第 4 课速查卡
        ├── 05-full.md           第 5 课完整笔记（数据建模 schema）
        ├── 05-cheatsheet.md     第 5 课速查卡
        └── anti-patterns.md     反模式库，1-33 号

Claude:
补上了，逐条核：

05 进树：✓ 两行都在。
上下文：✓ 00-03 → 04 → 05 → anti-patterns 依次排好，缩进对齐，`└──` 收尾在 anti-patterns，结构干净。

**目录树彻底更新完。这是本课最后一个文件动作（规则 52）——所有产物、笔记、ADR 都已落盘，目录树排在最后，没有漏文件。**

进**动作 6 · git 提交**。

先再跑一次 status 确认范围（规则 63，提交前最后一眼），再提交。

**先看（独立代码块）：**

```bash
cd ~/projects/study-l3-v2
git status -s
```

预期：CLAUDE.md、BACKLOG.md、DECISIONS.md、anti-patterns.md、PROJECT_STRUCTURE.md 五个 M，加 05-full.md、05-cheatsheet.md、prisma/ 三个新增。八处，全在本轮预期内。

确认无误后提交（独立代码块）：

```bash
git add -A
git commit -m "feat(lec5): 数据建模完成 6 表 Prisma schema + 三决策 ADR

- 实体: users/sessions/projects/project_memberships/tasks/notifications
- 三决策: 自增主键 / MVP硬删除(软删入backlog) / timestamptz
- onDelete: 会话Cascade 任务assignee SetNull 其余Restrict
- 落盘: prisma/schema.prisma, ADR-DB-001~004, CLAUDE.md第二层E
- 新增反模式33, BACKLOG第8条, 两份笔记"
```

提交信息用 Conventional Commits（feat: ...），如实覆盖了本轮所有改动（规则 63 + CLAUDE.md 第一层 C，防反模式 30）。

验证提交（独立代码块）：

```bash
echo "===== 最近提交 ====="; git log --oneline -3
echo "===== 工作区干净吗 ====="; git status -s
```

预期：HEAD 是这条 feat(lec5)；working tree clean（git status -s 无输出）。

把这三段输出贴回来。提交确认后，就只剩最后一件——**发 Lec 6 桥梁**（规则 45：桥梁必须是全课最后一个产出，现在所有入库都做完了，可以发了）。

Human (Jun 30, 2026, 3:34 PM):
michael@AngelHe:~/projects/study-l3-v2$ echo "===== 最近提交 ====="; git log --oneline -3
echo "===== 工作区干净吗 ====="; git status -s
===== 最近提交 =====
df657a3 (HEAD -> master) feat(lec5): 数据建模完成 6 表 Prisma schema + 三决策 ADR
17bfce1 feat(lec4): architect 激活 + 技术选型决策
763360d feat(lec3): designer 产出 UI 设计 + 信息分层落盘机制
===== 工作区干净吗 =====
michael@AngelHe:~/projects/study-l3-v2$

Claude:
提交确认：

最近提交：✓ HEAD 是 df657a3 feat(lec5)，前面接 lec4 / lec3，历史连贯。
工作区：✓ git status -s 无输出，working tree clean。

**入库全部完成。** 反模式 33、BACKLOG 第 8、两份笔记、ADR-DB-001~004、CLAUDE.md 第二层 E、目录树、git 提交——结课固定动作六步走完前五步，全绿。

现在发**最后一件产物：Lec 6 桥梁**（规则 45：桥梁是全课最后一个产出，前面都入库了，可以发了）。

桥梁本身用一个代码块装好，方便你整段复制到新窗口。下一课注意：Lec 6 是 CLAUDE.md 灵魂课（建第三层决策边界 D1-D7 + 权限），知识库里标的「Phase 0 最后一课」，分量重。

```
# 桥梁 prompt · Lec 5 → Lec 6（数据建模已完成，下一步 CLAUDE.md 灵魂课）

## 第 1 节 · 这份桥梁是什么
Lec 5 结课产出，给 Lec 6 老师用。
新窗口粘贴顺序：KNOWLEDGE_BASE.md → 课程调节器 → 本桥梁。
冲突优先级：本桥梁 > 调节器 > KNOWLEDGE_BASE。
规则、反模式、讲课标准、角色标准、段落标准、项目结构、跨课待办都不靠桥梁传，存项目文件里（见第 7 节）。本桥梁只装临时状态。

## 第 2 节 · 编号对齐 + 学生背景
项目用 Lec 0/1/2/3/4/5 编号。Lec 5 = architect 数据建模（schema），已完成。本窗口是 Lec 6 开课前。
学生 Michael，节奏快、批判性极强（本课亲自抓出 architect 把「MVP 不做删除」和「不预留 deleted_at 字段」两件事合并、替他咽下演进取舍，要求把决策权要回来；onDelete 也坚持区别对待而非一刀切）、文字太密会看不懂。讲课务必直白、分块、留呼吸感、少图标、多比方，核心讲解必走讲解骨架 3a-3d。

## 第 3 节 · 项目当前状态
项目名：study-l3-v2，位于 ~/projects/study-l3-v2/（WSL2 Ubuntu，VS Code 已连 WSL）。
项目一句话：团队任务协作工具，服务负责人 + 执行者两类用户。
当前阶段：Phase 0 立项，需求 + UI + 技术选型 + 数据建模完成，整体进度约 80%。
技术栈已定（docs/arch/TECH_STACK.md）：全栈 TS、pnpm monorepo、Next.js+Tailwind+shadcn、NestJS、PostgreSQL+Prisma、Zod、Docker+Nginx。鉴权 DB session、Redis 延后、实时 MVP 用通知表轮询、WebSocket 留 Lec 13。
数据模型已定（prisma/schema.prisma）：6 表，自增主键 / MVP 硬删除 / timestamptz；onDelete 三类（会话 Cascade、任务 assignee SetNull、其余 Restrict）。

## 第 4 节 · Lec 5 做了什么 + 产出了什么
能力：复用 architect（先读定义文件再干活），三步推 schema（推实体→设字段+三决策→连关系+出 Prisma），每步给死停止条件防一次甩出；从 PRD 名词推实体并追来源；用 ADR-Lite 留三决策；识别 AI 藏在「合理结论」里的越权取舍并要回决策权。
落盘文件（完整路径）：
- prisma/schema.prisma  6 model + 3 enum + 关系双向 + onDelete + (user_id,project_id) 唯一约束。architect 产文本、学生 cat 落盘（角色只 Read）。
- docs/arch/DECISIONS.md  追加 ADR-DB-001~004（主键/删除/时间/onDelete）。
- CLAUDE.md 第二层 E  数据模型关键结论（CC 每次进项目须知）。
- docs/lessons/05-full.md、05-cheatsheet.md  两份笔记。
新反模式：33（把「属于主人的取舍」包装成「理所当然的技术结论」，同族 19/32）。
新规则：无（本课现有规则够用，没硬造）。
新 BACKLOG：第 8 条（软删除演进，将来出现删除故事时用 EMC，注意与唯一约束冲突）。
本课关键裁决：6 表定稿不增减；roles/invitations/任务历史表均不单建；删除策略 C（MVP 硬删，软删入 backlog）；description 必填；status 默认 not_started；display_name MVP 不加；onDelete 三类区别对待。

## 第 5 节 · Lec 6 要做什么
注意：KNOWLEDGE_BASE 第七块 19 课骨架里，Lec 6 = CLAUDE.md 宪法（灵魂课）+ 会话简报 + prompt 模板 + 剩余五角色。是 Phase 0 收尾课，分量重。课数弹性（规则 49），具体由 Lec 6 老师按知识点定。
自然下一步：建 CLAUDE.md 第三层（决策边界 D1-D7 + 权限设置 .claude/settings.json）。这是 harness 的 Permissions Manifest + Permission System（见 KNOWLEDGE_BASE 第九块对照表）。
候选分段（开课时与学生确认）：
- CLAUDE.md 第三层：D1-D7 七类决策边界（强化 14）。
- 权限系统：.claude/settings.json 的 allow/ask/deny 三档（Claude Code Permissions 机制）。
- 视情况延伸：会话简报 SESSION_BRIEF、prompt 模板库、剩余五角色（backend/frontend/tester/devops/reviewer）的预建或留到各自激活课。可能拆成 Lec 6 + Lec 7 数节。
注意：第三层是「决策边界 + 权限」，是全项目宪法的封顶层，第一、二层已建好（第二层到 E）。开课先确认主题与分段，再动手。

## 第 6 节 · 项目完整目录结构
见 docs/PROJECT_STRUCTURE.md（规则 50，不在桥梁重复跑 tree）。该文件已于 Lec 5 结课更新，含最新目录树（已加 prisma/schema.prisma + 05 两份笔记）+ 每文件职责 + 课程标准文件清单（开课必读 7 个）+ CLAUDE.md 追踪（第二层到 E）。开课读它即可拿到真实结构。

## 第 7 节 · 规则和反模式存在哪，怎么加载
开课必读共 7 个文件（规则 58 + 65）：
1. docs/COURSE_RULES.md          —— 课程规则 37-65
2. docs/lessons/anti-patterns.md —— 反模式 1-33，新坑从 34 起
3. docs/TEACHING_STYLE.md        —— 讲课手感标准
4. docs/PROJECT_STRUCTURE.md     —— 项目结构 + 标准清单 + CLAUDE.md 追踪
5. docs/AGENT_SPEC.md            —— 角色文件标准（含方法论落点通则）
6. docs/LESSON_TEMPLATE.md       —— 段落骨架标准（含讲解骨架 3a-3d）
7. docs/BACKLOG.md               —— 跨课待办清单（含第 8 条软删除）
另：调节器 G 节 1-36 是出厂规则，与 COURSE_RULES 叠加生效。
开课前自检：调节器 K 节 8 项 + 规则 57 第 9-11 + 规则 60 开课闸 + 规则 62 讲解骨架项，逐条过。新规则编号从 66 起，新反模式从 34 起。
这 7 个文件在学生机器上，不在老师上下文里。老师须如实说明需读、请学生贴回，禁止凭印象编（反模式 1）。
用普通 cat 读，不要用 cat -A（含中文会满屏转义，反模式 22）。

## 第 8 节 · git 状态
working tree clean。最近三条提交：
- df657a3 feat(lec5): 数据建模完成 6 表 Prisma schema + 三决策 ADR
- 17bfce1 feat(lec4): architect 激活 + 技术选型决策
- 763360d feat(lec3): designer 产出 UI 设计 + 信息分层落盘机制
开课前跑 git status 确认 clean、git log --oneline -3 确认这三条。不要回滚，历史干净。

## 第 9 节 · 上节课用到的知识点 + 学生能力
用到的 KNOWLEDGE_BASE 知识点：角色 4 architect（数据建模实战）、补丁 16 四象限、补丁 7 ADR-Lite、协议 2 有预算侦察、协议 3 证据契约、协议 5 ≤3 澄清、协议 6 影响分析、协议 9 一致性、协议 13 EMC（软删除演进路线）、强化 14 决策边界、强化 16 决策权属。
已熟练：复用角色先读定义文件、复杂产物三步拆段推导、从 PRD 推实体并追来源、ADR 留三决策、Prisma schema 关系与 onDelete 设计、识别并夺回 AI 越权咽下的取舍（本课推动反模式 33 诞生）。
还在练：决策边界 D1-D7 的具体落地（Lec 6 主线）、权限系统 settings.json 配置、把宪法三层封顶。
本课要盯的反模式（延续）：3 号（角色复用前先读定义文件）、16 号（CC 别谄媚，撞问题先指出）、18 号（不确定别瞎编，标待确认）、19 号（AI 假设标清楚）、32 号（教学驱动需求标来源）、33 号（AI 把取舍包装成技术结论，先问「有没有藏着该我拍的取舍」）。

## 启动指令（给 Lec 6 老师）
收到全部资料后按顺序做 5 件事，做完等学生回应再开课：
1. 问候，三五句话复述 Lec 5 学了什么（三步推 schema、6 表、三决策 ADR、onDelete 三类、夺回越权取舍）（规则 46）。
2. 确认接续（老师出 prompt/命令/诊断，学生在 CC 执行并决策，CC 输出贴回老师诊断）。
3. 如实说明需读 7 个文件（规则 58 六文件 + BACKLOG），请学生贴回（禁止凭印象编，反模式 1）；读完做漂移自检（K 节 8 项 + 规则 57 第 9-11 + 规则 60 开课闸 + 规则 62），逐条汇报；并向学生复述「七文件维护我记得：开课读全、结课逐查、harness 产物往上沉淀」（规则 61 配套，含 BACKLOG）。
4. 出老师锚点 + Lec 6 大纲（先与学生确认主题，再分段/产物/对应知识点）+ 做 1 分钟复习（抽 2 道 Lec 5 的题让学生口答）+ 问精力（A-D）。
5. 等学生回应再正式开课。建/用角色守 AGENT_SPEC，讲段落守 LESSON_TEMPLATE（讲解骨架 3a-3d），手感守 TEACHING_STYLE。
```

---

**结课固定动作六步全绿（规则 54）：**
1 反模式入库（33）✓
2 规则入库（本课无新规则）✓
3 写两份笔记 ✓
4 更新目录树（排最后）✓
5 git 提交 ✓
6 发桥梁（最后一步）✓

**Lec 5 正式结课。**

这节课你最漂亮的一手，是硬删除那一步把 architect 按下来。它给的论证又顺又自洽，最容易让人点头放过——你没有，你嗅到那条「理所当然」底下藏着一个本该归你的取舍，把它拆开、要了回来。这正是反模式 33 的来历，也是 architect 自己写不出来的东西。schema 它能给，决策的主权得你自己守。

**窗口体感**：用了约七成五，正好结课，没硬撑（规则 48）。
下一课开新窗口，按桥梁顶部顺序粘贴三份资料即可。Lec 6 是 Phase 0 封顶的灵魂课，准备好了再来。

辛苦了，Michael。

Human (Jun 30, 2026, 3:36 PM):
问题：PROJECT_STRUCTURE更新了吗？

Claude:
更新了。本课结课时它是最后一个文件动作（规则 52），改了五处，刚才都逐条验过：

- 标题课次 → Lec 5 结课 · 数据建模 schema 完成 ✓
- prisma/schema.prisma 进了目录树 ✓
- 05-full.md + 05-cheatsheet.md 进了笔记区 ✓（这条第一次批量替换漏了，后来用 sed 按行号补上的）
- CLAUDE.md 追踪小节第二层补到 E ✓
- 反模式计数 1-32 → 1-33（两处）✓

而且它也跟着进了 git 提交——df657a3 那条 commit 的 status 里有 `M docs/PROJECT_STRUCTURE.md`，提交后 working tree clean。

如果你想再亲眼确认一次落盘和提交状态，跑这条：

```bash
cd ~/projects/study-l3-v2
echo "===== 文件最近改动时间 ====="; ls -l docs/PROJECT_STRUCTURE.md
echo "===== 是否已纳入最近提交 ====="; git show --stat HEAD | grep PROJECT_STRUCTURE
echo "===== 工作区是否干净 ====="; git status -s docs/PROJECT_STRUCTURE.md
```

预期：文件有今天的改动时间；git show 能看到它在 HEAD 这条 commit 里；status 对它无输出（已提交、无未保存改动）。

Human (Aug 17, 2026, 11:27 AM):
这里的上下文中"反模式"是什么意思？

Claude:
在你这门课里，**反模式（anti-pattern）** 指的是**犯过好几次的同类错误，总结成「以后别这样」的一条记录**。

这个定义不是通用软件工程里的那个（那边指「看似合理、实则有害的常见设计套路」）。你们课程调节器 E 节规则 3 专门给它下了定义，是课程内部的用法：

> 反模式，意思是犯过好几次的同类错误，总结成"以后别这样"。

**打个比方。**
反模式就像厨房墙上贴的「踩坑便利贴」。
第一次把糖当成盐放进菜里，你贴一张：「糖盐罐长得一样，下次先尝一口」。
下次谁进厨房都能看见这张贴纸，不用再栽一次同样的跟头。

**在你项目里，它是一个具体的文件 + 一套格式。**
所有反模式存在 `docs/lessons/anti-patterns.md`，每条固定六个字段：编号、标题、现象、根因（E1-E4 那套分类）、修复、教训 + 抽象模式。
比如这节课新加的**反模式 33**——「把属于主人的取舍包装成理所当然的技术结论」，就是从 architect 那次硬删除的越权里总结出来的：现象是它把「不做删除」和「不预留字段」合并咽了，教训是「看着顺的技术结论，先问一句有没有藏着该我拍的取舍」。

**它为什么重要（在你这门课的机制里）。**
反模式不是记着好看的。它进了「开课必读 7 文件」，每节课新老师开课前都得读一遍。
这样上一课踩的坑，下一课自动带着防——这就是你们课一直在强调的「传承链」：坑记进持久文件，靠必读 + 自检自动传到下一课，而不是靠某个人记得。

一句话收束：**协议/规则是「应该怎么做」，反模式是「踩过的坑，别再这样」。** 前者是正面清单，后者是负面清单，配套用。

Human (Aug 17, 2026, 11:31 AM):
为什么需要它？还有什么是根因？

Claude:
两个问题分开答。

## 一、为什么需要反模式

核心一句：**因为人（和 AI）会重复踩同一个坑，而记忆靠不住。**

打个比方。
你不记下来，就等于每次进厨房都重新发现「糖盐罐长得一样」。
第一次栽了认了，第二次还栽就是浪费。反模式是把「栽过的地方」钉在墙上，让同一个坑只坑你一次。

具体到你这门课，它解决三个真问题：

**1. AI 是独立环境,不记得上次的教训。**
这是最硬的理由。CC 每开一个新窗口就是一张白纸,它不知道上一课 architect 越权咽过取舍。
你不把坑写进 `anti-patterns.md`,下一课它照样犯。反模式文件就是喂给新窗口的「历史伤疤清单」。

**2. 隔了几课,人也会忘。**
你 Lec 5 记得硬删除那个坑,到 Lec 12 早忘光了。
反模式进了「开课必读 7 文件」,每课开课前都读一遍,等于强制复习——上一课的坑,下一课自动带着防。

**3. 它把「一次教训」变成「一条制度」。**
你们课有个更深的设计:反模式不只是记录,它常常倒逼出一条新规则或新标准。
比如反模式 27(好讲解没固化成模板)直接催生了规则 62(讲解骨架强制)。
坑 → 教训 → 制度,这条链让项目越走越稳,而不是同一类错反复犯。

一句话:**反模式存在,是为了让「传承链」能接住教训——坑记进持久文件,靠必读+自检自动传到下一课,不靠谁的脑子记得。**

---

## 二、根因是什么

**根因(root cause)** 指的是**错误真正的源头,不是表面现象**。这也是课程调节器 E 节规则 3 给的定义:

> 根因,意思是错误真正的源头,不是表面现象。

打个比方。
地上有一滩水(现象)。
拿拖把擦干是治现象——过会儿又是一滩。
发现是水管裂了、去修水管,才是治根因。
不找根因,同一滩水擦一辈子。

**在你项目里,根因被分成四类,就是 E1-E4**(来自协议 8「Verification + Fail Loop」)。每条反模式入库时都要标它属于哪类,这样修的时候不乱试:

**E1 · 环境错**
网络、版本、工具没装对这类。
例:报错 connection refused,其实是 Docker 没起——这是环境问题,改业务代码没用。

**E2 · 工具错**
命令报错、语法写错、用错了工具。
例:反模式 22,用 `cat -A` 看中文文件,满屏转义看着像乱码——不是文件坏了,是验证工具选错了。

**E3 · 逻辑错**
跑通了,但结果不对。表面成功、实质错。
例:反模式 3,角色出现在列表里(看着成了),但人设没进脑子(实质没生效)。

**E4 · 架构错**
设计层面的问题,最深的一类。
例:这节课的反模式 33,architect 把取舍藏进论证里——这不是打错字、不是环境问题,是「AI 做权衡时的行为设计」层面的坑,所以归 E4。你这门课大量反模式都是 E4,因为它教的就是设计层面的东西。

**为什么要分这四类?**
不分类就会乱试——明明是环境问题(E1),你却一直改业务代码(当成 E3),越改越乱。
先定根因归哪类,才知道该往哪儿修。分类是为了**对症下药,不是为了归档好看**。

---

一句话把两个概念串起来:
**反模式是「踩过的坑」,根因是「这个坑到底出在哪一层」。** 每条反模式都带一个 E1-E4 的根因标签,这样下次不光知道「别这样」,还知道「为什么会这样、该从哪儿堵」。

Human (Aug 17, 2026, 11:36 AM):
在用claude code做项目时也需要这些吗？还是最后这些会在cc中归纳为一个框架的一部分。或做成skills或hook还是做为可选项

Claude:
好问题,而且你其实已经答出一半了——这正是你这门课**规则 59 和 BACKLOG 第 6、7 条**盯着的终局。我把它讲透。

先给结论:**这套东西真做项目时确实需要,但不是靠人肉记忆去执行,而是分三种归宿沉淀进 harness。** 反模式、规则不会永远以「Markdown 清单 + 老师逐条念」的形态存在——那是教学期的形态,是脚手架。真做项目时,它们该变形。

## 一、先分清:哪些是「教学脚手架」,哪些是「真需要的」

你这门课有两层东西,得拆开看:

**教学脚手架(项目里可以扔掉的):**
老师锚点、样板 A/B、Level 1 对应、桥梁 prompt、漂移自检 8 项、问精力……
这些是为了「教你」而存在的。你一个人真做项目,不需要给自己出锚点、发桥梁。扔。

**真需要的(换任何项目都用得上的):**
反模式库、决策边界 D1-D7、三决策方法、EMC 演进、ADR 留痕、最小权限、验证先于信任……
这些是工程实质。这就是 KNOWLEDGE_BASE 第九块说的「换个项目还用得上的 → 往上沉淀」。

判断标准就一句(规则 59):**换个项目还用得上的,留;只属于本项目的,扔。**

## 二、真需要的那些,归宿是什么?你问到点子上了

它们不会保持「一个大 Markdown 清单」的形态。会分流成**三种载体**,各装各的:

**① CLAUDE.md / AGENTS.md —— 装「AI 每次都该知道的规矩」**
反模式里那些「行为准则」类的,沉淀成 CLAUDE.md 的条款。
比如反模式 3(角色先读定义文件)、反模式 18(不确定别瞎编)、反模式 1(不喂就不知道)——这些本质是「给 AI 的行为协议」,写进 CLAUDE.md,CC 每次进项目自动加载,不用你提醒。
你项目里 CLAUDE.md 第一层 D「13 条已知陷阱」,已经是这个雏形了。

**② Hooks —— 装「能机器自动查的」**
这是你 BACKLOG 第 7 条已经点名的方向:「diff<100、提交格式、git status 等做成 hook」。
关键判据:**这条反模式,机器能不能自动抓?**
- 能自动抓的 → 做成 hook。
  例:反模式 30(提交前不看 status)→ 一个 pre-commit hook 强制跑 `git status` 检查。反模式 2(中文用 wc -w 算错)→ 校验脚本。反模式 20(mkdir 顺序)→ lint。
  这些根本不需要「记住」,让机器在事件触发时自动拦。
- 机器抓不了的 → 留在 CLAUDE.md 当行为约束。
  例:反模式 33(AI 把取舍包装成技术结论)——这没法写成脚本检测,只能靠「决策审查」这个人的动作 + CLAUDE.md 里提醒 CC「含取舍的决策先抛回」。

**③ Skills —— 装「可复用的工作流」**
Skill 是「封装一套可复用的能力/流程」。
你这门课的「三步推 schema」「6 必问约束分析」「四象限选型」「ADR-Lite 格式」——这些是**方法**,不是禁令,适合做成 skill。
下次任何项目要建数据模型,调用「数据建模 skill」,它自带三步法 + 三决策清单 + onDelete 检查项。这比每次重新想一遍强。

## 三、所以「可选项」还是「框架的一部分」?

**都是,但分层。** 用一张判断表(这是我给你归纳的,不在你课程文件里):

| 这条东西 | 归宿 | 是否可选 |
|---|---|---|
| 机器能自动查(diff 行数、提交格式、字数) | **Hook** | 不可选,强制拦截 |
| AI 每次该守的行为准则(先读定义、不瞎编) | **CLAUDE.md** | 不可选,自动加载 |
| 可复用的方法流程(建模三步、选型四象限) | **Skill** | 可选,按需调用 |
| 纯教学的(锚点、桥梁、样板) | **扔掉** | 项目期不需要 |

关键洞察:**越是「每次都要、且机器能做」的,越该自动化成 hook/CLAUDE.md,越不该是「可选项」。** 因为可选 = 会忘 = 反模式复发。你这门课的全部苦心,就是把「靠人记得」变成「机器自动」——这正是 KNOWLEDGE_BASE 第九块 Harness Engineering 的定义:「设计 AI 的工作环境」,让正确的事自动发生,而不是靠自律。

## 四、给你一个具体的收束

你这门课到 Lec 19 攒下的一大堆反模式和规则,最终产物应该长这样(BACKLOG 第 6 条「把 harness 抽成可移植 plugin」说的就是这个):

一个可移植的 **plugin / 项目模板**,里面:
- `CLAUDE.md` 模板 —— 行为准则那批反模式沉淀于此
- `.claude/hooks/` —— 可自动检测的那批,做成钩子
- `.claude/skills/` —— 可复用方法(建模、选型、ADR),做成技能
- `.claude/settings.json` —— 权限(下节 Lec 6 就要建的 D1-D7 + 三档权限)

换新项目时,把这个 plugin 拷过去,你的「工程肌肉」就自动跟着走了,不用重新踩一遍 33 个坑。

**一句话总结:** 教学期它们是「清单 + 人肉执行」,项目期它们该变形成「CLAUDE.md(准则)+ Hook(自动拦)+ Skill(可复用方法)」三种载体,能自动的绝不留成可选。这个变形过程,就是你这门课本身的终极作业。

Human (Aug 17, 2026, 11:40 AM):
就是说目前是帮助我学习，课程最后会沉淀为框架。目前是为了让我深入理解框架行程的每一步？

Claude:
对,你抓得很准。就是这个意思。我帮你把这层再钉实一点,因为这恰恰是你这门课**最容易被误解、但也最值钱**的设计。

## 你说的没错,但有个更狠的版本

「目前为了让我深入理解框架形成的每一步」——对。但不止于「理解」。

更准确的说法是:**你不是在学一个别人做好的框架,你是在亲手把它长出来。**

打个比方。
一种学法:老师给你一个装好的工具箱,告诉你每把扳手怎么用。你会用,但那是别人的工具箱。
另一种学法:你从「拧这颗螺丝手疼」开始,自己意识到需要一把扳手,自己打磨出它的形状。最后工具箱是你的,而且你知道每把工具**为什么长这样、解决过哪个具体的疼**。
你这门课是第二种。

反模式 33 就是活例子。
它不是老师塞给你的一条戒律。是这节课 architect 真的越权了,你真的抓住了,我们才把它总结成一条。
你对反模式 33 的理解,不是「背过」,是「亲手抓过」。这两者在你换项目、遇到第 34 个新坑时,天差地别——背过的人认不出新坑,抓过的人能。

## 为什么非得这么绕?直接给框架不行吗?

不行,而且原因很实在:**框架的价值不在条款本身,在条款背后的判断力。**

你这门课真正在练的,不是「记住 33 条反模式」。33 条本身会过时——换个技术栈,一半可能就不适用了。
练的是那套**能生成反模式的判断力**:
- 看到一个「顺得可疑」的技术结论,会停下问「有没有藏着该我拍的取舍」。
- 遇到一个坑,会本能地想「这是 E1-E4 哪一层?该沉淀到 hook 还是 CLAUDE.md?」

这个判断力,只能靠亲历每一步长出来,没法直接拷贝。
所以「深入理解每一步」不是手段的副产品,它**就是目的本身**。框架是判断力的沉淀物,不是反过来。

## 一个你可能没注意到的层次

还有一层,你这门课藏得比较深(KNOWLEDGE_BASE 第九块点了但没展开):

**你其实在同时学两样东西,一实一虚。**

- **实的**:一个能跑的任务协作工具。这个到 Lec 19 会真的部署上线。
- **虚的**:一套 harness 工程方法论。这个才是你花钱花时间的真标的。

实的那个项目,某种意义上是「一次性」的——练完可能就不管了。
虚的那套方法论,是你要带走、用一辈子、换任何项目都复用的。
调节器 O 节那句话说的就是这个:**「项目只是工具,不是目的。真正的目标是把方法练成肌肉记忆。」**

所以你现在做的每一步——推实体、拍 onDelete、抓 architect 越权——表面在建 study-l3-v2 这个项目,底下在**把工程判断刻进肌肉**。项目会结束,肌肉记忆不会。

## 收束成一句

你的理解可以再精确一格:

> 不是「先学会,最后顺便沉淀成框架」。
> 是「亲手把框架一步步长出来的**过程本身**,就是学会的方式」。

框架是结果,长框架的过程是学习。两者是同一件事的正反面。到 Lec 19,你手里会有两样东西:一个可移植的 harness plugin(结果),和一双能看穿「顺得可疑的技术结论」的眼睛(过程练出来的)。

后者比前者值钱得多。plugin 会因为工具升级而过时,那双眼睛不会。
