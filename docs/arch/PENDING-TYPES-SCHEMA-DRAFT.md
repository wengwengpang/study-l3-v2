# 待执行：共享 schema 起草稿（补课 05-类型 第一窗口）

> 去留：一次性。schema 落进 packages/shared/src/、学生认过后删；删除走学生亲跑与 CONFIRM。
> 执行时机：先拍下面进度表的待拍项，再把报告第二块的六个文件落盘，一组一提交。回写清单在 docs/arch/PENDING-TYPES-DRAFT.md。
> 执行铁律：
> - 下面的报告原样存档，一字不改；要改的写进对照，不改这里。
> - 报告里的行号是 2026-11-05 写报告那天的；落前一律按内容重核。
> - 落盘前后都实跑：tsc --strict 两种模块解析，加全部样例。临时目录没了，照下面「实跑脚本」重建，装 zod@4.6.7 与 typescript，不进仓库。
> - C10 不成立：TECH_STACK 已写版本（对照 1140），architect 没读它（DECISIONS-R1 R1-718）。C12 是清单漏项，走对照改，不出题。N35 命令已判，不出题。
> 验证命令（全部落完后跑）：进度表里「待拍」0 次；packages/shared/src/ 与定稿逐字节相同；两种模块解析都过；样例不符 0 条；交付物清单开头的覆盖核对没有输出。
> 实跑结果（2026-11-05，Zod 4.6.7、tsc 7.0.2，按报告原稿）：nodenext、bundler 都过；样例 206 条不符 0 条；反向核对，故意改坏并集顺序、trim 顺序、去掉 strict、枚举改小写，样例都报错；Z1 到 Z10 都成立。
> 判断依据（规则 70 再追加）：报告依据提交 fd5d96e 时的七份文件。执行前回核这几份此后有没有改。
>
> 进度（按报告第四块计数，共 16 条）：

| 编号 | 题目 | 状态 |
|---|---|---|
| N24 | 文件怎么分 | 待拍 |
| N25 | 多余查询参数怎么逐项列 | 待拍 |
| N26 | ProblemType 性质名的写法（连 C13） | 待拍 |
| N27 | Project 的「我的角色」 | 待拍 |
| N28 | 「可能卡住」 | 待拍 |
| N29 | 汇总的四个字段 | 待拍 |
| N30 | 登录邮箱的规则 | 待拍 |
| N31 | 用户 id 的范围 | 待拍 |
| N32 | 响应字段的松紧 | 待拍 |
| N33 | ValidationProblemDetails 收不收窄 | 待拍 |
| N34 | 内部形状给不给前端用 | 待拍 |
| N35 | 相对导入写不写 .js | 已判：写（两种模块解析实跑都过） |
| C10 | Zod 精确版本的指针 | 不成立 |
| C11 | 邮箱上限的单位 | 待拍 |
| C12 | H34 的范围 | 走对照改 |
| C13 | 枚举大写的范围 | 随 N26 |

## 实跑脚本

