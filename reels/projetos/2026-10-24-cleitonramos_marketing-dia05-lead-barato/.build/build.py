# Gera index.html do dia 5 (lead barato, 33 → 110+)
import json, os, re
os.chdir(os.path.join(os.path.dirname(__file__), ".."))
D = 82.65
W = json.load(open("assets/audio/transcript.json"))

# ---------- legendas ----------
chunks, cur = [], []
for w in W:
    cur.append(w)
    if re.search(r"[.?!\"]$", w["text"]) or (re.search(r"[,:]$", w["text"]) and len(cur) >= 3) or len(cur) >= 6:
        chunks.append(cur); cur = []
if cur: chunks.append(cur)
caps = []
for i, c in enumerate(chunks):
    s = c[0]["start"]; e = chunks[i+1][0]["start"] if i+1 < len(chunks) else D
    ws = "".join(f'<span class="w" data-t="{w["start"]}">{w["text"]}</span> ' for w in c)
    caps.append(f'<div class="cap" data-s="{s}" data-e="{round(e,2)}">{ws.strip()}</div>')

# ---------- SFX ----------
sfx = [("whoosh",0.0,0.3)] + [("pop",t,0.25) for t in (0.34,1.06,2.0)]
sfx += [("click",t,0.14) for t in (2.15,2.3,2.45,2.6)] + [("impact",2.75,0.18),("whoosh",3.36,0.25),("pop",4.6,0.25),("impact",5.36,0.2)]
sfx += [("pop",5.9,0.22),("pop",6.1,0.22)] + [("click",t,0.12) for t in (6.25,6.4,6.55,6.7,6.85)] + [("impact",6.96,0.38),("impact",7.96,0.32)]
sfx += [("whoosh",8.85,0.3)] + [("pop",t,0.28) for t in (9.36,9.5,9.64)]
sfx += [("whoosh",10.2,0.3)] + [("pop",t,0.12) for t in (10.6,10.84,11.08)] + [("pop",12.1,0.25)]
sfx += [("whoosh",13.1,0.3),("pop",13.2,0.3),("whoosh",14.7,0.25),("whoosh",15.5,0.22),("pop",17.3,0.3),("glitch",18.3,0.15)]
sfx += [("whoosh",18.92,0.3),("impact",18.98,0.3),("whoosh",21.3,0.25)] + [("pop",round(22.3+k*0.28,2),0.12) for k in range(8)]
sfx += [("whoosh",25.3,0.25),("click",25.9,0.35),("pop",26.8,0.25),("pop",27.2,0.2)] + [("click",t,0.35) for t in (28.4,28.75,29.05)]
sfx += [("whoosh",29.5,0.25),("pop",30.0,0.3),("pop",31.72,0.3),("whoosh",32.72,0.25),("impact",33.4,0.25),("whoosh",33.9,0.22),("pop",34.4,0.3)]
sfx += [("whoosh",37.3,0.3),("impact",38.48,0.32),("whoosh",39.72,0.3),("impact",39.8,0.3),("whoosh",41.92,0.25)]
sfx += [("click",round(43.4+k*0.3,2),0.12) for k in range(12)] + [("pop",45.6,0.25)]
sfx += [("whoosh",47.22,0.25),("whoosh",48.7,0.3),("pop",50.02,0.25),("whoosh",50.42,0.3),("pop",51.3,0.35),("click",52.4,0.5)]
sfx += [("whoosh",53.78,0.3),("impact",53.86,0.3),("whoosh",55.85,0.25)] + [("pop",round(56.6+k*0.16,2),0.15) for k in range(6)]
sfx += [("impact",58.5,0.35),("whoosh",59.6,0.25),("whoosh",60.48,0.25),("pop",61.1,0.3)] + [("pop",t,0.2) for t in (62.0,62.25,62.5)]
sfx += [("whoosh",63.0,0.22)] + [("pop",t,0.3) for t in (65.38,66.82,68.52,70.3)] + [("impact",71.86,0.35)]
sfx += [("click",t,0.12) for t in (71.95,72.1,72.25)]
sfx += [("whoosh",72.5,0.3),("whoosh",73.4,0.22),("impact",75.6,0.35),("whoosh",76.45,0.3),("impact",78.6,0.35),("pop",79.0,0.25),("whoosh",79.7,0.25),("impact",80.75,0.3)]
dur = {"whoosh":0.6,"pop":0.7,"impact":2.1,"click":0.4,"glitch":2.6}
sfx_html = "\n".join(
    f'      <audio id="sfx-{k:03d}" src="assets/sfx/{f}.mp3" data-start="{t}" data-duration="{min(dur[f], round(D-t,2))}" data-track-index="{3+k%4}" data-volume="{v}"></audio>'
    for k,(f,t,v) in enumerate(sfx))

