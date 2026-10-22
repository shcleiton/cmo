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
      .badge { position: absolute; top: 290px; left: 120px; font-weight: 600; font-size: 26px; letter-spacing: 0.32em; color: #6FD3A0; z-index: 5; }
      .sc { position: absolute; inset: 0; opacity: 0; }
      .kick { font-weight: 600; font-size: 28px; letter-spacing: 0.28em; color: #6FD3A0; }
      .big { font-weight: 900; font-size: 92px; line-height: 1.0; letter-spacing: -0.02em; }
      .mid { font-weight: 900; font-size: 64px; line-height: 1.05; letter-spacing: -0.01em; }
      .acc { color: #6FD3A0; } .red { color: #ff7b7b; }
      .center { position: absolute; left: 120px; right: 120px; text-align: center; }
      /* balões */
      .bub { display: inline-block; max-width: 640px; font-weight: 600; font-size: 36px; line-height: 1.3; padding: 18px 26px; border-radius: 28px; }
      .in { background: #ffffff; color: #0d2633; border-bottom-left-radius: 8px; }
      .out { background: #1f6e5a; color: #ffffff; border-bottom-right-radius: 8px; }
      .out.hl { background: #6FD3A0; color: #03354e; font-weight: 800; }
      .row { display: flex; } .row.r { justify-content: flex-end; }
      .ch { opacity: 0; }
      .dots { display: inline-flex; gap: 12px; background: #ffffff; padding: 24px 30px; border-radius: 30px; border-bottom-left-radius: 8px; }
      .dots i { width: 18px; height: 18px; border-radius: 50%; background: #8aa0ad; display: block; }
      .tag-ex { position: absolute; top: 18px; right: 20px; font-weight: 800; font-size: 18px; letter-spacing: 0.2em; color: #03354e; background: #ffd66b; padding: 6px 12px; border-radius: 8px; }
      .phone { position: absolute; left: 160px; right: 160px; border-radius: 48px; background: rgba(8,28,38,0.92); border: 6px solid #0d2633;
        box-shadow: 0 30px 80px rgba(0,0,0,0.45); padding: 90px 30px 34px; display: flex; flex-direction: column; gap: 22px; }
      .phone::before { content: ""; position: absolute; top: 26px; left: 50%; width: 120px; height: 10px; margin-left: -60px; border-radius: 6px; background: rgba(255,255,255,0.15); }
      .lab { position: absolute; left: 120px; right: 120px; top: 390px; }
      .lab .kick { margin-bottom: 10px; }
      /* gancho */
      #h-n { top: 470px; font-weight: 900; font-size: 140px; letter-spacing: -0.03em; }
      #h-nl { top: 640px; }
      #h-p { top: 480px; font-weight: 900; font-size: 140px; white-space: nowrap; color: #6FD3A0; letter-spacing: -0.04em; opacity: 0; }
      #h-pl { top: 650px; opacity: 0; }
      #h-src { position: absolute; left: 120px; right: 120px; top: 810px; text-align: center; font-weight: 500; font-size: 24px; color: rgba(255,255,255,0.75); opacity: 0; }
      #h-chat { position: absolute; left: 160px; right: 160px; top: 920px; display: flex; flex-direction: column; gap: 16px; }
      #h-chat > div { opacity: 0; }
      /* tese */
      #t-dots { position: absolute; left: 160px; top: 470px; opacity: 0; }
      #t1 { top: 600px; opacity: 0; }
      #t-conv { top: 820px; font-weight: 900; font-size: 120px; opacity: 0; }
      #t-strike { position: absolute; left: 190px; right: 190px; top: 890px; height: 12px; background: #ff7b7b; border-radius: 6px; transform-origin: left center; }
      #t2 { top: 1010px; opacity: 0; }
      #lock { position: absolute; left: 50%; width: 230px; height: 280px; margin-left: -115px; }
      #lock svg { width: 100%; height: 100%; overflow: visible; }
      #t-lockwrap { position: absolute; left: 0; right: 0; top: 560px; height: 300px; opacity: 0; }
      #t3 { top: 900px; opacity: 0; }
      #t4 { top: 1150px; opacity: 0; }
      /* situação 2 */
      .box { position: absolute; left: 160px; right: 160px; border-radius: 24px; padding: 24px 30px; font-weight: 900; font-size: 46px; line-height: 1.1; text-align: center; opacity: 0; }
      #b-red { top: 720px; border: 4px solid #ff7b7b; color: #ff9a9a; background: rgba(60,20,20,0.45); }
      #b-green { top: 1130px; border: 4px solid #6FD3A0; color: #03354e; background: #6FD3A0; }
      #b-arrow { position: absolute; left: 50%; top: 880px; width: 10px; height: 220px; margin-left: -5px; background: #6FD3A0; transform-origin: top center; }
      #b-arrow::after { content: ""; position: absolute; left: -17px; bottom: -22px; border-left: 22px solid transparent; border-right: 22px solid transparent; border-top: 26px solid #6FD3A0; }
      #b-alab { position: absolute; left: 560px; top: 950px; width: 400px; font-weight: 800; font-size: 28px; line-height: 1.15; color: #6FD3A0; opacity: 0; }
      /* cta */
      #save { position: absolute; left: 50%; top: 640px; width: 220px; height: 280px; margin-left: -110px; }
      #save path { fill: none; stroke: #ffffff; stroke-width: 10; stroke-linejoin: round; }
      #save .fill { fill: #6FD3A0; stroke: none; }
      /* situação 3 */
      .chip { position: absolute; font-weight: 900; font-size: 32px; color: #03354e; background: #ffffff; padding: 12px 22px; border-radius: 40px; opacity: 0; white-space: nowrap; }
      #cal { position: absolute; left: 50%; top: 1010px; margin-left: -150px; width: 300px; text-align: center; font-weight: 900; font-size: 36px; color: #03354e; background: #6FD3A0; padding: 14px 0; border-radius: 40px; opacity: 0; }
      #s3-out { position: absolute; left: 160px; right: 160px; top: 1110px; opacity: 0; }
      #s3-res { top: 1050px; opacity: 0; }
      /* pergunta */
      #q-dots { position: absolute; left: 50%; top: 560px; margin-left: -80px; }
      #q-txt { top: 720px; font-weight: 900; font-size: 62px; line-height: 1.12; }
      /* assinatura */
      #sg-lock { position: absolute; left: 0; right: 0; top: 470px; height: 300px; }
      #sg-name { top: 820px; font-weight: 900; font-size: 92px; letter-spacing: -0.02em; }
      #sg-pos { top: 940px; }
      #sg-ch { position: absolute; left: 50%; top: 1040px; width: 820px; margin-left: -410px; text-align: center; font-weight: 900; font-size: 40px; white-space: nowrap; color: #6FD3A0; border: 5px solid #6FD3A0; border-radius: 18px; padding: 14px 0; }
      /* legenda */
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
      <div class="badge">DIA 4/45</div>

      <!-- gancho -->
      <div class="sc" id="s-h">
        <div class="center" id="h-n"><span id="h-num">0</span></div>
        <div class="center kick" id="h-nl">CONVERSAS DE VENDA ANALISADAS</div>
        <div class="center" id="h-p">40% A 60%</div>
        <div class="center mid" id="h-pl">TERMINARAM<br/><span class="red">SEM DECISÃO</span></div>
        <div id="h-src">Dixon e McKenna, Harvard Business Review, 2022</div>
        <div id="h-chat">
          <div class="row" id="hc0"><span class="bub in">quero fechar</span></div>
          <div class="row r" id="hc1"><span class="bub out">e aí?</span></div>
          <div class="row r" id="hc2"><span class="bub out">conseguiu ver?</span></div>
          <div class="row r" id="hc3"><span class="bub out">vai fechar?</span></div>
        </div>
      </div>

      <!-- tese -->
      <div class="sc" id="s-t">
        <div id="t-dots"><span class="dots"><i></i><i></i><i></i></span></div>
        <div class="center big" id="t1">ELA SÓ <span class="acc">TRAVOU.</span></div>
        <div class="center" id="t-conv">CONVENCER</div>
        <div id="t-strike"></div>
        <div class="center mid" id="t2">CADA TRAVA PEDE<br/>UMA CONVERSA <span class="acc">DIFERENTE</span></div>
        <div id="t-lockwrap"><div id="lock"><svg viewBox="0 0 230 280"><path id="lk-sh" d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#6FD3A0" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#6FD3A0"/><text x="115" y="230" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="120" fill="#03354e">?</text></svg></div></div>
        <div class="center mid" id="t3">DESCUBRA O QUE<br/><span class="acc">TRAVA A DECISÃO</span></div>
        <div class="center kick" id="t4">3 SITUAÇÕES</div>
      </div>

      <!-- situação 1 -->
      <div class="sc" id="s-1">
        <div class="lab"><p class="kick">TRAVA 1</p><p class="mid">QUAL É O <span class="acc">PROBLEMA DELA</span></p></div>
        <div class="phone" style="top:600px; height:640px"><span class="tag-ex">EXEMPLO</span>
          <div class="row" id="s1-q"><span class="bub in">quanto custa?</span></div>
          <div class="row r" id="s1-a1"><span class="bub out">%%A1%%</span></div>
          <div class="row r" id="s1-a2"><span class="bub out hl">%%A2%%</span></div>
        </div>
      </div>

      <!-- situação 2 -->
      <div class="sc" id="s-2">
        <div class="lab"><p class="kick">TRAVA 2</p><p class="mid">COM O QUE <span class="acc">ELE COMPARA</span></p></div>
        <div style="position:absolute; left:160px; top:590px" id="s2-q"><span class="bub in">tá caro</span></div>
        <div class="box" id="b-red">R$3 MIL/MÊS<br/><span style="font-size:32px">EM ANÚNCIO SEM VENDA</span></div>
        <div id="b-arrow"></div>
        <div id="b-alab">SE VOCÊ MOSTRAR<br/>A LIGAÇÃO</div>
        <div class="box" id="b-green">R$2 MIL<br/><span style="font-size:32px">UMA VEZ</span></div>
      </div>

      <!-- CTA salvar -->
      <div class="sc" id="s-c">
        <svg id="save" viewBox="0 0 220 280"><path class="fill" id="sv-fill" d="M20 20 H200 V260 L110 190 L20 260 Z"/><path d="M20 20 H200 V260 L110 190 L20 260 Z"/></svg>
        <div class="center mid" style="top:980px">SALVA PRA REVER<br/><span class="acc">ANTES DA PRÓXIMA VENDA</span></div>
      </div>

      <!-- situação 3 -->
      <div class="sc" id="s-3">
        <div class="lab"><p class="kick">TRAVA 3</p><p class="mid">O QUE <span class="acc">MUDOU</span></p></div>
        <div style="position:absolute; left:0; right:0; top:590px; height:300px"><div id="lock3" style="position:absolute; left:50%; width:200px; height:243px; margin-left:-100px; top:20px"><svg viewBox="0 0 230 280" style="width:100%;height:100%;overflow:visible"><path d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#6FD3A0" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#6FD3A0"/><text x="115" y="230" text-anchor="middle" font-family="Montserrat" font-weight="900" font-size="120" fill="#03354e">?</text></svg></div></div>
        <span class="chip" id="k0" style="left:120px; top:600px">DINHEIRO?</span>
        <span class="chip" id="k1" style="right:120px; top:640px">PRIORIDADE?</span>
        <span class="chip" id="k2" style="left:120px; top:900px">OUTRA SOLUÇÃO?</span>
        <span class="chip" id="k3" style="right:120px; top:920px">DÚVIDA?</span>
        <div id="cal">+15 DIAS</div>
        <div id="s3-out" class="row r"><span class="bub out hl">%%C1%%</span></div>
      </div>

      <!-- pergunta -->
      <div class="sc" id="s-q">
        <div id="q-dots"><span class="dots"><i></i><i></i><i></i></span></div>
        <div class="center" id="q-txt">NA SUA ÚLTIMA VENDA PERDIDA, VOCÊ DESCOBRIU <span class="acc">O QUE TRAVOU</span> OU SÓ TENTOU <span class="red">CONVENCER</span> MAIS UMA VEZ?</div>
      </div>

      <!-- assinatura -->
      <div class="sc" id="s-s">
        <div id="sg-lock"><div style="position:absolute; left:50%; width:200px; height:243px; margin-left:-100px; top:30px"><svg viewBox="0 0 230 280" style="width:100%;height:100%;overflow:visible"><path id="sg-sh" d="M55 120 V80 a60 60 0 0 1 120 0 V120" fill="none" stroke="#6FD3A0" stroke-width="22" stroke-linecap="round"/><rect x="20" y="115" width="190" height="150" rx="26" fill="#6FD3A0"/></svg></div></div>
        <div class="center" id="sg-name">CLEITON RAMOS</div>
        <div class="center kick" id="sg-pos">MARKETING E VENDAS COM NÚMERO</div>
        <div id="sg-ch">DESAFIO 45 DIAS · DIA 4/45</div>
      </div>

      <div id="caps">%%CAPS%%</div>
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out", D = %%D%%;
      const $ = (s) => document.querySelector(s), $$ = (s) => Array.from(document.querySelectorAll(s));
      const scene = (s, a, b) => { tl.fromTo(s, { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.25 }, a); tl.to(s, { autoAlpha: 0, duration: 0.2 }, b - 0.2); };
      const up = (s, t, d) => tl.fromTo(s, { autoAlpha: 0, y: 40 }, { autoAlpha: 1, y: 0, duration: d || 0.4, ease: "back.out(1.6)" }, t);
      const pop = (s, t) => tl.fromTo(s, { autoAlpha: 0, scale: 0.5 }, { autoAlpha: 1, scale: 1, duration: 0.45, ease: "back.out(2.2)" }, t);
      const hide = (s, t) => tl.to(s, { autoAlpha: 0, duration: 0.2 }, t);
      const type = (sel, a, b) => { const ch = $$(sel + " .ch"); tl.fromTo(ch, { opacity: 0 }, { opacity: 1, duration: 0.01, stagger: (b - a) / ch.length }, a); };
      const dots = (sel, t, n) => tl.fromTo(sel + " .dots i", { y: 0 }, { y: -10, duration: 0.22, stagger: 0.12, yoyo: true, repeat: n, ease: "sine.inOut" }, t);

      // gancho 0 a 10.4
      scene("#s-h", 0, 10.45);
      const cn = { v: 0 };
      tl.fromTo(cn, { v: 0 }, { v: 2500000, duration: 3.0, ease: "power2.out", onUpdate: () => { $("#h-num").textContent = Math.round(cn.v).toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."); } }, 0.1);
      up("#h-nl", 1.0);
      hide(["#h-n", "#h-nl"], 3.55);
      tl.fromTo("#h-p", { autoAlpha: 0, scale: 1.6 }, { autoAlpha: 1, scale: 1, duration: 0.3, ease: "power4.out" }, 3.7);
      up("#h-pl", 5.75); tl.fromTo("#h-src", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.4 }, 4.2);
      tl.to(["#h-p", "#h-pl", "#h-src"], { y: -120, duration: 0.5, ease: "power3.inOut" }, 6.8);
      up("#hc0", 6.96); up("#hc1", 8.4); up("#hc2", 8.9); up("#hc3", 9.4);
      tl.to("#hc0 .bub", { opacity: 0.45, duration: 0.3 }, 9.6);

      // tese 10.45 a 26.3
      scene("#s-t", 10.45, 26.35);
      tl.fromTo("#t-dots", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.2 }, 10.6); dots("#t-dots", 10.6, 7);
      tl.to("#t-dots", { autoAlpha: 0, duration: 0.15 }, 13.1);
      tl.fromTo("#t1", { autoAlpha: 0, scale: 1.3 }, { autoAlpha: 1, scale: 1, duration: 0.3, ease: "power4.out" }, 13.22);
      tl.fromTo("#t-conv", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1.15, duration: 0.9, ease: "power2.out" }, 17.08);
      tl.fromTo("#t-strike", { scaleX: 0 }, { scaleX: 1, duration: 0.3, ease: "power3.out" }, 18.6);
      tl.to("#t-conv", { color: "#ff7b7b", opacity: 0.6, duration: 0.3 }, 18.6);
      up("#t2", 19.0);
      hide(["#t1", "#t-conv", "#t-strike", "#t2"], 21.2);
      tl.fromTo("#t-lockwrap", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.5, ease: "back.out(2)" }, 21.4);
      tl.fromTo("#lock", { rotation: -8 }, { rotation: 8, duration: 0.12, yoyo: true, repeat: 5, ease: "sine.inOut" }, 22.0);
      up("#t3", 22.54); up("#t4", 24.72);

      // situação 1 26.35 a 39.5
      scene("#s-1", 26.35, 39.5);
      up("#s-1 .lab", 26.42); up("#s1-q", 26.6);
      up("#s1-a1", 30.6, 0.25); type("#s1-a1", 30.7, 33.5);
      up("#s1-a2", 33.7, 0.25); type("#s1-a2", 33.8, 36.3);
      tl.fromTo("#s1-a2 .bub", { boxShadow: "0 0 0 rgba(111,211,160,0)" }, { boxShadow: "0 0 50px rgba(111,211,160,0.8)", duration: 0.4, yoyo: true, repeat: 3 }, 36.66);

      // situação 2 39.5 a 51.85
      scene("#s-2", 39.5, 51.85);
      up("#s-2 .lab", 39.54); up("#s2-q", 40.5);
      up("#b-red", 44.76);
      tl.fromTo("#b-arrow", { scaleY: 0 }, { scaleY: 1, duration: 0.6, ease: "power2.out" }, 47.86);
      tl.fromTo("#b-alab", { autoAlpha: 0, x: -20 }, { autoAlpha: 1, x: 0, duration: 0.3 }, 48.2);
      pop("#b-green", 49.8);

      // CTA 51.85 a 54.9
      scene("#s-c", 51.85, 54.9);
      tl.fromTo("#sv-fill", { scaleY: 0, transformOrigin: "50% 100%" }, { scaleY: 1, duration: 0.6, ease: "power2.out" }, 52.1);
      tl.fromTo("#save", { scale: 0.8 }, { scale: 1, duration: 0.5, ease: "back.out(2.5)" }, 51.9);

      // situação 3 54.9 a 72.1
      scene("#s-3", 54.9, 72.15);
      up("#s-3 .lab", 54.94);
      tl.fromTo("#lock3", { autoAlpha: 0, scale: 0.6 }, { autoAlpha: 1, scale: 1, duration: 0.45, ease: "back.out(2)" }, 56.2);
      [57.92, 58.52, 59.54, 60.84].forEach((t, i) => tl.fromTo("#k" + i, { autoAlpha: 0, y: -60, rotation: i % 2 ? 6 : -6 }, { autoAlpha: 1, y: 0, rotation: i % 2 ? 3 : -3, duration: 0.45, ease: "bounce.out" }, t));
      pop("#cal", 62.98);
      up("#s3-out", 65.9, 0.25); type("#s3-out", 65.96, 69.4);
      tl.to(["#k0", "#k1", "#k2", "#k3"], { autoAlpha: 0.35, duration: 0.3 }, 69.88);

      // pergunta 72.15 a 78.55
      scene("#s-q", 72.15, 78.55);
      dots("#q-dots", 72.2, 11);
      up("#q-txt", 72.4, 0.5);

      // assinatura 78.55 a D
      tl.fromTo("#s-s", { autoAlpha: 0 }, { autoAlpha: 1, duration: 0.25 }, 78.55);
      tl.fromTo("#sg-sh", { y: 0 }, { y: -40, duration: 0.35, ease: "back.out(3)" }, 78.75);
      up("#sg-name", 78.9); up("#sg-pos", 79.8);
      tl.fromTo("#sg-ch", { autoAlpha: 0, scale: 1.6, rotation: -8 }, { autoAlpha: 1, scale: 1, rotation: -2, duration: 0.25, ease: "power4.in" }, 81.7);

      // legendas palavra a palavra
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
      tl.set({}, {}, D);
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
