# Gera index.html do dia 2 (v2: cenas com gráficos, contadores e SFX)
import os
os.chdir(os.path.join(os.path.dirname(__file__), ".."))
D = 72.31
B = "DIA 2/45"

caps = [
 (0.05,"22 mil seguidores."),(2.10,"9 vendas."),(3.35,"Isso dá 0,04%."),
 (6.44,"Eu descobri o motivo olhando"),(8.08,"um número que quase ninguém olha."),(9.72,"A taxa de engajamento."),
 (11.35,"Os stories davam entre 90 e 110 visualizações."),
 (15.26,"O mercado considera saudável algo entre"),(17.33,"5% e 10% dos seguidores."),
 (19.68,"O perfil fazia menos de meio por cento."),
 (22.70,"Fui pesquisar a lista de seguidores."),(24.80,"Perfis fake."),(25.75,"A audiência tinha sido comprada."),
 (27.84,"O produto custava R$2.997."),(31.00,"As 9 vendas fizeram cerca de R$27 mil."),
 (34.91,"Quem compra seguidor quer uma coisa:"),(37.35,"ser visto."),(38.23,"Quer que o perfil pareça grande para vender mais."),
 (40.77,"Só que seguidor fake nunca vê nada."),(43.18,"O número sobe e ninguém assiste."),
 (45.59,"Ser visto por gente real também tem preço."),
 (48.51,"Com custo por mil de R$20 a R$30,"),(51.10,"R$300 em anúncio entregam"),(53.09,"de 10 a 15 mil impressões"),(54.93,"para o público que você escolhe."),
 (56.96,"E quem assiste fica guardado."),(59.03,"Vira público de video view,"),(60.57,"e é esse público que recebe a oferta."),
 (62.92,"O Ícaro resume bem:"),(64.59,"compre gente, não seguidor."),
 (66.56,"Abre seus stories e faz a conta:"),(68.72,"visualizações divididas por seguidores."),(71.27,"Comenta o seu número."),
]

# (arquivo, início, volume)
sfx = [
 ("whoosh",0.0,0.35),("impact",2.08,0.45),("whoosh",3.3,0.3),("pop",6.45,0.35),("click",9.72,0.5),
 ("whoosh",11.3,0.3),("pop",12.45,0.3),("pop",17.7,0.3),("pop",18.7,0.3),("glitch",19.66,0.25),
 ("whoosh",22.65,0.3),("click",24.8,0.5),("click",25.0,0.5),("click",25.2,0.5),("impact",25.75,0.5),
 ("whoosh",27.8,0.3),("pop",31.0,0.35),("impact",33.5,0.4),("whoosh",34.88,0.3),("pop",37.35,0.4),
 ("whoosh",40.74,0.3),("glitch",44.09,0.25),("whoosh",45.55,0.3),("pop",48.7,0.3),("pop",51.1,0.3),
 ("impact",53.1,0.4),("click",54.95,0.5),("whoosh",56.92,0.3),("pop",59.0,0.35),("impact",61.7,0.4),
 ("whoosh",62.88,0.3),("impact",64.59,0.45),("whoosh",66.52,0.3),("pop",71.27,0.4),
]

EYE = '<svg viewBox="0 0 24 24" class="ico"><path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12z" fill="none" stroke="currentColor" stroke-width="2"/><circle cx="12" cy="12" r="3.2" fill="currentColor"/></svg>'
USER = '<svg viewBox="0 0 24 24" class="av"><circle cx="12" cy="12" r="12" fill="#3b5566"/><circle cx="12" cy="9.5" r="4" fill="#8aa0ad"/><path d="M4.5 20c1.5-3.6 4.4-5.2 7.5-5.2s6 1.6 7.5 5.2" fill="#8aa0ad"/></svg>'
PERSON = '<svg viewBox="0 0 24 24" class="pp"><circle cx="12" cy="7" r="4.2" fill="currentColor"/><path d="M3.5 23c.6-5.6 4-8.6 8.5-8.6s7.9 3 8.5 8.6z" fill="currentColor"/></svg>'

def scene(i, s, e, inner, cls="dark", face=None):
    bg = (f'<div class="face" id="s{i:02d}-face" style="background-image:url(assets/img/{face})"></div><div class="facefade"></div>'
          if face else '<div class="ground"></div>')
    ink = " ink" if cls == "orange" else ""
    return (f'      <section id="s{i:02d}" class="clip scene {cls}" data-start="{s}" data-duration="{round(e-s,2)}" data-track-index="1">\n'
            f'        {bg}\n        <div class="badge{ink}">{B}</div>\n'
            f'        <div class="stage{" low" if face else ""}" id="s{i:02d}-in">{inner}</div>\n      </section>')

