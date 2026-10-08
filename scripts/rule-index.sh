#!/bin/bash
# 规则一览：只读，按需打印 COURSE_RULES 每条规则的编号与标题，不存进任何文件，防副本过期（DECISIONS-R1 R1-8 第二点第 2 条、R1-176 问 167A）。
# 1-36 块取「N. 」行第一个句号前的字，37 起取「## N · 」标题。号段、留空、条数见 COURSE_RULES 文件头。
# 用法：在项目里任意目录跑 bash scripts/rule-index.sh
set -u
cd "$(git rev-parse --show-toplevel)" || exit 1
awk '/^## 1-36 · /{b=1; next}
     /^## [0-9]+ · /{b=0; s=$0; sub(/^## /, "", s); print s; next}
     b && /^[0-9]+\. /{n=$0; sub(/\..*/, "", n); t=$0; sub(/^[0-9]+\. /, "", t); sub(/。.*/, "", t); print n " · " t}' docs/COURSE_RULES.md
