# SHARED_TYPES · 共享类型的规则与裁决

> 项目：study-l3-v2（团队任务协作工具）
> 去留：长期。
> 用途：管共享 schema 怎么写、放哪、为什么。字段本体不在这里。
> 依据：docs/arch/ARCHITECTURE.md 第二节「共享类型推导方式（取舍 4）」；docs/arch/API_CONTRACT.md 第零节（API-1）。

## 零、管辖范围

三样东西各管一件，不重复：

- docs/arch/API_CONTRACT.md 管「怎么调」：接口、方法、路径、退回，并点名每个接口用哪个 schema。
- packages/shared/src/ 管「长什么样」：字段名、类型、必填与否、取值范围。这是字段的唯一真相（API-1）。
- 本文件管「schema 的规则」：命名、落点、版本、写法约定，以及这些规则为什么这样定。

本文件不写字段本体。写了就是第二份真相，与取舍 4 相悖（TYPE-4）。

## 一、全局约定

### 1. 落点

- schema 是真的 .ts 文件，放在 packages/shared/src/（TYPE-1）。
- 第 7 课建包之前，这个目录只放 schema，不放包壳。验证在仓库外的临时目录跑，不进仓库（TYPE-1）。

### 2. 命名

- 不带 Schema 后缀。schema 与类型同名，就叫契约点的名字，如 User（TYPE-2）。
- 类型一律 z.infer 推导，不手写（取舍 4）。

### 3. 版本

- Zod 主版本 4，下限 4.6。精确版本见 docs/arch/TECH_STACK.md 第一节（TYPE-3）。

### 4. 校验管道

- 服务端用 NestJS 内置 StandardSchemaValidationPipe，schema 挂在参数装饰器上（TYPE-5）。
- 校验失败的错误由项目写的 exceptionFactory 翻译成错误外壳（TYPE-5，错误外壳见 API-30）。
- 响应一律过 schema，没声明的字段丢掉（TYPE-9）。

### 5. 按角色不同的形状

- 两份内部形状合成对外一个名字，后端按调用者角色选（TYPE-8）。
- 并集里负责人形状排在前面（TYPE-8）。

## 二、本节裁决汇总

- TYPE-1 schema 的落点：真 .ts 文件放 packages/shared/src/，只放 schema，不建包壳；验证在临时目录跑（问 739 A）。
  理由：字段从第一天起只有一个家，不用搬家，也能用机器验。先例是 prisma/schema.prisma，第 5 课建库前就落在最终路径。
  没选：写进文档代码块、第 7 课搬；现在建完整的包；只写语义清单。
  说明：知识库第七块与 book/OUTLINE.md 第一篇写这一阶段「不写代码」。这两处不改字，schema 与 prisma 文件同类，算声明，不算业务代码。
- TYPE-2 命名：不带后缀，schema 与类型同名（问 740 A）。
  理由：契约的名字就是代码里的名字。Zod 官方基本用法页的例子就这样写，该页没有命名规定，只作参考。
  没选：schema 带 Schema 后缀；schema 与类型都带后缀。
  代价：Prisma 生成的类型可能同名（未核），后端同时用要改导入名。
- TYPE-3 Zod 版本：主版本 4，下限 4.6，精确版本第 7 课由锁文件定，到时重核（问 741 A）。
  理由：本节要写 schema 并实跑，不定版本就没依据。2026-11-05 查 npm，最新 4.6.7。
  没选：写死补丁号，仓库还没有 package.json，写了也锁不住；等第 7 课，那是 Prisma、NestJS 的做法（BACKLOG 74、75）。
- TYPE-4 本文件留不留：留，只写规则与裁决，不写字段（问 743 B）。
  理由：与契约同一分法，裁决有个长期的家，不造第二份字段真相。角色定义文件写的产出也对得上。
  没选：不要这份文档，规则分散进契约与 docs/arch/DECISIONS.md。