# ---------- peças ----------
def chars(txt):
    return "".join(f'<span class="ch">{c}</span>' for c in txt)

def boneco(bid, kind, style=""):
    body = "#00a897" if kind == "v" else "#E6F7F2"
    head = "#6FD3A0" if kind == "v" else "#ffffff"
    return (f'<svg class="bn" id="{bid}" viewBox="0 0 200 300" style="{style}">'
            f'<rect x="38" y="138" width="124" height="162" rx="62" fill="{body}"/>'
            f'<circle cx="100" cy="82" r="62" fill="{head}"/>'
            f'<circle cx="78" cy="76" r="7.5" fill="#03354e"/><circle cx="122" cy="76" r="7.5" fill="#03354e"/>'
            f'<path id="{bid}-m" d="M84 110 Q100 110 116 110" fill="none" stroke="#03354e" stroke-width="6" stroke-linecap="round"/></svg>')

def mini(mid, x, y, hat=False, ring=False, lead=False):
    r = f'<circle class="ring" id="{mid}-r" cx="50" cy="60" r="40" fill="none" stroke="#6FD3A0" stroke-width="8"/>' if ring else ""
    h = '<polygon points="50,4 34,38 66,38" fill="#ffd66b"/><circle cx="50" cy="4" r="6" fill="#ff7b7b"/>' if hat else ""
    svg = (f'<svg viewBox="0 0 100 170">{r}<rect x="18" y="92" width="64" height="78" rx="32" fill="#E6F7F2"/>{h}'
           f'<circle cx="50" cy="60" r="28" fill="#ffffff"/><circle cx="40" cy="56" r="4.5" fill="#03354e"/><circle cx="60" cy="56" r="4.5" fill="#03354e"/>'
           f'<path d="M40 70 Q50 77 60 70" fill="none" stroke="#03354e" stroke-width="4" stroke-linecap="round"/></svg>')
    tags = ('<span class="gt">GRÁTIS</span>' if hat else "") + (f'<span class="lt" id="{mid}-l">{"LEAD" if lead else "PÚBLICO"}</span>' if (ring or lead) else "")
    return f'<div class="mb" id="{mid}" style="left:{x}px; top:{y}px">{svg}{tags}</div>'

