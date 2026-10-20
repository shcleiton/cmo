<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1080, height=1920" />
    <title>Dia 3: o zero confortável</title>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js"></script>
    <style>
      @font-face { font-family: "Montserrat"; font-weight: 900; src: url("assets/fonts/montserrat-latin-900-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 800; src: url("assets/fonts/montserrat-latin-800-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 600; src: url("assets/fonts/montserrat-latin-600-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 500; src: url("assets/fonts/montserrat-latin-500-normal.woff2") format("woff2"); }
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html, body { margin: 0; background: #08090b; overflow: hidden; }
      #root { position: relative; width: 1080px; height: 1920px; overflow: hidden; background: #08090b; font-family: "Montserrat", sans-serif; color: #fff; }
      .layer { position: absolute; inset: 0; }

      /* ===== ATO 1: monocromático ===== */
      #mono { background: radial-gradient(80% 55% at 50% 46%, #24272c 0%, #121417 55%, #08090b 100%); transform-origin: 540px 930px; }
      #hook { position: absolute; left: 120px; right: 120px; top: 300px; }
      #hook p { font-weight: 900; font-size: 54px; line-height: 1.08; letter-spacing: -0.02em; color: #8d949c; }
      #hook .hi { color: #ffffff; }
      #hook .kw { display: inline-block; opacity: 0; }
      #nome { position: absolute; left: 120px; right: 120px; top: 330px; font-weight: 900; font-size: 84px; letter-spacing: -0.02em; opacity: 0; }
      #zbox { position: absolute; left: 0; right: 0; top: 510px; height: 840px; }
      #z0 { position: absolute; inset: 0; text-align: center; font-weight: 900; font-size: 900px; line-height: 840px; letter-spacing: 0;
        background: linear-gradient(105deg, #5b6168 0%, #c9ced4 30%, #ffffff 40%, #c9ced4 50%, #6d737a 80%, #4a4f55 100%);
        background-size: 300% 100%; background-position: 100% 0; -webkit-background-clip: text; background-clip: text; color: transparent;
        filter: drop-shadow(0 30px 60px rgba(0,0,0,0.6)); }
      #ring { position: absolute; left: 540px; top: 420px; width: 780px; height: 780px; margin: -390px 0 0 -390px; border-radius: 50%;
        border: 3px solid rgba(255,255,255,0.28); box-shadow: inset 0 0 80px rgba(255,255,255,0.10), 0 0 40px rgba(255,255,255,0.06);
        background: radial-gradient(circle at 35% 28%, rgba(255,255,255,0.10) 0%, rgba(255,255,255,0) 35%); opacity: 0; }
      #cracks { position: absolute; inset: 0; width: 1080px; height: 840px; }
      #cracks path { opacity: 0; fill: none; stroke: #ffffff; stroke-width: 5; stroke-linecap: round; stroke-linejoin: round; filter: drop-shadow(0 0 6px rgba(255,255,255,0.8)); }
      .nao { position: absolute; left: 540px; top: 890px; font-weight: 900; font-size: 46px; letter-spacing: 0.06em; color: #e9ecef;
        padding: 14px 26px; border: 3px solid rgba(255,255,255,0.6); border-radius: 40px; background: rgba(20,22,25,0.85); opacity: 0; white-space: nowrap; }
      .lb { position: absolute; left: 120px; right: 120px; top: 1290px; text-align: center; font-weight: 900; font-size: 62px; letter-spacing: -0.01em; line-height: 1.05; opacity: 0; }
      #quote { position: absolute; left: 120px; right: 120px; top: 1375px; text-align: center; font-weight: 500; font-size: 28px; color: #aab1b8; opacity: 0; }
      #quote b { font-weight: 600; color: #e5e8eb; font-style: italic; }
      #lb5 { font-size: 120px; top: 1250px; }
      #todo { position: absolute; left: 170px; right: 170px; top: 760px; height: 540px; border-radius: 28px; background: rgba(255,255,255,0.05);
        border: 2px solid rgba(255,255,255,0.14); overflow: hidden; opacity: 0; }
      #tdl { position: absolute; left: 0; right: 0; top: 24px; }
      .td { height: 92px; display: flex; align-items: center; gap: 26px; padding: 0 36px; font-weight: 800; font-size: 40px; color: #e3e6e9; opacity: 0; }
      .box { width: 44px; height: 44px; border-radius: 10px; border: 4px solid #8d949c; position: relative; flex: none; }
      .box::after { content: ""; position: absolute; left: 10px; top: 2px; width: 12px; height: 24px; border: solid #ffffff; border-width: 0 6px 6px 0; transform: rotate(45deg) scale(var(--ck, 0)); }
      #tdo { position: absolute; left: 0; right: 0; bottom: 0; height: 110px; display: flex; align-items: center; gap: 26px; padding: 0 36px;
        background: linear-gradient(0deg, #2a1b1b 0%, rgba(42,27,27,0.9) 100%); border-top: 2px solid rgba(255,107,107,0.5); font-weight: 900; font-size: 44px; color: #ff8a80; }
      #tdo .box { border-color: #ff8a80; }

      #flash { background: #6FD3A0; opacity: 0; }

      /* ===== ATO 2: cor ===== */
      #color { opacity: 0; background: radial-gradient(120% 70% at 50% 110%, #0a4a66 0%, #03354e 55%, #022a3e 100%); }
      #color::after { content: ""; position: absolute; left: 0; right: 0; bottom: 0; height: 560px;
        background-image: radial-gradient(circle, rgba(111,211,160,0.5) 2.2px, transparent 2.6px), radial-gradient(circle, rgba(0,163,214,0.4) 1.8px, transparent 2.2px);
        background-size: 34px 34px, 34px 34px; background-position: 0 0, 17px 17px;
        -webkit-mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%);
        mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%); }
      #week { position: absolute; left: 120px; right: 120px; top: 290px; display: flex; gap: 10px; z-index: 3; }
      .day { flex: 1; text-align: center; font-weight: 800; font-size: 22px; letter-spacing: 0.08em; padding: 12px 0; border-radius: 30px;
        background: rgba(255,255,255,0.07); color: rgba(255,255,255,0.45); }
      .day.on { background: #6FD3A0; color: #03354e; }
      #plus2 { position: absolute; top: -46px; left: 50%; font-weight: 900; font-size: 24px; color: #6FD3A0; opacity: 0; white-space: nowrap; }
      #world { position: absolute; left: 0; top: 0; width: 1080px; height: 5760px; }
      .st { position: absolute; left: 120px; right: 120px; height: 1920px; }
      #st1 { top: 0; } #st2 { top: 1920px; } #st3 { top: 3840px; }
      .sh { position: absolute; top: 410px; left: 0; right: 0; display: flex; align-items: center; gap: 30px; }
      .num { font-weight: 900; font-size: 170px; line-height: 0.8; color: transparent; -webkit-text-stroke: 4px #6FD3A0; }
      .stt { font-weight: 900; font-size: 50px; line-height: 1.05; letter-spacing: -0.01em; }
      .stt em { font-style: normal; color: #6FD3A0; }
      #msg { position: absolute; top: 640px; left: 0; right: 0; background: #0d2633; border: 2px solid rgba(111,211,160,0.3); border-radius: 30px 30px 30px 8px;
        padding: 34px 34px 30px; box-shadow: 0 30px 70px rgba(0,0,0,0.35); opacity: 0; }
      .ol { position: relative; margin-bottom: 22px; }
      .otag { display: inline-block; font-weight: 800; font-size: 20px; letter-spacing: 0.14em; color: #03354e; background: #6FD3A0; padding: 6px 12px; border-radius: 8px; margin-bottom: 8px; opacity: 0; }
      .otx { font-weight: 600; font-size: 38px; line-height: 1.25; color: #ffffff; }
      .otx .ch { opacity: 0; }
      #ol3 { margin-top: 10px; padding-top: 20px; border-top: 2px dashed rgba(111,211,160,0.4); margin-bottom: 0; }
      #ol3 .otx { color: #6FD3A0; font-weight: 800; }
      #stamp { position: absolute; right: 30px; bottom: -170px; width: 200px; height: 200px; border-radius: 50%; border: 6px solid #6FD3A0; color: #6FD3A0;
        display: flex; align-items: center; justify-content: center; text-align: center; font-weight: 900; font-size: 34px; line-height: 1; background: rgba(3,53,78,0.95); opacity: 0; }
      #grid { position: absolute; top: 660px; left: 30px; right: 30px; display: grid; grid-template-columns: repeat(6, 1fr); gap: 26px 0; }
      .av { width: 104px; height: 104px; border-radius: 50%; justify-self: center; position: relative; opacity: 0;
        background: radial-gradient(circle at 50% 38%, #8aa0ad 0 22%, transparent 23%), radial-gradient(ellipse at 50% 100%, #8aa0ad 0 42%, transparent 43%), #2c4756; }
      .tick { position: absolute; right: -6px; bottom: -4px; width: 40px; height: 40px; border-radius: 50%; background: #5f6f78; border: 4px solid #03354e; }
      .tick::after { content: ""; position: absolute; left: 12px; top: 6px; width: 8px; height: 16px; border: solid #fff; border-width: 0 4px 4px 0; transform: rotate(45deg); }
      .tick.blue { background: #00a3d6; }
      #ctr { position: absolute; top: 1335px; left: 0; right: 0; text-align: left; font-weight: 900; font-size: 64px; }
      #ctr span { color: #6FD3A0; }
      #clock { position: absolute; top: 1342px; right: 0; font-weight: 900; font-size: 34px; color: #03354e; background: #6FD3A0; padding: 12px 22px; border-radius: 40px; opacity: 0; }
      .tile { position: absolute; left: 0; right: 0; height: 200px; border-radius: 26px; background: rgba(2,42,62,0.85); border: 2px solid rgba(111,211,160,0.3);
        display: flex; align-items: center; justify-content: space-between; padding: 0 40px; opacity: 0; }
      .tile p { font-weight: 800; font-size: 38px; letter-spacing: 0.02em; }
      #t1 { top: 660px; } #t2 { top: 890px; } #t3 { top: 1120px; }
      .roll { display: inline-block; height: 130px; overflow: hidden; font-weight: 900; font-size: 120px; line-height: 130px; color: #6FD3A0; }
      .roll .strip { display: flex; flex-direction: column; }
      .roll i { font-style: normal; height: 130px; }

      /* ===== holofote ===== */
      #spot { opacity: 0; background: radial-gradient(circle at 50% 46%, rgba(255,255,255,0.13) 0%, rgba(255,255,255,0.04) 22%, #000 46%); }
      #spottxt { position: absolute; left: 150px; right: 150px; top: 740px; text-align: center; font-weight: 900; font-size: 72px; line-height: 1.05; opacity: 0; }
      #spottxt em { font-style: normal; color: #6FD3A0; }

      /* ===== árvore ===== */
      #tree { opacity: 0; background: radial-gradient(120% 70% at 50% 110%, #0a4a66 0%, #03354e 55%, #022a3e 100%); }
      #tmask { position: absolute; left: 0; right: 0; top: 0; height: 420px; background: linear-gradient(180deg, #022a3e 0%, #022a3e 60%, rgba(2,42,62,0) 100%); }
      #tcam { position: absolute; left: 120px; right: 120px; top: 400px; transform-origin: 50% 0; }
      #spine { position: absolute; left: 44px; top: 50px; width: 4px; height: 1300px; background: rgba(111,211,160,0.5); transform-origin: top center; transform: scaleY(0); }
      .br { position: relative; display: flex; gap: 30px; margin-bottom: 70px; }
      .ico { width: 92px; height: 92px; flex: none; border-radius: 50%; background: #0d2633; border: 3px solid rgba(111,211,160,0.6); display: flex; align-items: center; justify-content: center; position: relative; z-index: 2; opacity: 0; }
      .ico svg { width: 52px; height: 52px; fill: none; stroke: #ffffff; stroke-width: 3.2; stroke-linecap: round; stroke-linejoin: round; }
      .bt { flex: 1; }
      .q { font-weight: 900; font-size: 46px; line-height: 1.08; letter-spacing: -0.01em; opacity: 0; }
      .tagfix, .tagok { display: inline-flex; flex-wrap: wrap; align-items: baseline; gap: 10px; margin-top: 18px; font-weight: 900; font-size: 40px; padding: 14px 22px; border-radius: 16px; opacity: 0; }
      .tagfix { background: rgba(111,211,160,0.14); border: 2px solid rgba(111,211,160,0.55); color: #ffffff; }
      .tagfix .lbl { font-size: 24px; letter-spacing: 0.14em; color: #6FD3A0; }
      .tagfix small { flex-basis: 100%; font-weight: 600; font-size: 26px; color: rgba(255,255,255,0.75); }
      .dot { width: 14px; height: 14px; border-radius: 50%; background: #ff6b6b; display: inline-block; align-self: center; }
      .tagok { background: #6FD3A0; color: #03354e; box-shadow: 0 0 50px rgba(111,211,160,0.55); font-size: 46px; }
      .arrow-ad { font-size: 40px; opacity: 0; }
      .note { display: inline-block; margin-top: 18px; margin-left: 6px; max-width: 640px; font-weight: 800; font-size: 30px; line-height: 1.2; color: #2b2b1f; background: #fff3b0;
        padding: 18px 22px; border-radius: 4px; box-shadow: 0 14px 30px rgba(0,0,0,0.35); transform: rotate(-2.5deg); opacity: 0; }
      .chips { display: flex; gap: 14px; margin-top: 16px; }
      .chip { font-weight: 900; font-size: 32px; color: #03354e; background: #ffffff; padding: 10px 22px; border-radius: 40px; opacity: 0; }

      /* ===== assinatura ===== */
      #sig { opacity: 0; }
      #sg1 { position: absolute; left: 120px; right: 120px; top: 420px; text-align: center; font-weight: 900; font-size: 64px; opacity: 0; }
      #sg1 .gr { color: #7f8890; }
      #digits { position: absolute; left: 0; right: 0; top: 560px; height: 440px; text-align: center; font-weight: 900; font-size: 430px; line-height: 440px; white-space: nowrap; }
      #dg3 { display: inline-block; color: #6FD3A0; opacity: 0; }
      #dg0 { display: inline-block; color: #7f8890; }
      #sg2 { position: absolute; left: 120px; right: 120px; top: 1030px; text-align: center; font-weight: 900; font-size: 60px; line-height: 1.08; opacity: 0; }
      #sg3 { position: relative; display: inline-block; color: #6FD3A0; opacity: 0; }
      #sgu { position: absolute; left: 0; right: 0; bottom: -10px; height: 8px; border-radius: 4px; background: #6FD3A0; transform-origin: left center; transform: scaleX(0); }

      /* ===== CTA ===== */
      #cta { opacity: 0; }
      #ck { position: absolute; left: 120px; right: 120px; top: 330px; text-align: center; font-weight: 600; font-size: 30px; letter-spacing: 0.28em; color: #6FD3A0; opacity: 0; }
      #ct1, #ct2 { position: absolute; left: 120px; right: 120px; top: 370px; text-align: center; font-weight: 900; font-size: 66px; line-height: 1.05; opacity: 0; }
      #odo { position: absolute; left: 0; right: 0; top: 590px; height: 620px; display: flex; justify-content: center; align-items: flex-end; }
      #odd { width: 470px; height: 620px; overflow: hidden; font-weight: 900; font-size: 640px; line-height: 620px; text-align: center; }
      #odd .col { display: flex; flex-direction: column; }
      #odd i { font-style: normal; height: 620px; display: block; background: linear-gradient(160deg, #6FD3A0 0%, #00a897 50%, #008293 100%); -webkit-background-clip: text; background-clip: text; color: transparent; }
      #o45 { font-weight: 900; font-size: 150px; line-height: 1; color: #ffffff; margin: 0 0 70px 14px; opacity: 0; }
      #oday { position: absolute; top: 560px; left: 0; right: 0; text-align: center; font-weight: 600; font-size: 30px; letter-spacing: 0.32em; color: #6FD3A0; opacity: 0; }
      #stampd { position: absolute; left: 50%; top: 1180px; width: 640px; margin-left: -320px; text-align: center; font-weight: 900; font-size: 52px; letter-spacing: 0.04em;
        color: #6FD3A0; border: 6px solid #6FD3A0; border-radius: 18px; padding: 14px 0; opacity: 0; }
      #segue { position: absolute; left: 50%; top: 1310px; width: 840px; margin-left: -420px; text-align: center; font-weight: 900; font-size: 46px; white-space: nowrap; color: #03354e; background: #6FD3A0;
        border-radius: 60px; padding: 22px 0; opacity: 0; box-shadow: 0 0 50px rgba(111,211,160,0.5); }

      /* ===== legenda e textura ===== */
      #caps { position: absolute; left: 110px; right: 110px; top: 1430px; height: 110px; }
      .cap { position: absolute; left: 0; right: 0; top: 0; text-align: center; font-weight: 700; font-weight: 800; font-size: 40px; line-height: 1.2; visibility: hidden;
        text-shadow: 0 2px 12px rgba(0,0,0,0.85), 0 0 2px rgba(0,0,0,0.9); }
      .cap .w { color: rgba(255,255,255,0.55); }
      #grain { pointer-events: none; opacity: 0.07; mix-blend-mode: overlay;
        background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='300' height='300'><filter id='n'><feTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='2' stitchTiles='stitch'/></filter><rect width='300' height='300' filter='url(%23n)'/></svg>"); }
    </style>
  </head>
  <body>
    <div id="root" data-composition-id="main" data-start="0" data-width="1080" data-height="1920" data-duration="%%D%%">
      <audio id="narracao" src="assets/audio/narracao.mp3" data-start="0" data-duration="%%D%%" data-track-index="0"></audio>
%%SFX%%
      <div class="layer" id="mono">
        <div id="hook"><p>
          <span class="kw" data-t="0.06">VOCÊ</span> <span class="kw" data-t="0.28">ESTÁ</span> <span class="kw" data-t="0.5">HÁ</span> <span class="kw hi" data-t="0.68">MESES</span>
          <span class="kw" data-t="1.04">PREPARANDO</span> <span class="kw" data-t="1.42">O</span> <span class="kw" data-t="1.48">NEGÓCIO</span>
          <span class="kw" data-t="2.04">E</span> <span class="kw" data-t="2.12">AINDA</span> <span class="kw hi" data-t="2.34">NÃO</span> <span class="kw hi" data-t="2.48">FEZ</span>
          <span class="kw hi" data-t="2.68">NENHUMA</span> <span class="kw hi" data-t="3.14">OFERTA?</span></p></div>
        <div id="nome">ISSO TEM NOME.</div>
        <div id="zbox">
          <div id="ring"></div>
          <div id="z0">0</div>
          <svg id="cracks" viewBox="0 0 1080 840">
            <path id="ck1" d="M330 230 L392 296 L376 350 L438 404 L420 452"/>
            <path id="ck2" d="M742 214 L700 290 L734 338 L676 414 L700 470"/>
            <path id="ck3" d="M450 690 L506 630 L560 650 L604 590 L668 604"/>
          </svg>
          %%NAOS%%
        </div>
        <div class="lb" id="lb1">O ZERO CONFORTÁVEL</div>
        <div id="quote"><b>"O zero é muito confortável."</b> Ícaro de Carvalho</div>
        <div id="todo"><div id="tdl">%%TODO%%</div><div id="tdo"><b class="box"></b>OFERTA</div></div>
        <div class="lb" id="lb2">NINGUÉM TE DIZ NÃO.</div>
        <div class="lb" id="lb3">O ZERO NÃO TE ENSINA NADA.</div>
        <div class="lb" id="lb4">SAIR DO ZERO ESSA SEMANA.</div>
        <div class="lb" id="lb5">ANOTA.</div>
      </div>

      <div class="layer" id="color">
        <div id="week">%%DAYS%%<span id="plus2">+2 DIAS</span></div>
        <div id="world">
          <div class="st" id="st1">
            <div class="sh" id="sh1"><span class="num">1</span><p class="stt">ESCREVE A OFERTA<br/>EM <em>3 LINHAS</em></p></div>
            <div id="msg">%%OFFER%%<div id="stamp">SIM<br/>OU<br/>NÃO</div></div>
          </div>
          <div class="st" id="st2">
            <div class="sh" id="sh2"><span class="num">2</span><p class="stt"><em>30 PESSOAS</em> QUE JÁ<br/>FALARAM COM VOCÊ</p></div>
            <div id="grid">%%AV%%</div>
            <div id="ctr"><span id="ctrn">0</span>/30</div>
            <div id="clock">+2 DIAS: REENVIA</div>
          </div>
          <div class="st" id="st3">
            <div class="sh" id="sh3"><span class="num">3</span><p class="stt">ANOTA<br/><em>3 NÚMEROS</em></p></div>
            <div class="tile" id="t1"><p>RESPONDERAM</p>%%ROLL%%</div>
            <div class="tile" id="t2"><p>QUISERAM<br/>SABER MAIS</p>%%ROLL%%</div>
            <div class="tile" id="t3"><p>COMPRARAM</p>%%ROLL%%</div>
          </div>
        </div>
      </div>

      <div class="layer" id="spot"><div id="spottxt">AGORA A PARTE QUE QUASE NINGUÉM <em>SABE LER.</em></div></div>

      <div class="layer" id="tree"><div id="tcam"><div id="spine"></div>%%BR%%</div><div id="tmask"></div></div>

      <div class="layer" id="sig">
        <div id="sg1">O ZERO NÃO TE DIZ <span class="gr">NADA.</span></div>
        <div id="digits"><span id="dg3">3</span><span id="dg0">0</span></div>
        <div id="sg2">MENSAGENS TE MOSTRAM<br/><span id="sg3">ONDE ESTÁ O PROBLEMA.<i id="sgu"></i></span></div>
      </div>

      <div class="layer" id="cta">
        <div id="ck">NESSE PERFIL</div>
        <div id="ct1">MARKETING<br/>COM NÚMERO.</div>
        <div id="ct2">E ELE TAMBÉM ESTÁ<br/>SAINDO DO ZERO.</div>
        <div id="oday">DIA</div>
        <div id="odo"><div id="odd"><div class="col" id="odc"><i>0</i><i>1</i><i>2</i><i>3</i></div></div><div id="o45">/45</div></div>
        <div id="stampd">DESAFIO 45 DIAS</div>
        <div id="segue">SEGUE PRA ACOMPANHAR</div>
      </div>

      <div class="layer" id="flash"></div>
      <div id="caps">%%CAPS%%</div>
      <div class="layer" id="grain"></div>
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out", D = %%D%%;
      const $ = (s) => document.querySelector(s), $$ = (s) => Array.from(document.querySelectorAll(s));
      const show = (s, t, d) => tl.fromTo(s, { autoAlpha: 0 }, { autoAlpha: 1, duration: d || 0.25 }, t);
      const hide = (s, t, d) => tl.to(s, { autoAlpha: 0, duration: d || 0.25 }, t);
      const up = (s, t, d) => tl.fromTo(s, { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: d || 0.4, ease: "back.out(1.6)" }, t);
      const pop = (s, t) => tl.fromTo(s, { autoAlpha: 0, scale: 0.5 }, { autoAlpha: 1, scale: 1, duration: 0.45, ease: "back.out(2.2)" }, t);
      const draw = (el, t, d) => { const L = el.getTotalLength(); tl.set(el, { opacity: 1 }, t); tl.fromTo(el, { strokeDasharray: L, strokeDashoffset: L }, { strokeDashoffset: 0, duration: d || 0.3, ease: "power2.out" }, t); };

      // ===== ATO 1 =====
      tl.fromTo("#z0", { scale: 0.82, autoAlpha: 0 }, { scale: 1, autoAlpha: 1, duration: 0.5, ease: "power4.out" }, 0);
      tl.fromTo("#z0", { backgroundPosition: "100% 0" }, { backgroundPosition: "0% 0", duration: 2.2, ease: "power1.inOut" }, 0.3);
      tl.to("#zbox", { scale: 1.025, duration: 1.6, yoyo: true, repeat: 3, ease: "sine.inOut" }, 0.5);
      $$("#hook .kw").forEach((el) => tl.fromTo(el, { autoAlpha: 0, y: 26 }, { autoAlpha: 1, y: 0, duration: 0.16, ease: E }, parseFloat(el.dataset.t)));
      hide("#hook", 3.9, 0.15);
      tl.fromTo("#nome", { autoAlpha: 0, scale: 1.15 }, { autoAlpha: 1, scale: 1, duration: 0.25, ease: E }, 3.96);
      // zero vira bolha de vidro, confortável
      tl.fromTo("#z0", { backgroundPosition: "100% 0" }, { backgroundPosition: "0% 0", duration: 0.9, ease: "power2.inOut" }, 4.9);
      tl.fromTo("#ring", { autoAlpha: 0, scale: 0.85 }, { autoAlpha: 1, scale: 1, duration: 0.6, ease: "back.out(1.6)" }, 4.92);
      up("#lb1", 5.14); show("#quote", 5.5, 0.4);
      // lista que nunca termina
      hide(["#nome", "#lb1", "#quote", "#ring"], 6.55, 0.2);
      tl.to("#zbox", { y: -400, scale: 0.4, duration: 0.6, ease: "power3.inOut" }, 6.6);
      tl.fromTo("#todo", { autoAlpha: 0, y: 80 }, { autoAlpha: 1, y: 0, duration: 0.45, ease: E }, 6.75);
      const rowT = [7.0, 7.8, 8.96, 9.68, 10.05, 10.38];
      rowT.forEach((t, i) => {
        tl.fromTo("#td" + i, { autoAlpha: 0, x: -50 }, { autoAlpha: 1, x: 0, duration: 0.25, ease: E }, t);
        tl.fromTo("#bx" + i, { "--ck": 0 }, { "--ck": 1, duration: 0.2, ease: "back.out(3)" }, t + 0.3);
        if (i >= 3) tl.to("#tdl", { y: -(i - 3 + 1) * 92, duration: 0.3, ease: E }, t);
        tl.fromTo("#tdo", { y: 0 }, { y: 36, duration: 0.12, yoyo: true, repeat: 1, ease: "power2.out" }, t);
      });
      // bolha: os NÃO batem e voltam
      hide("#todo", 10.7, 0.25);
      tl.to("#zbox", { y: 0, scale: 1, duration: 0.55, ease: "power3.inOut" }, 10.72);
      tl.to("#ring", { autoAlpha: 1, duration: 0.3 }, 10.95);
      const ang = [200, 330, 30, 150, 260], hits = [11.3, 11.75, 12.2, 12.65, 13.12];
      ang.forEach((a, i) => {
        const r = (a * Math.PI) / 180, cx = Math.cos(r), cy = Math.sin(r);
        tl.fromTo("#nao" + i, { autoAlpha: 0, x: cx * 760 - 80, y: cy * 760 - 40, rotation: 0 },
          { autoAlpha: 1, x: cx * 470 - 80, y: cy * 470 - 40, duration: 0.35, ease: "power2.in" }, hits[i] - 0.35);
        tl.to("#nao" + i, { x: cx * 980 - 80, y: cy * 980 - 40, rotation: (i % 2 ? 40 : -40), autoAlpha: 0, duration: 0.6, ease: "power2.out" }, hits[i]);
        tl.fromTo("#ring", { borderColor: "rgba(255,255,255,0.9)" }, { borderColor: "rgba(255,255,255,0.28)", duration: 0.35 }, hits[i]);
      });
      up("#lb2", 12.38);
      // o zero racha
      hide(["#lb2", "#ring"], 13.7, 0.2);
      up("#lb3", 13.95);
      [["#ck1", 14.08], ["#ck2", 14.86], ["#ck3", 15.28]].forEach(([s, t]) => {
        draw($(s), t, 0.18);
        tl.fromTo("#zbox", { x: -7 }, { x: 0, duration: 0.25, ease: "elastic.out(1,0.3)" }, t);
      });
      hide("#lb3", 15.75, 0.15); up("#lb4", 15.88);
      hide("#lb4", 17.65, 0.1);
      tl.fromTo("#lb5", { autoAlpha: 0, scale: 1.6 }, { autoAlpha: 1, scale: 1, duration: 0.18, ease: "power4.out" }, 17.76);
      // o mergulho
      tl.to("#mono", { scale: 11, filter: "blur(10px)", duration: 0.5, ease: "power3.in" }, 17.9);
      tl.fromTo("#flash", { autoAlpha: 0 }, { autoAlpha: 0.85, duration: 0.06 }, 18.36);
      tl.to("#flash", { autoAlpha: 0, duration: 0.35 }, 18.42);
      tl.set("#mono", { autoAlpha: 0 }, 18.4);
      tl.fromTo("#color", { autoAlpha: 0, scale: 1.25 }, { autoAlpha: 1, scale: 1, duration: 0.6, ease: E }, 18.36);

      // ===== ATO 2: passos =====
      const dayOn = (i, t) => tl.fromTo("#d" + i, { backgroundColor: "rgba(255,255,255,0.07)", color: "rgba(255,255,255,0.45)" },
        { backgroundColor: "#6FD3A0", color: "#03354e", duration: 0.25 }, t);
      $$(".day").forEach((d) => gsap.set(d, { backgroundColor: "rgba(255,255,255,0.07)", color: "rgba(255,255,255,0.45)" }));
      dayOn(0, 18.44);
      up("#sh1", 18.5);
      up("#msg", 20.55, 0.35);
      const lineT = [[20.82, 21.6], [21.66, 22.6], [22.7, 24.2], [24.68, 26.3]];
      lineT.forEach(([a, b], i) => {
        if ($("#ot" + i)) pop("#ot" + i, a);
        const ch = $$("#ol" + i + " .ch");
        tl.fromTo(ch, { opacity: 0 }, { opacity: 1, duration: 0.01, stagger: (b - a) / ch.length }, a);
      });
      tl.fromTo("#stamp", { autoAlpha: 0, scale: 2.2, rotation: -30 }, { autoAlpha: 1, scale: 1, rotation: -12, duration: 0.25, ease: "power4.in" }, 26.4);
      // passo 2
      tl.to("#world", { y: -1920, duration: 0.75, ease: "power3.inOut" }, 27.5);
      dayOn(1, 28.42);
      up("#sh2", 27.9);
      tl.fromTo(".av", { autoAlpha: 0, scale: 0.3 }, { autoAlpha: 1, scale: 1, duration: 0.25, ease: "back.out(2)", stagger: { amount: 3.2, ease: "power2.in" } }, 28.45);
      const cn = { v: 0 };
      tl.fromTo(cn, { v: 0 }, { v: 30, duration: 3.45, ease: "power2.in", onUpdate: () => { $("#ctrn").textContent = Math.round(cn.v); } }, 28.45);
      dayOn(2, 30.6);
      const unseen = [3, 7, 11, 14, 18, 22, 25, 28];
      tl.fromTo("#plus2", { autoAlpha: 0, y: 10 }, { autoAlpha: 1, y: 0, duration: 0.3 }, 32.14);
      dayOn(3, 33.08);
      pop("#clock", 33.1);
      unseen.forEach((i) => tl.fromTo("#av" + i, { boxShadow: "0 0 0 0 rgba(255,107,107,0)" }, { boxShadow: "0 0 0 10px rgba(255,107,107,0.85)", duration: 0.3, yoyo: true, repeat: 3 }, 32.3));
      unseen.forEach((i, k) => tl.fromTo("#av" + i, { scale: 1 }, { scale: 1.18, duration: 0.15, yoyo: true, repeat: 1 }, 33.84 + k * 0.05));
      tl.to(".tick", { backgroundColor: "#00a3d6", duration: 0.15, stagger: 0.02 }, 34.1);
      // passo 3
      tl.to("#world", { y: -3840, duration: 0.75, ease: "power3.inOut" }, 34.72);
      up("#sh3", 35.1);
      dayOn(4, 35.54);
      [["#t1", 36.94], ["#t2", 38.14], ["#t3", 39.8]].forEach(([s, t], i) => {
        tl.fromTo(s, { autoAlpha: 0, x: 120 }, { autoAlpha: 1, x: 0, duration: 0.35, ease: E }, t);
        tl.fromTo(s + " .strip", { y: 0 }, { y: -1300, duration: 0.6, ease: "power2.out" }, t + 0.05);
        if (i) dayOn(4 + i, t);
      });

      // ===== holofote =====
      tl.fromTo("#spot", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.22 }, 40.74);
      tl.set("#color", { autoAlpha: 0 }, 40.98);
      tl.fromTo("#spottxt", { autoAlpha: 0, scale: 0.92 }, { autoAlpha: 1, scale: 1, duration: 0.5, ease: E }, 41.38);

      // ===== árvore =====
      tl.set("#tree", { autoAlpha: 1 }, 43.0);
      tl.to(["#spot"], { autoAlpha: 0, duration: 0.4 }, 43.05);
      const brs = ["b1", "b2", "b3", "b4"], bT = [43.62, 50.58, 54.18, 59.38], tagT = [45.38, 52.78, 56.14, 60.3];
      const camY = (id) => -$("#" + id).offsetTop;
      brs.forEach((b, i) => {
        if (i) tl.to("#tcam", { y: camY(b), duration: 0.7, ease: "power3.inOut" }, bT[i] - 0.5);
        tl.to("#spine", { scaleY: Math.min(1, ($("#" + b).offsetTop + 60) / 1300), duration: 0.5, ease: "power2.out" }, bT[i] - 0.4);
        pop("#" + b + "-ico", bT[i] - 0.15);
        $$("#" + b + "-ico svg path, #" + b + "-ico svg circle").forEach((p) => draw(p, bT[i], 0.45));
        up("#" + b + "-q", bT[i]);
        tl.fromTo("#" + b + "-tag", { autoAlpha: 0, y: -40 }, { autoAlpha: 1, y: 0, duration: 0.5, ease: "bounce.out" }, tagT[i]);
      });
      tl.fromTo("#b1-note", { autoAlpha: 0, scale: 1.4, rotation: 6 }, { autoAlpha: 1, scale: 1, rotation: -2.5, duration: 0.35, ease: "back.out(2)" }, 47.48);
      tl.fromTo("#b2-note", { autoAlpha: 0, scale: 1.4, rotation: 6 }, { autoAlpha: 1, scale: 1, rotation: 2, duration: 0.35, ease: "back.out(2)" }, 53.1);
      [57.54, 58.14, 58.74].forEach((t, k) => pop("#b3-c" + k, t));
      tl.fromTo("#b4-tag", { boxShadow: "0 0 0px rgba(111,211,160,0)" }, { boxShadow: "0 0 70px rgba(111,211,160,0.8)", duration: 0.5, yoyo: true, repeat: 3 }, 60.6);
      tl.fromTo("#b4-ad", { autoAlpha: 0, x: -30 }, { autoAlpha: 1, x: 0, duration: 0.35, ease: E }, 61.8);
      // quadro de print: árvore inteira
      const treeH = () => $("#tcam").scrollHeight;
      tl.to("#tcam", { y: 0, scale: () => Math.min(1, 1060 / treeH()), duration: 0.6, ease: "power3.inOut" }, 63.35);

      // ===== assinatura =====
      tl.to("#tree", { autoAlpha: 0, duration: 0.3 }, 64.0);
      tl.set("#sig", { autoAlpha: 1 }, 64.0);
      up("#sg1", 64.08);
      tl.fromTo("#digits", { autoAlpha: 0, scale: 0.8 }, { autoAlpha: 1, scale: 1, duration: 0.4, ease: E }, 64.3);
      tl.fromTo("#dg3", { autoAlpha: 0, x: -300 }, { autoAlpha: 1, x: 0, duration: 0.35, ease: "back.out(1.8)" }, 65.22);
      tl.to("#dg0", { color: "#6FD3A0", duration: 0.25 }, 65.3);
      up("#sg2", 65.54);
      tl.fromTo("#sg3", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 66.78);
      tl.fromTo("#sgu", { scaleX: 0 }, { scaleX: 1, duration: 0.45, ease: E }, 67.2);

      // ===== CTA =====
      tl.to("#sig", { autoAlpha: 0, duration: 0.3 }, 68.35);
      tl.set("#cta", { autoAlpha: 1 }, 68.35);
      show("#ck", 68.48); up("#ct1", 68.76);
      tl.fromTo("#odo", { autoAlpha: 0, scale: 0.85 }, { autoAlpha: 1, scale: 1, duration: 0.5, ease: E }, 68.6);
      hide(["#ct1", "#ck"], 71.4, 0.15); up("#ct2", 71.54);
      tl.fromTo("#odc", { y: 0 }, { y: -1860, duration: 0.7, ease: "back.out(1.4)" }, 72.24);
      show("#oday", 72.55); tl.fromTo("#o45", { autoAlpha: 0, x: -40 }, { autoAlpha: 1, x: 0, duration: 0.35, ease: E }, 72.6);
      tl.fromTo("#stampd", { autoAlpha: 0, scale: 1.8, rotation: -10 }, { autoAlpha: 1, scale: 1, rotation: -3, duration: 0.25, ease: "power4.in" }, 73.24);
      hide("#ct2", 76.5, 0.15);
      tl.fromTo("#segue", { autoAlpha: 0, y: 30 }, { autoAlpha: 1, y: 0, duration: 0.3, ease: "back.out(2)" }, 76.64);
      tl.to("#segue", { scale: 1.05, duration: 0.25, yoyo: true, repeat: 1 }, 77.0);

      // ===== legendas palavra a palavra =====
      $$(".cap").forEach((c) => {
        const s = parseFloat(c.dataset.s), e = parseFloat(c.dataset.e);
        tl.set(c, { visibility: "visible" }, s); tl.set(c, { visibility: "hidden" }, e);
        const ws = $$(".w", c);
        const mono = s < 18.3;
        ws.forEach((w, i) => {
          const t = parseFloat(w.dataset.t);
          tl.set(w, { color: mono ? "#ffffff" : "#6FD3A0" }, t);
          tl.set(w, { color: "#ffffff" }, i + 1 < ws.length ? parseFloat(ws[i + 1].dataset.t) : e - 0.01);
        });
      });
      $$(".cap .w").forEach((w) => gsap.set(w, { color: "rgba(255,255,255,0.55)" }));
      tl.fromTo("#grain", { backgroundPosition: "0px 0px" }, { backgroundPosition: "1500px 1100px", duration: D, ease: "steps(" + Math.round(D * 12) + ")" }, 0);
      tl.to("#caps", { autoAlpha: 0, duration: 0.15 }, 76.6);
      tl.set({}, {}, D);
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
