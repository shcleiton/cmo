# gera index.html do dia 2
D = 75.96
caps = [
 (0.05,"22 mil seguidores."),(2.10,"9 vendas."),(3.35,"Isso dá 0,04%."),
 (6.44,"Eu descobri o motivo olhando"),(8.1,"um número que quase ninguém olha."),(9.72,"A taxa de engajamento."),
 (11.35,"Os stories davam entre 90 e 110 visualizações."),
 (15.26,"O mercado considera saudável algo entre"),(17.4,"5% e 10% dos seguidores."),
 (19.68,"O perfil fazia menos de meio por cento."),
 (22.70,"Fui pesquisar a lista de seguidores."),(24.80,"Perfis fake."),(25.75,"A audiência tinha sido comprada."),
 (27.81,"O produto custava R$2.997."),(31.00,"As 9 vendas fizeram cerca de R$27 mil."),
 (34.64,"Com 22 mil pessoas reais,"),(37.45,"a conta seria outra."),
 (38.75,"Quem compra seguidor quer uma coisa:"),(41.00,"ser visto."),(41.80,"Quer que o perfil pareça grande para vender mais."),
 (44.92,"Só que seguidor fake nunca vê nada."),(47.00,"O número sobe e ninguém assiste."),
 (49.46,"Ser visto por gente real também tem preço."),
 (52.37,"Com custo por mil de R$20 a R$30,"),(54.6,"R$300 em anúncio entregam"),(56.33,"de 10 a 15 mil impressões"),(58.37,"para o público que você escolhe."),
 (60.95,"E quem assiste fica guardado."),(62.68,"Vira público de video view,"),(64.15,"e é esse público que recebe a oferta."),
 (66.48,"O Ícaro resume bem:"),(68.23,"compre gente, não seguidor."),
 (70.32,"Abre seus stories e faz a conta:"),(72.49,"visualizações divididas por seguidores."),(74.73,"Comenta o seu número."),
]
B = "DIA 2/45"
def sc(i, s, e, inner, cls="dark", face=None):
    f = f'<div class="face" id="s{i:02d}-face" style="background-image:url(assets/img/{face})"></div><div class="facefade"></div>' if face else '<div class="ground"></div>'
    ink = " ink" if cls=="orange" else ""
    return f'''      <section id="s{i:02d}" class="clip scene {cls}" data-start="{s}" data-duration="{round(e-s,2)}" data-track-index="1">
        {f}
        <div class="badge{ink}">{B}</div>
        <div class="stage{' low' if face else ''}">{inner}</div>
      </section>'''
S = [
 (0,3.35,'<h1 class="hook" id="s01-a">22 MIL<br/>SEGUIDORES.</h1><h1 class="hook acc" id="s01-b">9 VENDAS.</h1>',"dark","rosto-6.8.jpg"),
 (3.35,6.44,'<p class="kick" id="s02-k">DE CONVERSÃO</p><div class="stat" id="s02-n">0,04%</div>',"dark",None),
 (6.44,11.35,'<h2 class="mid" id="s03-a">O NÚMERO QUE<br/>QUASE NINGUÉM<br/>OLHA</h2><h1 class="big sm acc" id="s03-b">TAXA DE<br/>ENGAJAMENTO</h1>',"dark",None),
 (11.35,15.26,'<p class="kick" id="s04-k">VISUALIZAÇÕES NOS STORIES</p><div class="stat md" id="s04-n">90 A 110</div>',"dark",None),
 (15.26,19.68,'<p class="kick" id="s05-k">O MERCADO CONSIDERA SAUDÁVEL</p><div class="stat md" id="s05-n">5% A 10%</div><h2 class="mid" id="s05-t">DOS SEGUIDORES</h2>',"dark",None),
 (19.68,22.70,'<p class="kick ink" id="s06-k">O PERFIL FAZIA MENOS DE</p><div class="stat ink" id="s06-n">0,5%</div><h2 class="mid ink" id="s06-t">DOS SEGUIDORES</h2>',"orange",None),
 (22.70,27.81,'<p class="kick" id="s07-k">A LISTA DE SEGUIDORES</p><h1 class="hook" id="s07-a">PERFIS FAKE.</h1><h1 class="hook acc" id="s07-b">AUDIÊNCIA<br/>COMPRADA.</h1>',"dark","rosto-31.8.jpg"),
 (27.81,34.64,'<p class="kick" id="s08-k">TICKET DO PRODUTO</p><div class="stat md" id="s08-n">R$2.997</div><h2 class="mid" id="s08-t">9 VENDAS =<br/><span class="acc">R$27 MIL</span></h2>',"dark",None),
 (34.64,38.75,'<h1 class="big sm" id="s09-a">22 MIL<br/>PESSOAS<br/><span class="acc">REAIS?</span></h1><p class="kick" id="s09-k">A CONTA SERIA OUTRA</p>',"dark",None),
 (38.75,44.92,'<p class="kick" id="s10-k">QUEM COMPRA SEGUIDOR QUER</p><h1 class="big" id="s10-a">SER<br/><span class="acc">VISTO.</span></h1><h2 class="mid dim" id="s10-b">PARECER GRANDE<br/>PRA VENDER MAIS</h2>',"dark",None),
 (44.92,49.46,'<h1 class="big ink" id="s11-a">O NÚMERO<br/>SOBE.</h1><h1 class="big" id="s11-b">NINGUÉM<br/>ASSISTE.</h1>',"orange",None),
 (49.46,52.37,'<p class="kick" id="s12-k">GENTE REAL</p><h1 class="big" id="s12-a">SER VISTO<br/><span class="acc">TEM PREÇO.</span></h1>',"dark",None),
 (52.37,60.95,'<ul class="rules"><li id="s13-a"><span class="n">CPM</span>R$20 A R$30</li><li id="s13-b"><span class="n">ANÚNCIO</span>R$300</li><li id="s13-c" class="acc"><span class="n">ENTREGA</span>10 A 15 MIL<br/>IMPRESSÕES</li><li id="s13-d"><span class="n">PARA</span>QUEM VOCÊ<br/>ESCOLHE</li></ul>',"dark",None),
 (60.95,66.48,'<ul class="rules three"><li id="s14-a"><span class="n">01</span>ASSISTIU</li><li id="s14-b"><span class="n">02</span>VIDEO VIEW</li><li id="s14-c" class="acc"><span class="n">03</span>OFERTA</li></ul>',"dark",None),
 (66.48,70.32,'<p class="kick ink" id="s15-k">O ÍCARO RESUME</p><h1 class="big ink" id="s15-a">COMPRE<br/>GENTE.</h1><h1 class="big" id="s15-b">NÃO<br/>SEGUIDOR.</h1>',"orange",None),
 (70.32,D,'<p class="kick" id="s16-k">FAZ A CONTA</p><h2 class="mid" id="s16-a">VIEWS DOS STORIES<br/>÷ SEGUIDORES</h2><h1 class="hook acc" id="s16-b">COMENTA O<br/>SEU NÚMERO</h1>',"dark","rosto-27.8.jpg"),
]
scenes = "\n".join(sc(i+1,*x) for i,x in enumerate(S))
cl = []
for j,(t,txt) in enumerate(caps):
    e = caps[j+1][0] if j+1 < len(caps) else D
    cl.append(f'      <div id="cap-{j+1:02d}" class="clip cap" data-start="{t}" data-duration="{round(e-t,2)}" data-track-index="2"><span class="cap-line">{txt}</span></div>')
