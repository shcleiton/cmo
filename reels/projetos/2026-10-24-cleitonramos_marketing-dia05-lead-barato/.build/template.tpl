<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1080, height=1920" />
    <title>Dia 5: lead barato</title>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js"></script>
    <style>
      @font-face { font-family: "Montserrat"; font-weight: 900; src: url("assets/fonts/montserrat-latin-900-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 800; src: url("assets/fonts/montserrat-latin-800-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 600; src: url("assets/fonts/montserrat-latin-600-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 500; src: url("assets/fonts/montserrat-latin-500-normal.woff2") format("woff2"); }
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html, body { margin: 0; background: #03354e; overflow: hidden; }
      #root { position: relative; width: 1080px; height: 1920px; overflow: hidden; background: #03354e; font-family: "Montserrat", sans-serif; color: #fff; }
      .layer { position: absolute; inset: 0; }
      #ground { background: radial-gradient(120% 70% at 50% 110%, #0a4a66 0%, #03354e 55%, #022a3e 100%); }
      #ground::after { content: ""; position: absolute; left: 0; right: 0; bottom: 0; height: 520px;
        background-image: radial-gradient(circle, rgba(111,211,160,0.5) 2.2px, transparent 2.6px), radial-gradient(circle, rgba(0,163,214,0.4) 1.8px, transparent 2.2px);
        background-size: 34px 34px, 34px 34px; background-position: 0 0, 17px 17px;
        -webkit-mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%);
        mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.3) 45%, transparent 75%); }
      #cam { position: absolute; inset: 0; transform-origin: 540px 900px; }
      .badge { position: absolute; top: 290px; left: 120px; font-weight: 600; font-size: 26px; letter-spacing: 0.32em; color: #6FD3A0; z-index: 5; }
      .sc { position: absolute; inset: 0; opacity: 0; visibility: hidden; }
      .bggreen { position: absolute; inset: 0; background: #6FD3A0; }
      .kick { font-weight: 600; font-size: 28px; letter-spacing: 0.28em; color: #6FD3A0; }
      .big { font-weight: 900; font-size: 96px; line-height: 1.0; letter-spacing: -0.02em; }
      .mid { font-weight: 900; font-size: 64px; line-height: 1.05; letter-spacing: -0.01em; }
      .acc { color: #6FD3A0; } .red { color: #ff7b7b; } .navy { color: #03354e; }
      .center { position: absolute; left: 120px; right: 120px; text-align: center; }
      .label { position: absolute; left: 120px; right: 120px; top: 390px; }
      .pill { display: inline-block; font-weight: 900; font-size: 34px; color: #03354e; background: #6FD3A0; padding: 12px 24px; border-radius: 40px; white-space: nowrap; }
      .pill.pw { background: #ffffff; } .pill.c { background: #ff7b7b; color: #ffffff; }
      .ch { opacity: 0; }
      .bn { position: absolute; width: 220px; height: 330px; overflow: visible; }
      /* painéis */
      .pn { position: absolute; top: 470px; width: 420px; padding: 30px 28px 34px; border-radius: 30px; background: rgba(255,255,255,0.06); border: 3px solid rgba(255,255,255,0.16); }
      .pnh { font-weight: 800; font-size: 22px; letter-spacing: 0.16em; color: rgba(255,255,255,0.75); line-height: 1.3; }
      .pr { margin-top: 34px; }
      .pr span { display: block; font-weight: 600; font-size: 22px; letter-spacing: 0.1em; color: rgba(255,255,255,0.7); }
      .pr b { display: block; margin-top: 6px; font-weight: 900; font-size: 46px; }
      .pr b.g { color: #6FD3A0; } .pr b.c { color: #ff7b7b; }
      .num { font-size: 130px !important; line-height: 1; letter-spacing: -0.03em; }
      #pnL { left: 100px; } #pnR { left: 560px; }
      #stamp { position: absolute; left: 0; right: 0; top: 1190px; text-align: center; }
      #n123 { position: absolute; left: 0; right: 0; top: 820px; display: flex; justify-content: center; gap: 40px; }
      #n123 span { width: 170px; height: 170px; border-radius: 30px; border: 5px solid #6FD3A0; display: flex; align-items: center; justify-content: center; font-weight: 900; font-size: 110px; color: #6FD3A0; opacity: 0; }
      /* congresso */
      .scr { position: absolute; left: 160px; width: 760px; border-radius: 28px; background: #0b2533; border: 6px solid #0d2633; box-shadow: 0 30px 80px rgba(0,0,0,0.45); overflow: hidden; }
      .scr .bar { height: 48px; background: #16394a; display: flex; align-items: center; gap: 10px; padding-left: 20px; }
      .scr .bar i { width: 14px; height: 14px; border-radius: 50%; background: rgba(255,255,255,0.3); display: block; }
      .live { position: absolute; top: 72px; left: 24px; font-weight: 900; font-size: 22px; letter-spacing: 0.12em; background: #ff7b7b; padding: 6px 14px; border-radius: 8px; }
      .tiles { display: grid; grid-template-columns: repeat(3, 1fr); gap: 14px; padding: 70px 24px 24px; }
      .tiles div { height: 150px; border-radius: 16px; background: rgba(255,255,255,0.08); position: relative; }
      .tiles div::after { content: ""; position: absolute; left: 50%; top: 34px; width: 56px; height: 56px; margin-left: -28px; border-radius: 50%; background: rgba(255,255,255,0.22); }
      .mb { position: absolute; width: 100px; height: 170px; }
      .mb svg { width: 100px; height: 170px; overflow: visible; }
      .gt { position: absolute; top: -40px; left: 50%; margin-left: -52px; width: 104px; text-align: center; font-weight: 900; font-size: 18px; color: #03354e; background: #ffd66b; padding: 5px 0; border-radius: 20px; }
      .lt { position: absolute; top: -40px; left: 50%; margin-left: -44px; width: 88px; text-align: center; font-weight: 900; font-size: 18px; color: #03354e; background: #6FD3A0; padding: 5px 0; border-radius: 20px; opacity: 0; }
      #magnet { position: absolute; left: 50%; top: 420px; width: 200px; height: 200px; margin-left: -100px; }
      #mgl { top: 640px; }
      #cart { position: absolute; left: 700px; top: 1130px; width: 220px; text-align: center; }
      #cart svg { width: 150px; height: 130px; }
      #cart p { font-weight: 900; font-size: 34px; color: #ff7b7b; }
      #full { position: absolute; left: 140px; top: 1170px; }
      /* números das mudanças */
      .nbig { position: absolute; left: 50%; top: 520px; width: 260px; height: 260px; margin-left: -130px; border-radius: 48px; background: #6FD3A0; color: #03354e; font-weight: 900; font-size: 200px; display: flex; align-items: center; justify-content: center; }
      .ntit { top: 860px; }
      /* ponto 1 */
      #calg { position: absolute; left: 204px; top: 520px; display: grid; grid-template-columns: repeat(5, 120px); gap: 18px; }
      #calg i { width: 120px; height: 120px; border-radius: 22px; border: 4px solid rgba(255,255,255,0.25); display: flex; align-items: center; justify-content: center; font-style: normal; font-weight: 900; font-size: 30px; color: rgba(255,255,255,0.5); position: relative; }
      #calg i b { position: absolute; inset: -4px; border-radius: 22px; background: #00a897; opacity: 0; display: flex; align-items: center; justify-content: center; }
      #calg i b::after { content: ""; border-left: 30px solid #ffffff; border-top: 19px solid transparent; border-bottom: 19px solid transparent; margin-left: 8px; }
      #p1bt { top: 1010px; }
      .vid { position: absolute; left: 240px; top: 440px; width: 600px; height: 190px; border-radius: 26px; background: #ffffff; color: #03354e; padding: 26px 30px; }
      .vid p { font-weight: 900; font-size: 30px; }
      .vid .trk { margin-top: 26px; height: 22px; border-radius: 11px; background: #d6e2e8; position: relative; }
      .vid .prg { position: absolute; left: 0; top: 0; bottom: 0; width: 50%; border-radius: 11px; background: #00a897; transform-origin: left center; }
      .vid .pct { position: absolute; right: 30px; top: 22px; font-weight: 900; font-size: 44px; color: #00a897; }
      .ring { opacity: 0; }
      #aim { position: absolute; left: 0; top: 0; width: 150px; height: 150px; opacity: 0; }
      #path { position: absolute; left: 120px; right: 120px; top: 1170px; text-align: center; }
      #path span { display: inline-block; font-weight: 800; font-size: 26px; padding: 10px 16px; border-radius: 12px; background: rgba(255,255,255,0.12); margin: 6px 2px; opacity: 0; }
      #path span.on { background: #6FD3A0; color: #03354e; }
      .meter { position: absolute; top: 520px; width: 200px; height: 520px; border-radius: 30px; background: rgba(255,255,255,0.08); overflow: hidden; }
      .meter i { position: absolute; left: 0; right: 0; bottom: 0; height: 100%; display: block; transform-origin: 50% 100%; }
      .mtl { position: absolute; top: 1070px; width: 320px; text-align: center; font-weight: 800; font-size: 28px; letter-spacing: 0.06em; line-height: 1.2; }
      .msg { position: absolute; top: 450px; width: 320px; text-align: center; font-weight: 900; font-size: 64px; }
      #faucet { position: absolute; left: 250px; top: 500px; width: 300px; height: 220px; }
      #fpill { position: absolute; left: 520px; top: 520px; }
      .drop { position: absolute; left: 478px; top: 700px; width: 26px; height: 34px; border-radius: 50% 50% 50% 50% / 60% 60% 40% 40%; background: #6FD3A0; opacity: 0; }
      #tank { position: absolute; left: 290px; top: 800px; width: 400px; height: 380px; border: 6px solid rgba(255,255,255,0.7); border-top: none; border-radius: 0 0 40px 40px; overflow: hidden; }
      #tankf { position: absolute; left: 0; right: 0; bottom: 0; height: 100%; background: linear-gradient(180deg, #6FD3A0, #00a897); transform-origin: 50% 100%; }
      #tankl { position: absolute; left: 0; right: 0; top: 140px; text-align: center; font-weight: 900; font-size: 46px; color: #ffffff; z-index: 2; }
      #launch { position: absolute; left: 720px; top: 1060px; }
      #ready { position: absolute; left: 290px; width: 400px; top: 1210px; text-align: center; }
      /* ponto 2 */
      .ad { position: absolute; left: 170px; top: 460px; width: 740px; background: #ffffff; color: #0d2633; border-radius: 30px; overflow: hidden; box-shadow: 0 30px 80px rgba(0,0,0,0.4); }
      .ad .hd { display: flex; align-items: center; gap: 16px; padding: 20px 26px; }
      .ad .av { width: 58px; height: 58px; border-radius: 50%; background: #00a897; }
      .ad .hd b { display: block; font-weight: 900; font-size: 26px; } .ad .hd small { font-weight: 600; font-size: 20px; color: #7c8f99; }
      .ad .img { height: 260px; background: linear-gradient(135deg, #00a897, #006892); display: flex; align-items: center; justify-content: center; font-weight: 900; font-size: 58px; color: #ffffff; letter-spacing: -0.01em; }
      .ad .cp { padding: 26px 30px 20px; font-weight: 700; font-size: 38px; line-height: 1.3; min-height: 200px; }
      .ad .ct { display: flex; justify-content: space-between; align-items: center; background: #eef3f5; padding: 18px 26px; font-weight: 800; font-size: 24px; }
      .ad .ct span { background: #00a897; color: #fff; padding: 10px 20px; border-radius: 12px; }
      #adtag { position: absolute; left: 0; right: 0; top: 1250px; text-align: center; }
      #p2out { top: 1100px; }
      /* cta */
      #follow { position: absolute; left: 50%; top: 1060px; width: 440px; margin-left: -220px; text-align: center; font-weight: 900; font-size: 50px; color: #ffffff; background: #03354e; padding: 26px 0; border-radius: 24px; }
      #hand { position: absolute; left: 640px; top: 1150px; width: 120px; height: 140px; }
      /* ponto 3 */
      .dc { position: absolute; top: 560px; width: 260px; height: 460px; border-radius: 24px; background: rgba(255,255,255,0.06); border: 3px solid rgba(255,255,255,0.12); }
      .dc .dh { text-align: center; padding-top: 22px; font-weight: 900; font-size: 32px; letter-spacing: 0.08em; }
      .blk { position: absolute; left: 30px; width: 200px; height: 90px; border-radius: 16px; background: rgba(255,255,255,0.18); display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 22px; letter-spacing: 0.06em; color: rgba(255,255,255,0.8); opacity: 0; }
      .crd { position: absolute; left: 18px; width: 224px; top: 100px; height: 130px; border-radius: 18px; display: flex; align-items: center; justify-content: center; text-align: center; font-weight: 900; font-size: 25px; line-height: 1.15; opacity: 0; }
      .hc { position: absolute; left: 50%; bottom: 26px; margin-left: -60px; width: 120px; text-align: center; font-weight: 900; font-size: 20px; color: #03354e; background: #6FD3A0; padding: 8px 0; border-radius: 20px; opacity: 0; }
      .ofr { position: absolute; left: 40px; width: 180px; top: 270px; text-align: center; font-weight: 900; font-size: 30px; padding: 14px 0; border-radius: 14px; opacity: 0; }
      #thread { position: absolute; left: 0; top: 0; width: 1080px; height: 1920px; overflow: visible; }
      #sol { position: absolute; left: 0; width: 260px; top: 260px; text-align: center; font-weight: 900; font-size: 24px; color: #6FD3A0; opacity: 0; }
      #score { position: absolute; right: 120px; top: 380px; text-align: right; }
      #score small { display: block; font-weight: 600; font-size: 24px; letter-spacing: 0.2em; color: rgba(255,255,255,0.7); }
      #score b { font-weight: 900; font-size: 86px; letter-spacing: -0.03em; color: #6FD3A0; }
      /* fechamento */
      #fpn { left: 230px; width: 620px; top: 480px; }
      #mag { position: absolute; left: 600px; top: 620px; width: 220px; height: 220px; }
      #errado { position: absolute; left: 0; right: 0; top: 1040px; text-align: center; }
      #errado span { display: inline-block; font-weight: 900; font-size: 60px; color: #ffffff; background: #ff7b7b; padding: 14px 30px; border-radius: 16px; }
      #qd { top: 560px; }
      #cpv { top: 650px; font-weight: 900; font-size: 120px; line-height: 0.98; letter-spacing: -0.03em; }
      #frm { position: absolute; left: 0; right: 0; top: 1000px; text-align: center; }
      #frm span { display: inline-block; font-weight: 800; font-size: 34px; border: 4px solid #6FD3A0; color: #6FD3A0; padding: 16px 28px; border-radius: 18px; }
      #sgname { top: 760px; font-weight: 900; font-size: 92px; letter-spacing: -0.02em; }
      #sgpos { top: 880px; }
      #sgch { position: absolute; left: 50%; top: 990px; width: 820px; margin-left: -410px; text-align: center; font-weight: 900; font-size: 40px; color: #6FD3A0; border: 5px solid #6FD3A0; border-radius: 18px; padding: 14px 0; white-space: nowrap; }
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
      <div class="layer" id="ground"></div>
      <div id="cam">
        <!-- gancho: dois painéis -->
        <div class="sc" id="sH1">
          <div class="pn" id="pnL"><p class="pnh">LANÇAMENTO<br/>ANTERIOR</p>
            <div class="pr" id="pL0"><span>CUSTO POR LEAD</span><b class="g">BAIXO ✓</b></div>
            <div class="pr" id="pL1"><span>PRESENÇA NA AULA</span><b class="g">ALTA ✓</b></div>
            <div class="pr" id="pL2"><span>VENDAS</span><b class="num" id="nL">0</b></div>
          </div>
          <div class="pn" id="pnR"><p class="pnh">LANÇAMENTO<br/>SEGUINTE</p>
            <div class="pr" id="pR0"><span>CUSTO POR LEAD</span><b class="c">MAIS ALTO ↑</b></div>
            <div class="pr" id="pR1"><span>PRESENÇA NA AULA</span><b>ALTA =</b></div>
            <div class="pr" id="pR2"><span>VENDAS</span><b class="num g" id="nR">0</b></div>
          </div>
          <div id="stamp"><span class="pill pw">MESMO PRODUTO</span></div>
        </div>
        <div class="sc" id="sH2">
          <div class="center mid" style="top:620px">MUDAMOS</div>
          <div id="n123"><span>1</span><span>2</span><span>3</span></div>
        </div>
        <!-- contexto -->
        <div class="sc" id="sX1">
          <div class="label"><p class="kick" id="x1k">PÓS-GRADUAÇÃO</p></div>
          <div class="scr" id="x1s" style="top:480px"><div class="bar"><i></i><i></i><i></i></div><span class="live">AO VIVO</span>
            <div class="tiles"><div></div><div></div><div></div><div></div><div></div><div></div></div></div>
          <div class="center mid" id="x1t" style="top:1010px">CONGRESSO<br/><span class="acc">ONLINE</span></div>
        </div>
        <div class="sc" id="sX2">
          <svg id="magnet" viewBox="0 0 200 200"><path d="M40 20 V110 a60 60 0 0 0 120 0 V20" fill="none" stroke="#ff7b7b" stroke-width="44"/><rect x="18" y="10" width="44" height="40" fill="#ffffff"/><rect x="138" y="10" width="44" height="40" fill="#ffffff"/></svg>
          <div class="center kick" id="mgl">ANÚNCIO</div>
          %%CROWD1%%
          <div id="full"><span class="pill">SALA CHEIA ✓</span></div>
          <div id="cart"><svg viewBox="0 0 150 130"><path d="M8 16h22l16 70h76l16-52H38" fill="none" stroke="#ff7b7b" stroke-width="10" stroke-linejoin="round" stroke-linecap="round"/><circle cx="56" cy="112" r="10" fill="#ff7b7b"/><circle cx="112" cy="112" r="10" fill="#ff7b7b"/></svg><p>0 COMPRAS</p></div>
        </div>
        <!-- ponto 1 -->
        <div class="sc" id="sP1a"><div class="nbig">1</div><div class="center mid ntit">QUEM VIA<br/><span class="acc">O ANÚNCIO</span></div></div>
        <div class="sc" id="sP1b">
          <div class="label"><p class="kick">ANTES DE CAPTAR</p></div>
          <div id="calg">%%CAL%%</div>
          <div class="center mid" id="p1bt">15+ DIAS DE CONTEÚDO<br/><span class="acc">COM ANÚNCIO</span></div>
        </div>
        <div class="sc" id="sP1c">
          <div class="vid" id="vid"><p>ASSISTIU O VÍDEO</p><div class="trk"><i class="prg" id="prg"></i></div><span class="pct">50%</span></div>
          %%CROWD2%%
          <svg id="aim" viewBox="0 0 150 150"><circle cx="75" cy="75" r="58" fill="none" stroke="#ff7b7b" stroke-width="8"/><path d="M75 0v40M75 110v40M0 75h40M110 75h40" stroke="#ff7b7b" stroke-width="8"/></svg>
          <div id="path"><span>PÚBLICOS</span> <span>PERSONALIZADO</span> <span>ENVOLVIMENTO COM VÍDEO</span> <span class="on">50%</span></div>
        </div>
        <div class="sc" id="sP1d">
          <div class="meter" style="left:220px"><i id="mt0" style="background:#ff7b7b"></i></div>
          <div class="meter" style="left:660px"><i id="mt1" style="background:#6FD3A0"></i></div>
          <div class="msg red" id="mg0" style="left:160px">↑</div>
          <div class="msg acc" id="mg1" style="left:600px">=</div>
          <div class="mtl" style="left:160px">CUSTO<br/>POR LEAD</div>
          <div class="mtl" style="left:600px">PRESENÇA<br/>NA AULA</div>
        </div>
        <div class="sc" id="sP1e">
          <div class="label"><p class="kick">CONSELHO DE AMIGO</p></div>
          <svg id="faucet" viewBox="0 0 300 220"><rect x="0" y="60" width="250" height="50" rx="12" fill="#cfe3ea"/><rect x="100" y="24" width="50" height="40" rx="8" fill="#cfe3ea"/><rect x="70" y="10" width="110" height="22" rx="11" fill="#ffffff"/><rect x="204" y="60" width="50" height="140" rx="14" fill="#cfe3ea"/></svg>
          <div id="fpill"><span class="pill pw">VERBA FIXA</span></div>
          %%DROPS%%
          <div id="tank"><div id="tankf"></div><div id="tankl">PÚBLICO</div></div>
          <div id="launch"><span class="pill c">LANÇAMENTO</span></div>
          <div id="ready"><span class="pill">JÁ ESTÁ PRONTO ✓</span></div>
        </div>
        <!-- ponto 2 -->
        <div class="sc" id="sP2a"><div class="nbig">2</div><div class="center mid ntit">O QUE O ANÚNCIO<br/><span class="acc">PROMETIA</span></div></div>
        <div class="sc" id="sP2b">
          <div class="ad" id="ad"><div class="hd"><i class="av"></i><div><b>Congresso online</b><small>Patrocinado</small></div></div>
            <div class="img">3 DIAS · AO VIVO</div>
            <p class="cp" id="adcp">%%ADTXT%%</p>
            <div class="ct">congresso online <span>Inscreva-se</span></div></div>
          <div id="adtag"><span class="pill">A FRASE DO CRIATIVO</span></div>
        </div>
        <div class="sc" id="sP2c">
          %%CROWD3%%
          <div class="center mid" id="p2out">SAIU ANTES DE<br/><span class="acc">VIRAR LEAD</span></div>
        </div>
        <!-- CTA -->
        <div class="sc" id="sC"><div class="bggreen"></div>
          <div class="center mid navy" style="top:640px">A TERCEIRA FOI<br/>A QUE MAIS PESOU</div>
          <div id="follow">SEGUIR</div>
          <svg id="hand" viewBox="0 0 120 140"><circle cx="40" cy="30" r="26" fill="#ffffff" stroke="#03354e" stroke-width="8"/><path d="M40 30 L40 100 Q40 130 70 130 L95 130 Q112 130 112 110 L112 70" fill="#ffffff" stroke="#03354e" stroke-width="8" stroke-linejoin="round"/></svg>
        </div>
        <!-- ponto 3 -->
        <div class="sc" id="sP3a"><div class="nbig">3</div><div class="center mid ntit">O ROTEIRO<br/><span class="acc">DO CONGRESSO</span></div></div>
        <div class="sc" id="sP3b">
          <div class="label"><p class="kick red">ANTES</p></div>
          %%DAYS_A%%
        </div>
        <div class="sc" id="sP3c">
          <div class="label"><p class="kick">DEPOIS</p></div>
          <div id="score"><small>VENDAS</small><b id="nS">33</b></div>
          <svg id="thread" viewBox="0 0 1080 1920"><path id="thp" d="M250 975 C 330 1040, 460 1040, 540 975 S 750 910, 830 975" fill="none" stroke="#6FD3A0" stroke-width="8" stroke-linecap="round" stroke-dasharray="760" stroke-dashoffset="760"/></svg>
          %%DAYS_B%%
          <div style="position:absolute; left:460px; top:1100px">%%B_h%%</div>
        </div>
        <!-- fechamento -->
        <div class="sc" id="sF1">
          <div class="pn" id="fpn"><p class="pnh">O SEU LANÇAMENTO</p>
            <div class="pr"><span>CUSTO POR LEAD</span><b class="g">BAIXO ✓</b></div>
            <div class="pr"><span>PRESENÇA NA AULA</span><b class="g">ALTA ✓</b></div>
            <div class="pr"><span>VENDAS</span><b class="c">POUCAS ✕</b></div>
          </div>
          <svg id="mag" viewBox="0 0 180 180"><circle cx="72" cy="72" r="54" fill="rgba(255,255,255,0.15)" stroke="#ffffff" stroke-width="14"/><path d="M112 112 L165 165" stroke="#ffffff" stroke-width="22" stroke-linecap="round"/></svg>
          <div id="errado"><span>PÚBLICO ERRADO</span></div>
        </div>
        <div class="sc" id="sF2">
          <div class="center kick" id="qd">QUEM DECIDE</div>
          <div class="center" id="cpv">CUSTO POR<br/><span class="acc">VENDA</span></div>
          <div id="frm"><span>INVESTIMENTO ÷ VENDAS</span></div>
        </div>
        <!-- assinatura -->
        <div class="sc" id="sS">
          <div class="center" id="sgname">CLEITON RAMOS</div>
          <div class="center kick" id="sgpos">MARKETING E VENDAS COM NÚMERO</div>
          <div id="sgch">DESAFIO 45 DIAS · DIA 5/45</div>
        </div>
      </div>
      <div class="badge">DIA 5/45</div>
      <div id="caps">%%CAPS%%</div>
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out", D = %%D%%;
      const $ = (s) => document.querySelector(s), $$ = (s) => Array.from(document.querySelectorAll(s));
      const scene = (s, a, b, dir) => {
        tl.fromTo(s, { autoAlpha: 0, x: (dir || 1) * 140 }, { autoAlpha: 1, x: 0, duration: 0.3, ease: E }, a);
        tl.fromTo(s, { scale: 1 }, { scale: 1.035, duration: b - a, ease: "none" }, a);
        tl.to(s, { autoAlpha: 0, x: -(dir || 1) * 140, duration: 0.2, ease: "power2.in" }, b - 0.2);
      };
      const punch = (t, k) => tl.fromTo("#cam", { scale: k || 1.07 }, { scale: 1, duration: 0.45, ease: "power3.out" }, t);
      const shake = (t) => tl.fromTo("#cam", { x: -10 }, { x: 0, duration: 0.35, ease: "elastic.out(1,0.3)" }, t);
      const up = (s, t, d) => tl.fromTo(s, { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: d || 0.35, ease: "back.out(1.6)" }, t);
      const pop = (s, t) => tl.fromTo(s, { autoAlpha: 0, scale: 0.4 }, { autoAlpha: 1, scale: 1, duration: 0.4, ease: "back.out(2.4)" }, t);
      const slam = (s, t, r) => tl.fromTo(s, { autoAlpha: 0, scale: 1.8, rotation: (r || -4) * 3 }, { autoAlpha: 1, scale: 1, rotation: r || -4, duration: 0.22, ease: "power4.in" }, t);
      const type = (sel, a, b) => { const ch = $$(sel + " .ch"); tl.fromTo(ch, { opacity: 0 }, { opacity: 1, duration: 0.01, stagger: (b - a) / ch.length }, a); };
      const bob = (sel, t, n) => tl.fromTo(sel, { y: 0 }, { y: -12, duration: 0.22, yoyo: true, repeat: n || 1, ease: "sine.inOut" }, t);
      const count = (sel, a, d, v, suf) => { const o = { v: 0 }; tl.fromTo(o, { v: 0 }, { v: v, duration: d, ease: "power2.out", onUpdate: () => { $(sel).textContent = Math.round(o.v) + (o.v >= v - 0.01 ? (suf || "") : ""); } }, a); };

      // ===== gancho =====
      scene("#sH1", 0, 8.85);
      tl.fromTo("#pnL", { autoAlpha: 0, y: 60 }, { autoAlpha: 1, y: 0, duration: 0.35, ease: E }, 0.05);
      up("#pL0", 0.34); up("#pL1", 1.06); up("#pL2", 2.0);
      count("#nL", 2.1, 0.6, 33);
      tl.to("#nL", { color: "#ff7b7b", duration: 0.2 }, 2.75);
      tl.to("#pnL", { opacity: 0.45, filter: "grayscale(1)", duration: 0.4 }, 3.1);
      tl.fromTo("#pnR", { autoAlpha: 0, y: 60 }, { autoAlpha: 1, y: 0, duration: 0.35, ease: E }, 3.36);
      up("#pR0", 4.6); punch(5.36, 1.04);
      up("#pR1", 5.9); up("#pR2", 6.1);
      count("#nR", 6.15, 0.85, 110, "+");
      punch(6.96, 1.08);
      tl.to("#pnR", { borderColor: "#6FD3A0", duration: 0.3 }, 6.96);
      slam("#stamp", 7.96, -3);
      scene("#sH2", 8.85, 10.2);
      $$("#n123 span").forEach((el, i) => pop(el, 9.36 + i * 0.14));

      // ===== contexto =====
      scene("#sX1", 10.2, 13.1);
      up("#x1k", 10.5);
      tl.fromTo("#x1s", { autoAlpha: 0, y: 60 }, { autoAlpha: 1, y: 0, duration: 0.4, ease: E }, 10.35);
      tl.fromTo("#x1s .tiles div", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.2, stagger: 0.08 }, 10.6);
      up("#x1t", 12.1);
      scene("#sX2", 13.1, 18.92);
      tl.fromTo("#magnet", { autoAlpha: 0, y: -80 }, { autoAlpha: 1, y: 0, duration: 0.4, ease: "back.out(2)" }, 13.2);
      up("#mgl", 14.38);
      %%CROWD1JS%%
      tl.fromTo("#magnet", { rotation: -4 }, { rotation: 4, duration: 0.18, yoyo: true, repeat: 9, ease: "sine.inOut" }, 14.7);
      pop("#full", 17.3);
      tl.fromTo("#cart", { autoAlpha: 0, y: 30 }, { autoAlpha: 1, y: 0, duration: 0.3 }, 18.0);
      shake(18.3);

      // ===== ponto 1 =====
      scene("#sP1a", 18.92, 21.3);
      pop("#sP1a .nbig", 18.98); up("#sP1a .ntit", 19.3);
      scene("#sP1b", 21.3, 25.3);
      tl.fromTo("#calg i", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.15, stagger: 0.03 }, 21.36);
      tl.fromTo("#calg i b", { autoAlpha: 0, scale: 0.5 }, { autoAlpha: 1, scale: 1, duration: 0.18, stagger: 0.14, ease: "back.out(2)" }, 22.3);
      up("#p1bt", 23.2);
      scene("#sP1c", 25.3, 29.5);
      tl.fromTo("#vid", { autoAlpha: 0, y: -40 }, { autoAlpha: 1, y: 0, duration: 0.3 }, 25.35);
      tl.fromTo("#prg", { scaleX: 0 }, { scaleX: 1, duration: 0.6, ease: "power2.out" }, 25.9);
      %%CROWD2JS%%
      $$("#path span").forEach((el, i) => up(el, 26.4 + i * 0.25, 0.25));

      scene("#sP1d", 29.5, 32.72);
      tl.fromTo("#mt0", { scaleY: 0.3 }, { scaleY: 0.85, duration: 0.8, ease: "power2.out" }, 29.62);
      tl.fromTo("#mt1", { scaleY: 0 }, { scaleY: 0.75, duration: 0.5, ease: "power2.out" }, 29.6);
      pop("#mg0", 30.0); pop("#mg1", 31.72);
      bob("#mt1", 31.0, 1);
      scene("#sP1e", 32.72, 39.72);
      up("#sP1e .kick", 32.85); punch(33.4, 1.05);
      tl.fromTo("#faucet", { autoAlpha: 0, x: -120 }, { autoAlpha: 1, x: 0, duration: 0.4, ease: E }, 33.9);
      pop("#fpill", 34.4);
      tl.fromTo("#tank", { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: 0.3 }, 34.5);
      $$(".drop").forEach((d, i) => tl.fromTo(d, { autoAlpha: 1, y: 0 }, { autoAlpha: 0.9, y: 300, duration: 0.42, ease: "power1.in", repeat: 9, repeatDelay: 0.2 }, 34.75 + i * 0.21));
      tl.fromTo("#tankf", { scaleY: 0 }, { scaleY: 1, duration: 4.0, ease: "none" }, 34.8);
      tl.fromTo("#launch", { autoAlpha: 0, x: 300 }, { autoAlpha: 1, x: 0, duration: 0.4, ease: "back.out(1.6)" }, 37.3);
      tl.to("#tankl", { color: "#03354e", duration: 0.3 }, 37.2); pop("#ready", 38.48); punch(38.5, 1.05);

      // ===== ponto 2 =====
      scene("#sP2a", 39.72, 41.92);
      pop("#sP2a .nbig", 39.8); up("#sP2a .ntit", 40.1);
      scene("#sP2b", 41.92, 47.22);
      tl.fromTo("#ad", { autoAlpha: 0, y: 80 }, { autoAlpha: 1, y: 0, duration: 0.4, ease: E }, 41.96);
      type("#adcp", 43.36, 47.0);
      pop("#adtag", 45.6);
      scene("#sP2c", 47.22, 50.42);
      %%CROWD3JS%%
      up("#p2out", 49.4);

      // ===== CTA =====
      scene("#sC", 50.42, 53.78);
      tl.fromTo("#follow", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.35, ease: "back.out(2)" }, 51.3);
      tl.fromTo("#hand", { autoAlpha: 0, x: 200, y: 200 }, { autoAlpha: 1, x: 0, y: 0, duration: 0.4, ease: E }, 51.9);
      tl.to("#follow", { scale: 0.9, duration: 0.1, yoyo: true, repeat: 1 }, 52.4);
      tl.to("#follow", { backgroundColor: "#ffffff", color: "#03354e", duration: 0.15 }, 52.5);
      tl.set("#follow", { textContent: "SEGUINDO ✓" }, 52.55);
      punch(52.5, 1.05);

      // ===== ponto 3 =====
      scene("#sP3a", 53.78, 55.85);
      pop("#sP3a .nbig", 53.86); up("#sP3a .ntit", 54.5);
      scene("#sP3b", 55.85, 60.48);
      $$("#sP3b .dc").forEach((el, i) => up(el, 55.9 + i * 0.12, 0.3));
      $$("#sP3b .blk").forEach((el, i) => pop(el, 56.6 + i * 0.16));
      tl.fromTo("#oA", { autoAlpha: 0, scale: 2, rotation: -20 }, { autoAlpha: 1, scale: 1, rotation: -8, duration: 0.22, ease: "power4.in" }, 58.5);
      shake(58.72);
      tl.to("#oA", { y: 520, rotation: 30, autoAlpha: 0, duration: 0.7, ease: "power2.in" }, 59.6);
      scene("#sP3c", 60.48, 72.5);
      $$("#sP3c .dc").forEach((el, i) => up(el, 60.55 + i * 0.12, 0.3));
      tl.fromTo("#h", { y: 80, autoAlpha: 0 }, { y: 0, autoAlpha: 1, duration: 0.35, ease: "back.out(2)" }, 61.1);
      $$("#sP3c .hc").forEach((el, i) => pop(el, 62.0 + i * 0.25));
      tl.to("#thp", { attr: { "stroke-dashoffset": 0 }, duration: 1.2, ease: "power2.inOut" }, 63.0);
      bob("#h", 63.1, 2);
      pop("#cB0", 65.38); pop("#cB1", 66.82); tl.fromTo("#sol", { autoAlpha: 0, x: -30 }, { autoAlpha: 1, x: 0, duration: 0.3 }, 68.52);
      pop("#cB2", 70.3); punch(70.3, 1.04);
      tl.fromTo("#oB", { autoAlpha: 0, y: -260 }, { autoAlpha: 1, y: 0, duration: 0.5, ease: "bounce.out" }, 71.86);
      tl.fromTo("#score", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 70.6);
      (() => { const o = { v: 33 }; tl.fromTo(o, { v: 33 }, { v: 110, duration: 0.55, ease: "power2.out", onUpdate: () => { $("#nS").textContent = Math.round(o.v) + (o.v >= 109.99 ? "+" : ""); } }, 71.9); })();
      tl.to("#h-m", { attr: { d: "M82 104 Q100 120 118 104" }, duration: 0.2 }, 71.9);

      // ===== fechamento =====
      scene("#sF1", 72.5, 76.45);
      tl.fromTo("#fpn", { autoAlpha: 0, y: 50 }, { autoAlpha: 1, y: 0, duration: 0.35 }, 72.55);
      tl.fromTo("#mag", { autoAlpha: 0, x: 200, y: 200 }, { autoAlpha: 1, x: 0, y: 0, duration: 0.45, ease: E }, 73.4);
      tl.to("#mag", { x: -330, y: 120, duration: 0.8, ease: "power2.inOut" }, 73.9);
      tl.to("#mag", { x: -120, y: 300, duration: 0.6, ease: "power2.inOut" }, 74.7);
      tl.to("#mag", { autoAlpha: 0, scale: 0.6, duration: 0.25 }, 75.35); slam("#errado", 75.6, -3); shake(75.82);
      scene("#sF2", 76.45, 79.7);
      up("#qd", 76.55);
      tl.fromTo("#cpv", { autoAlpha: 0, scale: 1.4 }, { autoAlpha: 1, scale: 1, duration: 0.3, ease: "power4.out" }, 78.6);
      punch(78.62, 1.08);
      up("#frm", 79.0);
      // ===== assinatura =====
      tl.fromTo("#sS", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.3 }, 79.7);
      up("#sgname", 79.8); up("#sgpos", 80.3);
      tl.fromTo("#sgch", { autoAlpha: 0, scale: 1.6, rotation: -8 }, { autoAlpha: 1, scale: 1, rotation: -2, duration: 0.25, ease: "power4.in" }, 80.75);

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
      tl.to("#caps", { autoAlpha: 0, duration: 0.15 }, 50.42); tl.to("#caps", { autoAlpha: 1, duration: 0.15 }, 53.78);
      tl.set({}, {}, D);
      window.__timelines = window.__timelines || {};
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
