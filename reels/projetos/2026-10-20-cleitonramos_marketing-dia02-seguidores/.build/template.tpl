<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=1080, height=1920" />
    <title>Dia 2: 22 mil seguidores, 9 vendas</title>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.2/dist/gsap.min.js"></script>
    <style>
      @font-face { font-family: "Montserrat"; font-weight: 900; src: url("assets/fonts/montserrat-latin-900-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 800; src: url("assets/fonts/montserrat-latin-800-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 600; src: url("assets/fonts/montserrat-latin-600-normal.woff2") format("woff2"); }
      @font-face { font-family: "Montserrat"; font-weight: 500; src: url("assets/fonts/montserrat-latin-500-normal.woff2") format("woff2"); }
      * { margin: 0; padding: 0; box-sizing: border-box; }
      html, body { margin: 0; background: #03354e; overflow: hidden; }
      #root { position: relative; width: 100%; height: 100%; overflow: hidden; background: #03354e; font-family: "Montserrat", sans-serif; color: #FFFFFF; }
      #fundo { position: absolute; inset: 0; width: 1080px; height: 1920px; object-fit: cover; }
      .scene { position: absolute; inset: 0; }
      .ground { position: absolute; inset: 0; background: radial-gradient(120% 70% at 50% 110%, rgba(10,74,102,0.62) 0%, rgba(3,53,78,0.72) 55%, rgba(2,42,62,0.86) 100%); }
      .ground::after { content: ""; position: absolute; left: 0; right: 0; bottom: 0; height: 520px;
        background-image: radial-gradient(circle, rgba(111,211,160,0.55) 2.2px, transparent 2.6px), radial-gradient(circle, rgba(0,163,214,0.45) 1.8px, transparent 2.2px);
        background-size: 34px 34px, 34px 34px; background-position: 0 0, 17px 17px;
        -webkit-mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.35) 45%, transparent 75%);
        mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.35) 45%, transparent 75%); }
      .orange .ground { background: linear-gradient(135deg, rgba(0,168,151,0.84) 0%, rgba(0,130,147,0.86) 50%, rgba(0,104,146,0.90) 100%); }
      .orange .ground::after { opacity: 0.35; }
      .face { position: absolute; inset: 0; background-size: cover; background-position: center 30%; transform-origin: 50% 35%; }
      .facefade { position: absolute; inset: 0; background: linear-gradient(180deg, rgba(2,42,62,0.55) 0%, rgba(2,42,62,0) 18%, rgba(2,42,62,0) 36%, rgba(2,42,62,0.82) 56%, rgba(2,42,62,0.97) 100%); }
      .badge { position: absolute; top: 300px; left: 120px; font-weight: 600; font-size: 28px; letter-spacing: 0.32em; color: #6FD3A0; }
      .badge.ink { color: #FFFFFF; }
      .stage { position: absolute; left: 120px; right: 120px; top: 400px; height: 860px; display: flex; flex-direction: column; justify-content: center; gap: 34px; }
      .stage.low { top: 820px; height: 480px; justify-content: flex-end; gap: 18px; }
      .hook { font-weight: 900; font-size: 96px; line-height: 1.0; letter-spacing: -0.02em; }
      .big { font-weight: 900; font-size: 104px; line-height: 1.0; letter-spacing: -0.025em; }
      .big.sm { font-size: 84px; }
      .red { color: #ff6b6b; }
      .mid { font-weight: 800; font-size: 64px; line-height: 1.05; letter-spacing: -0.02em; }
      .mid.dim { color: rgba(255,255,255,0.72); font-size: 52px; }
      .stat { font-weight: 900; font-size: 250px; line-height: 0.9; letter-spacing: -0.04em; color: #6FD3A0; }
      .stat.md { font-size: 190px; }
      .stat.sm2 { font-size: 120px; }
      .stat.ink { color: #FFFFFF; }
      .kick { font-weight: 600; font-size: 28px; letter-spacing: 0.3em; color: #6FD3A0; }
      .kick.ink { color: #E6F7F2; }
      .ink { color: #FFFFFF; }
      .acc { color: #6FD3A0; }
      .orange .acc { color: #03354e; }
      .orange .big:not(.ink) { color: #03354e; }
      .ico { width: 1em; height: 1em; }
      /* s02 barras */
      .bar-wrap { display: flex; flex-direction: column; gap: 26px; }
      .hbar { position: relative; height: 92px; background: rgba(255,255,255,0.08); border-radius: 14px; overflow: hidden; }
      .hbar .fill { position: absolute; left: 0; top: 0; bottom: 0; transform-origin: left center; border-radius: 14px; }
      .hbar .full { right: 0; background: rgba(255,255,255,0.22); }
      .hbar .sliver { width: 10px; background: #6FD3A0; box-shadow: 0 0 22px #6FD3A0; }
      .hbar span { position: absolute; left: 34px; top: 26px; font-weight: 800; font-size: 36px; letter-spacing: 0.04em; }
      /* s03 card */
      .card { background: rgba(2,42,62,0.78); border: 2px solid rgba(111,211,160,0.25); border-radius: 28px; padding: 34px 34px 24px; }
      .card-h { font-weight: 800; font-size: 34px; letter-spacing: 0.08em; display: flex; justify-content: space-between; }
      .down { color: #ff6b6b; }
      .chart { width: 100%; height: 300px; margin-top: 20px; }
      /* s04 celular */
      .phone { position: relative; align-self: center; width: 470px; height: 830px; border-radius: 54px; border: 10px solid #0d2633; overflow: hidden; box-shadow: 0 30px 80px rgba(0,0,0,0.5); }
      .ph-bg { position: absolute; inset: 0; background: url(assets/img/rosto-blur.jpg) center/cover; filter: brightness(0.75); }
      .ph-bars { position: absolute; top: 26px; left: 22px; right: 22px; display: flex; gap: 8px; }
      .ph-bars i { flex: 1; height: 6px; border-radius: 3px; background: rgba(255,255,255,0.35); overflow: hidden; position: relative; }
      .ph-bars i.on { background: #fff; }
      .ph-bars i b { position: absolute; inset: 0; background: #fff; transform-origin: left center; }
      .ph-top { position: absolute; top: 50px; left: 22px; display: flex; align-items: center; gap: 14px; font-weight: 600; font-size: 22px; }
      .ph-top .av { width: 54px; height: 54px; }
      .ph-views { position: absolute; left: 26px; bottom: 34px; display: flex; align-items: baseline; gap: 14px; background: rgba(0,0,0,0.55); padding: 18px 26px; border-radius: 22px; font-size: 64px; }
      .ph-views .ico { width: 56px; height: 56px; align-self: center; }
      .ph-views b { font-weight: 900; }
      .ph-views .c2 { font-size: 64px; }
      .ph-views span { font-weight: 600; font-size: 24px; display: none; }
      /* s05 colunas */
      .vchart { display: flex; gap: 70px; align-items: flex-end; height: 700px; padding: 0 30px; }
      .vcol { flex: 1; display: flex; flex-direction: column; align-items: stretch; justify-content: flex-end; height: 100%; gap: 16px; }
      .vval { font-weight: 900; font-size: 44px; text-align: center; color: #6FD3A0; }
      .vval.bad { color: #ff6b6b; }
      .vbar { border-radius: 16px 16px 4px 4px; transform-origin: bottom center; }
      .vbar.ok { height: 470px; background: linear-gradient(180deg, #6FD3A0 0%, #00a897 100%); }
      .vbar.bad { height: 24px; background: #ff6b6b; }
      .vlab { font-weight: 800; font-size: 32px; text-align: center; letter-spacing: 0.06em; border-top: 2px solid rgba(255,255,255,0.3); padding-top: 14px; }
      .vlab span { font-weight: 600; font-size: 24px; color: rgba(255,255,255,0.7); }
      /* s06 anel */
      .ringbox { position: relative; width: 520px; height: 520px; align-self: center; }
      .ring { width: 100%; height: 100%; }
      .ringtxt { position: absolute; inset: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 10px; }
      /* s07 lista */
      .list { display: flex; flex-direction: column; gap: 14px; }
      .row { display: flex; align-items: center; gap: 24px; background: rgba(2,42,62,0.75); border-radius: 20px; padding: 16px 22px; }
      .row .av { width: 70px; height: 70px; flex: none; }
      .who { flex: 1; display: flex; flex-direction: column; }
      .who b { font-weight: 800; font-size: 34px; }
      .who span { font-weight: 500; font-size: 22px; color: rgba(255,255,255,0.55); }
      .tag { font-weight: 900; font-size: 26px; letter-spacing: 0.14em; color: #fff; background: #e5484d; padding: 8px 16px; border-radius: 10px; }
      .stamp { position: absolute; left: 50%; top: 50%; width: 760px; margin-left: -380px; margin-top: -150px; text-align: center; font-weight: 900; font-size: 104px; line-height: 1.0; color: #ff6b6b; border: 10px solid #ff6b6b; border-radius: 24px; padding: 30px 10px; background: rgba(2,42,62,0.88); }
      /* s08 conta */
      .calc { display: flex; flex-direction: column; gap: 22px; }
      .cl { display: flex; justify-content: space-between; align-items: baseline; border-bottom: 2px solid rgba(111,211,160,0.3); padding-bottom: 18px; }
      .cl span { font-weight: 600; font-size: 28px; letter-spacing: 0.24em; color: #6FD3A0; }
      .cl b { font-weight: 900; font-size: 104px; letter-spacing: -0.03em; }
      .cl.tot b { font-size: 112px; }
      .cl em { font-style: normal; }
      /* s09 olho */
      .eye-big { font-size: 220px; color: #6FD3A0; line-height: 1; }
      /* s10 contadores */
      .duo { display: flex; gap: 30px; }
      .ctr { flex: 1; background: rgba(2,42,62,0.8); border-radius: 26px; padding: 28px 28px; display: flex; flex-direction: column; gap: 8px; position: relative; }
      .ctr span { font-weight: 600; font-size: 22px; letter-spacing: 0.2em; color: rgba(255,255,255,0.7); }
      .ctr b { font-weight: 900; font-size: 82px; letter-spacing: -0.03em; }
      .ctr i { position: absolute; right: 26px; top: 22px; font-style: normal; font-size: 34px; }
      .up { color: #6FD3A0; } .dn { color: #ff6b6b; }
      #s10-c2 b { color: #ff6b6b; }
      /* s11 etiqueta */
      .tagprice { align-self: flex-start; font-weight: 900; font-size: 120px; color: #03354e; background: #6FD3A0; padding: 10px 46px 10px 70px; border-radius: 18px 60px 60px 18px; position: relative; }
      .tagprice::before { content: ""; position: absolute; left: 24px; top: 50%; width: 26px; height: 26px; margin-top: -13px; border-radius: 50%; background: #03354e; }
      /* s12 calculadora */
      .rules { list-style: none; display: flex; flex-direction: column; gap: 22px; position: relative; }
      .rules li { font-weight: 900; font-size: 62px; line-height: 1.05; letter-spacing: -0.02em; border-top: 2px solid rgba(111,211,160,0.35); padding-top: 18px; display: flex; align-items: baseline; gap: 28px; }
      .rules .n { font-weight: 600; font-size: 24px; letter-spacing: 0.2em; color: #6FD3A0; min-width: 150px; }
      .dots { position: absolute; inset: -20px -40px; display: grid; grid-template-columns: repeat(12, 1fr); align-content: center; gap: 30px 0; opacity: 0.9; }
      .dots i { width: 22px; height: 22px; border-radius: 50%; background: #6FD3A0; justify-self: center; opacity: 0; }
      /* s13 fluxo */
      .flow { display: flex; flex-direction: column; align-items: stretch; gap: 0; }
      .node { font-weight: 900; font-size: 58px; line-height: 1.05; text-align: center; background: rgba(2,42,62,0.82); border: 3px solid rgba(111,211,160,0.45); border-radius: 26px; padding: 26px 20px; }
      .node span { display: block; font-weight: 600; font-size: 26px; letter-spacing: 0.04em; color: rgba(255,255,255,0.7); margin-top: 8px; }
      .node.hot { background: #6FD3A0; color: #03354e; border-color: #6FD3A0; font-size: 84px; box-shadow: 0 0 60px rgba(111,211,160,0.6); }
      .arrow { align-self: center; width: 8px; height: 70px; background: #6FD3A0; position: relative; transform-origin: top center; }
      .arrow::after { content: ""; position: absolute; left: -16px; bottom: -18px; border-left: 20px solid transparent; border-right: 20px solid transparent; border-top: 24px solid #6FD3A0; }
      /* s14 pessoas */
      .crowd { display: flex; gap: 12px; color: #FFFFFF; }
      .pp { width: 96px; height: 96px; }
      .pw { display: inline-block; }
      /* s15 fórmula */
      .formula { display: inline-flex; flex-direction: column; align-items: flex-start; gap: 6px; font-weight: 900; font-size: 58px; }
      .formula i { width: 560px; height: 8px; background: #6FD3A0; border-radius: 4px; transform-origin: left center; }
      .cap { position: absolute; left: 120px; right: 120px; top: 1330px; height: 180px; display: flex; align-items: flex-start; justify-content: center; }
      .cap-line { display: block; font-weight: 600; font-size: 40px; line-height: 1.25; text-align: center; color: #FFFFFF; background: rgba(2,42,62,0.88); padding: 10px 22px; border-radius: 10px; }
    </style>
  </head>
  <body>
    <div id="root" data-composition-id="main" data-start="0" data-width="1080" data-height="1920" data-duration="%%D%%">
      <audio id="narracao" src="assets/audio/narracao.mp3" data-start="0" data-duration="%%D%%" data-track-index="0"></audio>
%%SFX%%
      <video id="fundo" src="assets/video/fundo.mp4" data-start="0" data-duration="%%D%%" data-track-index="3" muted playsinline></video>
%%SCENES%%
%%CAPS%%
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out";
      const fmt = (n, dec) => { const s = dec ? n.toFixed(dec).replace(".", ",") : String(Math.round(n)); return dec ? s : s.replace(/\B(?=(\d{3})+(?!\d))/g, "."); };
      const count = (id, a, b, t, d, dec, suf) => { const o = { v: a }; const el = document.getElementById(id);
        tl.fromTo(o, { v: a }, { v: b, duration: d, ease: "power2.out", onUpdate: () => { el.textContent = fmt(o.v, dec) + (suf || ""); } }, t); };
      const up = (s, t, d) => tl.fromTo(s, { y: 50, opacity: 0 }, { y: 0, opacity: 1, duration: d || 0.4, ease: E }, t);
      const fade = (s, t) => tl.fromTo(s, { opacity: 0 }, { opacity: 1, duration: 0.3 }, t);
      const pop = (s, t) => tl.fromTo(s, { scale: 0.6, opacity: 0 }, { scale: 1, opacity: 1, duration: 0.45, ease: "back.out(2)" }, t);
      // entrada de cada cena: desliza e assenta
      document.querySelectorAll("section.scene").forEach((sc) => {
        const t = parseFloat(sc.dataset.start); const d = parseFloat(sc.dataset.duration);
        const inn = sc.querySelector(".stage");
        tl.fromTo(inn, { x: 90, opacity: 0 }, { x: 0, opacity: 1, duration: 0.32, ease: "power3.out" }, t);
        tl.fromTo(inn, { scale: 1 }, { scale: 1.03, duration: d, ease: "none" }, t);
      });
      // s01
      tl.fromTo("#s01-face", { scale: 1.14 }, { scale: 1.0, duration: 3.35, ease: "none" }, 0);
      count("s01-n", 0, 22000, 0.05, 1.5);
      tl.fromTo("#s01-b", { scale: 2.2, opacity: 0 }, { scale: 1, opacity: 1, duration: 0.3, ease: "power4.in" }, 1.8);
      tl.fromTo("#s01-in", { x: -14 }, { x: 0, duration: 0.3, ease: "elastic.out(1,0.3)" }, 2.1);
      // s02
      pop("#s02-n", 3.4);
      tl.fromTo("#s02-f1", { scaleX: 0 }, { scaleX: 1, duration: 0.7, ease: E }, 4.0);
      tl.fromTo("#s02-f2", { scaleX: 0 }, { scaleX: 1, duration: 0.3, ease: E }, 4.7);
      tl.fromTo("#s02-f2", { opacity: 1 }, { opacity: 0.3, duration: 0.35, repeat: 3, yoyo: true }, 5.0);
      // s03
      fade("#s03-k", 6.5); up("#s03-card", 6.8);
      const ln = document.getElementById("s03-line"); const L = ln.getTotalLength();
      tl.fromTo(ln, { strokeDasharray: L, strokeDashoffset: L }, { strokeDashoffset: 0, duration: 2.4, ease: "power1.inOut" }, 7.0);
      pop("#s03-down", 9.72); up("#s03-b", 9.8);
      // s04
      tl.fromTo("#s04-phone", { y: 160, rotation: -4, opacity: 0 }, { y: 0, rotation: 0, opacity: 1, duration: 0.6, ease: E }, 11.35);
      tl.fromTo("#s04-prog b", { scaleX: 0 }, { scaleX: 1, duration: 3.8, ease: "none" }, 11.45);
      pop("#s04-views", 12.2); count("s04-c", 0, 90, 12.4, 0.6);
      fade("#s04-c2", 13.15);
      // s05
      fade("#s05-k", 15.3);
      tl.fromTo("#s05-b1", { scaleY: 0 }, { scaleY: 1, duration: 0.8, ease: E }, 17.69); fade("#s05-v1", 18.2);
      tl.fromTo("#s05-b2", { scaleY: 0 }, { scaleY: 1, duration: 0.4, ease: E }, 18.68); fade("#s05-v2", 18.9);
      // s06
      tl.fromTo("#s06-arc", { strokeDashoffset: 527.8 }, { strokeDashoffset: 475.0, duration: 0.5, ease: E }, 19.75);
      tl.to("#s06-arc", { strokeDashoffset: 525.2, duration: 1.0, ease: "power2.inOut" }, 20.5);
      count("s06-n", 10, 0.5, 20.5, 1.0, 1, "%");
      up("#s06-t", 21.0);
      // s07
      fade("#s07-k", 22.75);
      [0,1,2,3,4,5].forEach((k) => tl.fromTo("#s07-r" + k, { x: 120, opacity: 0 }, { x: 0, opacity: 1, duration: 0.35, ease: E }, 22.85 + k * 0.12));
      [0,1,2,3,4,5].forEach((k) => pop("#s07-t" + k, 24.8 + k * 0.13));
      tl.fromTo("#s07-stamp", { scale: 2.4, rotation: -14, opacity: 0 }, { scale: 1, rotation: -8, opacity: 1, duration: 0.28, ease: "power4.in" }, 25.6);
      // s08
      fade("#s08-k", 27.9); up("#s08-a", 29.2); up("#s08-b", 31.0); up("#s08-c", 32.0);
      count("s08-cn", 0, 27, 32.1, 1.3);
      // s09
      fade("#s09-k", 34.95);
      tl.fromTo("#s09-eye", { scaleY: 0.05, opacity: 0 }, { scaleY: 1, opacity: 1, duration: 0.35, ease: E }, 36.6);
      up("#s09-a", 37.35); up("#s09-b", 38.23);
      // s10
      up("#s10-c1", 40.8); up("#s10-c2", 41.0);
      count("s10-n1", 22000, 48000, 41.2, 4.2);
      tl.fromTo("#s10-n2", { opacity: 1 }, { opacity: 0.35, duration: 0.25, repeat: 7, yoyo: true }, 42.0);
      up("#s10-a", 43.18); up("#s10-b", 44.09);
      // s11
      tl.fromTo("#s11-tag", { rotation: -25, scale: 0.4, opacity: 0 }, { rotation: -6, scale: 1, opacity: 1, duration: 0.5, ease: "back.out(2)" }, 45.62);
      fade("#s11-k", 45.65); up("#s11-a", 46.0);
      // s12
      up("#s12-a", 48.6); up("#s12-b", 51.1); up("#s12-c", 53.09); up("#s12-d", 54.93);
      tl.fromTo("#s12-dots i", { opacity: 0, scale: 0.2 }, { opacity: 0.13, scale: 1, duration: 0.25, stagger: { each: 0.012, from: "random" } }, 53.1);
      // s13
      fade("#s13-k", 57.0); pop("#s13-a", 57.1);
      tl.fromTo("#s13-x1", { scaleY: 0 }, { scaleY: 1, duration: 0.4, ease: E }, 58.6); pop("#s13-b", 59.03);
      tl.fromTo("#s13-x2", { scaleY: 0 }, { scaleY: 1, duration: 0.4, ease: E }, 61.2); pop("#s13-c", 61.7);
      // s14
      fade("#s14-k", 62.95);
      [0,1,2,3,4,5,6].forEach((k) => pop("#s14-p" + k, 63.1 + k * 0.1));
      up("#s14-a", 64.59); up("#s14-b", 65.52);
      // s15
      tl.fromTo("#s15-face", { scale: 1.0 }, { scale: 1.06, duration: 5.75, ease: "none" }, 66.56);
      fade("#s15-k", 66.6); up("#s15-f", 68.72);
      tl.fromTo("#s15-f i", { scaleX: 0 }, { scaleX: 1, duration: 0.5, ease: E }, 69.0);
      tl.fromTo("#s15-b", { scale: 0.85, opacity: 0 }, { scale: 1, opacity: 1, duration: 0.4, ease: "back.out(2)" }, 71.27);
      document.querySelectorAll(".cap-line").forEach((el) => {
        const t = parseFloat(el.parentElement.dataset.start);
        tl.fromTo(el, { opacity: 0, y: 12 }, { opacity: 1, y: 0, duration: 0.18, ease: "power2.out" }, t);
      });
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
