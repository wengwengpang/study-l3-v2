"""把书的每一章 Markdown 转成手机能读的网页。只支持书里用到的写法，只用标准库。
用法（在项目根目录跑）: python3 book/build.py
每一章 book/lecXX.md 生成两份，都放在 book/out/（不进 git）：
  lecXX.html       离线单文件网页，拷到手机上用浏览器直接打开
  lecXX.page.html  发布成 claude.ai 私有网页用的页面内容
页面标题取这一章的第一行大标题。
"""
import glob
import html
import os
import re

CSS = """
/* 版式：单栏阅读页，一行约 34 个汉字；标题用宋体，正文用系统黑体；红黄绿三色只用在三种牌子上 */
:root {
  --bg: #F5F6F3; --surface: #ECEEE9; --fg: #1C2321; --muted: #5B6763; --rule: #D5DAD4;
  --accent: #1D6B58; --allow: #2B7A4B; --ask: #9A6A12; --deny: #AE3327; --code-bg: #E6E9E3;
  --font-display: "Songti SC", "STSong", "Noto Serif CJK SC", "Source Han Serif SC", "SimSun", serif;
  --font-body: -apple-system, "PingFang SC", "HarmonyOS Sans SC", "MiSans", "Noto Sans CJK SC", "Microsoft YaHei", sans-serif;
  --font-mono: ui-monospace, "SF Mono", "Cascadia Code", Consolas, "Noto Sans Mono CJK SC", monospace;
}
@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) {
    --bg: #131816; --surface: #1B2220; --fg: #E2E8E4; --muted: #96A39D; --rule: #2A3430;
    --accent: #62C4A7; --allow: #6FC48E; --ask: #E1B458; --deny: #EE8478; --code-bg: #202825;
    color-scheme: dark;
  }
}
:root[data-theme="dark"] {
  --bg: #131816; --surface: #1B2220; --fg: #E2E8E4; --muted: #96A39D; --rule: #2A3430;
  --accent: #62C4A7; --allow: #6FC48E; --ask: #E1B458; --deny: #EE8478; --code-bg: #202825;
  color-scheme: dark;
}
body {
  margin: 0;
  background: var(--bg); color: var(--fg);
  font-family: var(--font-body); font-size: 17px; line-height: 1.9;
  padding-inline: 20px; padding-block: 28px 72px;
}
main { max-width: 36rem; margin-inline: auto; }
main > * { margin-block: 0; }
main > * + * { margin-top: 1.05em; }
h1, h2, h3 { font-family: var(--font-display); font-weight: 700; line-height: 1.35; text-wrap: balance; }
h1 { font-size: 1.9rem; letter-spacing: .01em; }
.cards { display: flex; gap: 6px; margin-top: .9em; }
.cards i { width: 22px; height: 6px; display: block; }
.cards .a { background: var(--allow); } .cards .q { background: var(--ask); } .cards .d { background: var(--deny); }
main > h2 { font-size: 1.42rem; margin-top: 2.6em; padding-top: 1.1em; border-top: 1px solid var(--rule); }
main > h3 { font-size: 1.14rem; margin-top: 2em; color: var(--accent); }
p > strong:first-child { color: var(--accent); }
strong.k-allow { color: var(--allow); } strong.k-ask { color: var(--ask); } strong.k-deny { color: var(--deny); }
a { color: var(--accent); text-underline-offset: 3px; }
a:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }
ul, ol { padding-left: 1.4em; display: flex; flex-direction: column; gap: .35em; }
blockquote { margin-inline: 0; padding: .15em 0 .15em 1em; border-left: 2px solid var(--rule); color: var(--muted); }
code { font-family: var(--font-mono); font-size: .88em; background: var(--code-bg); padding: .1em .32em; border-radius: 3px; overflow-wrap: anywhere; }
pre { background: var(--code-bg); padding: .9em 1em; border-radius: 4px; overflow-x: auto; line-height: 1.65; }
pre code { background: none; padding: 0; font-size: .82em; overflow-wrap: normal; white-space: pre; }
.tbl { overflow-x: auto; }
table { border-collapse: collapse; width: 100%; font-size: .9em; line-height: 1.7; }
th, td { text-align: left; vertical-align: top; padding: .55em .7em .55em 0; border-bottom: 1px solid var(--rule); }
th { font-weight: 600; color: var(--muted); font-size: .92em; white-space: nowrap; }
nav.toc { background: var(--surface); padding: .9em 1.1em; font-size: .92em; line-height: 1.75; }
nav.toc b { display: block; color: var(--muted); font-weight: 600; letter-spacing: .08em; font-size: .86em; }
nav.toc ol { margin: .3em 0 0; gap: .1em; }
hr { border: 0; border-top: 1px solid var(--rule); }
"""

KEY = {"绿牌": "k-allow", "黄牌": "k-ask", "红牌": "k-deny"}


