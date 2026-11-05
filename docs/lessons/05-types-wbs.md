# 补课 05-类型 交付物清单（WBS）

> 去留：一次性。整节课结课时，没做完的项转进 BACKLOG，再删本文件（删除走学生亲跑与 CONFIRM）。
> 用途：本节课要交的全部东西，照工作分解结构的 100% 规则拆到最小，一项不漏；每项写完成的定义与状态。报「做到哪、还剩多少」一律从本文件导出（规则 87）。
> 与 BACKLOG 的分工：BACKLOG 装跨课、本节课不做的事（规则 65）；本文件装本节课要交的全部东西，含已经做完的。本节决定不做的项，移进 BACKLOG 并在这里标「移出」。
> 状态五种：已完、进行中、待做、随做、移出。
> 覆盖核对：每次报进度前、每个窗口收尾时跑下面这条命令。没有输出，才算契约点名的每个 schema 都在本清单里；有输出，先补清单再报进度。主产物的规则文件是 docs/arch/SHARED_TYPES.md，下面第二条命令查它的全部标题；packages/shared/src/ 写起来后，再加一条查 schema 文件（规则 87）。
> 本窗口目标（第一窗口，桥梁 w1 第 5 节）：走完开课；architect 核对轮报出接缝；拍定落点、命名规则与版本；字段未决能拍多少拍多少。

```
awk '/^## 一、全局约定/,/^## 三、本节裁决汇总/' docs/arch/API_CONTRACT.md | /usr/bin/grep -oE '\b[A-Z][a-z]+([A-Z][a-z]+)+\b|\b(User|Project|Member|Task)\b' | sort -u | /usr/bin/grep -vE '^(AuthGuard|AuthzGuard|SameSite|HttpOnly)$' | while IFS= read -r n; do /usr/bin/grep -qF -- "$n" docs/lessons/05-types-wbs.md || echo "清单里缺：$n"; done
/usr/bin/grep -E "^#{2,3} " docs/arch/SHARED_TYPES.md | sed -E 's/^#+ //' | while IFS= read -r h; do /usr/bin/grep -qF -- "$h" docs/lessons/05-types-wbs.md || echo "清单里缺：$h"; done
```

## 一、共享 schema（契约点名的接缝）

出处：docs/arch/API_CONTRACT.md 第零节、第一节第 7 小节、第二节第 3 小节、「本节裁决汇总」；docs/arch/ARCHITECTURE.md 第二节「共享类型推导方式（取舍 4）」。契约第一、二节点名的 schema 共 19 个，这个数是开课时用上面的命令数的，architect 核对轮再核。

| 编号 | 交付件 | 完成的定义 | 状态 |
|---|---|---|---|
| S1 | 落点与产物形式 | schema 放哪、第 7 课建 packages/shared 之前以什么形式存在；architect 核对后学生拍（桥梁第 5 节） | 已完（问 739 A，TYPE-1） |
| S2 | 命名规则：写不写 Schema 后缀 | 拍定，19 个名字都照它（API-30） | 已完（问 740 A，TYPE-2） |
| S3 | Zod 版本 | 学生拍（D4）；docs/arch/TECH_STACK.md 写 Zod 的两行都没写版本 | 已完（问 741 A，TYPE-3） |
| S4 | 错误外壳：ProblemDetails、ValidationProblemDetails、ProblemType | 有字段，对得上 API-17、API-30 与第一节第 7 小节 | 待做 |
| S5 | auth：CreateUserRequest、CreateSessionRequest、User | 有字段，对得上第二节第 4 小节 | 待做 |
| S6 | projects：CreateProjectRequest、CreateMemberRequest、ReplaceProjectOwnerRequest、Project、Member、ListProjectsResponse、ListMembersResponse | 有字段，对得上第二节第 5 小节 | 待做 |
| S7 | tasks：CreateTaskRequest、UpdateTaskRequest、UpdateTaskStatusRequest、Task、ListTasksResponse、ProjectSummary | 有字段，对得上第二节第 6 小节 | 待做 |
| S8 | 一个资源按角色给不同形状怎么写 | 拍定写法（API-30 补充，问 629 A） | 进行中（进度表在待执行文件） |
| S9 | 负责人那份 Project 带什么、两份是否同形 | 拍定（API-34 补充） | 进行中（进度表在待执行文件） |
| S10 | 列表外壳里放数组的字段名 | 拍定（API-18） | 进行中（进度表在待执行文件） |
| S11 | 标题、描述、项目名称的最大长度 | 拍定（API-32） | 进行中（进度表在待执行文件） |
| S12 | 去掉首尾空白放哪一层 | 拍定，API-32 与 API-55 放同一层（BACKLOG 79） | 进行中（进度表在待执行文件） |
| S13 | 转让负责人请求体 | 字段是 userId，不包数组（API-57 修订推翻原文的数组写法） | 进行中（进度表在待执行文件） |
| S14 | 请求拒绝多余字段、响应容忍多余字段的写法 | 落到 schema 写法上（API-31） | 进行中（进度表在待执行文件） |
| S15 | 共享枚举：MemberRole、TaskStatus | 拍定写法，与 prisma/schema.prisma 的枚举对得上（docs/arch/TECH_STACK.md 共享类型包一条）；枚举名不在文件头命令的范围内，人工核 | 进行中（进度表在待执行文件） |
| S16 | 校验管道：自写还是官方内置 | 报学生裁。ARCHITECTURE 第二节写自写、不用内置 ValidationPipe（T1）；NestJS Pipes 页现在建议生产用内置 StandardSchemaValidationPipe，要哪个版本、接不接得住 API-31 未核 | 已完（问 744 B，TYPE-5） |
| S17 | 其余未决项 N1 到 N23 | 逐条拍，进度在 docs/arch/PENDING-TYPES-DRAFT.md（architect 核对轮新报，含 NotificationType 进不进共享层） | 进行中（进度表在待执行文件） |
| S18 | docs/arch/SHARED_TYPES.md：零、管辖范围；一、全局约定（1. 落点、2. 命名、3. 版本、4. 校验管道、5. 按角色不同的形状）；二、本节裁决汇总 | 规则与裁决都落进去，不写字段（问 743 B） | 进行中（已建，余下裁决随拍随加） |

