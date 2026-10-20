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
      .ground { position: absolute; inset: 0; background: radial-gradient(120% 70% at 50% 110%, rgba(10,74,102,0.62) 0%, rgba(3,53,78,0.70) 55%, rgba(2,42,62,0.84) 100%); }
      .ground::after { content: ""; position: absolute; left: 0; right: 0; bottom: 0; height: 520px;
        background-image: radial-gradient(circle, rgba(111,211,160,0.55) 2.2px, transparent 2.6px), radial-gradient(circle, rgba(0,163,214,0.45) 1.8px, transparent 2.2px);
        background-size: 34px 34px, 34px 34px; background-position: 0 0, 17px 17px;
        -webkit-mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.35) 45%, transparent 75%);
        mask-image: radial-gradient(90% 100% at 50% 100%, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.35) 45%, transparent 75%); }
      .orange .ground { background: linear-gradient(135deg, rgba(0,168,151,0.80) 0%, rgba(0,130,147,0.83) 50%, rgba(0,104,146,0.87) 100%); }
      .orange .ground::after { opacity: 0.35; }
      .face { position: absolute; inset: 0; background-size: cover; background-position: center 30%; transform-origin: 50% 35%; }
      .facefade { position: absolute; inset: 0; background: linear-gradient(180deg, rgba(2,42,62,0.55) 0%, rgba(2,42,62,0) 18%, rgba(2,42,62,0) 38%, rgba(2,42,62,0.80) 58%, rgba(2,42,62,0.96) 100%); }
      .badge { position: absolute; top: 300px; left: 120px; font-weight: 600; font-size: 28px; letter-spacing: 0.32em; color: #6FD3A0; }
      .badge.ink { color: #FFFFFF; }
      .stage { position: absolute; left: 120px; right: 120px; top: 400px; height: 860px; display: flex; flex-direction: column; justify-content: center; gap: 36px; }
      .stage.low { top: 860px; height: 440px; justify-content: flex-end; gap: 20px; }
      .hook { font-weight: 900; font-size: 96px; line-height: 1.0; letter-spacing: -0.02em; }
      .big { font-weight: 900; font-size: 112px; line-height: 1.0; letter-spacing: -0.025em; }
      .big.sm { font-size: 92px; }
      .mid { font-weight: 800; font-size: 72px; line-height: 1.04; letter-spacing: -0.02em; }
      .mid.dim { color: rgba(255,255,255,0.7); font-size: 56px; }
      .stat { font-weight: 900; font-size: 260px; line-height: 0.9; letter-spacing: -0.04em; color: #6FD3A0; }
      .stat.md { font-size: 170px; }
      .stat.ink { color: #FFFFFF; }
      .kick { font-weight: 600; font-size: 28px; letter-spacing: 0.32em; color: #6FD3A0; }
      .kick.ink { color: #E6F7F2; }
      .ink { color: #FFFFFF; }
      .acc { color: #6FD3A0; }
      .orange .acc { color: #03354e; }
      .orange .big:not(.ink) { color: #03354e; }
      .rules { list-style: none; display: flex; flex-direction: column; gap: 26px; }
      .rules li { font-weight: 900; font-size: 64px; line-height: 1.05; letter-spacing: -0.02em; border-top: 2px solid rgba(111,211,160,0.35); padding-top: 20px; display: flex; align-items: baseline; gap: 28px; }
      .rules.three li { font-size: 92px; }
      .rules .n { font-weight: 600; font-size: 26px; letter-spacing: 0.2em; color: #6FD3A0; min-width: 150px; }
      .rules.three .n { min-width: 60px; }
      .cap { position: absolute; left: 120px; right: 120px; top: 1330px; height: 180px; display: flex; align-items: flex-start; justify-content: center; }
      .cap-line { display: block; font-weight: 600; font-size: 40px; line-height: 1.25; text-align: center; color: #FFFFFF; background: rgba(2,42,62,0.85); padding: 10px 22px; border-radius: 10px; }
    </style>
  </head>
  <body>
    <div id="root" data-composition-id="main" data-start="0" data-width="1080" data-height="1920" data-duration="%%D%%">
      <audio id="narracao" src="assets/audio/narracao.mp3" data-start="0" data-duration="%%D%%" data-track-index="0"></audio>
      <video id="fundo" src="assets/video/fundo.mp4" data-start="0" data-duration="%%D%%" data-track-index="3" muted playsinline></video>
%%SCENES%%
%%CAPS%%
    </div>
    <script>
      const tl = gsap.timeline({ paused: true });
      const E = "power3.out";
%%ANIM%%
      document.querySelectorAll(".cap-line").forEach((el) => {
        const t = parseFloat(el.parentElement.dataset.start);
        tl.fromTo(el, { opacity: 0, y: 12 }, { opacity: 1, y: 0, duration: 0.18, ease: "power2.out" }, t);
      });
      window.__timelines["main"] = tl;
    </script>
  </body>
</html>