def inline(text):
    parts = re.split(r"(`[^`]+`)", text)
    out = []
    for part in parts:
        if part.startswith("`") and part.endswith("`") and len(part) > 1:
            out.append("<code>" + html.escape(part[1:-1]) + "</code>")
            continue
        esc = html.escape(part, quote=False)

        def bold(m):
            body = m.group(1)
            cls = next((c for k, c in KEY.items() if body.startswith(k)), None)
            return f'<strong class="{cls}">{body}</strong>' if cls else f"<strong>{body}</strong>"

        out.append(re.sub(r"\*\*(.+?)\*\*", bold, esc))
    return "".join(out)


def convert(md):
    lines = md.split("\n")
    body, toc = [], []
    i, n = 0, len(lines)
    while i < n:
        line = lines[i]
        if not line.strip():
            i += 1
        elif line.startswith("```"):
            i += 1
            buf = []
            while i < n and not lines[i].startswith("```"):
                buf.append(lines[i])
                i += 1
            i += 1
            body.append("<pre><code>" + html.escape("\n".join(buf)) + "</code></pre>")
        elif line.startswith("# "):
            body.append("<h1>" + inline(line[2:]) + '</h1>\n<div class="cards" aria-hidden="true"><i class="a"></i><i class="q"></i><i class="d"></i></div>')
            body.append("<!--TOC-->")
            i += 1
        elif line.startswith("## "):
            sid = f"s{len(toc) + 1}"
            toc.append((sid, line[3:]))
            body.append(f'<h2 id="{sid}">' + inline(line[3:]) + "</h2>")
            i += 1
        elif line.startswith("### "):
            body.append("<h3>" + inline(line[4:]) + "</h3>")
            i += 1
        elif line.strip() == "---":
            body.append("<hr>")
            i += 1
        elif line.startswith("|"):
            rows = []
            while i < n and lines[i].startswith("|"):
                rows.append([c.strip() for c in lines[i].strip().strip("|").split("|")])
                i += 1
            head, data = rows[0], rows[2:]
            t = ['<div class="tbl"><table><thead><tr>' + "".join(f"<th>{inline(c)}</th>" for c in head) + "</tr></thead><tbody>"]
            for r in data:
                t.append("<tr>" + "".join(f"<td>{inline(c)}</td>" for c in r) + "</tr>")
            t.append("</tbody></table></div>")
            body.append("".join(t))
        elif line.startswith("> "):
            buf = []
            while i < n and lines[i].startswith(">"):
                buf.append(lines[i][1:].strip())
                i += 1
            body.append("<blockquote>" + inline(" ".join(buf)) + "</blockquote>")
        elif re.match(r"^(- |\d+\. )", line):
            ordered = not line.startswith("- ")
            pat = r"^\d+\. " if ordered else r"^- "
            items = []
            while i < n and re.match(pat, lines[i]):
                items.append(re.sub(pat, "", lines[i], count=1))
                i += 1
            tag = "ol" if ordered else "ul"
            body.append(f"<{tag}>" + "".join(f"<li>{inline(x)}</li>" for x in items) + f"</{tag}>")
        else:
            buf = []
            while i < n and lines[i].strip() and not re.match(r"^(#|```|\||> |- |\d+\. |---$)", lines[i]):
                buf.append(lines[i].strip())
                i += 1
            body.append("<p>" + inline("".join(buf)) + "</p>")
    nav = '<nav class="toc" aria-label="目录"><b>目录</b><ol>' + "".join(
        f'<li><a href="#{sid}">{html.escape(t)}</a></li>' for sid, t in toc) + "</ol></nav>"
    return "\n".join(body).replace("<!--TOC-->", nav)


def build(src, out_dir):
    with open(src, encoding="utf-8") as fh:
        md = fh.read()
    first = re.search(r"^# (.+)$", md, flags=re.M)
    title = re.sub(r"\s+", " ", first.group(1)).strip() if first else os.path.basename(src)
    page = f"<title>{html.escape(title)}</title>\n<style>{CSS}</style>\n<main>\n{convert(md)}\n</main>\n"
    offline = ('<!doctype html>\n<html lang="zh-CN">\n<head>\n<meta charset="utf-8">\n'
               '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
               + page.replace("<main>", "</head>\n<body>\n<main>", 1) + "</body>\n</html>\n")
    name = os.path.splitext(os.path.basename(src))[0]
    for suffix, text in ((".html", offline), (".page.html", page)):
        with open(os.path.join(out_dir, name + suffix), "w", encoding="utf-8") as out:
            out.write(text)
    print(f"{name}: 「{title}」 源 {len(md)} 字符，离线网页 {len(offline)} 字符")


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(here, "out")
    os.makedirs(out_dir, exist_ok=True)
    chapters = sorted(glob.glob(os.path.join(here, "lec*.md")))
    if not chapters:
        print("book/ 下没有 lec*.md，没有可转的章")
    for src in chapters:
        build(src, out_dir)


if __name__ == "__main__":
    main()
