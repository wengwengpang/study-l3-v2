#!/bin/bash
# 资料管理员机械体检（S1 到 S7）：只读，不改任何文件，结果打印到屏幕。
# 范围：docs/ 下全部 .md（除 DECISIONS-* 历史记录、LIBRARIAN_REPORT 体检报告本身）、CLAUDE.md、.claude/agents/。
# 引用来源分三列：常驻、历史（docs/lessons/、PENDING-TUNER-REFACTOR）、产品（docs/arch/、docs/design/）。
# 出处：DECISIONS-R1 R1-99、R1-100、R1-108；审查 2-4、2-5（R1-3）、F67 到 F70（R1-104）。
# 用法：在项目里任意目录跑 bash scripts/doc-check.sh
set -u
cd "$(git rev-parse --show-toplevel)" || exit 1

files=$(git ls-files 'docs/*.md' 'CLAUDE.md' '.claude/agents/*.md' | grep -v '^docs/DECISIONS-' | grep -vx 'docs/LIBRARIAN_REPORT.md')

col() {  # 文件归哪列。BRIDGE 复课要用，暂归常驻；用完改归历史，以后新的 BRIDGE 同理（审查 F83）
  case "$1" in
    docs/lessons/*|docs/PENDING-TUNER-REFACTOR.md) echo 历史 ;;
    docs/arch/*|docs/design/*) echo 产品 ;;
    *) echo 常驻 ;;
  esac
}

# 编号清单，各取编号，每行一个
rule_ids() {  # COURSE_RULES：1-36 块里的「N. 」加「## N · 」标题
  awk '/^## 1-36 · /{b=1; next}
       /^## [0-9]+ · /{b=0; sub(/^## /,""); sub(/ ·.*/,""); print; next}
       b && /^[0-9]+\. /{sub(/\..*/,""); print}' docs/COURSE_RULES.md
}
anti_ids()      { grep -oE '^## [0-9]+ 号' docs/lessons/anti-patterns.md | grep -oE '[0-9]+'; }
backlog_ids()   { grep -oE '^[0-9]+ \|' docs/BACKLOG.md | grep -oE '[0-9]+'; }
section_ids()   { awk -v a="$2" '$0 ~ "^## "a"、"{b=1; next} /^## /{b=0} b && /^[0-9]+\. /{sub(/\..*/,""); print}' "$1"; }
principle_ids() { section_ids docs/HARNESS.md 四; }
question_ids()  { section_ids docs/HARNESS.md 三; }
d_ids()         { grep -oE '^D[0-9]+ ' CLAUDE.md | grep -oE '[0-9]+'; }
check57_ids()   { awk '/^## 57 · /{b=1; next} /^## /{b=0} b && /^[0-9]+\. /{sub(/\..*/,""); print}' docs/COURSE_RULES.md; }
r1_ids()        { grep -oE '^--- R1-[0-9]+ ' docs/DECISIONS-R1.md | grep -oE '[0-9]+ $' | tr -d ' '; }
g1_ids()        { grep -oE '^--- 补遗 [0-9]+ ' docs/DECISIONS-G1.md | grep -oE '[0-9]+'; }
placeholder_ids() {  # 规则里的占位行：号还在，正文写「（已废」「（不存在」「（留空」
  awk '/^## 1-36 · /{b=1; next} /^## [0-9]+ · /{b=0} b && /^[0-9]+\. （(已废|不存在|留空)/{sub(/\..*/,""); print}' docs/COURSE_RULES.md
}
active_rule_ids() { rule_ids | grep -vxF -f <(placeholder_ids); }  # 删并候选只看在用的规则

# 引用：前缀后跟号；「45、61」逐个取，「18 到 20」展开；输出「号<TAB>列<TAB>文件:行」
# 以 # 开头的标题行不算引用（分组小标题只是结构，审查 F81）
# 跨度超过 10 的区间（如「1-36」指整块）不算进引用次数，另在 S3 附栏列出；倒序（如「补遗 26-7」指第 7 项）只取前一个号（审查 F82、F109-1、F112）
refs() {  # $2 填「大」则只出跨度超过 10 的区间，号那列写「首-尾」
  for f in $files; do
    awk -v pre="$1" -v c="$(col "$f")" -v wide="${2:-}" '/^#/{next} {
      s = $0
      while (match(s, pre "[0-9]+( ?(、|到|-) ?[0-9]+)*")) {
        m = substr(s, RSTART, RLENGTH); s = substr(s, RSTART + RLENGTH)
        sub("^" pre, "", m); gsub(/ /, "", m)
        n = split(m, part, "、")
        for (i = 1; i <= n; i++)
          if (split(part[i], r, /到|-/) == 2 && r[2] + 0 >= r[1] + 0) {
            if (r[2] - r[1] > 10) { if (wide != "") print r[1] "-" r[2] "\t" c "\t" FILENAME ":" FNR }
            else if (wide == "") for (k = r[1]; k <= r[2]; k++) print k "\t" c "\t" FILENAME ":" FNR
          }
          else if (wide == "") print r[1] "\t" c "\t" FILENAME ":" FNR
      }
    }' "$f"
  done
}

