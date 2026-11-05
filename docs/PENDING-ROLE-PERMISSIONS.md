# 待执行：角色权限系统（设计稿，学生未定）

> 去留：一次性。定稿落进各正本（第七节）后删；删除走学生亲跑与 CONFIRM。
> 来历：学生 2026-11-05 在补课 05-类型 提出（DECISIONS-R1 R1-712）。HARNESS 第三节问题 14、15 早已挂着其中一半。
> 执行时机：随问 754。最晚第 10 课建第一个能写文件的角色之前。
> 执行铁律：本文件是设计稿，学生逐条定之前不生效。设置文件与钩子由学生亲写（规则 66）。正本只有一处，别处写指针（第七节）。
> 判断依据：第二节的原文；AGENT_SPEC 权限表、.claude/settings.json、.claude/agents/ 的现状（2026-11-05 打开核过）。执行前回核。

## 一、结论

权限要有一套系统，但不用新造。现在已有两根轴：D1 到 D8 管「什么决定要喊人」，settings.json 管「什么动作能做」。缺第三根：谁。同一个动作，架构师能不能做、后端能不能做，现在只有 AGENT_SPEC 一张粗表。

补这一根，做到五样：每个主体一行权限；放权走固定流程；改东西在隔离里；越权和出错有处理办法；做过的事查得到。

## 二、权威怎么说

通用访问控制的原则早有定案。AI 代理这一块还在演进，我没查到定案的标准。

- 最小权限，Saltzer 与 Schroeder：「Every program and every user of the system should operate using the least set of privileges necessary to complete the job.」NIST SP 800-53 AC-6：「Employ the principle of least privilege, allowing only authorized accesses for users」。
- 默认拒绝与每次都查，Saltzer：「Base access decisions on permission rather than exclusion.」「Every access to every object must be checked for authority.」
- 分权，Saltzer：「a protection mechanism that requires two keys to unlock it is more robust and flexible」。AC-5：「Separation of duties addresses the potential for abuse of authorized privileges」。
- 定期复查与留痕，AC-6(7)：「to validate the need for such privileges」。AC-6(9)：「Log the execution of privileged functions.」
- 审计记录要六样，AU-3：事件类型、时间、地点、来源、结果、涉及的身份。账本防改，AU-9：「Protect audit information and audit logging tools from unauthorized access, modification, and deletion; and」。
- 机制要小，Saltzer：「Keep the design as simple and small as possible.」审批要好用：「It is essential that the human interface be designed for ease of use」。
- AI 代理，OWASP LLM06:2025，根因三样：excessive functionality、excessive permissions、excessive autonomy。「Limit the extensions that LLM agents are allowed to call to only the minimum necessary.」「Implement authorization in downstream systems rather than relying on an LLM to decide if an action is allowed or not.」「Utilise human-in-the-loop control to require a human to approve high-impact actions before they are taken.」日志归在「will not prevent Excessive Agency, but can limit the level of damage caused」一类。
- Claude Code 官方：省略 tools 时「Inherits every tool available to subagents if omitted.」；isolation「Set to `worktree` to run the subagent in a temporary git worktree, giving it an isolated copy of the repository」；「Rules are evaluated in order: deny, then ask, then allow.」；钩子「the input carries the `agent_id` and `agent_type` common input fields that identify the subagent.」；「The sandbox covers shell commands only.」；「Note that using WebFetch alone doesn't prevent network access.」
- 主流文章，不是标准，Willison「lethal trifecta」：「Access to your private data」「Exposure to untrusted content」「The ability to externally communicate in a way that could be used to steal your data」，三样齐了最危险。
- 借鉴非 AI 的成熟做法（主流，不是 AI 专用标准；HARNESS 原则 23）：权限挂在角色上，NIST RBAC「Each user is assigned one or more roles, and each role is assigned one or more privileges」（该项目 NIST 已标不再维护）。放权有上限，AWS IAM「A permissions boundary is an advanced feature for using a managed policy to set the maximum permissions」「it limits the user's permissions but does not provide permissions on its own.」，还能用来委派放权。不能给出自己没有的，Kubernetes RBAC 防提权（工具摘要，未逐字核）。指定文件归谁审，GitHub「Code owners are automatically requested for review when someone opens a pull request that modifies code that they own.」

## 三、学生问的，逐条答

1. 必须由架构师读时要放权吗？先分开「读」和「取」。读是他的专业，取只是跑腿。他有 Read，主对话把网页和包取成文件，他就能读，不用放权。他不知道该查什么，就让他先列要核的清单，主对话取料，他再读。这样还不够用，才给工具：只给网页，限域名，不给 Bash。
2. 其它角色放不放？放，按「这件活需要什么」放，不按「他专业」放。专业说明他的判断可信，不说明他该有更大的手。见第四节。
3. 谁来控制？主人批，人亲写（规则 66、HARNESS 原则 10）。四件事分开：要权限的、批的、做的、查账的。
4. 隔离区要不要？要，四层，从轻到重：tools 字段（他根本没这个工具）；路径钩子（第 8 课，PreToolUse 能挡）；隔离副本（isolation: worktree，主人审过才合回，第 13 课）；沙箱（系统级，只管 shell）。
5. 学生没想到的：
   - 读也是权力。读进来的网页可能夹指令（HARNESS 问题 15）。读外部内容的角色，不该同时能写、能往外发。
   - 串权。角色默认能再派角色（官方页摘要，未逐字核），低权角色可能借高权角色的手。tools 里不写 Agent。
   - 漏写等于全给。省略 tools 就继承全部。新角色必须写死。
   - 绕墙。挡了 WebFetch，Bash 还能联网。权限规则挡工具，不挡子进程（BACKLOG 10）。
   - 权限会过期。临时放的要收回，定期复查。
   - 审批疲劳。弹窗多了就都点同意，等于没有（HARNESS 原则 8）。能用隔离副本，就少弹窗。
   - 墙要测。写了不等于查了（35 号，规则 66 追加）。
   - 紧急放开。要有时限，事后记账。
   - 两种权限别混。D3 管产品里的负责人与执行者，这里管 AI 角色。

