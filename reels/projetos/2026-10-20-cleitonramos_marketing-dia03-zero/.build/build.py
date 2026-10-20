# Gera index.html do dia 3 (o zero confortável)
import json, os, re
os.chdir(os.path.join(os.path.dirname(__file__), ".."))
D = 77.56
W = json.load(open("assets/audio/transcript.json"))

# ---------- legendas (palavra a palavra, a partir de 6.7s) ----------
chunks, cur = [], []
for w in W:
    if w["start"] < 6.7:
        continue
    cur.append(w)
    end_punct = re.search(r"[.?!:,]$", w["text"])
    if (end_punct and len(cur) >= 3) or len(cur) >= 6 or re.search(r"[.?!]$", w["text"]):
        chunks.append(cur); cur = []
if cur: chunks.append(cur)
cap_html = []
for i, c in enumerate(chunks):
    s = c[0]["start"]; e = chunks[i+1][0]["start"] if i+1 < len(chunks) else D
    words = "".join(f'<span class="w" data-t="{w["start"]}">{w["text"]}</span> ' for w in c)
    cap_html.append(f'<div class="cap" data-s="{s}" data-e="{round(e,2)}">{words.strip()}</div>')

# ---------- SFX ----------
sfx = [("impact",0.0,0.3),("pop",4.92,0.35)]
sfx += [("click",t,0.3) for t in (7.35,8.15,9.3,10.0,10.35)]
sfx += [("pop",t,0.22) for t in (11.3,11.75,12.2,12.65,13.12)]
sfx += [("click",t,0.6) for t in (14.08,14.86,15.3)]
sfx += [("whoosh",17.72,0.45),("impact",18.08,0.35)]
sfx += [("click",t,0.16) for t in (20.85,21.05,21.25,21.7,21.9,22.15,22.75,22.95,23.3,24.75,24.95,25.2,25.5)]
sfx += [("impact",26.62,0.38),("whoosh",27.55,0.3)]
sfx += [("pop",t,0.18) for t in (28.45,29.0,29.45,29.85,30.2,30.5,30.8,31.05,31.3,31.55)]
sfx += [("whoosh",32.14,0.22),("pop",33.84,0.22),("pop",34.05,0.22),("pop",34.25,0.22),("whoosh",34.78,0.3)]
sfx += [("pop",t,0.32) for t in (36.94,38.14,39.8)]
sfx += [("whoosh",43.3,0.3),("impact",45.38,0.3),("click",47.48,0.45),("whoosh",50.45,0.25),("impact",52.78,0.3),("click",53.1,0.45)]
sfx += [("whoosh",54.05,0.25),("impact",56.14,0.3),("pop",57.54,0.3),("pop",58.14,0.3),("pop",58.74,0.3)]
sfx += [("whoosh",59.25,0.25),("impact",60.3,0.4),("whoosh",61.8,0.28),("whoosh",63.45,0.3)]
sfx += [("pop",65.22,0.35),("whoosh",68.4,0.3),("click",72.24,0.4),("impact",72.55,0.35),("impact",73.3,0.32),("pop",76.64,0.35)]
dur = {"whoosh":0.6,"pop":0.7,"impact":2.1,"click":0.4,"glitch":2.6}
sfx_html = "\n".join(
    f'      <audio id="sfx-{k:03d}" src="assets/sfx/{f}.mp3" data-start="{t}" data-duration="{min(dur[f], round(D-t,2))}" data-track-index="{2+k%4}" data-volume="{v}"></audio>'
    for k,(f,t,v) in enumerate(sfx))

# ---------- peças ----------
def chars(txt, cls):
    return f'<p class="{cls}">' + "".join(f'<span class="ch">{c}</span>' for c in txt) + "</p>"

offer = [("PRA QUEM", "Pra clínicas com horário vazio."),
         ("O QUE RESOLVE", "Monto sua captação em 30 dias."),
         ("QUANTO E ATÉ QUANDO", "R$900, só até sexta."),
         ("", "Posso te mandar como funciona?")]
