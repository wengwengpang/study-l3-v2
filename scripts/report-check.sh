#!/usr/bin/env bash
# 体检报告原样核对，只读。
# 用法：在项目根目录跑 bash scripts/report-check.sh [核对记录路径]。最后一行是「两项一致」、退出码 0 才算过。
# 查两项：一，docs/LIBRARIAN_REPORT.md「## 栏 6」之前与管理员最后一条返回是否相同（查 CC 存档；栏 6「学生选择」由 CC 事后填，不核）；
#         二，报告栏 1 与管理员跑脚本那次的原样输出是否相同（查管理员有没有删改）。
# 记录：传了路径就核那份；不传取最近一次资料管理员子代理的记录（~/.claude/projects/ 下 subagents/ 目录，按 agentType 认）。首行打出所用路径，存档时记进 DECISIONS-R1，以后重跑带上。
# 脚本输出取命令含 scripts/doc-check.sh 的那次调用，从「== 资料体检」行取到尾（管理员连着别的命令跑也取得对）；同一次调用在记录里会存几遍，按 id 归拢，几份不一样就停下报；按 id 算跑过不止一次也停下报。栏 1 只比代码框里的行（清单 G10、问 333、问 569 A）。
# 出处：DECISIONS-R1 R1-128、R1-129（第四份审查点 9）、R1-130 问 134A、R1-132 问 138A、R1-148 问 150A、151A。
set -u
proj="$HOME/.claude/projects/$(pwd | sed 's#/#-#g')"

python3 - "$proj" "${1:-}" <<'EOF'
import glob, json, os, sys

if sys.argv[2]:
    log = sys.argv[2]
    if not os.path.isfile(log):
        print('找不到核对记录：' + log)
        sys.exit(1)
else:
    metas = [m for m in glob.glob(os.path.join(sys.argv[1], '*', 'subagents', 'agent-*.meta.json'))
             if json.load(open(m)).get('agentType') == 'librarian']
    if not metas:
        print('找不到资料管理员子代理记录')
        sys.exit(1)
    log = max(metas, key=os.path.getmtime).replace('.meta.json', '.jsonl')
print('核对记录：' + log)

last, raws, ids = '', {}, set()
for line in open(log):
    d = json.loads(line)
    c = d.get('message', {}).get('content')
    if not isinstance(c, list):
        continue
    for b in c:
        if d.get('type') == 'assistant' and b.get('type') == 'text':
            last = b['text']
        if b.get('type') == 'tool_use' and 'scripts/doc-check.sh' in str(b.get('input', {}).get('command', '')):
            ids.add(b['id'])
        if b.get('type') == 'tool_result' and b.get('tool_use_id') in ids:
            x = b.get('content')
            t = '\n' + (x if isinstance(x, str) else ''.join(i.get('text', '') for i in x if isinstance(i, dict)))
            k = t.find('\n== 资料体检')
            if k >= 0:
                raws.setdefault(b['tool_use_id'], []).append(t[k + 1:])  # 同一次调用在记录里会存几遍，按 id 归拢（清单 G10）

report = open('docs/LIBRARIAN_REPORT.md').read()
bad = False

def body(s):  # 只取「## 栏 6」之前；栏 6 由 CC 事后照学生原话填，不核（问 150A）
    k = s.find('\n## 栏 6')
    return (s if k < 0 else s[:k]).rstrip('\n')

if body(report) != body(last):
    bad = True
    print('一，报告栏 6 之前与管理员最后一条返回不同')

if any(len(set(v)) > 1 for v in raws.values()):
    bad = True
    print('二，同一次调用在记录里存的几份返回不一样')

col1, inside, fence = [], False, False
for l in report.splitlines():
    if l.startswith('## 栏 1'):
        inside = True
        continue
    if l.startswith('## 栏 2'):
        break
    if inside and l.strip().startswith('```'):  # 只取代码框里的行，框外的说明不是脚本输出（问 333）
        fence = not fence
        continue
    if inside and fence and l.strip():
        col1.append(l)
raw_lines = [l for l in (list(raws.values())[-1][0] if raws else '').splitlines() if l.strip()]
if len(raws) > 1:
    bad = True
    print('二，记录里 doc-check.sh 跑了 %d 次，分不清报告用的是哪次' % len(raws))
elif not raw_lines:
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