## 四、权限表（草案）

| 主体 | 工具 | 能碰 | 影响范围 | 何时 |
|---|---|---|---|---|
| 主人 | 全部 | 全部；设置与钩子亲写 | 全部 | 现在 |
| 主对话 | 读写、命令 | 按 settings.json；改已有文件走对照 | 全项目，靠 git 可撤 | 现在 |
| client、persona、pm、designer、architect | Read | 全项目只读，产出交主对话落盘 | 只影响报告 | 现在 |
| librarian | Read、Grep、Glob、Bash | 只读；靠行为约束加指纹，钩子能焊死 | 只影响报告 | 现在 |
| backend | Read、Write、Edit，跑测试要 Bash | 后端目录与测试；prisma/ 只读，改表先回 architect | 后端代码 | 第 10 课 |
| frontend | 同上 | 前端目录 | 前端代码 | 第 11 课 |
| reviewer | Read | 只审不改 | 只影响报告 | 第 12 课 |
| tester | Read、Write、Edit、Bash | 测试目录，不改业务实现 | 测试代码 | 第 14 课 |
| devops | 同上 | 部署文件；生产操作双确认 | 生产环境，最大 | 第 15 课 |

目录名第 7 课定。路径范围 tools 字段写不了，要钩子或隔离副本。

## 五、放权、越权、出错

放权流程：角色报「我的工具做不了」，不自己绕；先问能不能给料不给工具；写明谁、要什么、范围、多久、为什么；主人批；人亲写；验证生效（规则 66 追加）；用完收回；记决策记录。

越权分三种。被墙挡下：机制在工作，记一笔，不算事故。想绕：换工具办同一件事，停下报，按越权算。穿透：真改了不该改的，先回滚，再 5 Why 定根因（E1 到 E4），补墙，进反模式。

授权内出错。授权不免检，回报照旧核（检查单卡 3），机器验。怎么补看两把尺：能不能撤销、影响多大。可撤的回滚重做，不可撤的走 D5。批的人管范围对不对，做的人管事做没做对。同一类错两次，收权或加墙。

## 六、追踪

现有三处：子代理记录，每次调用都在，只在本机，不进仓库；git，改了什么，不分哪个角色；决策记录，谁批的，靠手写。

缺一条统一流水。第 8 课加 PostToolUse 钩子，一次调用写一行：谁（agent_type）、什么工具、碰了什么、何时、成没成。放在角色写不到的地方（AU-9）。提交信息写明哪个角色产出，现在就能做。

## 七、落点与去重

| 内容 | 正本 | 别处 |
|---|---|---|
| 权限表、放权流程 | AGENT_SPEC 权限表（问 755 A） | 知识库第三块开头那句现在抄了权限表，改指针 |
| 框架原则 | HARNESS 第四节，按规则 77 判，并答第三节问题 14、15 | 不抄 |
| 标准 | docs/arch/STANDARDS.md「AI 代理的权限与人工审批」一行扩写，不新开 | 只写指针 |
| 机制（tools、worktree、钩子） | book/appendix-a.md | 第 8、13 课章实操 |
| 这个问题怎么来、怎么解 | book/appendix-h.md 新案例（问 515 A） | 第 6 章加一节「第三根轴」 |
| 课程规则 | 不新开（试行期条件：规则总数不涨） | 规则 31、58 已指向 AGENT_SPEC |
| 反模式 | 不新开，39 号补案例：它没想到的标不了 | 无 |

重复怎么处理：一处正本（原则 1）；指针按用途选两种写法（规则 74 追加）；入库前逐条对已有的（规则 77 判据三）；删前核第二个家（规则 75）；资料管理员每次体检查重复。

谁能放权（问 756 A）：一张封闭清单，由学生定，CC 不能扩；清单外一律喊学生。「核心不核心」由清单定，不由 CC 当场判断。
绿档，CC 自批，事后记一笔：把文件取来放到角色能读的地方；派单里指定只读角色读哪些文件；让子代理在隔离副本跑；收回或收窄权限。共同点：不让任何角色多一种能力。
黄档，学生一句话批，CC 走对照改：给角色加工具（如 architect 限域名的 WebFetch）；建新角色（规则 31）。
红档，学生批并亲写：settings.json 与钩子（规则 66）；给文档类角色 Bash；让角色执行不可逆操作，走 D5 双确认。
硬规则：CC 不能批给自己；放出去的不超过清单；每次自批进决策记录；每节结课学生看一次账。现在这些靠 CC 自觉，第 8 课钩子能焊一部分。
这三档只管给角色放权。主人与主对话也在第四节的表里，因为要答「谁有什么权」；主对话自己的权限不走放权，由 settings.json 与 D1 到 D8 管。

## 八、不做什么

不建权限服务，不上角色管理系统。这是单人项目，机制要小。一张表，加现成的 tools、钩子、worktree 就够。

## 九、未核

- NIST SP 800-53 取自 csf.tools 镜像，没对 NIST 原站。
- OWASP Top 10 for Agentic Applications 2026：官网只给下载，没读原文。「least agency」、ASI03 只见二手文章。
- NIST NCCoE 2026-02 概念稿：只见搜索摘要，它本身还在问代理的最小权限怎么定。
- 官方页有截断。角色默认能再派角色、Agent(名字) 规则来自摘要。按角色限网页域名要不要靠钩子，没核。
- 主对话把文件放到临时目录，角色的 Read 会不会弹窗，没实测。
