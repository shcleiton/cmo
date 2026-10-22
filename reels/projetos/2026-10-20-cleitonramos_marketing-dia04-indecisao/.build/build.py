# Gera index.html do dia 4 (a objeção errada)
import json, os, re
os.chdir(os.path.join(os.path.dirname(__file__), ".."))
D = 84.61
W = json.load(open("assets/audio/transcript.json"))

chunks, cur = [], []
for w in W:
    cur.append(w)
    if re.search(r"[.?!]$", w["text"]) or (re.search(r"[,:]$", w["text"]) and len(cur) >= 3) or len(cur) >= 6:
        chunks.append(cur); cur = []
if cur: chunks.append(cur)
caps = []
for i, c in enumerate(chunks):
    s = c[0]["start"]; e = chunks[i+1][0]["start"] if i+1 < len(chunks) else D
    ws = "".join(f'<span class="w" data-t="{w["start"]}">{w["text"]}</span> ' for w in c)
    caps.append(f'<div class="cap" data-s="{s}" data-e="{round(e,2)}">{ws.strip()}</div>')

sfx = [("whoosh",0.0,0.3),("impact",3.7,0.4),("pop",6.96,0.3)]
sfx += [("pop",t,0.25) for t in (8.4,8.9,9.4)]
sfx += [("glitch",13.2,0.18),("impact",17.1,0.3),("click",18.6,0.45),("impact",21.4,0.3),("whoosh",24.7,0.3)]
sfx += [("whoosh",26.35,0.3),("pop",26.6,0.3)]
sfx += [("click",t,0.15) for t in (30.75,31.0,31.3,31.7,32.1,32.5,33.85,34.2,34.6,35.0,35.5,35.9)]
sfx += [("whoosh",39.45,0.3),("pop",40.56,0.3),("impact",44.8,0.3),("click",47.9,0.4),("impact",49.9,0.35)]
sfx += [("pop",51.95,0.4),("whoosh",54.85,0.3)]
sfx += [("pop",t,0.25) for t in (57.92,58.52,59.54,60.84)]
sfx += [("whoosh",62.98,0.25)]
sfx += [("click",t,0.15) for t in (66.0,66.3,66.7,67.1,67.5,68.1,68.5,68.9,69.3)]
sfx += [("whoosh",72.15,0.3),("click",78.62,0.5),("impact",78.9,0.35)]
dur = {"whoosh":0.6,"pop":0.7,"impact":2.1,"click":0.4,"glitch":2.6}
sfx_html = "\n".join(
    f'      <audio id="sfx-{k:03d}" src="assets/sfx/{f}.mp3" data-start="{t}" data-duration="{min(dur[f], round(D-t,2))}" data-track-index="{3+k%4}" data-volume="{v}"></audio>'
    for k,(f,t,v) in enumerate(sfx))

def chars(txt):
    return "".join(f'<span class="ch">{c}</span>' for c in txt)

html = open(".build/template.tpl").read()
rep = {"%%D%%": str(D), "%%SFX%%": sfx_html, "%%CAPS%%": "\n".join(caps),
       "%%A1%%": chars("Vai de R$1.500 a R$3.000, conforme o que você precisa."),
       "%%A2%%": chars("Hoje suas vendas vêm mais do Instagram ou do WhatsApp?"),
       "%%C1%%": chars("Oi, conversamos sobre o seu projeto. Isso ainda é prioridade pra você?")}
for k, v in rep.items():
    html = html.replace(k, v)
open("index.html", "w").write(html)
print("ok", len(chunks), "legendas", len(sfx), "sfx")