anim = [
 ("#s01-face","{ scale: 1.12 }","{ scale: 1.0, duration: 3.35, ease: 'none' }",0),
 ("#s01-a",Y:="{ y: 60, opacity: 0 }",YE:="{ y: 0, opacity: 1, duration: 0.4, ease: E }",0.05),
 ("#s01-b",Y,YE,2.1),
 ("#s02-n","{ scale: 0.7, opacity: 0 }","{ scale: 1, opacity: 1, duration: 0.45, ease: E }",3.38),
 ("#s02-k",O:="{ opacity: 0 }",OE:="{ opacity: 1, duration: 0.3 }",3.9),
 ("#s03-a",Y,YE,6.47),("#s03-b",Y,YE,9.72),
 ("#s04-k",O,OE,11.38),("#s04-n",Y,YE,12.6),
 ("#s05-k",O,OE,15.29),("#s05-n",Y,YE,17.4),("#s05-t",O,OE,18.2),
 ("#s06-k",O,OE,19.7),("#s06-n","{ scale: 0.8, opacity: 0 }","{ scale: 1, opacity: 1, duration: 0.4, ease: E }",20.4),("#s06-t",O,OE,21.2),
 ("#s07-face","{ scale: 1.15 }","{ scale: 1.0, duration: 5.1, ease: 'none' }",22.7),
 ("#s07-k",O,OE,22.75),("#s07-a",Y,YE,24.8),("#s07-b",Y,YE,25.75),
 ("#s08-k",O,OE,27.85),("#s08-n",Y,YE,29.0),("#s08-t",Y,YE,31.0),
 ("#s09-a",Y,YE,34.67),("#s09-k",O,OE,37.45),
 ("#s10-k",O,OE,38.8),("#s10-a","{ scale: 0.85, opacity: 0 }","{ scale: 1, opacity: 1, duration: 0.4, ease: E }",41.0),("#s10-b",O,OE,41.8),
 ("#s11-a",Y,YE,44.95),("#s11-b",Y,YE,47.0),
 ("#s12-k",O,OE,49.5),("#s12-a",Y,YE,49.6),
 ("#s13-a",X:="{ x: -60, opacity: 0 }",XE:="{ x: 0, opacity: 1, duration: 0.4, ease: E }",52.4),("#s13-b",X,XE,54.6),("#s13-c",X,XE,56.33),("#s13-d",X,XE,58.4),
 ("#s14-a",Y,YE,61.0),("#s14-b",Y,YE,62.95),("#s14-c",Y,YE,65.7),
 ("#s15-k",O,OE,66.5),("#s15-a",Y,YE,68.23),("#s15-b",Y,YE,69.45),
 ("#s16-face","{ scale: 1.0 }","{ scale: 1.05, duration: 5.64, ease: 'none' }",70.32),
 ("#s16-k",O,OE,70.35),("#s16-a",Y,YE,72.49),("#s16-b",Y,YE,74.73),
]
js = "\n".join(f'      tl.fromTo("{s}", {a}, {b}, {t});' for s,a,b,t in anim)
html = open(".build/template.tpl").read().replace("%%SCENES%%",scenes).replace("%%CAPS%%","\n".join(cl)).replace("%%ANIM%%",js).replace("%%D%%",str(D))
open("index.html","w").write(html)