- TYPE-5 校验管道：用 NestJS 内置 StandardSchemaValidationPipe，项目只写 exceptionFactory（问 744 B）。推翻 ARCHITECTURE 第三节 T1 与问 468 A 的「项目自写」。
  依据：NestJS 官方 Pipes 页「For schema-based validation in production, use the built-in `StandardSchemaValidationPipe` instead.」（网页代理取回）；框架约定排在自定之前（docs/arch/STANDARDS.md）。
  核对（2026-11-05，读 @nestjs/common 包源码与 Zod 4.6.7 实跑，没在 Nest 里跑）：12.0.0 起有，11.2.8 没有，与 API-11 要的 12.1 兼容；exceptionFactory 拿得到字段路径与说明；多余键的 keys 运行时有、类型上没有，要加一小段判断；默认把解析后的值传下去；@Query 也能挂 schema。
  防：没挂 schema 的参数原样通过，漏挂会放行；自写管道漏绑同样如此。第 10 课实跑时再验。
  没选：保留自写，要登偏离；先不定，等第 10 课。
- TYPE-6 执行者那份 Project 带项目 id（问 745 A）。PRD 审定决策 D11、D17 读作业务信息只有名称与自己的角色，id 是路径编号，不算业务信息。
  理由：不带 id，执行者拼不出任务接口的路径，页面也进不了项目。他本来就能用这个路径，多带 id 不增加可见信息（推断）。
  没选：不带 id、列表另给不透明入口，要改路径设计；不带也不给入口，执行者进不了项目。
- TYPE-7 Project 两种角色同形：id、名称、我的角色（问 746 A）。
  理由：本版页面用不到别的，项目主页其余数据由汇总与成员列表供。响应字段只加不改，以后要了再加。
  没选：负责人多带创建时间等元信息；负责人多带自己的身份信息。
- TYPE-8 按角色不同的形状：两份内部形状合成对外一个名字，后端按调用者角色选（问 747 B）。本版只有 Task 这样。
  理由：负责人专属项是权限边界（ARCHITECTURE 第二节「共享层边界」第 4 问），形状本身挡住，比靠记得可靠。实跑（Zod 4.6.7）：过执行者形状，专属项被丢。
  写法：并集里负责人形状排在前面，否则负责人那份的专属项也被丢（实跑）。内部两个形状不进契约，问 629 A 否掉的是对外分两个名字。
  没选：一个对象加可选项，执行者数据多带也放行（实跑）；再加「我的角色」作判别，前端已从 Project 知道。
- TYPE-9 响应一律过 schema，没声明的字段丢掉；Task 由后端按调用者角色选形状（问 748 A）。用内置 StandardSchemaSerializerInterceptor 还是 Service 手工，第 10 课写骨架时定。
  理由：Prisma 查出的 User 整行带 passwordHash。tsc 7.0.2 实跑：从变量返回多余字段不报错，类型检查挡不住。
  已知：内置拦截器 12.0.0 起有；schema 按路由固定，分不了调用者角色，所以 Task 选形状那一步只能在 Service。
  没选：不过，靠类型检查；只让 Task 过。
- TYPE-10 密码上限 64，按 Unicode 码点算（问 749 C）。算法第 10 课定（BACKLOG 82）。
  依据：NIST SP 800-63B Rev 4「Verifiers and CSPs SHOULD permit a maximum password length of at least 64 characters.」「Each Unicode code point SHALL be counted as a single character when evaluating password length.」；OWASP Authentication「Maximum password length should be at least 64 characters to allow passphrases.」（网页代理取回）。Zod 4.6.7 的 min、max 实跑按码点算。
  理由：这个数有出处；以后放宽不伤已有账号，收紧才伤。
  没选：128，architect 的假设，没有标准出处；只写下限，上限等第 10 课。
- TYPE-11 响应只带页面和接口要的（问 750 A）。本版响应没有时间点字段，API-41 关于时间点那一半暂时用不上。
  理由：本版页面不显示时间点与所属项目 id。响应字段只加不改，以后要了再加；少带合最小权限。
  没选：Task 多带状态时间与分配时间；全部资源带创建、更新时间。