# S1、S2：总数、最大号、缺号、重号；取出 0 条要大声报（格式可能漂移）
list_stats() {  # $1 名称，$2 取号函数，$3 起始号（缺省 1）
  local ids max dup gap
  ids=$($2 | sort -n)
  if [ -z "$ids" ]; then echo "  !! $1：取出 0 条，格式可能漂移，先人工看"; return; fi
  max=$(echo "$ids" | tail -1)
  dup=$(echo "$ids" | uniq -d | tr '\n' ' ')
  gap=$(seq "${3:-1}" "$max" | grep -vxF -f <(echo "$ids") | tr '\n' ' ')
  echo "  $1：共 $(echo "$ids" | grep -c .) 条，最大号 $max；缺号：${gap:-无}；重号：${dup:-无}"
}

# 分组小标题漂移：1-36 块里「### 规则 N 到 M」下面实有的号，和 N 到 M 对不对得上（问 124A）
heading_drift() {
  awk 'function chk(  e, k) { if (h == "") return; e = ""; for (k = lo; k <= hi; k++) e = e k " "
         if (e != got) print "  " h "：标题写 " lo " 到 " hi "，下面实有 " (got == "" ? "无" : got) }
       /^## 1-36 · /{b=1; next}
       b && /^## /{chk(); b=0; h=""}
       b && /^### 规则 /{chk(); h=$0; s=$0; sub(/^### 规则 /, "", s); split(s, a, /[^0-9]+/)
                        lo=a[1]; hi=(s ~ /^[0-9]+ ?到 ?[0-9]+/) ? a[2] : a[1]; got=""; next}
       b && /^[0-9]+\. /{n=$0; sub(/\..*/, "", n); got=got n " "}
       END{if (b) chk()}' docs/COURSE_RULES.md
}

# S3：引用了但清单里没有的号
dangling() {  # $1 名称，$2 引用前缀，$3 取号函数，$4 填「常驻」则只看常驻列（撞名风险大的清单，审查 F82）
  local ids out
  ids=" $($3 | tr '\n' ' ') "
  out=$(refs "$2" | sort -u | while IFS=$'\t' read -r n c loc; do
    [ -n "${4:-}" ] && [ "$c" != "$4" ] && continue
    case "$ids" in *" $n "*) ;; *) echo "  $1 $n ← $loc（$c）" ;; esac
  done)
  echo "${out:-  $1：无}"
}

# S3 附：跨度超过 10 的区间不静默丢，逐条列出，首尾号在不在人工看（审查 F109-1）
wide_spans() {  # $1 名称，$2 引用前缀
  local out
  out=$(refs "$2" 大 | sort -u | while IFS=$'\t' read -r n c loc; do echo "  $1 $n ← $loc（$c）"; done)
  echo "${out:-  $1：无}"
}

# S4：常驻列一次都没写到「前缀 N」的号，附历史、产品列次数（自己那节提到自己也算被引用）
unreferenced() {  # $1 名称，$2 引用前缀，$3 取号函数，$4 标注
  local all none
  all=$(refs "$2")
  none=$($3 | sort -un | while read -r n; do
    [ "$(echo "$all" | awk -v n="$n" -F'\t' '$1==n && $2=="常驻"' | wc -l)" -eq 0 ] || continue
    h=$(echo "$all" | awk -v n="$n" -F'\t' '$1==n && $2=="历史"' | wc -l)
    p=$(echo "$all" | awk -v n="$n" -F'\t' '$1==n && $2=="产品"' | wc -l)
    printf '%s(历史%s 产品%s) ' "$n" "$h" "$p"
  done)
  echo "  $1$4：${none:-无}"
}

