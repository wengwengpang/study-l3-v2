#!/bin/bash
# 资料管理员机械体检（S1 到 S5）：只读，不改任何文件，结果打印到屏幕。
# 范围：docs/ 下全部 .md（除 DECISIONS-*，那是历史记录）、CLAUDE.md、.claude/agents/。
# 出处：DECISIONS-R1 R1-99、R1-100；审查 2-4、2-5（R1-3）。
# 用法：在项目里任意目录跑 bash scripts/doc-check.sh
set -u
cd "$(git rev-parse --show-toplevel)" || exit 1

files=$(git ls-files 'docs/*.md' 'CLAUDE.md' '.claude/agents/*.md' | grep -v '^docs/DECISIONS-')

# 四份编号清单，各取编号，每行一个
rule_ids() {  # COURSE_RULES：1-36 块里的「N. 」加「## N · 」标题
  awk '/^## 1-36 · /{b=1; next}
       /^## [0-9]+ · /{b=0; sub(/^## /,""); sub(/ ·.*/,""); print; next}
       b && /^[0-9]+\. /{sub(/\..*/,""); print}' docs/COURSE_RULES.md
}
anti_ids()      { grep -oE '^## [0-9]+ 号' docs/lessons/anti-patterns.md | grep -oE '[0-9]+'; }
backlog_ids()   { grep -oE '^[0-9]+ \|' docs/BACKLOG.md | grep -oE '[0-9]+'; }
principle_ids() { awk '/^## 四、/{b=1; next} /^## /{b=0} b && /^[0-9]+\. /{sub(/\..*/,""); print}' docs/HARNESS.md; }

# 引用：前缀后跟号，含「规则 45、61、67」这种顿号连写；输出「号<TAB>文件:行」
# 已知漏：「规则 1 到 7」只取 1；只认阿拉伯数字
refs() {
  grep -noE "$1 ?[0-9]+(、[0-9]+)*" $files | while IFS=: read -r f l m; do
    for n in $(echo "$m" | grep -oE '[0-9]+'); do printf '%s\t%s:%s\n' "$n" "$f" "$l"; done
  done
}

# S1、S2：总数、最大号、缺号、重号
list_stats() {  # $1 名称，$2 取号函数
  local ids max dup gap
  ids=$($2 | sort -n)
  max=$(echo "$ids" | tail -1)
  dup=$(echo "$ids" | uniq -d | tr '\n' ' ')
  gap=$(seq 1 "$max" | grep -vxF -f <(echo "$ids") | tr '\n' ' ')
  echo "  $1：共 $(echo "$ids" | grep -c .) 条，最大号 $max；缺号：${gap:-无}；重号：${dup:-无}"
}

# S3：引用了但清单里没有的号
dangling() {  # $1 名称，$2 引用前缀，$3 取号函数
  local ids out
  ids=" $($3 | tr '\n' ' ') "
  out=$(refs "$2" | sort -u | while IFS=$'\t' read -r n loc; do
    case "$ids" in *" $n "*) ;; *) echo "  $1 $n ← $loc" ;; esac
  done)
  echo "${out:-  $1：无}"
}

# S4：清单里有、全范围一次都没写到「前缀 N」的号（自己那节提到自己也算被引用）
unreferenced() {  # $1 名称，$2 引用前缀，$3 取号函数
  local used none
  used=" $(refs "$2" | cut -f1 | sort -un | tr '\n' ' ') "
  none=$($3 | sort -un | while read -r n; do
    case "$used" in *" $n "*) ;; *) printf '%s ' "$n" ;; esac
  done)
  echo "  $1：${none:-无}"
}

echo "== 资料体检 $(date '+%F %T')  提交 $(git log --oneline -1 | cut -d' ' -f1)"
echo "== 范围：$(echo "$files" | grep -c .) 份文件"
echo
echo "== S1、S2 编号清单"
list_stats "规则（COURSE_RULES）" rule_ids
list_stats "反模式（anti-patterns）" anti_ids
list_stats "BACKLOG" backlog_ids
list_stats "原则（HARNESS 第四节）" principle_ids
echo
echo "== S3 指空的引用（写了号，清单里没有）"
dangling "规则" "规则" rule_ids
dangling "反模式" "反模式" anti_ids
dangling "BACKLOG" "BACKLOG" backlog_ids
dangling "原则" "原则" principle_ids
echo
echo "== S4 从没被引用过的号（删并候选，删不删学生判）"
unreferenced "规则" "规则" rule_ids
unreferenced "反模式" "反模式" anti_ids
unreferenced "BACKLOG" "BACKLOG" backlog_ids
unreferenced "原则" "原则" principle_ids
echo
echo "== S5 各文件行数"
wc -l $files | sort -rn | sed 's/^/  /'
