#!/usr/bin/env bash
# 体检报告原样核对，只读。
# 用法：在项目根目录跑 bash scripts/report-check.sh。最后一行是「两项一致」、退出码 0 才算过。
# 查两项：一，docs/LIBRARIAN_REPORT.md 与管理员最后一条返回是否相同（查 CC 存档）；
#         二，报告栏 1 与管理员跑脚本那次的原样输出是否相同（查管理员有没有删改）。
# 记录取最近一次资料管理员子代理的记录（~/.claude/projects/ 下 subagents/ 目录，按 agentType 认）。
# 出处：DECISIONS-R1 R1-128、R1-129（第四份审查点 9）、R1-130 问 134A。
set -u
proj="$HOME/.claude/projects/$(pwd | sed 's#/#-#g')"

python3 - "$proj" <<'EOF'
import glob, json, os, sys

metas = [m for m in glob.glob(os.path.join(sys.argv[1], '*', 'subagents', 'agent-*.meta.json'))
         if json.load(open(m)).get('agentType') == 'librarian']
if not metas:
    print('找不到资料管理员子代理记录')
    sys.exit(1)
log = max(metas, key=os.path.getmtime).replace('.meta.json', '.jsonl')
print('核对记录：' + log)

last, raw = '', ''
for line in open(log):
    d = json.loads(line)
    c = d.get('message', {}).get('content')
    if not isinstance(c, list):
        continue
    for b in c:
        if d.get('type') == 'assistant' and b.get('type') == 'text':
            last = b['text']
        if b.get('type') == 'tool_result':
            x = b.get('content')
            s = x if isinstance(x, str) else ''.join(i.get('text', '') for i in x if isinstance(i, dict))
            if '== 资料体检' in s:
                raw = s

report = open('docs/LIBRARIAN_REPORT.md').read()
bad = False

if report.rstrip('\n') != last.rstrip('\n'):
    bad = True
    print('一，报告与管理员最后一条返回不同')

col1, inside = [], False
for l in report.splitlines():
    if l.startswith('## 栏 1'):
        inside = True
        continue
    if l.startswith('## 栏 2'):
        break
    if inside and l.strip() and l.strip() != '```':
        col1.append(l)
raw_lines = [l for l in raw.splitlines() if l.strip()]
if not raw_lines:
    bad = True
    print('二，记录里找不到脚本输出')
elif col1 != raw_lines:
    bad = True
    print('二，报告栏 1 与脚本原样输出不同：')
    for l in raw_lines:
        if l not in col1:
            print('  栏 1 缺：' + l)
    for l in col1:
        if l not in raw_lines:
            print('  栏 1 多：' + l)

print('有差异，停下报学生' if bad else '两项一致')
sys.exit(1 if bad else 0)
EOF