dirty=$(git status --porcelain | wc -l)
echo "== 资料体检 $(date '+%F %T')  提交 $(git log --oneline -1 | cut -d' ' -f1)  未提交改动 $dirty 处$([ "$dirty" -gt 0 ] && echo '（!! 报告与提交号对不上）')"
echo "== 范围：$(echo "$files" | grep -c .) 份文件"
echo
echo "== S1、S2 编号清单"
list_stats "规则（COURSE_RULES）" rule_ids
echo "  其中占位（已废、不存在、留空）：$(placeholder_ids | tr '\n' ' ')"
drift=$(heading_drift)
echo "  1-36 块分组小标题漂移：${drift:+
$drift}${drift:-无}"
list_stats "反模式（anti-patterns）" anti_ids
list_stats "BACKLOG" backlog_ids
list_stats "原则（HARNESS 第四节）" principle_ids
list_stats "问题（HARNESS 第三节）" question_ids
list_stats "决策边界 D（CLAUDE.md）" d_ids
list_stats "规则 57 自检项（9 起，1 到 8 在 SESSION_START J 节）" check57_ids 9
list_stats "DECISIONS-R1 条目" r1_ids
list_stats "DECISIONS-G1 补遗" g1_ids
echo
echo "== S3 指空的引用（写了号，清单里没有）"
dangling "规则" "规则 ?" rule_ids
dangling "反模式" "(反模式|anti-patterns) ?" anti_ids
dangling "BACKLOG" "BACKLOG ?" backlog_ids
dangling "原则" "原则 ?" principle_ids 常驻
dangling "问题" "问题 ?" question_ids 常驻
dangling "R1" "R1-" r1_ids
dangling "补遗" "补遗 ?" g1_ids
echo "  （原则、问题两份只看常驻列：常用词会撞名。D 号不查：常驻文件里 PRD 审定决策 D1 到 D9、重构分组 D0 也叫 D，只看常驻列也撞）"
echo
echo "== S3 附：跨度超过 10 的区间（只是不算进引用次数，不是不查；首尾号在不在请人工看）"
wide_spans "规则" "规则 ?"
wide_spans "反模式" "(反模式|anti-patterns) ?"
wide_spans "BACKLOG" "BACKLOG ?"
wide_spans "原则" "原则 ?"
wide_spans "问题" "问题 ?"
wide_spans "R1" "R1-"
wide_spans "补遗" "补遗 ?"
echo
echo "== S4 常驻文件里从没被引用过的号"
unreferenced "规则" "规则 ?" active_rule_ids "（删并候选，不含占位，删不删学生判）"
unreferenced "反模式" "(反模式|anti-patterns) ?" anti_ids "（参考，不是删并信号）"
unreferenced "BACKLOG" "BACKLOG ?" backlog_ids "（参考，不是删并信号）"
unreferenced "原则" "原则 ?" principle_ids "（参考，不是删并信号）"
echo
echo "== S5 各文件行数"
wc -l $files | sort -rn | sed 's/^/  /'

# S6：上次体检以来 docs/、CLAUDE.md、.claude/、scripts/ 里新增、删除、改名的文件，供人对 SESSION_START M 节送审命令清单（DECISIONS-R1 R1-167 问 162A）
# 起点取上次报告的提交；只比已提交的；范围比上面的 files 宽，不只 .md
echo
echo "== S6 上次体检以来新增、删除、改名的文件（A 新增、D 删除、R 改名；请对 SESSION_START M 节送审命令清单：要不要加、要不要改）"
last=$(git log -1 --format=%h -- docs/LIBRARIAN_REPORT.md)
if [ -z "$last" ]; then
  echo "  首次体检，无上次报告可比"
else
  out=$(git diff --name-status --diff-filter=ADR "$last" HEAD -- docs CLAUDE.md .claude scripts | sed 's/^/  /')
  echo "  起点：上次报告提交 $last"
  echo "${out:-  无}"
fi

# S7：开头 15 行里没有「去留：」的文件（DECISIONS-R1 R1-8 第二点第 1 条、R1-176 问 166A、R1-177 问 169A）
# 用途看 PROJECT_STRUCTURE 目录树，谁能改看规则 78 与 M 节清单，开头只补去留一行；不急补，哪节课改到哪份，顺手补那份
echo
echo "== S7 开头 15 行没有「去留：」的文件（补一行「去留：长期」或「去留：一次性，某某时删」；哪节课改到哪份，顺手补那份）"
miss=$(for f in $files; do head -15 "$f" | grep -q '去留：' || echo "  $f"; done)
echo "  共 $(echo "$files" | grep -c .) 份，缺 $(echo "$miss" | grep -c .) 份"
echo "${miss:-  无}"
