# 界面样稿

> 去留：长期。
> 用途：第 3 课用 Claude Code 的 /design 画的界面样稿，源文件存一份防丢（问 728 A）。
> 准绳：文字规范仍以 docs/design/UI_DESIGN.md 为准，样稿只是看样子（问 726 A）。
> 示例数据是编的：成员邮箱用 example.com，项目名、任务名、日期都不是真实数据。

## 文件

| 文件 | 画的是 |
|---|---|
| canvas.json | 画布上各张样稿的排布 |
| Main.dc.html | 页 5 项目主页（负责人） |
| TasksOwner.dc.html | 页 6 任务页（负责人） |
| TasksExecutor.dc.html | 页 6 任务页（执行者） |
| TaskDetailExecutor.dc.html | 页 7 任务详情（执行者） |
| TasksLoading.dc.html | 页 6 任务页 加载态 |
| TasksEmptyOwner.dc.html | 页 6 任务页 空态（负责人） |
| TasksEmptyExecutor.dc.html | 页 6 任务页 空态（执行者） |
| TasksError.dc.html | 页 6 任务页 错误态（负责人） |

## 怎么看

网页版（私有）：https://claude.ai/artifact/9WMjnG5qyvuWRKXerRbwbe

源文件里引用的 ./support.js 是 Design 类型的运行文件，这里不存。脱离网页直接在浏览器打开是什么效果，没实测。

任务页画了加载、空、错误三态，其余页面只画了正常态。

## 来历

前三张 2026-11-04 从网页版取回，版本 1793770414-b23a，和当时写入的内容逐字节比过，相同。后五张是 2026-11-04 补画的，发布为第 5 版 1793806498-87a1。经过见 docs/DECISIONS-R1.md 的 R1-681、R1-682、R1-684。