offer_html = "".join(
    f'<div class="ol" id="ol{i}">' + (f'<span class="otag" id="ot{i}">{t}</span>' if t else '') + chars(x, "otx") + "</div>"
    for i,(t,x) in enumerate(offer))

avatars = "".join(f'<div class="av" id="av{i}"><i class="tick" id="tk{i}"></i></div>' for i in range(30))
days = "".join(f'<span class="day" id="d{i}">{d}</span>' for i,d in enumerate(["SEG","TER","QUA","QUI","SEX","SÁB","DOM"]))
todo = ["CORES DA MARCA","BIO NOVA","LOGO","SITE","FOTO NOVA","MAIS UM CURSO"]
todo_html = "".join(f'<div class="td" id="td{i}"><b class="box" id="bx{i}"></b>{t}</div>' for i,t in enumerate(todo))
naos = "".join(f'<span class="nao" id="nao{i}">NÃO</span>' for i in range(5))
roll = '<span class="roll"><span class="strip">' + "".join(f"<i>{n}</i>" for n in "0123456789?") + "</span></span>"

EYE = '<svg viewBox="0 0 48 48"><path d="M3 24s8-13 21-13 21 13 21 13-8 13-21 13S3 24 3 24z"/><circle cx="24" cy="24" r="6"/></svg>'
CHAT = '<svg viewBox="0 0 48 48"><path d="M8 10h32v22H22l-9 7v-7H8z"/></svg>'
TAG = '<svg viewBox="0 0 48 48"><path d="M24 6h16v16L22 40 8 26z"/><circle cx="33" cy="15" r="3"/></svg>'
CART = '<svg viewBox="0 0 48 48"><path d="M5 9h6l5 21h22l4-14H14"/><circle cx="19" cy="38" r="3"/><circle cx="35" cy="38" r="3"/></svg>'

branches = [
 ("b1", EYE, "VISUALIZARAM E NINGUÉM RESPONDEU?", "A MENSAGEM", "CARA DE PROPAGANDA", "ABRA COM O NOME + O QUE VOCÊS JÁ CONVERSARAM", None, False),
 ("b2", CHAT, "RESPONDERAM, MAS NINGUÉM QUIS SABER MAIS?", "A PROMESSA", "", "FALE DA DOR QUE ELA SENTE", None, False),
 ("b3", TAG, "QUISERAM SABER MAIS E NÃO COMPRARAM?", "O FECHAMENTO", "", None, ["PREÇO","PROVA","PRAZO"], False),
 ("b4", CART, "ALGUÉM COMPROU?", "VOCÊ TEM UMA OFERTA", "", None, None, True),
]
br_html = ""
for bid, ico, q, diag, sub, note, ch, ok in branches:
    tag = (f'<div class="tagok" id="{bid}-tag">{diag}<span class="arrow-ad" id="{bid}-ad">→ <b>ANÚNCIO</b></span></div>' if ok else
           f'<div class="tagfix" id="{bid}-tag"><i class="dot"></i><span class="lbl">AJUSTE:</span> {diag}{f"<small>{sub}</small>" if sub else ""}</div>')
    extra = ""
    if note: extra += f'<div class="note" id="{bid}-note">{note}</div>'
    if ch: extra += '<div class="chips">' + "".join(f'<span class="chip" id="{bid}-c{k}">{c}</span>' for k,c in enumerate(ch)) + "</div>"
    br_html += f'<div class="br{" ok" if ok else ""}" id="{bid}"><div class="ico" id="{bid}-ico">{ico}</div><div class="bt"><p class="q" id="{bid}-q">{q}</p>{tag}{extra}</div></div>'

html = open(".build/template.tpl").read()
for k,v in {"%%D%%":str(D),"%%SFX%%":sfx_html,"%%CAPS%%":"\n".join(cap_html),"%%OFFER%%":offer_html,"%%AV%%":avatars,
            "%%DAYS%%":days,"%%TODO%%":todo_html,"%%NAOS%%":naos,"%%ROLL%%":roll,"%%BR%%":br_html}.items():
    html = html.replace(k, v)
open("index.html","w").write(html)
print("ok", len(chunks), "legendas", len(sfx), "sfx")
