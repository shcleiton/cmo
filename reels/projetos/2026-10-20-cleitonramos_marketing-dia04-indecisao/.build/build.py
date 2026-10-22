# Gera index.html do dia 4 (a objeção errada), v2: ritmo por frase, câmera, bonecos
import json, os, re
os.chdir(os.path.join(os.path.dirname(__file__), ".."))
D = 84.61
W = json.load(open("assets/audio/transcript.json"))

# ---------- legendas ----------
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

# ---------- SFX ----------
sfx = [("whoosh",0.0,0.3)] + [("pop",t,0.12) for t in (0.4,0.9,1.4,1.9,2.4,2.9)]
sfx += [("impact",3.7,0.4),("pop",6.96,0.3)] + [("pop",t,0.28) for t in (8.42,9.0,9.56)]
sfx += [("whoosh",10.45,0.3),("glitch",13.22,0.16),("whoosh",14.75,0.25),("pop",15.9,0.2),("pop",16.4,0.2),("impact",17.08,0.32)]
sfx += [("click",18.6,0.45),("whoosh",21.3,0.25),("pop",22.54,0.3),("whoosh",24.65,0.3),("click",25.3,0.3)]
sfx += [("whoosh",26.35,0.3),("pop",26.5,0.35),("click",28.3,0.35)]
sfx += [("click",t,0.14) for t in (30.75,31.0,31.3,31.7,32.1,32.5,33.85,34.2,34.6,35.0,35.5,35.9)]
sfx += [("whoosh",36.6,0.25),("pop",37.4,0.3)]
sfx += [("whoosh",39.45,0.3),("impact",39.6,0.3),("click",41.2,0.35),("pop",42.5,0.3),("impact",44.6,0.3)]
sfx += [("pop",t,0.15) for t in (47.6,47.9,48.2,48.5,48.8,49.1)]
sfx += [("impact",49.8,0.35),("whoosh",51.8,0.3),("pop",52.1,0.4),("whoosh",54.85,0.3)]
sfx += [("pop",t,0.26) for t in (57.92,58.52,59.54,60.84)]
sfx += [("whoosh",62.95,0.25)] + [("click",t,0.12) for t in (63.1,63.25,63.4,63.55,63.7,63.85)]
sfx += [("click",64.4,0.35)] + [("click",t,0.14) for t in (66.0,66.3,66.7,67.1,67.5,68.1,68.5,68.9,69.3)]
sfx += [("pop",t,0.25) for t in (70.0,70.4,70.8)]
sfx += [("whoosh",72.15,0.3),("impact",76.6,0.25),("click",78.62,0.5),("impact",78.9,0.32),("impact",81.7,0.3)]
dur = {"whoosh":0.6,"pop":0.7,"impact":2.1,"click":0.4,"glitch":2.6}
sfx_html = "\n".join(
    f'      <audio id="sfx-{k:03d}" src="assets/sfx/{f}.mp3" data-start="{t}" data-duration="{min(dur[f], round(D-t,2))}" data-track-index="{3+k%4}" data-volume="{v}"></audio>'
    for k,(f,t,v) in enumerate(sfx))

# ---------- peças ----------
def chars(txt):
    return "".join(f'<span class="ch">{c}</span>' for c in txt)

def boneco(bid, kind):
    body = "#00a897" if kind == "v" else "#E6F7F2"
    head = "#6FD3A0" if kind == "v" else "#ffffff"
    return (f'<svg class="bn" id="{bid}" viewBox="0 0 200 300">'
            f'<rect x="38" y="138" width="124" height="162" rx="62" fill="{body}"/>'
            f'<circle cx="100" cy="82" r="62" fill="{head}"/>'
            f'<circle class="eye" cx="78" cy="76" r="7.5" fill="#03354e"/><circle class="eye" cx="122" cy="76" r="7.5" fill="#03354e"/>'
            f'<path id="{bid}-m" d="M82 106 Q100 116 118 106" fill="none" stroke="#03354e" stroke-width="6" stroke-linecap="round"/></svg>')

# parede de conversas (ordem fixa, sem aleatoriedade)
order = [(i * 37) % 54 for i in range(54)]
wall = "".join(f'<i class="wb{" r" if (k % 3 == 0) else ""}" id="wb{k}"></i>' for k in range(54))
# grade de 100 pontos, 50 marcados (padrão fixo)
marked = sorted({(i * 47 + 13) % 100 for i in range(50)})
while len(marked) < 50:
    marked.append(max(set(range(100)) - set(marked)))
dots = "".join(f'<i class="dt" id="dt{k}"></i>' for k in range(100))
# moedas que escapam
coins = "".join(f'<i class="coin" id="cn{k}">R$</i>' for k in range(6))

html = open(".build/template.tpl").read()
rep = {"%%D%%": str(D), "%%SFX%%": sfx_html, "%%CAPS%%": "\n".join(caps),
       "%%A1%%": chars("Vai de R$1.500 a R$3.000, conforme o que você precisa."),
       "%%A2%%": chars("Hoje suas vendas vêm mais do Instagram ou do WhatsApp?"),
       "%%C1%%": chars("Oi, conversamos sobre o seu projeto. Isso ainda é prioridade pra você?"),
       "%%WALL%%": wall, "%%WALLORDER%%": json.dumps(order), "%%DOTS%%": dots, "%%MARKED%%": json.dumps(marked),
       "%%COINS%%": coins}
for k in ["c1","v1","c2","v2","c3","c4","c5","c6"]:
    rep[f"%%B_{k}%%"] = boneco(k, k[0])
for k, v in rep.items():
    html = html.replace(k, v)
open("index.html", "w").write(html)
print("ok", len(chunks), "legendas", len(sfx), "sfx")