fake = ["user_88k2x7","a.h_92kd01","z_m00384","pr0f1le_4471","mx_k99_2","n0name_1203"]
rows = "".join(f'<div class="row" id="s07-r{k}">{USER}<div class="who"><b>{h}</b><span>0 posts</span></div><div class="tag" id="s07-t{k}">FAKE</div></div>' for k,h in enumerate(fake))
dots = "".join('<i></i>' for _ in range(120))
people = "".join(f'<span class="pw" id="s14-p{k}">{PERSON}</span>' for k in range(7))

S = [
 (0,3.35,'<p class="kick" id="s01-k">SEGUIDORES</p><div class="stat md ink" id="s01-n">0</div><h1 class="hook acc" id="s01-b">9 VENDAS.</h1>',"dark"),
 (3.35,6.44,'<div class="stat" id="s02-n">0,04%</div><div class="bar-wrap" id="s02-bars"><div class="hbar"><div class="fill full" id="s02-f1"></div><span>22.000 SEGUIDORES</span></div><div class="hbar"><div class="fill sliver" id="s02-f2"></div><span class="acc">9 VENDAS</span></div></div>'),
 (6.44,11.35,'<p class="kick" id="s03-k">O NÚMERO QUE QUASE NINGUÉM OLHA</p><div class="card" id="s03-card"><div class="card-h">TAXA DE ENGAJAMENTO <span class="down" id="s03-down">▼</span></div><svg viewBox="0 0 600 260" class="chart"><path id="s03-line" d="M10 40 C 90 50, 130 70, 190 95 S 300 150, 360 170 S 470 225, 590 238" fill="none" stroke="#ff6b6b" stroke-width="8" stroke-linecap="round"/><line x1="10" y1="250" x2="590" y2="250" stroke="rgba(255,255,255,0.25)" stroke-width="2"/></svg></div><h1 class="big sm acc" id="s03-b">ENGAJAMENTO<br/>NO CHÃO</h1>'),
 (11.35,15.26,f'<div class="phone" id="s04-phone"><div class="ph-bg"></div><div class="ph-bars"><i class="on"></i><i class="on"></i><i id="s04-prog"><b></b></i><i></i></div><div class="ph-top">{USER}<span>seu perfil · 22 mil seguidores</span></div><div class="ph-views" id="s04-views">{EYE}<b id="s04-c">0</b><b class="c2" id="s04-c2">a 110</b><span>visualizações</span></div></div>'),
 (15.26,19.68,'<p class="kick" id="s05-k">VISUALIZAÇÕES NOS STORIES</p><div class="vchart"><div class="vcol"><div class="vval" id="s05-v1">1.100 a 2.200</div><div class="vbar ok" id="s05-b1"></div><div class="vlab">SAUDÁVEL<br/><span>5% a 10%</span></div></div><div class="vcol"><div class="vval bad" id="s05-v2">90 a 110</div><div class="vbar bad" id="s05-b2"></div><div class="vlab">O PERFIL</div></div></div>'),
 (19.68,22.70,'<div class="ringbox"><svg viewBox="0 0 200 200" class="ring"><circle cx="100" cy="100" r="84" fill="none" stroke="rgba(3,53,78,0.35)" stroke-width="22"/><circle id="s06-arc" cx="100" cy="100" r="84" fill="none" stroke="#FFFFFF" stroke-width="22" stroke-linecap="round" stroke-dasharray="527.8" stroke-dashoffset="527.8" transform="rotate(-90 100 100)"/></svg><div class="ringtxt"><p class="kick ink">MENOS DE</p><div class="stat ink sm2" id="s06-n">10%</div></div></div><h2 class="mid ink" id="s06-t">DOS SEGUIDORES<br/>VIAM OS STORIES</h2>',"orange"),
 (22.70,27.84,f'<p class="kick" id="s07-k">A LISTA DE SEGUIDORES</p><div class="list" id="s07-list">{rows}</div><div class="stamp" id="s07-stamp">AUDIÊNCIA<br/>COMPRADA</div>'),
 (27.84,34.91,'<p class="kick" id="s08-k">A CONTA DO LANÇAMENTO</p><div class="calc"><div class="cl" id="s08-a"><span>TICKET</span><b>R$2.997</b></div><div class="cl" id="s08-b"><span>VENDAS</span><b>× 9</b></div><div class="cl tot" id="s08-c"><span>TOTAL</span><b class="acc">≈ R$<em id="s08-cn">0</em> MIL</b></div></div>'),
 (34.91,40.77,f'<p class="kick" id="s09-k">QUEM COMPRA SEGUIDOR QUER</p><div class="eye-big" id="s09-eye">{EYE}</div><h1 class="big" id="s09-a">SER <span class="acc">VISTO.</span></h1><h2 class="mid dim" id="s09-b">PARECER GRANDE<br/>PRA VENDER MAIS</h2>'),
 (40.77,45.59,f'<div class="duo"><div class="ctr" id="s10-c1"><span>SEGUIDORES</span><b id="s10-n1">22.000</b><i class="up">▲</i></div><div class="ctr" id="s10-c2"><span>QUEM ASSISTE</span><b id="s10-n2">110</b><i class="dn">▼</i></div></div><h1 class="big sm" id="s10-a">O NÚMERO SOBE.</h1><h1 class="big sm red" id="s10-b">NINGUÉM ASSISTE.</h1>'),
 (45.59,48.51,'<p class="kick" id="s11-k">GENTE REAL</p><div class="tagprice" id="s11-tag">R$</div><h1 class="big" id="s11-a">SER VISTO<br/><span class="acc">TEM PREÇO.</span></h1>'),
 (48.51,56.96,f'<div class="dots" id="s12-dots">{dots}</div><ul class="rules"><li id="s12-a"><span class="n">CPM</span>R$20 A R$30</li><li id="s12-b"><span class="n">ANÚNCIO</span>R$300</li><li id="s12-c" class="acc"><span class="n">ENTREGA</span><span>10 A 15 MIL<br/>IMPRESSÕES</span></li><li id="s12-d"><span class="n">PARA</span>QUEM VOCÊ<br/>ESCOLHE</li></ul>'),
 (56.96,62.92,'<p class="kick" id="s13-k">CICLO DO LUCRO</p><div class="flow"><div class="node" id="s13-a">ASSISTIU<br/><span>o conteúdo</span></div><div class="arrow" id="s13-x1"></div><div class="node" id="s13-b">PÚBLICO DE<br/>VIDEO VIEW<br/><span>fica guardado no pixel</span></div><div class="arrow" id="s13-x2"></div><div class="node hot" id="s13-c">OFERTA</div></div>'),
 (62.92,66.56,f'<p class="kick ink" id="s14-k">O ÍCARO RESUME</p><div class="crowd">{people}</div><h1 class="big ink" id="s14-a">COMPRE GENTE.</h1><h1 class="big" id="s14-b">NÃO SEGUIDOR.</h1>',"orange"),
 (66.56,D,'<p class="kick" id="s15-k">FAZ A CONTA</p><div class="formula" id="s15-f"><span>VIEWS DOS STORIES</span><span class="div">÷</span><span>SEGUIDORES</span><span class="acc">= ?</span></div><h1 class="hook acc" id="s15-b">COMENTA O<br/>SEU NÚMERO</h1>',"dark"),
]
scenes = "\n".join(scene(i+1, *x) for i, x in enumerate(S))

cl = []
for j,(t,txt) in enumerate(caps):
    e = caps[j+1][0] if j+1 < len(caps) else D
    cl.append(f'      <div id="cap-{j+1:02d}" class="clip cap" data-start="{t}" data-duration="{round(e-t,2)}" data-track-index="2"><span class="cap-line">{txt}</span></div>')
sx = []
for k,(f,t,v) in enumerate(sfx):
    dur = {"whoosh":0.6,"pop":0.7,"impact":2.1,"click":0.4,"glitch":2.6}[f]
    dur = min(dur, round(D-t,2))
    sx.append(f'      <audio id="sfx-{k:02d}" src="assets/sfx/{f}.mp3" data-start="{t}" data-duration="{dur}" data-track-index="{4+k%3}" data-volume="{v}"></audio>')

html = open(".build/template.tpl").read()
html = html.replace("%%SCENES%%", scenes).replace("%%CAPS%%", "\n".join(cl)).replace("%%SFX%%", "\n".join(sx)).replace("%%D%%", str(D))
open("index.html","w").write(html)