拆稿：从报告拆出 .ts 与样例，存成 src/*.ts 与 samples.json，正则见报告第二、五块的标题写法。跑样例：编译到 dist 后，用下面这个脚本。

```js
// 跑 architect 给的样例。用法：node run_samples.mjs <编译产物目录> <samples.json> <zod 所在目录>
import { readFileSync } from 'node:fs';
import { pathToFileURL } from 'node:url';
import { isDeepStrictEqual } from 'node:util';
const [dist, samplesPath, labDir] = process.argv.slice(2);
const mods = {};
for (const f of ['enums', 'fields', 'problem', 'auth', 'project', 'task']) {
  Object.assign(mods, await import(pathToFileURL(`${dist}/${f}.js`).href));
}
const expand = (v) => {
  if (Array.isArray(v)) return v.map(expand);
  if (v && typeof v === 'object') {
    if (Array.isArray(v.$repeat)) return String(v.$repeat[0]).repeat(v.$repeat[1]);
    if (Array.isArray(v.$concat)) return v.$concat.map(expand).join('');
    return Object.fromEntries(Object.entries(v).map(([k, x]) => [k, expand(x)]));
  }
  return v;
};
const short = (x) => { const s = JSON.stringify(x); return s.length > 120 ? s.slice(0, 117) + '...' : s; };
const samples = JSON.parse(readFileSync(samplesPath, 'utf8'));
let total = 0, bad = 0;
for (const [name, g] of Object.entries(samples)) {
  const s = mods[name];
  if (!s) { console.log('缺 schema', name); bad++; continue; }
  for (const raw of g.pass ?? []) { total++; const r = s.safeParse(expand(raw)); if (!r.success) { bad++; console.log('该过没过', name, short(raw), JSON.stringify(r.error.issues.map((i) => i.code))); } }
  for (const raw of g.fail ?? []) { total++; const r = s.safeParse(expand(raw)); if (r.success) { bad++; console.log('该拒没拒', name, short(raw)); } }
  for (const o of g.output ?? []) { total++; const r = s.safeParse(expand(o.input)); if (!r.success) { bad++; console.log('输出样例没过', name, short(o.input)); } else if (!isDeepStrictEqual(r.data, expand(o.expected))) { bad++; console.log('输出不等', name, short(r.data), '期望', short(o.expected)); } }
}
console.log(`样例共 ${total} 条，不符 ${bad} 条`);

// 名字核对：契约 19 个加枚举加内部形状
const want = ['ProblemDetails','ValidationProblemDetails','ProblemType','CreateUserRequest','CreateSessionRequest','User','CreateProjectRequest','CreateMemberRequest','ReplaceProjectOwnerRequest','Project','Member','ListProjectsResponse','ListMembersResponse','CreateTaskRequest','UpdateTaskRequest','UpdateTaskStatusRequest','Task','ListTasksResponse','ProjectSummary','MemberRole','TaskStatus','OwnerTask','ExecutorTask'];
console.log('缺的名字', want.filter((n) => !mods[n]).join(',') || '无', '；多的导出', Object.keys(mods).filter((n) => !want.includes(n)).join(',') || '无');
console.log('NotificationType 进了没', !!mods.NotificationType);

// 请求 strict、响应默认：请求全部拒多余键，响应全部丢多余键
const reqs = { CreateUserRequest: { email: 'a@b.co', password: 'a'.repeat(15) }, CreateSessionRequest: { email: 'a', password: 'x' }, CreateProjectRequest: { name: 'a' }, CreateMemberRequest: { email: 'a@b.co' }, ReplaceProjectOwnerRequest: { userId: 1 }, CreateTaskRequest: { title: 't', description: 'd' }, UpdateTaskRequest: {}, UpdateTaskStatusRequest: { status: 'COMPLETED' } };
for (const [n, v] of Object.entries(reqs)) { const ok = mods[n].safeParse(v).success; const strict = !mods[n].safeParse({ ...v, zzz: 1 }).success; if (!ok || !strict) console.log('请求不对', n, 'ok', ok, 'strict', strict); }
console.log('请求 strict 核完');

// 执行者形状挡专属项；并集保留
const row = { id: 1, title: 't', description: 'd', status: 'COMPLETED', assignee: null, dueDate: null, possiblyStuck: true };
console.log('过 ExecutorTask 有没有 possiblyStuck', 'possiblyStuck' in mods.ExecutorTask.parse(row));
console.log('过 Task 有没有 possiblyStuck', 'possiblyStuck' in mods.Task.parse(row));

// Z 项里样例没直接覆盖的
const { z } = await import(pathToFileURL(`${labDir}/node_modules/zod/index.js`).href);
const ok = (s, v) => s.safeParse(v).success;
console.log('Z2 int32 2147483647', ok(z.int32(), 2147483647), '2147483648', ok(z.int32(), 2147483648));
console.log('Z3 int32.positive 0', ok(z.int32().positive(), 0), '1', ok(z.int32().positive(), 1), 'int.min(0) -1', ok(z.int().min(0), -1));
console.log('Z4 iso.date 2024-02-29', ok(z.iso.date(), '2024-02-29'), '2025-02-29', ok(z.iso.date(), '2025-02-29'), '带时刻', ok(z.iso.date(), '2026-12-31T00:00:00Z'), '输出类型', typeof z.iso.date().parse('2024-02-29'));
console.log('Z5 regex 接在 trim、max 后', z.string().trim().max(254).regex(z.regexes.unicodeEmail).parse('  a@b.co  '));
const local65 = 'a'.repeat(65) + '@b.co'; const dom = 'a@' + 'b'.repeat(256);
console.log('Z5 预设 本地 65', ok(z.string().regex(z.regexes.unicodeEmail), local65), '域名 256', ok(z.string().regex(z.regexes.unicodeEmail), dom));
const base = z.object({ status: z.int() }); const ext = base.extend({ status: z.literal(400) });
console.log('Z6 extend 覆盖 status 400', ok(ext, { status: 400 }), '404', ok(ext, { status: 404 }), '丢多余', JSON.stringify(ext.parse({ status: 400, x: 1 })));
console.log('Z8 nullable.optional 缺键', ok(z.object({ a: z.int().nullable().optional() }), {}), 'null', ok(z.object({ a: z.int().nullable().optional() }), { a: null }));
console.log('Z10 array.min(1) 空', ok(z.array(z.int()).min(1), []));
```

## 甲、起草轮报告（原样存档，一字不改）

# 05-类型 起草轮报告

**本轮动作**
- 共 9 次 Read：定义文件 1 次，七份 7 次，契约截断后续读 1 次，读到第 795 行文件末尾。
- 只读，没改文件，没派子代理。我只有 Read 工具，没跑任何命令。下面的稿子全部是「已写，待验证」。
- Read 按整份读，第 3、4 份读到了点名之外。我引用了 `docs/arch/ARCHITECTURE.md:63`、`:352`、`:409` 和 PENDING 第四块。
- 路径相对项目根 `/home/michael/projects/study-l3-v2`。
- 约束沿用 `docs/arch/PENDING-TYPES-DRAFT.md:308-313`，这轮没有新增。
- 先指出：新发现 4 处文档对不上（C10 到 C13），都不挡写稿，详情在第四块。

---

## 一、枚举确认

**结论：可以。** 下面逐条查过，没有挡路的。

| 新值 | 现值 | 位置 | 挡路的 |
|---|---|---|---|
| OWNER | owner | `prisma/schema.prisma:11` | 没有 |
| EXECUTOR | executor | `prisma/schema.prisma:12` | 没有 |
| NOT_STARTED | not_started | `prisma/schema.prisma:16`；默认值 `:87` | 没有 |
| IN_PROGRESS | in_progress | `prisma/schema.prisma:17` | 没有 |
| COMPLETED | completed | `prisma/schema.prisma:18` | 没有 |
| STUCK_TASK | stuck_task | `prisma/schema.prisma:22` | 没有；只改 Prisma，不进共享层（`docs/arch/SHARED_TYPES.md:87`） |

可能挡路的事，逐条看：
1. **数据：** 库没建，没数据要迁（`docs/arch/SHARED_TYPES.md:120`）。我没看 prisma/ 下有没有迁移目录，主对话 `ls prisma/` 确认一下。
2. **Prisma 语法：** 枚举值允许大写标识符。这条凭记忆，未核；版本也没锁（`docs/arch/SHARED_TYPES.md:57`）。
3. **部分唯一索引（ADR-DB-006）：** 它不在 schema.prisma 里，写法在 DECISIONS，我没读。谓词若写了 `'owner'`，要跟着改成 `'OWNER'`。PostgreSQL 枚举标签区分大小写（凭记忆，未核）。这一处 H34 没列。
4. **命名分层：** `docs/arch/ARCHITECTURE.md:244` 只管列名，不管枚举值，不挡。改完也更合 `:246` 的全链路不转换。
5. **@map：** `docs/arch/SHARED_TYPES.md:120` 写数据库枚举一起改，所以不加 @map。
6. **路径：** `/owner`（`docs/arch/API_CONTRACT.md:424`）是路径段，不是枚举值，不改。
7. **偏离：** 选 C 后不用登偏离。

要改的每一处：
- `prisma/schema.prisma:11`、`:12`、`:16`、`:17`、`:18`、`:22`、`:87`
- `docs/arch/ARCHITECTURE.md:409`（H34 已列）
- `docs/arch/ARCHITECTURE.md:63`（H34 没列，见 C12）
- `docs/arch/DECISIONS.md:67`。这是转引 `docs/arch/PENDING-TYPES-DRAFT.md:543`，我没读，按内容重核。
- `docs/arch/DECISIONS.md` 的 ADR-DB-006。我没读，按内容核；含小写字面值就改。H34 没列。
- `CLAUDE.md` 第二层 E「枚举：」一行。这份我没按文件读，行号未取。规则 78 要「帮我改」（`docs/arch/PENDING-TYPES-DRAFT.md:96`）。
- `book/lec05.md`：引文不动，补一句（H35，`docs/arch/PENDING-TYPES-DRAFT.md:97`）。我没读。

七份之外我说不了「别处没有」。落前请主对话在 `docs/arch/` 和 `book/` 按原字面值搜一遍。`docs/arch/PENDING-TYPES-DRAFT.md` 的存档照规矩不改。

---

## 二、schema 正文

文件划分待 N24 确认，稿子先按推荐写。

| 文件 | 契约名字 | 其他 |
|---|---|---|
| enums.ts | 无 | MemberRole、TaskStatus |
| fields.ts | 无 | 内部片段 idField、emailField |
| problem.ts | 3 个 | |
| auth.ts | 3 个 | |
| project.ts | 7 个 | |
| task.ts | 6 个 | 内部形状 OwnerTask、ExecutorTask |

合计 19 个契约名字，加 2 个枚举、2 份内部形状。NotificationType 不进。没写 index.ts，它属包壳，留第 7 课（`docs/arch/SHARED_TYPES.md:23`）。

**用到的标准**

| 用到处 | 适用哪条 | 出处 | 档次 |
|---|---|---|---|
| ProblemDetails 成员 | RFC 9457；Zalando #176、#177 | `docs/arch/STANDARDS.md:24`；`docs/arch/API_CONTRACT.md:572` | 必须 |
| about:blank | RFC 9457 第 4.2.1 节 | `docs/arch/STANDARDS.md:24`；`docs/arch/API_CONTRACT.md:733` | 必须 |
| ProblemType 的 urn | RFC 8141；偏离待 H27 | `docs/arch/SHARED_TYPES.md:100` | 偏离，已拍 |
| errors 每项形状 | RFC 9457 第 3 节例子 | `docs/arch/SHARED_TYPES.md:102` | 可选（例子，不是规定） |
| instance 只定字符串 | RFC 9562；API-51 第一点 | `docs/arch/STANDARDS.md:25`；`docs/arch/API_CONTRACT.md:750` | 建议 |
| 请求拒多余字段 | OWASP Mass Assignment；Zalando #109 | `docs/arch/STANDARDS.md:29`；`docs/arch/API_CONTRACT.md:650-651` | 必须 |
| 响应容忍多余字段 | Zalando #108 | `docs/arch/API_CONTRACT.md:651` | 必须（沿用核对报告，我没单独核） |
| 字符串长度范围 | Zalando #109 | `docs/arch/API_CONTRACT.md:656` | 建议 |
| 先 trim 再校验 | OWASP Input Validation | `docs/arch/STANDARDS.md:40` | 建议 |
| 没传与 null | RFC 7396；Zalando #123 | `docs/arch/STANDARDS.md:28` | 必须 |
| 截止日期写法 | RFC 3339；Zalando #169、#238 | `docs/arch/STANDARDS.md:31`；`docs/arch/API_CONTRACT.md:708` | 必须 |
| 顶层用对象 | Zalando #167、#110 | `docs/arch/STANDARDS.md:26` | 必须 |
| items | Zalando #241、AIP-132 的例子 | `docs/arch/SHARED_TYPES.md:112` | 可选（依据不硬，已拍） |
| 按角色分形状 | OWASP Authorization 最小权限 | `docs/arch/STANDARDS.md:27` | 必须 |
| 密码下限与组成 | OWASP Authentication | `docs/arch/STANDARDS.md:38`；`docs/design/PRD.md:306` | 必须 |
| 密码上限、码点 | NIST SP 800-63B（SHOULD、SHALL）。未登记，H19 待做，原文见 `docs/arch/SHARED_TYPES.md:81`，我没另核 | `docs/arch/SHARED_TYPES.md:81` | 上限建议，码点必须 |
| 邮箱比较 | OWASP Email Validation | `docs/arch/STANDARDS.md:37` | 必须（只管比较，schema 不做） |
| 邮箱语法用库 | `docs/arch/SHARED_TYPES.md:108` 引的 OWASP 那句，页名没写，登记表没登这句 | `docs/arch/SHARED_TYPES.md:108` | 建议，未核 |
| 邮箱上限 254 | RFC 5321，推算。未登记，未核 | `docs/arch/SHARED_TYPES.md:108` | 建议 |
| 枚举值大写蛇形 | Zalando #240。主参考已登记，这一条没单列 | `docs/arch/STANDARDS.md:17`；`docs/arch/SHARED_TYPES.md:120` | 建议（档次凭记忆，未核） |
| 名字 | NestJS CRUD 生成器、AIP-133、AIP-132 | `docs/arch/STANDARDS.md:39` | 建议 |
| 查询参数项 parameter | JSON:API 的 source.parameter。我新引，凭记忆，未登记，未核 | 无 | 可选 |

**packages/shared/src/enums.ts**

```ts
import { z } from "zod";

// TYPE-19；ARCHITECTURE 第二节「共享层边界」
export const MemberRole = z.enum(["OWNER", "EXECUTOR"]);
export type MemberRole = z.infer<typeof MemberRole>;

// TYPE-19；PRD 审定决策 D12
export const TaskStatus = z.enum(["NOT_STARTED", "IN_PROGRESS", "COMPLETED"]);
export type TaskStatus = z.infer<typeof TaskStatus>;
```

**packages/shared/src/fields.ts**

```ts
import { z } from "zod";

// 内部片段，不是契约名字（TYPE-18）；列是 32 位 Int，超范围挡在 400，待确认（假设）
export const idField = z.int32().positive();

// TYPE-17：先 trim，再判长度与格式，预设 unicodeEmail，上限 254
export const emailField = z.string().trim().max(254).regex(z.regexes.unicodeEmail);
```

**packages/shared/src/problem.ts**

```ts
import { z } from "zod";

// TYPE-16、API-24、API-47：12 个 urn 加 about:blank；性质名的写法与词待确认（假设）
export const ProblemType = z.enum([
  "about:blank",
  "urn:study-l3-v2:problem:unauthenticated",
  "urn:study-l3-v2:problem:not-found",
  "urn:study-l3-v2:problem:forbidden",
  "urn:study-l3-v2:problem:csrf-rejected",
  "urn:study-l3-v2:problem:invalid-request",
  "urn:study-l3-v2:problem:conflict",
  "urn:study-l3-v2:problem:unsupported-media-type",
  "urn:study-l3-v2:problem:internal-error",
  "urn:study-l3-v2:problem:email-already-used",
  "urn:study-l3-v2:problem:invitee-not-registered",
  "urn:study-l3-v2:problem:already-member",
  "urn:study-l3-v2:problem:sole-owner-removal",
]);
export type ProblemType = z.infer<typeof ProblemType>;

// TYPE-16（type、title、status、instance 必填，detail 可省）；API-17；API-51 第一点
export const ProblemDetails = z.object({
  type: ProblemType,
  title: z.string(),
  status: z.int(),
  detail: z.string().optional(),
  instance: z.string(),
});
export type ProblemDetails = z.infer<typeof ProblemDetails>;

// TYPE-16（errors、detail、pointer）；API-31；API-56；查询参数项与收窄待确认（假设）
export const ValidationProblemDetails = ProblemDetails.extend({
  status: z.literal(400),
  errors: z
    .array(
      z.union([
        z.object({ detail: z.string(), pointer: z.string() }),
        z.object({ detail: z.string(), parameter: z.string() }),
      ]),
    )
    .min(1),
});
export type ValidationProblemDetails = z.infer<typeof ValidationProblemDetails>;
```

**packages/shared/src/auth.ts**

```ts
import { z } from "zod";
import { emailField, idField } from "./fields.js";

// API-34、API-53（三处同形）；TYPE-9（没声明的字段丢掉）
export const User = z.object({
  id: idField,
  email: z.string(),
});
export type User = z.infer<typeof User>;

// TYPE-10、TYPE-17；PRD 审定决策 D20；API-32 补充（密码不 trim）
export const CreateUserRequest = z.strictObject({
  email: emailField,
  password: z.string().min(15).max(64),
});
export type CreateUserRequest = z.infer<typeof CreateUserRequest>;

// TYPE-14（不套注册规则，空值回 400）；邮箱上限 254、不校格式待确认（假设）
export const CreateSessionRequest = z.strictObject({
  email: z.string().trim().min(1).max(254),
  password: z.string().min(1).max(64),
});
export type CreateSessionRequest = z.infer<typeof CreateSessionRequest>;
```

**packages/shared/src/project.ts**

```ts
import { z } from "zod";
import { MemberRole } from "./enums.js";
import { emailField, idField } from "./fields.js";

// TYPE-17（项目名上限 100，假设值）；API-32
export const CreateProjectRequest = z.strictObject({
  name: z.string().trim().min(1).max(100),
});
export type CreateProjectRequest = z.infer<typeof CreateProjectRequest>;

// TYPE-6、TYPE-7（两种角色同形）；API-34
export const Project = z.object({
  id: idField,
  name: z.string(),
  role: MemberRole,
});
export type Project = z.infer<typeof Project>;

// TYPE-18（items）；API-18；API-30 补充
export const ListProjectsResponse = z.object({
  items: z.array(Project),
});
export type ListProjectsResponse = z.infer<typeof ListProjectsResponse>;

// TYPE-17；PRD 审定决策 D5、D10（不带角色）
export const CreateMemberRequest = z.strictObject({
  email: emailField,
});
export type CreateMemberRequest = z.infer<typeof CreateMemberRequest>;

// API-59（用户 id）；TYPE-11、TYPE-15；PRD 澄清注记 4（显示邮箱）
export const Member = z.object({
  userId: idField,
  email: z.string(),
  role: MemberRole,
});
export type Member = z.infer<typeof Member>;

// TYPE-18（items）；API-18；API-59
export const ListMembersResponse = z.object({
  items: z.array(Member),
});
export type ListMembersResponse = z.infer<typeof ListMembersResponse>;

// API-36、API-57 修订（userId，不包数组）
export const ReplaceProjectOwnerRequest = z.strictObject({
  userId: idField,
});
export type ReplaceProjectOwnerRequest = z.infer<typeof ReplaceProjectOwnerRequest>;
```

**packages/shared/src/task.ts**

```ts
import { z } from "zod";
import { TaskStatus } from "./enums.js";
import { idField } from "./fields.js";

// 文件内片段，不导出：TYPE-17（先 trim 再判长度，上限是假设值）
const titleField = z.string().trim().min(1).max(200);
const descriptionField = z.string().trim().min(1).max(5000);
// 文件内片段，不导出：TYPE-17（只校合法日期，不限过去）；API-41
const dueDateField = z.iso.date();

// API-54（没传与 null 同义）；API-31、决策 D（项目只从路径取）
export const CreateTaskRequest = z.strictObject({
  title: titleField,
  description: descriptionField,
  assigneeUserId: idField.nullable().optional(),
  dueDate: dueDateField.nullable().optional(),
});
export type CreateTaskRequest = z.infer<typeof CreateTaskRequest>;

// API-33、API-35（没传不改，null 清空，不收状态）；TYPE-17（空对象回 200）
export const UpdateTaskRequest = z.strictObject({
  title: titleField.optional(),
  description: descriptionField.optional(),
  assigneeUserId: idField.nullable().optional(),
  dueDate: dueDateField.nullable().optional(),
});
export type UpdateTaskRequest = z.infer<typeof UpdateTaskRequest>;

// API-35；TYPE-17（必须带状态）
export const UpdateTaskStatusRequest = z.strictObject({
  status: TaskStatus,
});
export type UpdateTaskStatusRequest = z.infer<typeof UpdateTaskStatusRequest>;

// 内部形状（TYPE-8，不进契约）；TYPE-11；TYPE-18（任务负责人是子对象，未分配为 null）
export const ExecutorTask = z.object({
  id: idField,
  title: z.string(),
  description: z.string(),
  status: TaskStatus,
  assignee: z.object({ id: idField, email: z.string() }).nullable(),
  dueDate: dueDateField.nullable(),
});
export type ExecutorTask = z.infer<typeof ExecutorTask>;

// 内部形状（TYPE-8，不进契约）；API-43；PRD 审定决策 D13
export const OwnerTask = ExecutorTask.extend({
  possiblyStuck: z.boolean(),
});
export type OwnerTask = z.infer<typeof OwnerTask>;

// TYPE-8（负责人形状排在前面）；API-30 补充
export const Task = z.union([OwnerTask, ExecutorTask]);
export type Task = z.infer<typeof Task>;

// TYPE-18（items）；API-18；API-43
export const ListTasksResponse = z.object({
  items: z.array(Task),
});
export type ListTasksResponse = z.infer<typeof ListTasksResponse>;

// API-42 补充（四个数，不带完成率）；US-04
export const ProjectSummary = z.object({
  total: z.int().min(0),
  completed: z.int().min(0),
  inProgress: z.int().min(0),
  notStarted: z.int().min(0),
});
export type ProjectSummary = z.infer<typeof ProjectSummary>;
```

---

## 三、字段名清单

文档已写死、不用再定的：
- ProblemDetails 的 type、title、status、detail、instance（`docs/arch/API_CONTRACT.md:241-245`）
- errors、detail、pointer（`docs/arch/SHARED_TYPES.md:102`）
- ReplaceProjectOwnerRequest.userId（`docs/arch/API_CONTRACT.md:780`）
- 三个 List 的 items（`docs/arch/SHARED_TYPES.md:112`）

下面都是我起的。规则照 TYPE-15：能同名就同名，没有对应列的另起（`docs/arch/SHARED_TYPES.md:97`）。

| 字段名 | 属于 | 依据 | 别的叫法 |
|---|---|---|---|
| id | User | `prisma/schema.prisma:26`；`docs/arch/API_CONTRACT.md:94` | userId |
| email | User | `prisma/schema.prisma:27`；`docs/arch/API_CONTRACT.md:94` | 无 |
| email | CreateUserRequest | `prisma/schema.prisma:27`；`docs/design/PRD.md:151` | 无 |
| password | CreateUserRequest | 无对应列（`:28` 存的是哈希）；`docs/design/PRD.md:151` | 无合理的 |
| email、password | CreateSessionRequest | `docs/design/PRD.md:160` | 无 |
| name | CreateProjectRequest、Project | `prisma/schema.prisma:55`；`docs/design/PRD.md:229` | projectName |
| id | Project | `prisma/schema.prisma:54`；`docs/arch/SHARED_TYPES.md:66` | projectId |
| role | Project | `prisma/schema.prisma:69`；`docs/arch/API_CONTRACT.md:89`「我在本项目的角色」 | myRole（N27） |
| email | CreateMemberRequest | `prisma/schema.prisma:27`；`docs/design/PRD.md:239` | inviteeEmail |
| userId | Member | `prisma/schema.prisma:67`；`docs/arch/API_CONTRACT.md:791` | id |
| email | Member | `prisma/schema.prisma:27`；`docs/design/PRD.md:323` | 无 |
| role | Member | `prisma/schema.prisma:69`；`docs/design/PRD.md:248` | 无 |
| title、description | 两个任务请求、Task | `prisma/schema.prisma:83-84`；`docs/design/PRD.md:358` | 无 |
| assigneeUserId | 两个任务请求 | `prisma/schema.prisma:85` | assigneeId |
| dueDate | 两个任务请求、Task | `prisma/schema.prisma:89`；`docs/design/PRD.md:356` | 无 |
| status | UpdateTaskStatusRequest、Task | `prisma/schema.prisma:87` | 无 |
| id | Task | `prisma/schema.prisma:81` | taskId |
| assignee | Task | `prisma/schema.prisma:94` 的关系字段；`docs/arch/SHARED_TYPES.md:113` | assigneeUser |
| assignee.id、assignee.email | Task | `docs/arch/SHARED_TYPES.md:113`「id、邮箱」 | assignee.userId |
| possiblyStuck | OwnerTask | 无对应列；`docs/design/PRD.md:63`、`:299` | isStuck、stuck（N28） |
| total、completed、inProgress、notStarted | ProjectSummary | 无对应列；`docs/design/PRD.md:71`；`docs/arch/API_CONTRACT.md:715` | totalCount 等（N29） |
| parameter | ValidationProblemDetails 的 errors 项 | 无对应；`docs/arch/SHARED_TYPES.md:102` 留给起草轮 | query、name（N25） |

有一处读写不同名，要知道：响应给 `assignee.id`，请求收 `assigneeUserId`。这是 TYPE-15 与 TYPE-18 合起来的结果，不算冲突。

内部形状的名字也是我起的：OwnerTask、ExecutorTask。别的叫法是 TaskForOwner、TaskForExecutor。

ProblemType 的性质名也是我起的。前缀 `urn:study-l3-v2:problem:` 已定（`docs/arch/SHARED_TYPES.md:100`）。

| 性质名 | 退回性质 | 依据 | 别的叫法 |
|---|---|---|---|
| unauthenticated | 未登录 | `docs/arch/API_CONTRACT.md:197` | unauthorized |
| not-found | 看不见 | `docs/arch/API_CONTRACT.md:198` | not-visible |
| forbidden | 不许做 | `docs/arch/API_CONTRACT.md:199` | action-forbidden |
| csrf-rejected | 跨站被拒 | `docs/arch/API_CONTRACT.md:200`、`:301` | cross-site-rejected |
| invalid-request | 参数不合法 | `docs/arch/API_CONTRACT.md:201` | validation-failed |
| conflict | 冲突 | `docs/arch/API_CONTRACT.md:202` | 无 |
| unsupported-media-type | 格式不支持 | `docs/arch/API_CONTRACT.md:203` | 无 |
| internal-error | 内部错误 | `docs/arch/API_CONTRACT.md:204` | 无 |
| email-already-used | 邮箱已被使用 | `docs/arch/API_CONTRACT.md:326` | email-taken |
| invitee-not-registered | 邀请的邮箱没注册 | `docs/arch/API_CONTRACT.md:408` | invitee-not-found |
| already-member | 已在项目中 | `docs/arch/API_CONTRACT.md:408` | member-exists |
| sole-owner-removal | 移出唯一负责人 | `docs/arch/API_CONTRACT.md:418` | last-owner |

加 about:blank（`docs/arch/API_CONTRACT.md:254`）共 13 个，与 `docs/arch/PENDING-TYPES-DRAFT.md:221` 的数对得上。

---

## 四、取舍与冲突

稿子按推荐写。下面的推荐都是待确认（假设），拍之前不算决定。编号接着核对报告的 N23、C9 往下。

**N24 文件怎么分**
- A：六个文件（enums、fields、problem、auth、project、task）。内部片段小写开头，放 fields.ts，第 7 课的入口不导出。
- B：一个 schemas.ts。
- C：每个 schema 一个文件。
- 推荐 A，甜区。它和模块划分对得上，也能一组一提交（`docs/arch/PENDING-TYPES-DRAFT.md:4`）。

**N25 多余查询参数怎么逐项列（`docs/arch/SHARED_TYPES.md:102` 留给起草轮）**
- A：逐项是两种形状的并集，`{detail, pointer}` 与 `{detail, parameter}`。
- B：只留 pointer，查询参数写成 `#/query/foo` 这样的伪指针。它指向一个请求体里不存在的键。
- C：pointer 可省，参数名只写进 detail。形状最小，但机器读不到（`docs/arch/API_CONTRACT.md:771`）。
- 推荐 A，甜区。pointer 对请求体项保持必填，参数名也能机读。

**N26 ProblemType 性质名的写法（依附 C13）**
- A：小写连字符，如 `not-found`。
- B：大写蛇形，如 `NOT_FOUND`。
- C：小写蛇形，如 `not_found`。
- 推荐 A，甜区。它是 URI 里的一段，和路径段写法一致（`docs/arch/API_CONTRACT.md:45`）。具体的词见第三块。

**N27 Project 的「我的角色」**
- A：role。
- B：myRole。
- 推荐 A，甜区。照 TYPE-15 同名；B 读起来更清楚，但多一种叫法。

**N28「可能卡住」**
- A：possiblyStuck。
- B：isStuck。
- C：stuck。
- 推荐 A，甜区。PRD 的判定是「可能」，B、C 说得比判定更肯定。

**N29 汇总的四个字段**
- A：total、completed、inProgress、notStarted。
- B：totalCount、completedCount、inProgressCount、notStartedCount。
- 推荐 A，甜区。schema 名已经说明这是汇总，后三个也和 TaskStatus 对得上。

**N30 登录邮箱的规则（`docs/arch/SHARED_TYPES.md:93` 只写了密码上限）**
- A：trim、非空、上限 254，不校格式。
- B：trim、非空，不设上限。
- C：也校格式，不合规回 400。
- 推荐 A，甜区。C 违反「不合规的凭据走 401」（`docs/arch/PENDING-TYPES-DRAFT.md:464`），B 让接口收无上限的串。

**N31 用户 id 的范围**
- A：`z.int32().positive()`。
- B：`z.int()`，超 32 位另由后端挡。不挡可能落成 500（凭记忆，未核）。
- C：`z.int().positive()`，同 B 的问题。
- 推荐 A，甜区。列是 Int（`prisma/schema.prisma:26`、`:85`），在管道就回 400。

**N32 响应字段的松紧**
- A：响应只校类型，不带长度和邮箱格式。枚举和 dueDate 照校。
- B：响应也带长度和格式，和请求共用片段。
- 推荐 A，甜区。响应过 schema 为的是丢字段（`docs/arch/SHARED_TYPES.md:76`）。以后收紧请求规则时，老数据不会让响应变 500。

**N33 ValidationProblemDetails 收不收窄**
- A：status 写死 400，errors 至少一项。
- B：直接继承，不收窄。
- 推荐 A，甜区。契约写的就是 400（`docs/arch/API_CONTRACT.md:249`）。

**N34 内部形状给不给前端用（`docs/arch/SHARED_TYPES.md:115` 写「给后端用」）**
- A：前端只用 Task，读专属项时用 `"possiblyStuck" in task` 收窄。
- B：前端也导入两份内部形状，按 Project.role 选一份解析。
- C：第 7 课分子路径，只让后端导入。
- 推荐 A，甜区。对外只有一个名字，tsc 能实跑核。

**N35 相对导入写不写 .js 后缀（包壳第 7 课才定）**
- A：写 `./enums.js`。
- B：不写。
- 推荐 A，甜区。NodeNext 要求写，Bundler 也认（凭记忆）。这条可逆且影响小，命令能判，主对话换两种 moduleResolution 各跑一次就知道，不必占题。

**新发现的文档冲突，只报不裁**

**C10 Zod 精确版本的指针**
- 甲：`docs/arch/SHARED_TYPES.md:32` 写「精确版本见 docs/arch/TECH_STACK.md 第一节」。
- 乙：`docs/arch/PENDING-TYPES-DRAFT.md:70` 的 H8 只改 TECH_STACK「共享类型包一条」，`:63-97` 的回写清单没有写 Zod 版本这一行。
- 对不上的点：指针指向的内容，清单里没人负责写。TECH_STACK 不在七份内，我不知道它现在写没写。

**C11 邮箱上限的单位**
- 甲：`docs/arch/SHARED_TYPES.md:107` 写长度按 Unicode 码点。
- 乙：`docs/arch/SHARED_TYPES.md:108` 写 254 来自 RFC 5321 的 256 字节。
- 对不上的点：一个按码点，一个按字节。含多字节字符的地址，254 码点不止 254 字节。

**C12 H34 的范围**
- 甲：`docs/arch/PENDING-TYPES-DRAFT.md:96` 写 ARCHITECTURE「第三节默认值一行」，对应 `docs/arch/ARCHITECTURE.md:409`。
- 乙：`docs/arch/ARCHITECTURE.md:63` 在第一节，也写着字面值 stuck_task。
- 对不上的点：清单比实际要改的少一处。ADR-DB-006 是否同样漏，见第一块，那份我没读。

**C13 枚举大写的范围**
- 甲：`docs/arch/SHARED_TYPES.md:120` 写「枚举值全链路大写蛇形」。
- 乙：`docs/arch/SHARED_TYPES.md:100` 写 `urn:study-l3-v2:problem:性质名` 与 about:blank。`docs/arch/API_CONTRACT.md:250` 写 ProblemType 是字面值集合，稿子用 z.enum 写。
- 对不上的点：ProblemType 算不算甲说的枚举，甲没写。

**写后端时要盯的，不用拍，不计条数**
1. 出参不能用 Task 选形状。用 Task 解析带 possiblyStuck 的行会走负责人形状，执行者就漏了。必须用 OwnerTask 或 ExecutorTask（`docs/arch/SHARED_TYPES.md:78`）。
2. 前端要合并解析两种错误外壳时，先试 ValidationProblemDetails，否则 errors 被丢。这和 TYPE-8 是同一种顺序陷阱。
3. `prisma/schema.prisma:89` 查出来是 Date（凭记忆）。schema 要字符串，又不许转换（`docs/arch/SHARED_TYPES.md:119`），所以 Service 要先转好。
4. 路径 id 同样有 32 位问题：`99999999999` 转得成数字，查库可能抛错（凭记忆，未核）。决策 B 只写转不成的情况，第 10 课要一起挡。
5. 登录时全空白的密码走 401，不算空值。这是 TYPE-14 加 `docs/arch/API_CONTRACT.md:126` 的推论。

**凭记忆写的 Zod 用法，请实跑核**
- Z1：`import { z } from "zod"` 在 4.6.7 可用。
- Z2：`z.int()`、`z.int32()` 存在；`z.int32()` 拒 2147483648，收 2147483647。
- Z3：`z.int32().positive()`、`z.int().min(0)` 能这样链。
- Z4：`z.iso.date()` 收 2024-02-29，拒 2025-02-29、2026-02-30 和带时刻的写法；输出仍是字符串。
- Z5：`.regex(z.regexes.unicodeEmail)` 这种接法可用，且接在 trim、max 之后按链式顺序执行。预设的本地部分 64、域名 255 的上限也凭记忆。
- Z6：`.extend` 能覆盖已有键（status 改成 `z.literal(400)`），结果仍丢多余字段。
- Z7：`z.literal(400)` 收数字。
- Z8：`.nullable().optional()` 允许键缺失，也允许 null。
- Z9：全可选的 `z.strictObject` 收 `{}`。
- Z10：`z.array(...).min(1)` 拒空数组。

Prisma 枚举大写、Date 返回类型、超范围整数报错不是 Zod 用法，在第一块和上面的提醒里已标未核。

**共 16 条：取舍 12 条（N24 到 N35），文档冲突 4 条（C10 到 C13）。凭记忆的用法 Z1 到 Z10 与提醒 5 条不计入。**

---

## 五、样例

样例约定：
- `pass` 应通过，`fail` 应拒绝。
- `output` 应通过，且输出与 `expected` 深相等。
- `{"$repeat":["字符",N]}` 展开成重复串，`{"$concat":[...]}` 拼接，两者都要递归展开。

这些样例专门覆盖了容易错的三条：
- 先 trim 再判长度：见 CreateProjectRequest 那个 100 字加首尾空格的样例。
- 负责人形状排前：见 Task 与 ListTasksResponse 的 `output`。
- 请求 strict、响应 default：见各请求的多余键样例和各响应的 `output`。

Project、Task 及其列表都给了两种角色的数据。

```json
{
  "MemberRole": {
    "pass": ["OWNER", "EXECUTOR"],
    "fail": ["owner", "ADMIN", "", null]
  },
  "TaskStatus": {
    "pass": ["NOT_STARTED", "IN_PROGRESS", "COMPLETED"],
    "fail": ["not_started", "DONE", null]
  },
  "ProblemType": {
    "pass": [
      "about:blank",
      "urn:study-l3-v2:problem:unauthenticated",
      "urn:study-l3-v2:problem:not-found",
      "urn:study-l3-v2:problem:forbidden",
      "urn:study-l3-v2:problem:csrf-rejected",
      "urn:study-l3-v2:problem:invalid-request",
      "urn:study-l3-v2:problem:conflict",
      "urn:study-l3-v2:problem:unsupported-media-type",
      "urn:study-l3-v2:problem:internal-error",
      "urn:study-l3-v2:problem:email-already-used",
      "urn:study-l3-v2:problem:invitee-not-registered",
      "urn:study-l3-v2:problem:already-member",
      "urn:study-l3-v2:problem:sole-owner-removal"
    ],
    "fail": ["urn:study-l3-v2:problem:teapot", "not-found", "https://example.com/probs/x", null]
  },
  "ProblemDetails": {
    "pass": [
      {"type": "urn:study-l3-v2:problem:not-found", "title": "Not Found", "status": 404, "instance": "urn:uuid:6f1c2b7e-0d4a-4c3e-9b1a-2f8e5d7c9a10"},
      {"type": "about:blank", "title": "Method Not Allowed", "status": 405, "detail": "x", "instance": "urn:uuid:6f1c2b7e-0d4a-4c3e-9b1a-2f8e5d7c9a10"}
    ],
    "output": [
      {
        "input": {"type": "urn:study-l3-v2:problem:internal-error", "title": "Internal Server Error", "status": 500, "instance": "urn:uuid:1", "stack": "Error at x"},
        "expected": {"type": "urn:study-l3-v2:problem:internal-error", "title": "Internal Server Error", "status": 500, "instance": "urn:uuid:1"}
      }
    ],
    "fail": [
      {"type": "about:blank", "title": "x", "status": 404},
      {"type": "about:blank", "status": 404, "instance": "urn:uuid:1"},
      {"type": "about:blank", "title": "x", "status": "404", "instance": "urn:uuid:1"},
      {"type": "urn:study-l3-v2:problem:teapot", "title": "x", "status": 404, "instance": "urn:uuid:1"},
      {"type": "about:blank", "title": "x", "status": 404, "instance": "urn:uuid:1", "detail": null}
    ]
  },
  "ValidationProblemDetails": {
    "pass": [
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "Bad Request", "status": 400, "instance": "urn:uuid:1", "errors": [{"detail": "必填", "pointer": "#/email"}]},
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "Bad Request", "status": 400, "instance": "urn:uuid:1", "errors": [{"detail": "没定义的查询参数", "parameter": "foo"}]}
    ],
    "output": [
      {
        "input": {"type": "urn:study-l3-v2:problem:invalid-request", "title": "Bad Request", "status": 400, "instance": "urn:uuid:1", "errors": [{"detail": "x", "pointer": "#/a", "code": "too_small"}]},
        "expected": {"type": "urn:study-l3-v2:problem:invalid-request", "title": "Bad Request", "status": 400, "instance": "urn:uuid:1", "errors": [{"detail": "x", "pointer": "#/a"}]}
      }
    ],
    "fail": [
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "x", "status": 400, "instance": "urn:uuid:1", "errors": []},
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "x", "status": 400, "instance": "urn:uuid:1"},
      {"type": "urn:study-l3-v2:problem:internal-error", "title": "x", "status": 500, "instance": "urn:uuid:1", "errors": [{"detail": "x", "pointer": "#/a"}]},
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "x", "status": 400, "instance": "urn:uuid:1", "errors": [{"detail": "x"}]},
      {"type": "urn:study-l3-v2:problem:invalid-request", "title": "x", "status": 400, "instance": "urn:uuid:1", "errors": [{"pointer": "#/a"}]}
    ]
  },
  "CreateUserRequest": {
    "pass": [
      {"email": "bob@example.com", "password": {"$repeat": ["a", 15]}},
      {"email": "张三@例子.公司", "password": {"$repeat": ["a", 64]}},
      {"email": "dave@example.com", "password": {"$repeat": ["😀", 15]}},
      {"email": "erin@example.com", "password": {"$repeat": ["😀", 64]}},
      {"email": "frank@example.com", "password": {"$repeat": [" ", 15]}},
      {"email": {"$concat": [{"$repeat": ["a", 64]}, "@", {"$repeat": ["b", 189]}]}, "password": {"$repeat": ["a", 15]}}
    ],
    "output": [
      {
        "input": {"email": "  Bob@Example.com  ", "password": "  keep-spaces-in-password  "},
        "expected": {"email": "Bob@Example.com", "password": "  keep-spaces-in-password  "}
      }
    ],
    "fail": [
      {"email": "bob@example.com", "password": {"$repeat": ["a", 14]}},
      {"email": "bob@example.com", "password": {"$repeat": ["a", 65]}},
      {"email": "bob@example.com", "password": {"$repeat": ["😀", 14]}},
      {"email": "bob@example.com", "password": {"$repeat": ["😀", 65]}},
      {"email": "bob", "password": {"$repeat": ["a", 15]}},
      {"email": "   ", "password": {"$repeat": ["a", 15]}},
      {"email": {"$concat": [{"$repeat": ["a", 64]}, "@", {"$repeat": ["b", 190]}]}, "password": {"$repeat": ["a", 15]}},
      {"email": "bob@example.com", "password": {"$repeat": ["a", 15]}, "role": "OWNER"},
      {"email": "bob@example.com"},
      {"email": null, "password": {"$repeat": ["a", 15]}}
    ]
  },
  "CreateSessionRequest": {
    "pass": [
      {"email": "bob@example.com", "password": "short"},
      {"email": "not-an-email", "password": "x"},
      {"email": "bob@example.com", "password": "   "},
      {"email": "bob@example.com", "password": {"$repeat": ["a", 64]}},
      {"email": {"$repeat": ["b", 254]}, "password": "x"}
    ],
    "output": [
      {
        "input": {"email": "  bob@example.com ", "password": " x "},
        "expected": {"email": "bob@example.com", "password": " x "}
      }
    ],
    "fail": [
      {"email": "bob@example.com", "password": ""},
      {"email": "bob@example.com", "password": {"$repeat": ["a", 65]}},
      {"email": "", "password": "x"},
      {"email": "   ", "password": "x"},
      {"email": {"$repeat": ["b", 255]}, "password": "x"},
      {"email": "bob@example.com", "password": "x", "remember": true},
      {"email": "bob@example.com"},
      {"email": null, "password": "x"}
    ]
  },
  "User": {
    "pass": [{"id": 1, "email": "bob@example.com"}],
    "output": [
      {
        "input": {"id": 1, "email": "bob@example.com", "passwordHash": "secret", "createdAt": "2026-11-05T00:00:00.000Z"},
        "expected": {"id": 1, "email": "bob@example.com"}
      }
    ],
    "fail": [
      {"id": "1", "email": "bob@example.com"},
      {"id": 1.5, "email": "bob@example.com"},
      {"id": 0, "email": "bob@example.com"},
      {"id": 1},
      {"id": null, "email": "bob@example.com"}
    ]
  },
  "CreateProjectRequest": {
    "pass": [
      {"name": "A"},
      {"name": {"$repeat": ["甲", 100]}},
      {"name": {"$concat": [" ", {"$repeat": ["甲", 100]}, " "]}},
      {"name": {"$repeat": ["😀", 100]}}
    ],
    "output": [
      {"input": {"name": "  项目甲  "}, "expected": {"name": "项目甲"}}
    ],
    "fail": [
      {"name": ""},
      {"name": "   "},
      {"name": {"$repeat": ["甲", 101]}},
      {"name": {"$repeat": ["😀", 101]}},
      {},
      {"name": null},
      {"name": "A", "projectId": 1}
    ]
  },
  "Project": {
    "pass": [
      {"id": 1, "name": "项目甲", "role": "OWNER"},
      {"id": 1, "name": "项目甲", "role": "EXECUTOR"}
    ],
    "output": [
      {
        "input": {"id": 1, "name": "项目甲", "role": "EXECUTOR", "ownerEmail": "boss@example.com", "createdAt": "2026-11-05T00:00:00.000Z"},
        "expected": {"id": 1, "name": "项目甲", "role": "EXECUTOR"}
      }
    ],
    "fail": [
      {"name": "项目甲", "role": "EXECUTOR"},
      {"id": 1, "name": "项目甲"},
      {"id": 1, "name": "项目甲", "role": "owner"}
    ]
  },
  "ListProjectsResponse": {
    "pass": [
      {"items": []},
      {"items": [{"id": 1, "name": "项目甲", "role": "OWNER"}, {"id": 2, "name": "项目乙", "role": "EXECUTOR"}]}
    ],
    "fail": [
      [],
      {},
      {"projects": []},
      {"items": [{"id": 1}]}
    ]
  },
  "CreateMemberRequest": {
    "pass": [{"email": "carol@example.com"}, {"email": "张三@例子.公司"}],
    "output": [
      {"input": {"email": " Carol@Example.com "}, "expected": {"email": "Carol@Example.com"}}
    ],
    "fail": [
      {"email": "carol"},
      {"email": "   "},
      {},
      {"email": null},
      {"email": "carol@example.com", "role": "OWNER"}
    ]
  },
  "Member": {
    "pass": [
      {"userId": 1, "email": "boss@example.com", "role": "OWNER"},
      {"userId": 2, "email": "carol@example.com", "role": "EXECUTOR"}
    ],
    "output": [
      {
        "input": {"id": 9, "userId": 2, "email": "carol@example.com", "role": "EXECUTOR", "createdAt": "2026-11-05T00:00:00.000Z"},
        "expected": {"userId": 2, "email": "carol@example.com", "role": "EXECUTOR"}
      }
    ],
    "fail": [
      {"id": 2, "email": "carol@example.com", "role": "EXECUTOR"},
      {"userId": 2, "role": "EXECUTOR"},
      {"userId": 2, "email": "carol@example.com", "role": "executor"}
    ]
  },
  "ListMembersResponse": {
    "pass": [
      {"items": []},
      {"items": [{"userId": 1, "email": "boss@example.com", "role": "OWNER"}, {"userId": 2, "email": "carol@example.com", "role": "EXECUTOR"}]}
    ],
    "fail": [
      [],
      {"members": []},
      {"items": [{"userId": 1}]}
    ]
  },
  "ReplaceProjectOwnerRequest": {
    "pass": [{"userId": 2}, {"userId": 2147483647}],
    "fail": [
      {},
      {"userId": "2"},
      {"userId": [2]},
      {"userId": null},
      {"userId": 0},
      {"userId": 2147483648},
      {"userId": 2, "projectId": 1}
    ]
  },
  "CreateTaskRequest": {
    "pass": [
      {"title": "t", "description": "d"},
      {"title": "t", "description": "d", "assigneeUserId": null, "dueDate": null},
      {"title": "t", "description": "d", "assigneeUserId": 2, "dueDate": "2026-12-31"},
      {"title": "t", "description": "d", "dueDate": "2000-01-01"},
      {"title": "t", "description": "d", "dueDate": "2024-02-29"},
      {"title": {"$repeat": ["甲", 200]}, "description": {"$repeat": ["乙", 5000]}}
    ],
    "output": [
      {"input": {"title": " t ", "description": " d "}, "expected": {"title": "t", "description": "d"}}
    ],
    "fail": [
      {"description": "d"},
      {"title": "t"},
      {"title": "   ", "description": "d"},
      {"title": "t", "description": ""},
      {"title": {"$repeat": ["甲", 201]}, "description": "d"},
      {"title": "t", "description": {"$repeat": ["乙", 5001]}},
      {"title": "t", "description": "d", "dueDate": "2026-02-30"},
      {"title": "t", "description": "d", "dueDate": "2025-02-29"},
      {"title": "t", "description": "d", "dueDate": "2026-12-31T00:00:00Z"},
      {"title": "t", "description": "d", "assigneeUserId": "2"},
      {"title": "t", "description": "d", "status": "COMPLETED"},
      {"title": "t", "description": "d", "projectId": 1}
    ]
  },
  "UpdateTaskRequest": {
    "pass": [
      {},
      {"title": "新标题"},
      {"assigneeUserId": null},
      {"dueDate": null},
      {"description": "x", "assigneeUserId": 3, "dueDate": "2026-12-31"}
    ],
    "output": [
      {"input": {"title": "  新标题 "}, "expected": {"title": "新标题"}}
    ],
    "fail": [
      {"title": null},
      {"description": null},
      {"title": "   "},
      {"status": "COMPLETED"},
      {"projectId": 1},
      {"dueDate": "tomorrow"},
      {"assigneeUserId": 1.5}
    ]
  },
  "UpdateTaskStatusRequest": {
    "pass": [{"status": "NOT_STARTED"}, {"status": "IN_PROGRESS"}, {"status": "COMPLETED"}],
    "fail": [
      {},
      {"status": null},
      {"status": "in_progress"},
      {"status": "COMPLETED", "title": "x"}
    ]
  },
  "OwnerTask": {
    "pass": [
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31", "possiblyStuck": true},
      {"id": 2, "title": "未认领任务", "description": "还没人接", "status": "NOT_STARTED", "assignee": null, "dueDate": null, "possiblyStuck": false}
    ],
    "fail": [
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31"},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "dueDate": null, "possiblyStuck": false},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2}, "dueDate": null, "possiblyStuck": false}
    ]
  },
  "ExecutorTask": {
    "pass": [
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31"}
    ],
    "output": [
      {
        "input": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com", "passwordHash": "secret"}, "dueDate": "2026-12-31", "possiblyStuck": true},
        "expected": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31"}
      }
    ],
    "fail": [
      {"id": 1, "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": null, "dueDate": null},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "in_progress", "assignee": null, "dueDate": null},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": null, "dueDate": "2026-02-30"}
    ]
  },
  "Task": {
    "pass": [
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31", "possiblyStuck": true},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": "2026-12-31"}
    ],
    "output": [
      {
        "input": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": null, "possiblyStuck": true},
        "expected": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": null, "possiblyStuck": true}
      },
      {
        "input": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": null},
        "expected": {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": null}
      }
    ],
    "fail": [
      {"id": 1},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "dueDate": null},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "in_progress", "assignee": null, "dueDate": null},
      {"id": 1, "title": "写接口", "description": "写改状态接口", "status": "IN_PROGRESS", "assignee": null, "dueDate": "2026-12-31T00:00:00Z"}
    ]
  },
  "ListTasksResponse": {
    "pass": [
      {"items": []},
      {"items": [{"id": 1, "title": "t", "description": "d", "status": "COMPLETED", "assignee": null, "dueDate": null, "possiblyStuck": false}]},
      {"items": [{"id": 1, "title": "t", "description": "d", "status": "COMPLETED", "assignee": {"id": 2, "email": "carol@example.com"}, "dueDate": null}]}
    ],
    "output": [
      {
        "input": {"items": [{"id": 1, "title": "t", "description": "d", "status": "NOT_STARTED", "assignee": null, "dueDate": null, "possiblyStuck": false}]},
        "expected": {"items": [{"id": 1, "title": "t", "description": "d", "status": "NOT_STARTED", "assignee": null, "dueDate": null, "possiblyStuck": false}]}
      }
    ],
    "fail": [
      [],
      {"tasks": []},
      {"items": [{"id": 1}]}
    ]
  },
  "ProjectSummary": {
    "pass": [
      {"total": 0, "completed": 0, "inProgress": 0, "notStarted": 0},
      {"total": 10, "completed": 3, "inProgress": 4, "notStarted": 3}
    ],
    "output": [
      {
        "input": {"total": 10, "completed": 3, "inProgress": 4, "notStarted": 3, "completionRate": 0.3},
        "expected": {"total": 10, "completed": 3, "inProgress": 4, "notStarted": 3}
      }
    ],
    "fail": [
      {"total": 10, "completed": 3, "inProgress": 4},
      {"total": -1, "completed": 0, "inProgress": 0, "notStarted": 0},
      {"total": 1.5, "completed": 0, "inProgress": 0, "notStarted": 0},
      {"total": "10", "completed": 3, "inProgress": 4, "notStarted": 3}
    ]
  }
}
```

**没改任何文件。** 稿子和样例都没跑过，等主对话实跑。
