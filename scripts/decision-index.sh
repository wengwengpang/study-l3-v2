#!/bin/bash
# 决策记录目录：只读，按需打印 DECISIONS-R1 或 DECISIONS-G1 每条记录的编号、日期、提交号与标题，不存进任何文件，防副本过期（DECISIONS-R1 R1-487、R1-488 问 502 A；先例 rule-index.sh）。
# 日期与提交号取自 git blame，即这条标题行最初写进仓库的那次提交；要看那次改了哪些文件，跑 git show --stat <提交号>。
# 用法：在项目里任意目录跑 bash scripts/decision-index.sh [R1|G1] [关键词]，不带参数即 R1 全部。
set -u
cd "$(git rev-parse --show-toplevel)" || exit 1
which=${1:-R1}
key=${2:-}
case "$which" in
  R1) file=docs/DECISIONS-R1.md; pat='^--- R1-[0-9]+ · ' ;;
  G1) file=docs/DECISIONS-G1.md; pat='^--- 补遗 [0-9]+ · ' ;;
  *) echo "第一个参数只认 R1 或 G1"; exit 2 ;;
esac
git blame --date=short -c "$file" \
  | awk -F'\t' -v pat="$pat" '{
      text=$4; sub(/^[0-9]+\)/, "", text)
      if (text ~ pat) {
        sha=substr($1, 1, 7); date=$3
        sub(/^--- /, "", text); sub(/ ?---$/, "", text)
        sep=" · "; i=index(text, sep)
        print substr(text, 1, i-1) " | " date " | " sha " | " substr(text, i+length(sep))
      }
    }' \
  | { if [ -n "$key" ]; then grep -F -- "$key"; else cat; fi; }
