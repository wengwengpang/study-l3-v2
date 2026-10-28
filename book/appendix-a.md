# 附录 A　Claude Code 速查

这一份是 Claude Code 的速查。每项写四样：是什么，原理，怎么用，本书哪一章用到。

产品事实都对官方文档核过，每项末尾写出处和核对日期。Claude Code 改版快，用的时候以官方文档为准。

现收一项：设置与权限里的权限模式。

## 设置与权限：权限模式

### 是什么

Claude Code 要改文件、跑命令、上网之前，先过一道关：是停下来问你，还是直接做。权限模式定的就是这件事。

官方现有六种模式。下表照官方页的表译出。「不问就能做的」一栏，是这个模式下不弹窗就会执行的动作。

| 模式（设置里写的值） | 适合 | 不问就能做的 |
|---|---|---|
| `default`，界面上叫 Manual | 每个动作都自己过目，敏感的活 | 只读 |
| `acceptEdits` | 一边改代码一边审 | 读、改文件、常见的文件系统命令（`mkdir`、`touch`、`mv`、`cp` 等） |
| `plan` | 动手之前先摸清代码 | 读；auto 可用时，再加分类器放行的命令 |
| `auto` | 长任务，少弹窗 | 全部，配后台安全检查 |
| `dontAsk` | 锁死的持续集成与脚本 | 工作目录里读文件、预先放行的工具；其余要问的一律拒绝，装了的 mod 仍可放行其中一部分 |
| `bypassPermissions` | 只在隔离的容器和虚拟机里用 | 全部 |

本书只用到两种。

**Manual。** 设置里写 `default`，命令行、VS Code 扩展、桌面应用里都叫 Manual。改文件、跑 shell 命令、上网之前，大多会先停下来问你。命令行也认 `manual` 这个别名，写 `"defaultMode": "manual"` 和写 `default` 一样。

**auto。** 不再逐个问你。另有一个分类器模型，在每个动作执行之前审一遍。超出你的请求的、指向不认识的基础设施的、看起来是被读到的恶意内容带着走的，它拦下来。

### 原理

打个比方。Manual 像门禁设成「每个来客都敲门问你」。auto 像门口换了个保安：他会看一眼再放行，大多数时候判断得对，但那已经不是你在决定。

**会话从哪个模式起步。** 在终端里开一个新会话，Claude Code 按下面的顺序取，用第一个有的：

1. 命令行参数 `--permission-mode`，或 `--dangerously-skip-permissions`。
2. 设置文件里的 `permissions.defaultMode`。
3. 内置默认值。

内置默认值随版本变过。v2.1.283 起，交互式终端和 VS Code 会话的内置默认是 auto。更早的版本只在 Pro、Max、Team 套餐是 auto，别的套餐是 Manual。

所以一个项目要是没写 `defaultMode`，新版本里开出来的会话就是 auto。没人去看状态栏，就没人发现。

**模式和规则的关系。** 设置文件里还能写 allow、ask、deny 三档规则。到了 auto 下，deny 规则照样拦，ask 规则照样弹窗。模式管的，是规则没写到的那一大片。护栏要完整，写下的规则和兜底的模式两样都要定（反模式 36 号）。

**写在哪份文件，结果不一样。** 项目里的 `.claude/settings.json`、`.claude/settings.local.json` 写 `"auto"` 或 `"bypassPermissions"`，不生效；写 `default` 等其余的值，生效。VS Code 扩展定起步模式时不读项目里这两份文件，它依次看扩展自己的 `claudeCode.initialPermissionMode`、上次在模式指示器里选的模式、管理员配置或 `~/.claude/settings.json`，最后才是内置默认值。

### 怎么用

**本项目的设置。** 项目根目录 `.claude/settings.json` 里显式写了默认模式：

```json
"permissions": {
  "defaultMode": "default",
```

每个新会话都从 Manual 起步。这一行是唯一把项目留在 Manual 的东西，不能删。

**认状态栏。** 命令行底部的状态栏显示当前模式。Manual 是灰色的 `⏸ manual mode on`，auto 是 `⏵⏵ auto mode on`。plan 显示 `⏸ plan mode on`，和 Manual 共用 ⏸ 这个图标，要看后面的字。

**两条会不知不觉切进 auto 的路。**

1. 按 Shift+Tab。命令行里按 Shift+Tab，在模式之间循环：`default` → `acceptEdits` → `plan`，auto 可用时排在 `plan` 后面。切到 auto 不弹确认。
2. 在弹窗里选错一项。在 Manual 和 `acceptEdits` 模式下、auto 可用时，Bash 命令的权限弹窗会多出一项「Yes, and switch to auto mode」。选了它，这条命令放行，整个会话也切到 auto。只想放行这一条，选「Yes」那一项。

**切回来。** 按 Shift+Tab，直到状态栏显示 `⏸ manual mode on`。从 auto 按一次就回到 `default`。

**想彻底不用 auto。** 在设置文件里把 `permissions.disableAutoMode` 设成 `"disable"`。auto 就从 Shift+Tab 的循环里拿掉，带 `--permission-mode auto` 启动的会话也改从 Manual 起步。要给整个组织锁住，写进管理员配置（managed settings）。本项目没这样做，选的是声明默认 Manual，要用 auto 时自己切，用完切回来。

**开工前看一眼。** 本课程每次开课，先看一眼状态栏写的是不是 manual mode（SESSION_START J 节第 2 件）。

### 本书哪一章用到

- 第 6 课：建 `.claude/settings.json` 的 allow、ask、deny 三档规则。
- 补课 05-ARCH：发现项目从没写过 `defaultMode`，一直跑在 auto 下，补上这一行（反模式 36 号）。
- 每次开课：开课闸门看状态栏是不是 manual mode。

### 出处

Claude Code 官方文档，括号里是取回核过的日期：
- 「Choose a permission mode」，code.claude.com/docs/en/permission-modes（2026-10-28）。六种模式的表；Manual 的叫法与 `manual` 别名；auto 的分类器；起步模式的取法；v2.1.283 前后的内置默认；项目设置里写 auto、bypassPermissions 不生效；VS Code 扩展的起步模式；状态栏写法；Shift+Tab 的循环、切到 auto 不弹确认；「Yes, and switch to auto mode」；deny、ask 规则在 auto 下的作用；`permissions.disableAutoMode`。

项目里：
- `.claude/settings.json` 的 `permissions.defaultMode`。
- 反模式 36 号「未声明的档位由厂商默认值填」。
- 写作时这台机器的版本：`claude --version` 显示 2.1.312（2026-10-28）。

相对网页版改了什么：
- 网页版说起步模式「取决于每个套餐的内置默认值」。现按 v2.1.283 起交互式终端和 VS Code 一律 auto 写。
- 网页版把关掉 auto 的键写成设置文件顶层的 `disableAutoMode`。官方写在 `permissions` 下面，现照官方写。
- 补了六种模式的表、两条误切进 auto 的路、VS Code 扩展的例外。