# contexto: multidão do congresso gratuito
c1, c1js = [], []
for i in range(10):
    x, y = 150 + (i % 5) * 160, 720 + (i // 5) * 210
    c1.append(mini(f"a{i}", x, y, hat=True))
    c1js.append(f'tl.fromTo("#a{i}", {{ autoAlpha: 0, x: {700 if i % 2 else -700}, y: -200 }}, {{ autoAlpha: 1, x: 0, y: 0, duration: 0.5, ease: "power3.out" }}, {round(14.7 + i * 0.15, 2)});')
c1js.append('bob("#sX2 .mb", 17.3, 1);')

# ponto 1: quem assistiu vira público
RING = [0, 2, 3, 7, 9, 10]
c2, c2js = [], []
pos2 = [(130 + (i % 6) * 140, 720 + (i // 6) * 220) for i in range(12)]
for i, (x, y) in enumerate(pos2):
    c2.append(mini(f"b{i}", x, y, ring=i in RING))
c2js.append('tl.fromTo("#sP1c .mb", { autoAlpha: 0, scale: 0.5 }, { autoAlpha: 1, scale: 1, duration: 0.25, stagger: 0.04, ease: "back.out(2)" }, 25.4);')
for k, i in enumerate(RING):
    c2js.append(f'tl.fromTo("#b{i}-r", {{ opacity: 0 }}, {{ opacity: 1, duration: 0.2 }}, {round(26.8 + k * 0.07, 2)});')
    c2js.append(f'tl.fromTo("#b{i}-l", {{ autoAlpha: 0, y: 14 }}, {{ autoAlpha: 1, y: 0, duration: 0.25 }}, {round(27.15 + k * 0.05, 2)});')
for i in range(12):
    if i not in RING:
        c2js.append(f'tl.to("#b{i}", {{ opacity: 0.25, duration: 0.3 }}, 27.15);')
aimpts = [pos2[i] for i in (0, 7, 10)]
c2js.append(f'tl.fromTo("#aim", {{ autoAlpha: 0, x: {aimpts[0][0]-25}, y: {aimpts[0][1]-15} }}, {{ autoAlpha: 1, duration: 0.15 }}, 28.35);')
for t, (x, y) in zip((28.75, 29.05), aimpts[1:]):
    c2js.append(f'tl.to("#aim", {{ x: {x-25}, y: {y-15}, duration: 0.22, ease: "power3.inOut" }}, {t - 0.2});')

# ponto 2: quem só queria aula grátis sai
HAT = [0, 2, 3, 6]
c3, c3js = [], []
for i in range(8):
    c3.append(mini(f"c{i}", 110 + i * 110, 760, hat=i in HAT, lead=i not in HAT))
c3js.append('tl.fromTo("#sP2c .mb", { autoAlpha: 0, y: 60 }, { autoAlpha: 1, y: 0, duration: 0.3, stagger: 0.05, ease: "back.out(2)" }, 47.3);')
for k, i in enumerate(HAT):
    c3js.append(f'tl.to("#c{i}", {{ x: -260 - {k * 40}, y: 420, autoAlpha: 0, rotation: -25, duration: 0.6, ease: "power2.in" }}, {round(48.62 + k * 0.08, 2)});')
for i in range(8):
    if i not in HAT:
        c3js.append(f'tl.fromTo("#c{i}-l", {{ autoAlpha: 0, y: 14 }}, {{ autoAlpha: 1, y: 0, duration: 0.25 }}, 50.02);')
c3js.append('bob(["#c1","#c4","#c5","#c7"], 50.05, 1);')

cal = "".join(f"<i>{n}<b></b></i>" for n in range(1, 16))
drops = "".join('<i class="drop"></i>' for _ in range(5))

def days(prefix, after):
    out = ""
    for i in range(3):
        x = 120 + i * 290
        inner = f'<p class="dh">DIA {i+1}</p>'
        if not after:
            inner += f'<div class="blk" style="top:{100}px; left:{24 + (i % 2) * 14}px">PALESTRA</div>'
            inner += f'<div class="blk" style="top:{214}px; left:{36 - (i % 2) * 14}px">PALESTRA</div>'
            if i == 0:
                inner += '<div class="ofr" id="oA" style="background:#ff7b7b; color:#ffffff; top:330px">OFERTA</div>'
        else:
            lab, st = [("O PROBLEMA", "background:#ff7b7b; color:#ffffff"),
                       ("O DIAGNÓSTICO", "background:#ffffff; color:#03354e"),
                       ("A SOLUÇÃO", "background:#6FD3A0; color:#03354e")][i]
            inner += f'<div class="crd" id="cB{i}" style="{st}">{lab}</div>'
            if i == 1:
                inner += '<div id="sol">TEM SOLUÇÃO →</div>'
            if i == 2:
                inner += '<div class="ofr" id="oB" style="background:#6FD3A0; color:#03354e">OFERTA</div>'
            inner += '<div class="hc">HOST</div>'
        out += f'<div class="dc" style="left:{x}px">{inner}</div>'
    return out

html = open(".build/template.tpl").read()
rep = {"%%D%%": str(D), "%%SFX%%": sfx_html, "%%CAPS%%": "\n".join(caps),
       "%%CROWD1%%": "".join(c1), "%%CROWD1JS%%": "\n      ".join(c1js),
       "%%CROWD2%%": "".join(c2), "%%CROWD2JS%%": "\n      ".join(c2js),
       "%%CROWD3%%": "".join(c3), "%%CROWD3JS%%": "\n      ".join(c3js),
       "%%CAL%%": cal, "%%DROPS%%": drops,
       "%%ADTXT%%": chars("Congresso online de 3 dias. No final, eu vou apresentar uma oferta."),
       "%%DAYS_A%%": days("a", False), "%%DAYS_B%%": days("b", True),
       "%%B_h%%": boneco("h", "v", "width:150px; height:225px")}
for k, v in rep.items():
    html = html.replace(k, v)
open("index.html", "w").write(html)
print("ok", len(chunks), "legendas", len(sfx), "sfx")