## 二、schema 以外的本节交付

| 编号 | 交付件 | 完成的定义 | 状态 |
|---|---|---|---|
| B1 | 接缝清单给学生看 | 开课消息里列出（桥梁第 5 节第一步） | 已完 |
| B2 | 标准补登 | docs/arch/STANDARDS.md 加共享校验 schema 一行（检查单卡 1 第 2 条） | 已完（对照 1134，bc1f2a2） |
| B3 | 回写契约与架构 | 拍定的口径回写 API_CONTRACT、ARCHITECTURE、TECH_STACK，逐类扫传播面（规则 69） | 随做 |
| B4 | 项目宪法第二层 | 写代码时必须知道的结论摘进 CLAUDE.md（规则 64；规则 78 要「帮我改」） | 随做 |
| B5 | BACKLOG 79 关闭 | S12 拍定后 | 待做 |

## 三、每个窗口收尾

| 编号 | 交付件 | 完成的定义 | 状态 |
|---|---|---|---|
| W1 | 笔记补记 | 完整笔记末尾追加本窗口补记；速查卡一页，不追加（问 366 A、691 B） | 待做（本窗口收尾） |
| W2 | 目录树 | PROJECT_STRUCTURE 相关行与本窗口改动对得上 | 待做（本窗口收尾） |
| W3 | 桥梁 | 规则 82 九节，写明下个窗口的模型与 effort，指向清单，不另抄状态表 | 待做（本窗口收尾） |
| W4 | 删减清单 | 每份写为什么删、第二个家、谁还指着它；学生回 CONFIRM 后亲跑删除（问 473 A） | 待做（本窗口收尾） |
| W5 | 窗口回顾 | 收尾时答三问：哪里顺、哪里出错、改进项是什么；改进项当场登进清单第五节（问 494 A） | 待做（本窗口收尾） |
| W6 | 本窗口目标 | 开头在清单文件头写一句本窗口目标，收尾时对着它说达没达到（问 494 A） | 进行中（目标句已写） |

## 四、整节课结课（规则 54、规则 60，桥梁第 5 节）

| 编号 | 交付件 | 完成的定义 | 状态 |
|---|---|---|---|
| E1 | 执行开课体检时学生选的删并 | 逐条出对照，学生说「帮我改」才改；本节各次体检栏 6 逐条核 | 待做 |
| E2 | 新反模式入库 | 挂账里的候选逐条判，入库的判自检与 HARNESS | 待做 |
| E3 | 新规则入库 | 同上 | 待做 |
| E4 | 两份笔记定稿 | 完整笔记与速查卡，速查卡一页（规则 19，问 691 B） | 待做 |
| E5 | 目录树 | 排在所有文件落盘之后（规则 52） | 待做 |
| E6 | 送审 | 照 SESSION_START M 节；试行期第二节，必送，判丙正式定不定；带欠账 21 到 24、27 到 31，每条给欠账表那一行、决策记录原文、未审范围的 git diff；BACKLOG 70、50 原文；book/lec00.md 三处「从空白开始」一并报；git 管不到的三份比开课的 sha256（R1-705） | 待做 |
| E7 | 结课自检实跑 | 照规则 60「结课自检」一行逐项跑，问学生哪段太粗 | 待做 |
| E8 | 书章 | 照 book/OUTLINE.md 十节写，推 GitHub，学生读过认了（规则 54 第 3 项） | 待做 |
| E9 | 这节有哪些能删、有无新待办 | 规则 54 第 1 项之前那一问；规则 65 逐条问并梳理 BACKLOG | 待做 |
| E10 | 本课挂账（第五节各行） | 逐条处理或转 BACKLOG | 待做 |
| E11 | 删本节桥梁与本文件 | 学生亲跑、CONFIRM | 待做 |
| E12 | 结课桥梁 | 规则 82、规则 45 追加五项核对；第三节 W1 到 W6 写进结课桥梁第 5 节，下节清单照搬（G37，问 651 A） | 待做 |

## 五、推到结课的事（本课挂账）

| 编号 | 事 | 出处 | 状态 |
|---|---|---|---|
| 1 | 存量行号引用批量清：本节结课时清，还是留到 05-环境 结课或专开一轮，学生定。开课时又见一例：ARCHITECTURE 第二节出处写 TECH_STACK.md:15、:57，现在 Zod 在第 16 行、共享类型包在第 59 行 | BACKLOG 31 时间栏 | 待做 |
| 2 | 反模式候选（补案例）：42 号，写「三行」前用的 grep 把 packages/shared 也算进去，数错；40 号，列 schema 全集时漏了枚举，它们不在扫的那两节里 | R1-707，报告第一块、C8 | 待做 |
| 3 | 反模式候选（补案例）：46 号，清单改后行数的预期没用命令数（写 80，实际 81），计数和提交写在同一条命令里，没比预期就提交了 | R1-708 第二点 | 待做 |
