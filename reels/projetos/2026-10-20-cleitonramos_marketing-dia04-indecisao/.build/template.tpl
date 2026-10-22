<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1080, height=1920" />
    <title>Dia 4: a objeção errada</title>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js"></script>
    <style>
      @font-face { font-family: "Montserrat"; font-weight: 900; src: url("assets/fonts/montserrat-latin-900-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 800; src: url("assets/fonts/montserrat-latin-800-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 600; src: url("assets/fonts/montserrat-latin-600-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 500; src: url("assets/fonts/montserrat-latin-500-normal.woff2") format("woff2"); }
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html, body { margin: 0; background: #03354e; overflow: hidden; }
      #root { position: relative; width: 1080px; height: 1920px; overflow: hidden; background: #03354e; font-family: "Montserrat", sans-serif; color: #fff; }
      #fundo { position: absolute; inset: 0; width: 1080px; height: 1920px; object-fit: cover; }
      .layer { position: absolute; inset: 0; }
      #ground { background: radial-gradient(120% 70% at 50% 110%, rgba(10,74,102,0.62) 0%, rgba(3,53,78,0.74) 55%, rgba(2,42,62,0.88) 100%); }
      #ground::after { content: ""; position: absolute; left: 0; right: 0; bottom: 0; height: 520px;
        background-image: radial-gradient(circle, rgba(111,211,160,0.5) 2.2px, transparent 2.6px), radial-gradient(circle, rgba(0,163,214,0.4) 1.8px, transparent 2.2px);
        background-size: 34px 34px, 34px 34px; background-position: 0 0, 17px 17px;
        -webkit-mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%);
        mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%); }
      #cam { position: absolute; inset: 0; transform-origin: 540px 900px; }
      .badge { position: absolute; top: 290px; left: 120px; font-weight: 600; font-size: 26px; letter-spacing: 0.32em; color: #6FD3A0; z-index: 5; }
      .sc { position: absolute; inset: 0; opacity: 0; visibility: hidden; }
      .bgteal { position: absolute; inset: 0; background: linear-gradient(135deg, rgba(0,168,151,0.94) 0%, rgba(0,130,147,0.95) 50%, rgba(0,104,146,0.96) 100%); }
      .bggreen { position: absolute; inset: 0; background: #6FD3A0; }
      .bgdark { position: absolute; inset: 0; background: radial-gradient(circle at 50% 42%, rgba(10,20,26,0.75) 0%, rgba(4,8,10,0.96) 60%); }
      .kick { font-weight: 600; font-size: 28px; letter-spacing: 0.28em; color: #6FD3A0; }
      .big { font-weight: 900; font-size: 96px; line-height: 1.0; letter-spacing: -0.02em; }
      .mid { font-weight: 900; font-size: 64px; line-height: 1.05; letter-spacing: -0.01em; }
      .acc { color: #6FD3A0; } .red { color: #ff7b7b; } .navy { color: #03354e; }
      .center { position: absolute; left: 120px; right: 120px; text-align: center; }
      .kw { display: inline-block; opacity: 0; }
      .bub { display: inline-block; max-width: 620px; font-weight: 600; font-size: 34px; line-height: 1.3; padding: 16px 24px; border-radius: 26px; }
      .in { background: #ffffff; color: #0d2633; border-bottom-left-radius: 8px; }
      .out { background: #1f6e5a; color: #ffffff; border-bottom-right-radius: 8px; }
      .out.hl { background: #6FD3A0; color: #03354e; font-weight: 800; }
      .row { display: flex; } .row.r { justify-content: flex-end; }
      .ch { opacity: 0; }
      .dots3 { display: inline-flex; gap: 10px; background: #ffffff; padding: 20px 26px; border-radius: 28px; border-bottom-left-radius: 8px; }
      .dots3 i { width: 16px; height: 16px; border-radius: 50%; background: #8aa0ad; display: block; }
      .tag-ex { position: absolute; top: 18px; right: 20px; font-weight: 800; font-size: 18px; letter-spacing: 0.2em; color: #03354e; background: #ffd66b; padding: 6px 12px; border-radius: 8px; }
      .phone { position: absolute; left: 190px; width: 700px; border-radius: 52px; background: rgba(8,28,38,0.95); border: 6px solid #0d2633;
        box-shadow: 0 30px 80px rgba(0,0,0,0.45); padding: 96px 28px 30px; display: flex; flex-direction: column; gap: 20px; overflow: hidden; }
      .phone::before { content: ""; position: absolute; top: 28px; left: 50%; width: 120px; height: 10px; margin-left: -60px; border-radius: 6px; background: rgba(255,255,255,0.15); }
      .notif { position: absolute; left: 16px; right: 16px; top: 12px; background: rgba(255,255,255,0.96); color: #0d2633; border-radius: 22px; padding: 14px 20px; font-weight: 600; font-size: 26px; display: flex; gap: 14px; align-items: center; z-index: 3; }
      .notif b { font-weight: 800; }
      .notif i { width: 42px; height: 42px; border-radius: 12px; background: #6FD3A0; display: block; flex: none; }
      .ticks { font-weight: 800; font-size: 22px; color: #8aa0ad; margin-left: 8px; }
      .ticks.blue { color: #00a3d6; }
      .label { position: absolute; left: 120px; right: 120px; top: 380px; }
      .pill { display: inline-block; font-weight: 900; font-size: 34px; color: #03354e; background: #6FD3A0; padding: 12px 24px; border-radius: 40px; }
      .bn { position: absolute; width: 220px; height: 330px; overflow: visible; }
      .thought { position: absolute; background: #ffffff; color: #03354e; border-radius: 40px; padding: 22px 28px; font-weight: 900; font-size: 34px; line-height: 1.15; text-align: center; }
      .thought::after { content: ""; position: absolute; left: 60px; bottom: -34px; width: 30px; height: 30px; border-radius: 50%; background: #ffffff; }
      .thought::before { content: ""; position: absolute; left: 40px; bottom: -64px; width: 18px; height: 18px; border-radius: 50%; background: #ffffff; }
      .lk { width: 150px; height: 182px; }
      /* gancho */
      #wall { position: absolute; left: 100px; right: 100px; top: 380px; opacity: 0.55; height: 1060px; display: grid; grid-template-columns: repeat(6, 1fr); gap: 34px 18px; align-content: start; }
      .wb { height: 52px; border-radius: 18px; background: rgba(255,255,255,0.18); opacity: 0; }
      .wb.r { background: rgba(111,211,160,0.35); margin-left: 30px; }
      #h1n { top: 700px; font-weight: 900; font-size: 150px; letter-spacing: -0.03em; text-shadow: 0 10px 40px rgba(2,42,62,0.9); }
      #h1l { top: 880px; text-shadow: 0 4px 20px rgba(2,42,62,1); }
      #grid100 { position: absolute; left: 290px; top: 800px; width: 500px; display: grid; grid-template-columns: repeat(10, 1fr); gap: 14px; }
      .dt { width: 36px; height: 36px; border-radius: 50%; background: rgba(255,255,255,0.85); }
      #h2p { top: 400px; font-weight: 900; font-size: 140px; color: #6FD3A0; letter-spacing: -0.03em; white-space: nowrap; }
      #h2l { top: 560px; }
      #h2src { top: 1300px; font-weight: 500; font-size: 24px; color: rgba(255,255,255,0.8); }
      /* tese */
      #t1 { top: 640px; }
      #frz { position: absolute; left: 430px; top: 820px; }
      #t2 { top: 420px; }
      #args { position: absolute; left: 140px; top: 470px; width: 520px; display: flex; flex-direction: column; gap: 16px; }
      #args > div { opacity: 0; }
      #convw { position: absolute; left: 0; right: 0; top: 1180px; text-align: center; }
      #conv { display: inline-block; position: relative; font-weight: 900; font-size: 108px; letter-spacing: -0.02em; }
      #strike { position: absolute; left: -10px; right: -10px; top: 50%; height: 14px; margin-top: -7px; background: #ff7b7b; border-radius: 7px; transform-origin: left center; }
      #t4 { top: 480px; }
      #locks { position: absolute; left: 0; right: 0; top: 720px; display: flex; justify-content: center; gap: 60px; }
      #locks > div { text-align: center; opacity: 0; }
      #locks p { margin-top: 16px; font-weight: 800; font-size: 26px; letter-spacing: 0.08em; }
      #t5 { top: 400px; }
      #th5 { left: 470px; top: 640px; width: 300px; height: 260px; display: flex; align-items: center; justify-content: center; }
      #mag { position: absolute; left: 650px; top: 840px; width: 180px; height: 180px; }
      #t6 { top: 650px; }
      #n123 { position: absolute; left: 0; right: 0; top: 820px; display: flex; justify-content: center; gap: 40px; }
      #n123 span { width: 170px; height: 170px; border-radius: 30px; border: 5px solid #6FD3A0; display: flex; align-items: center; justify-content: center; font-weight: 900; font-size: 110px; color: #6FD3A0; opacity: 0; }
      /* s2 */
      #beam { position: absolute; left: 190px; top: 900px; width: 700px; height: 14px; border-radius: 7px; background: #ffffff; transform-origin: 350px 7px; }
      #pivot { position: absolute; left: 515px; top: 900px; width: 50px; height: 140px; background: #ffffff; clip-path: polygon(50% 0, 100% 100%, 0 100%); }
      .pan { position: absolute; top: 740px; width: 300px; height: 160px; border-radius: 24px; display: flex; align-items: center; justify-content: center; text-align: center; font-weight: 900; font-size: 46px; line-height: 1.05; }
      #panL { left: 160px; background: #6FD3A0; color: #03354e; }
      #panR { left: 620px; background: rgba(60,20,20,0.6); border: 4px solid #ff7b7b; color: #ff9a9a; font-size: 30px; }
      #panRq { position: absolute; inset: 0; display: flex; align-items: center; justify-content: center; font-size: 90px; }
      #panRt { opacity: 0; }
      .coin { position: absolute; left: 740px; top: 900px; width: 64px; height: 64px; border-radius: 50%; background: #ffd66b; color: #7a5a00; font-style: normal; font-weight: 900; font-size: 22px; display: flex; align-items: center; justify-content: center; opacity: 0; }
      #motivo { position: absolute; left: 140px; top: 590px; font-weight: 900; font-size: 40px; color: #03354e; background: #ffffff; padding: 10px 22px; border-radius: 12px; transform: rotate(-6deg); opacity: 0; }
      /* cta */
      #save { position: absolute; left: 50%; top: 560px; width: 240px; height: 300px; margin-left: -120px; }
      #save path { fill: none; stroke: #03354e; stroke-width: 12; stroke-linejoin: round; }
      #save .fill { fill: #03354e; stroke: none; }
      /* s3 */
      .chip { position: absolute; font-weight: 900; font-size: 30px; color: #03354e; background: #ffffff; padding: 12px 20px; border-radius: 40px; white-space: nowrap; opacity: 0; }
      #cal { position: absolute; left: 50%; top: 560px; width: 300px; margin-left: -150px; border-radius: 28px; overflow: hidden; background: #ffffff; text-align: center; box-shadow: 0 20px 60px rgba(0,0,0,0.35); }
      #cal .hd { background: #ff7b7b; color: #fff; font-weight: 900; font-size: 30px; padding: 12px 0; letter-spacing: 0.1em; }
      #cal .bd { height: 220px; overflow: hidden; }
      #calcol i { display: block; height: 220px; line-height: 220px; font-style: normal; font-weight: 900; font-size: 150px; color: #03354e; }
      #s3sup { top: 900px; }
      .br3 { position: absolute; left: 140px; right: 140px; display: flex; align-items: center; gap: 20px; opacity: 0; }
      .br3 .bub { flex: none; }
      .br3 .arr { flex: 1; height: 6px; background: #6FD3A0; position: relative; }
      .br3 .arr::after { content: ""; position: absolute; right: -4px; top: -10px; border-left: 20px solid #6FD3A0; border-top: 13px solid transparent; border-bottom: 13px solid transparent; }
      .br3 b { font-weight: 900; font-size: 30px; color: #6FD3A0; text-align: right; width: 290px; line-height: 1.1; }
      /* pergunta e assinatura */
      #qdots { position: absolute; left: 50%; top: 520px; margin-left: -75px; }
      #qtxt { top: 680px; font-weight: 900; font-size: 64px; line-height: 1.12; }
      #sglk { position: absolute; left: 50%; top: 470px; width: 200px; height: 243px; margin-left: -100px; }
      #sgname { top: 800px; font-weight: 900; font-size: 92px; letter-spacing: -0.02em; }
      #sgpos { top: 920px; }
      #sgch { position: absolute; left: 50%; top: 1030px; width: 820px; margin-left: -410px; text-align: center; font-weight: 900; font-size: 40px; color: #6FD3A0; border: 5px solid #6FD3A0; border-radius: 18px; padding: 14px 0; white-space: nowrap; }
      #caps { position: absolute; left: 110px; right: 110px; top: 1430px; height: 110px; z-index: 6; }
      .cap { position: absolute; left: 0; right: 0; top: 0; text-align: center; font-weight: 800; font-size: 40px; line-height: 1.2; visibility: hidden;
        text-shadow: 0 2px 12px rgba(0,0,0,0.85), 0 0 2px rgba(0,0,0,0.9); }
      .cap .w { color: rgba(255,255,255,0.55); }
    </style>
  </head>
  <body>
    <div id="root" data-composition-id="main" data-start="0" data-width="1080" data-height="1920" data-duration="%%D%%">
      <audio id="narracao" src="assets/audio/narracao.mp3" data-start="0" data-duration="%%D%%" data-track-index="0"></audio>
%%SFX%%
      <video id="fundo" src="assets/video/fundo.mp4" data-start="0" data-duration="%%D%%" data-track-index="2" muted playsinline></video>
      <div class="layer" id="ground"></div>
      <div id="cam">
        <!-- gancho 1: a parede de conversas -->
        <div class="sc" id="sH1">
          <div id="wall">%%WALL%%</div>
          <div class="center" id="h1n">0</div>
          <div class="center kick" id="h1l">CONVERSAS DE VENDA ANALISADAS</div>
        </div>
        <!-- gancho 2: 100 pontos -->
        <div class="sc" id="sH2">
          <div class="center" id="h2p">40% A 60%</div>
          <div class="center mid" id="h2l">TERMINARAM<br/><span class="red">SEM DECISÃO</span></div>
          <div id="grid100">%%DOTS%%</div>
          <div class="center" id="h2src">Dixon e McKenna, Harvard Business Review, 2022</div>
        </div>
        <!-- gancho 3: cliente quer, vendedor atropela -->
        <div class="sc" id="sH3">
          <div style="position:absolute; left:110px; top:860px">%%B_c1%%</div>
          <div style="position:absolute; left:750px; top:860px">%%B_v1%%</div>
          <div class="row" id="h3a" style="position:absolute; left:120px; top:690px; opacity:0"><span class="bub in">quero fechar</span></div>
          <div id="h3b" style="position:absolute; right:120px; top:470px; display:flex; flex-direction:column; align-items:flex-end; gap:14px">
            <span class="bub out" id="h3b0" style="opacity:0">e aí?</span>
            <span class="bub out" id="h3b1" style="opacity:0">conseguiu ver?</span>
            <span class="bub out" id="h3b2" style="opacity:0">vai fechar?</span>
          </div>
        </div>
        <!-- tese 1: tela teal -->
        <div class="sc" id="sT1"><div class="bgteal"></div>
          <div class="center big" id="t1"><span class="kw" data-t="10.54">NEM</span> <span class="kw" data-t="10.72">TODA</span> <span class="kw" data-t="10.98">VENDA</span> <span class="kw" data-t="11.26">QUE</span> <span class="kw" data-t="11.42">NÃO</span> <span class="kw" data-t="11.62">AVANÇA</span> <span class="kw" data-t="12.16">FOI</span> <span class="kw navy" data-t="12.3">REJEITADA</span></div>
        </div>
        <!-- tese 2: travou -->
        <div class="sc" id="sT2">
          <div class="center big" id="t2">ELA SÓ <span class="acc">TRAVOU.</span></div>
          <div style="position:absolute; left:430px; top:860px">%%B_c2%%</div>
          <div id="frz" style="left:470px; top:760px"><span class="dots3"><i></i><i></i><i></i></span></div>
        </div>
        <!-- tese 3: argumentos empilhados -->
        <div class="sc" id="sT3">
          <div id="args">
            <div class="row r"><span class="bub out">é o melhor do mercado</span></div>
            <div class="row r"><span class="bub out">tem garantia</span></div>
            <div class="row r"><span class="bub out">só hoje com desconto</span></div>
            <div class="row r"><span class="bub out">todo mundo compra</span></div>
          </div>
          <div style="position:absolute; left:740px; top:620px">%%B_v2%%</div>
          <div id="convw"><span id="conv">CONVENCER<i id="strike"></i></span></div>
        </div>
        <!-- tese 4: cada trava uma conversa -->
        <div class="sc" id="sT4">
          <div class="center mid" id="t4">CADA TRAVA PEDE<br/>UMA CONVERSA <span class="acc">DIFERENTE</span></div>
          <div id="locks">
            <div id="lk0"><svg class="lk" viewBox="0 0 230 280"><path d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#6FD3A0" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#6FD3A0"/><text x="115" y="228" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="110" fill="#03354e">?</text></svg><p>CLAREZA</p></div>
            <div id="lk1"><svg class="lk" viewBox="0 0 230 280"><path d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#ffffff" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#ffffff"/><text x="115" y="228" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="110" fill="#03354e">?</text></svg><p>RISCO</p></div>
            <div id="lk2"><svg class="lk" viewBox="0 0 230 280"><path d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#ff7b7b" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#ff7b7b"/><text x="115" y="228" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="110" fill="#03354e">?</text></svg><p>ESCOLHA</p></div>
          </div>
        </div>
        <!-- tese 5: descobre a trava -->
        <div class="sc" id="sT5">
          <div class="center mid" id="t5">DESCUBRA O QUE<br/><span class="acc">TRAVA A DECISÃO</span></div>
          <div style="position:absolute; left:220px; top:900px">%%B_c3%%</div>
          <div class="thought" id="th5"><svg class="lk" viewBox="0 0 230 280"><path d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#00a897" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#00a897"/><text x="115" y="228" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="110" fill="#ffffff">?</text></svg></div>
          <svg id="mag" viewBox="0 0 180 180"><circle cx="72" cy="72" r="54" fill="rgba(255,255,255,0.15)" stroke="#ffffff" stroke-width="14"/><path d="M112 112 L165 165" stroke="#ffffff" stroke-width="22" stroke-linecap="round"/></svg>
        </div>
        <!-- tese 6: 3 situações -->
        <div class="sc" id="sT6">
          <div class="center kick" id="t6">OLHA ISSO EM</div>
          <div id="n123"><span>1</span><span>2</span><span>3</span></div>
        </div>
        <!-- situação 1 -->
        <div class="sc" id="sS1">
          <div class="label"><p class="kick">SITUAÇÃO 1</p><p class="mid">PERGUNTOU O PREÇO</p></div>
          <div class="phone" id="ph1" style="top:560px; height:700px"><span class="tag-ex">EXEMPLO</span>
            <div class="notif" id="nt1"><i></i><span><b>Cliente</b><br/>quanto custa?</span></div>
            <div class="row" id="s1q" style="opacity:0"><span class="bub in">quanto custa?</span></div>
            <div class="row r" id="s1t" style="opacity:0"><span class="dots3" style="border-bottom-left-radius:28px; border-bottom-right-radius:8px; background:#1f6e5a"><i style="background:#9fd9c6"></i><i style="background:#9fd9c6"></i><i style="background:#9fd9c6"></i></span></div>
            <div class="row r" id="s1a1" style="opacity:0"><span class="bub out">%%A1%%</span></div>
            <div class="row r" id="s1a2" style="opacity:0"><span class="bub out hl">%%A2%%</span></div>
          </div>
          <div id="s1f" style="position:absolute; left:0; right:0; top:1290px; text-align:center; opacity:0"><span class="pill">PREÇO + PERGUNTA</span></div>
        </div>
        <div class="sc" id="sS1b">
          <div class="label"><p class="kick">TRAVA 1</p><p class="mid">QUAL É O <span class="acc">PROBLEMA DELA</span></p></div>
          <div style="position:absolute; left:200px; top:930px">%%B_c4%%</div>
          <div class="thought" id="th4" style="left:420px; top:640px; width:460px">VENDAS PELO<br/>INSTAGRAM<br/><span style="color:#00a897">NÃO ESTÃO VINDO</span></div>
        </div>
        <!-- situação 2 -->
        <div class="sc" id="sS2">
          <div class="label" id="s2lab"><p class="kick">SITUAÇÃO 2</p><p class="mid">"TÁ CARO"</p></div>
          <div style="position:absolute; left:120px; top:930px" id="c5w">%%B_c5%%</div>
          <div id="s2b" style="position:absolute; left:380px; top:820px; opacity:0"><span class="bub in" style="font-size:54px; font-weight:900">tá caro</span></div>
          <div id="s2j" class="center mid" style="top:600px; opacity:0">ANTES DE <span class="red">JUSTIFICAR</span></div>
        </div>
        <div class="sc" id="sS2b">
          <div class="label"><p class="kick">TRAVA 2</p><p class="mid">COM O QUE <span class="acc">ELE COMPARA</span></p></div>
          <div id="scale" style="position:absolute; inset:0">
            <div id="beam"></div><div id="pivot"></div>
            <div class="pan" id="panL">R$2 MIL<br/><span style="font-size:28px">UMA VEZ</span></div>
            <div class="pan" id="panR"><span id="panRq">?</span><span id="panRt">R$3 MIL/MÊS<br/>EM ANÚNCIO<br/>SEM VENDA</span></div>
          </div>
          %%COINS%%
          <div id="motivo">TEM MOTIVO</div>
          <div class="center" id="s2x" style="top:1150px; font-weight:800; font-size:34px; color:#6FD3A0; opacity:0">SE VOCÊ MOSTRAR ONDE<br/>O DINHEIRO ESCAPA</div>
        </div>
        <!-- CTA -->
        <div class="sc" id="sC"><div class="bggreen"></div>
          <svg id="save" viewBox="0 0 240 300"><path class="fill" id="svf" d="M22 22 H218 V278 L120 202 L22 278 Z"/><path d="M22 22 H218 V278 L120 202 L22 278 Z"/></svg>
          <div class="center mid navy" style="top:930px">SALVA PRA REVER<br/>ANTES DA PRÓXIMA VENDA</div>
        </div>
        <!-- situação 3 -->
        <div class="sc" id="sS3">
          <div class="label"><p class="kick">SITUAÇÃO 3</p><p class="mid">NÃO COMPROU</p></div>
          <div class="phone" id="ph3" style="top:560px; height:300px"><span class="tag-ex">EXEMPLO</span>
            <div class="row"><span class="bub in">vou pensar</span></div>
            <div class="row r"><span class="bub out">tudo bem! <span class="ticks">✓✓</span></span></div>
          </div>
          <div style="position:absolute; left:160px; top:960px">%%B_c6%%</div>
          <span class="chip" id="k0" style="left:420px; top:920px">DINHEIRO?</span>
          <span class="chip" id="k1" style="left:620px; top:1010px">PRIORIDADE?</span>
          <span class="chip" id="k2" style="left:420px; top:1100px">OUTRA SOLUÇÃO?</span>
          <span class="chip" id="k3" style="left:640px; top:1190px">DÚVIDA?</span>
        </div>
        <div class="sc" id="sS3b">
          <div class="label"><p class="kick">TRAVA 3</p><p class="mid">O QUE <span class="acc">MUDOU</span></p></div>
          <div id="cal"><div class="hd">DIAS DEPOIS</div><div class="bd"><div id="calcol"><i>1</i><i>3</i><i>5</i><i>8</i><i>11</i><i>15</i></div></div></div>
          <div class="center mid" id="s3sup" style="opacity:0">PERGUNTE EM VEZ<br/>DE <span class="red">SUPOR</span></div>
        </div>
        <div class="sc" id="sS3c">
          <div class="label"><p class="kick">TRAVA 3</p><p class="mid">O QUE <span class="acc">MUDOU</span></p></div>
          <div class="phone" id="ph3c" style="top:560px; height:330px"><span class="tag-ex">EXEMPLO</span>
            <div class="row r" id="s3m"><span class="bub out hl">%%C1%%</span></div>
          </div>
          <div class="br3" id="r0" style="top:960px"><span class="bub in">sim, ainda é</span><i class="arr"></i><b>CONVERSA DE FECHAMENTO</b></div>
          <div class="br3" id="r1" style="top:1090px"><span class="bub in">agora não</span><i class="arr"></i><b>RETOMAR NO MOMENTO CERTO</b></div>
          <div class="br3" id="r2" style="top:1220px"><span class="bub in">já resolvi</span><i class="arr"></i><b>ENTENDER O QUE ESCOLHEU</b></div>
        </div>
        <!-- pergunta -->
        <div class="sc" id="sQ"><div class="bgdark"></div>
          <div id="qdots"><span class="dots3"><i></i><i></i><i></i></span></div>
          <div class="center" id="qtxt"><span class="kw" data-t="72.24">NA SUA ÚLTIMA</span> <span class="kw" data-t="73.58">VENDA PERDIDA,</span> <span class="kw" data-t="74.56">VOCÊ DESCOBRIU</span> <span class="kw acc" data-t="75.3">O QUE TRAVOU</span> <span class="kw" data-t="76.54">OU SÓ TENTOU</span> <span class="kw red" data-t="77.14">CONVENCER</span> <span class="kw" data-t="77.68">MAIS UMA VEZ?</span></div>
        </div>
        <!-- assinatura -->
        <div class="sc" id="sS">
          <svg id="sglk" viewBox="0 0 230 280" style="overflow:visible"><path id="sgsh" d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#6FD3A0" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#6FD3A0"/></svg>
          <div class="center" id="sgname">CLEITON RAMOS</div>
          <div class="center kick" id="sgpos">MARKETING E VENDAS COM NÚMERO</div>
          <div id="sgch">DESAFIO 45 DIAS · DIA 4/45</div>
        </div>
      </div>
      <div class="badge">DIA 4/45</div>
      <div id="caps">%%CAPS%%</div>
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out", D = %%D%%;
      const $ = (s) => document.querySelector(s), $$ = (s) => Array.from(document.querySelectorAll(s));
      // cena: entra deslizando, deriva devagar, sai
      const scene = (s, a, b, dir) => {
        tl.fromTo(s, { autoAlpha: 0, x: (dir || 1) * 140 }, { autoAlpha: 1, x: 0, duration: 0.3, ease: E }, a);
        tl.fromTo(s, { scale: 1 }, { scale: 1.035, duration: b - a, ease: "none" }, a);
        tl.to(s, { autoAlpha: 0, x: -(dir || 1) * 140, duration: 0.2, ease: "power2.in" }, b - 0.2);
      };
      const punch = (t, k) => tl.fromTo("#cam", { scale: k || 1.07 }, { scale: 1, duration: 0.45, ease: "power3.out" }, t);
      const shake = (t) => tl.fromTo("#cam", { x: -10 }, { x: 0, duration: 0.35, ease: "elastic.out(1,0.3)" }, t);
      const up = (s, t, d) => tl.fromTo(s, { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: d || 0.35, ease: "back.out(1.6)" }, t);
      const pop = (s, t) => tl.fromTo(s, { autoAlpha: 0, scale: 0.4 }, { autoAlpha: 1, scale: 1, duration: 0.4, ease: "back.out(2.4)" }, t);
      const type = (sel, a, b) => { const ch = $$(sel + " .ch"); tl.fromTo(ch, { opacity: 0 }, { opacity: 1, duration: 0.01, stagger: (b - a) / ch.length }, a); };
      const bob = (sel, t, n) => tl.fromTo(sel, { y: 0 }, { y: -14, duration: 0.25, yoyo: true, repeat: n || 3, ease: "sine.inOut" }, t);
      const mouth = (id, t, d) => tl.to("#" + id + "-m", { attr: { d: d }, duration: 0.2 }, t);
      const SAD = "M82 114 Q100 102 118 114", FLAT = "M84 110 Q100 110 116 110", HAPPY = "M82 104 Q100 120 118 104";
      const kws = (sel) => $$(sel + " .kw").forEach((el) => tl.fromTo(el, { autoAlpha: 0, y: 30, scale: 1.2 }, { autoAlpha: 1, y: 0, scale: 1, duration: 0.18, ease: E }, parseFloat(el.dataset.t)));

      // ===== gancho =====
      scene("#sH1", 0, 3.62);
      const ord = %%WALLORDER%%;
      ord.forEach((k, i) => tl.fromTo("#wb" + k, { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.2 }, 0.1 + i * 0.05));
      const cn = { v: 0 };
      tl.fromTo(cn, { v: 0 }, { v: 2500000, duration: 3.0, ease: "power2.out", onUpdate: () => { $("#h1n").textContent = Math.round(cn.v).toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."); } }, 0.1);
      up("#h1l", 0.9);
      scene("#sH2", 3.62, 6.9);
      punch(3.7, 1.1);
      tl.fromTo("#h2p", { autoAlpha: 0, scale: 1.5 }, { autoAlpha: 1, scale: 1, duration: 0.3, ease: "power4.out" }, 3.7);
      tl.fromTo(".dt", { autoAlpha: 0, scale: 0 }, { autoAlpha: 1, scale: 1, duration: 0.15, stagger: 0.008 }, 3.75);
      %%MARKED%%.forEach((k, i) => tl.to("#dt" + k, { backgroundColor: "#ff7b7b", scale: 0.8, duration: 0.15 }, 5.1 + i * 0.022));
      up("#h2l", 5.14); tl.fromTo("#h2src", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 4.2);
      scene("#sH3", 6.9, 10.45);
      tl.fromTo("#c1", { y: 80, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.35, ease: "back.out(2)" }, 6.96);
      up("#h3a", 7.06); mouth("c1", 7.06, HAPPY); bob("#c1", 7.2, 1);
      tl.fromTo("#v1", { y: 80, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.35, ease: "back.out(2)" }, 8.3);
      [8.42, 9.0, 9.56].forEach((t, i) => { pop("#h3b" + i, t); bob("#v1", t, 1); });
      mouth("c1", 9.2, SAD); tl.to("#c1", { x: -30, duration: 0.6 }, 9.2); tl.to("#h3a .bub", { opacity: 0.4, duration: 0.3 }, 9.6);
      shake(9.56);

      // ===== tese =====
      scene("#sT1", 10.45, 13.17); kws("#t1"); punch(12.3, 1.05);
      scene("#sT2", 13.17, 14.76);
      tl.fromTo("#t2", { autoAlpha: 0, scale: 1.3 }, { autoAlpha: 1, scale: 1, duration: 0.25, ease: "power4.out" }, 13.22);
      mouth("c2", 13.2, FLAT);
      tl.fromTo("#frz .dots3 i", { y: 0 }, { y: -9, duration: 0.2, stagger: 0.1, yoyo: true, repeat: 3, ease: "sine.inOut" }, 13.3);
      tl.to("#frz", { autoAlpha: 0, duration: 0.1 }, 14.3);
      tl.to("#c2", { filter: "saturate(0.2) brightness(0.8)", duration: 0.3 }, 14.2);
      scene("#sT3", 14.76, 18.52);
      tl.fromTo("#v2", { y: 80, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.3, ease: "back.out(2)" }, 14.8);
      $$("#args > div").forEach((el, i) => { tl.fromTo(el, { autoAlpha: 0, x: 80 }, { autoAlpha: 1, x: 0, duration: 0.25, ease: "back.out(2)" }, 15.2 + i * 0.45); bob("#v2", 15.2 + i * 0.45, 1); });
      tl.fromTo("#conv", { autoAlpha: 0, scale: 0.5 }, { autoAlpha: 1, scale: 1.1, duration: 0.5, ease: "back.out(2)" }, 17.08);
      punch(17.1, 1.08);
      scene("#sT4", 18.52, 21.32);
      tl.fromTo("#strike", { scaleX: 0 }, { scaleX: 1, duration: 0.25, ease: "power3.out" }, 18.1);
      up("#t4", 18.65);
      ["#lk0", "#lk1", "#lk2"].forEach((s, i) => pop(s, 19.2 + i * 0.35));
      scene("#sT5", 21.32, 24.67);
      up("#t5", 21.4);
      tl.fromTo("#c3", { y: 60, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.3 }, 21.5);
      pop("#th5", 22.2);
      tl.fromTo("#mag", { autoAlpha: 0, x: 200, y: 120 }, { autoAlpha: 1, x: 0, y: 0, duration: 0.5, ease: E }, 22.54);
      tl.to("#mag", { x: -170, y: -150, duration: 0.6, ease: "power2.inOut" }, 23.2);
      punch(23.8, 1.06);
      scene("#sT6", 24.67, 26.37);
      up("#t6", 24.72);
      $$("#n123 span").forEach((el, i) => pop(el, 25.26 + i * 0.22));

      // ===== situação 1 =====
      scene("#sS1", 26.37, 36.62);
      tl.fromTo("#nt1", { y: -160, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.4, ease: "back.out(1.8)" }, 26.5);
      tl.to("#nt1", { y: -160, autoAlpha: 0, duration: 0.3 }, 27.6);
      up("#s1q", 27.7);
      tl.fromTo("#s1f", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.35, ease: "back.out(2.4)" }, 28.3);
      tl.fromTo("#s1t", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.15 }, 29.4);
      tl.fromTo("#s1t i", { y: 0 }, { y: -8, duration: 0.18, stagger: 0.08, yoyo: true, repeat: 5 }, 29.4);
      tl.to("#s1t", { autoAlpha: 0, height: 0, duration: 0.1 }, 30.6);
      up("#s1a1", 30.62, 0.2); type("#s1a1", 30.7, 33.4);
      up("#s1a2", 33.7, 0.2); type("#s1a2", 33.8, 36.2);
      punch(33.8, 1.04);
      scene("#sS1b", 36.62, 39.52);
      tl.fromTo("#c4", { y: 60, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.3 }, 36.7);
      pop("#th4", 37.4); mouth("c4", 37.4, SAD); bob("#c4", 38.2, 1);

      // ===== situação 2 =====
      scene("#sS2", 39.52, 44.5);
      tl.fromTo("#c5", { y: 60, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.3 }, 39.56);
      tl.fromTo("#s2b", { autoAlpha: 0, scale: 0.4 }, { autoAlpha: 1, scale: 1, duration: 0.35, ease: "back.out(2.5)" }, 40.0);
      mouth("c5", 40.0, SAD); punch(40.56, 1.08);
      tl.to("#s2lab", { autoAlpha: 0, duration: 0.2 }, 41.0);
      up("#s2j", 41.16);
      tl.to("#s2j .red", { textDecoration: "line-through", duration: 0.01 }, 42.0);
      scene("#sS2b", 44.5, 51.87);
      tl.fromTo("#beam", { rotation: 0 }, { rotation: -10, duration: 0.6, ease: "power2.out" }, 44.6);
      tl.fromTo("#panL", { y: 0 }, { y: 60, duration: 0.6, ease: "power2.out" }, 44.6);
      tl.fromTo("#panR", { y: 0 }, { y: -60, duration: 0.6, ease: "power2.out" }, 44.6);
      tl.to("#panRq", { autoAlpha: 0, duration: 0.2 }, 44.8);
      tl.fromTo("#panRt", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 44.9);
      for (let k = 0; k < 6; k++) {
        tl.fromTo("#cn" + k, { autoAlpha: 0, x: 0, y: 0 }, { autoAlpha: 1, x: (k % 2 ? 40 : -40) + k * 6, y: 120, duration: 0.25, ease: "power2.out" }, 47.6 + k * 0.3);
        tl.to("#cn" + k, { y: 420, autoAlpha: 0, duration: 0.6, ease: "power2.in" }, 47.85 + k * 0.3);
      }
      tl.fromTo("#s2x", { autoAlpha: 0, y: 20 }, { autoAlpha: 1, y: 0, duration: 0.3 }, 48.3);
      tl.to("#beam", { rotation: 10, duration: 0.7, ease: "back.out(1.6)" }, 49.74);
      tl.to("#panL", { y: -60, duration: 0.7, ease: "back.out(1.6)" }, 49.74);
      tl.to("#panR", { y: 60, duration: 0.7, ease: "back.out(1.6)" }, 49.74);
      tl.fromTo("#motivo", { autoAlpha: 0, scale: 2, rotation: -20 }, { autoAlpha: 1, scale: 1, rotation: -6, duration: 0.25, ease: "power4.in" }, 50.4);

      // ===== CTA =====
      scene("#sC", 51.87, 54.9);
      tl.fromTo("#svf", { scaleY: 0, transformOrigin: "50% 100%" }, { scaleY: 1, duration: 0.7, ease: "power2.out" }, 52.1);
      punch(52.1, 1.05);

      // ===== situação 3 =====
      scene("#sS3", 54.9, 62.3);
      tl.fromTo("#ph3", { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: 0.35 }, 54.95);
      tl.fromTo("#c6", { y: 60, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.3 }, 56.18);
      mouth("c6", 56.18, FLAT);
      [57.92, 58.52, 59.54, 60.84].forEach((t, i) => { tl.fromTo("#k" + i, { autoAlpha: 0, y: -50, rotation: i % 2 ? 8 : -8 }, { autoAlpha: 1, y: 0, rotation: i % 2 ? 3 : -3, duration: 0.45, ease: "bounce.out" }, t); bob("#c6", t, 1); });
      scene("#sS3b", 62.3, 65.9);
      tl.fromTo("#calcol", { y: 0 }, { y: -1100, duration: 1.1, ease: "power2.inOut" }, 62.98);
      punch(64.1, 1.05);
      up("#s3sup", 64.34);
      scene("#sS3c", 65.9, 72.17);
      type("#s3m", 65.96, 69.4);
      [70.0, 70.4, 70.8].forEach((t, i) => tl.fromTo("#r" + i, { autoAlpha: 0, x: -60 }, { autoAlpha: 1, x: 0, duration: 0.3, ease: E }, t));
      $$(".br3 .arr").forEach((a, i) => tl.fromTo(a, { scaleX: 0, transformOrigin: "left center" }, { scaleX: 1, duration: 0.3 }, 70.1 + i * 0.4));

      // ===== pergunta =====
      scene("#sQ", 72.17, 78.57);
      tl.fromTo("#qdots .dots3 i", { y: 0 }, { y: -10, duration: 0.22, stagger: 0.12, yoyo: true, repeat: 11, ease: "sine.inOut" }, 72.2);
      kws("#qtxt"); punch(77.14, 1.06);

      // ===== assinatura =====
      tl.fromTo("#sS", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 78.57);
      tl.fromTo("#sgsh", { y: 0 }, { y: -40, duration: 0.35, ease: "back.out(3)" }, 78.75);
      up("#sgname", 78.9); up("#sgpos", 79.8);
      tl.fromTo("#sgch", { autoAlpha: 0, scale: 1.6, rotation: -8 }, { autoAlpha: 1, scale: 1, rotation: -2, duration: 0.25, ease: "power4.in" }, 81.7);

      // ===== legendas =====
      $$(".cap").forEach((c) => {
        const s = parseFloat(c.dataset.s), e = parseFloat(c.dataset.e);
        tl.set(c, { visibility: "visible" }, s); tl.set(c, { visibility: "hidden" }, e);
        const ws = $$(".w", c);
        ws.forEach((w, i) => {
          tl.set(w, { color: "#6FD3A0" }, parseFloat(w.dataset.t));
          tl.set(w, { color: "#ffffff" }, i + 1 < ws.length ? parseFloat(ws[i + 1].dataset.t) : e - 0.01);
        });
      });
      $$(".cap .w").forEach((w) => gsap.set(w, { color: "rgba(255,255,255,0.55)" }));
      tl.to("#caps", { autoAlpha: 0, duration: 0.15 }, 51.85); tl.to("#caps", { autoAlpha: 1, duration: 0.15 }, 54.9);
      tl.set({}, {}, D);
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
