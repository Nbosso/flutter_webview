import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidget extends StatefulWidget {
  const CustomWebViewWidget({super.key});

  @override
  State<CustomWebViewWidget> createState() => _CustomWebViewWidgetState();
}

class _CustomWebViewWidgetState extends State<CustomWebViewWidget> {
  WebViewController? controller;

  var html = """
 <html>

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>
  <header class="header">
    <img class="logo" src="https://raichu-uploads.s3.amazonaws.com/logo_da-vovo-papinhas_5tpzIQ.png" alt="Logo do site">
    <p class="card-text">Blog da Vovó</p>
    <div class="icons">
      <img class="icon" src="https://img.icons8.com/ios-glyphs/30/FFFFFF/home-page--v1.png" alt="Ícone 1">
      <img class="icon" src="https://img.icons8.com/glyph-neue/64/FFFFFF/contacts.png" alt="Ícone 2">
    </div>
  </header>
  <html lang="pt-br">
  <style>
    .header {
      background-color: red;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
    }

    .logo {
      width: 100px;
      height: 50px;
    }

    .icons {
      display: flex;
      justify-content: flex-end;
      align-items: center;
      width: 100px;
    }

    .icon {
      margin-left: 10px;
      width: 30px;
      height: 30px;
    }

    body {
      font-family: monospace;
      background-color: rgb(255, 244, 252);
    }

    article {
      background-color: white;
      border-radius: 8px;
      margin: 50px;
      padding: 45px 50px;
      box-shadow: rgb(211, 187, 157) 0px 4px 2px;
    }

    .card-text {
      margin: 0;
      font-size: 20px;
      font-weight: normal;
      color: rgb(255, 244, 252);
    }

    h3 {
      margin: 0;
      font-size: 40px;
      font-weight: normal;
      color: rgb(48, 48, 48);
    }

    header p {
      font-size: 20px;
      margin: 8px 0 20px;
      color: rgb(119, 119, 119);
    }

    img {
      width: 175px;
      height: 175px;
    }

    .post__info {
      display: flex;
    }

    .post__info span {
      font-size: 20px;
      margin: 0 16px 0 32px;
      color: rgb(48, 48, 48);
    }

    .post__interaction--liked,
    .post__interaction--commented,
    p {
      display: inline-block;
      margin: 0;
    }

    .post__interaction--commented {
      margin-left: 10px;
    }

    .post__interaction--commented p {
      font-size: 18px;
      vertical-align: bottom;
      padding-bottom: 8px;
    }

    .post__interaction {
      margin-top: 25px;
    }

    @media(max-width: 860px) {
      .post__info {
        display: grid;
      }

      .post__info span {
        margin-top: 20px;
        margin-left: 0;
      }
    }
  </style>

  <body>
    <article>
      <header>
        <h3>Bordado</h3>
        <p>dezembro 30, 2020</p>
      </header>
      <div class="post__info">
        <img
          src="https://static.wixstatic.com/media/9c24ce_a08312d3999c429abbb5fe0883b0aae6~mv2.jpg/v1/fill/w_414,h_414,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Primavera%20de%2083_Curso%2025%20Pontos%20de%20Bordado%20Livre%20(2).jpg"
          alt="bordado">
        <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis laudantium pariatur beatae repellendus
          labore doloribus aspernatur, eligendi voluptatem exercitationem saepe totam unde molestias. Ipsa vero non
          veniam earum commodi laborum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad velit reiciendis,
          nam cum aliquid odit! Suscipit ratione placeat itaque repellat reprehenderit fugit natus sequi inventore,
          architecto aliquid necessitatibus nostrum rerum...</span>
      </div>
      <div class="post__interaction">
        <div class="post__interaction--liked">
          <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24"
            style="fill: rgb(255, 0, 0);transform: ;msFilter:;">
            <path
              d="M20.205 4.791a5.938 5.938 0 0 0-4.209-1.754A5.906 5.906 0 0 0 12 4.595a5.904 5.904 0 0 0-3.996-1.558 5.942 5.942 0 0 0-4.213 1.758c-2.353 2.363-2.352 6.059.002 8.412L12 21.414l8.207-8.207c2.354-2.353 2.355-6.049-.002-8.416z">
            </path>
          </svg>
        </div>
        <div class="post__interaction--commented">
          <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24"
            style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
            <path
              d="M20 1.999H4c-1.103 0-2 .897-2 2v18l4-4h14c1.103 0 2-.897 2-2v-12c0-1.103-.897-2-2-2zm-6 11H7v-2h7v2zm3-4H7v-2h10v2z">
            </path>
          </svg>
          <p>15 comentários</p>
        </div>
      </div>
    </article>

    <article>
      <header>
        <h3>Conversa de vovó</h3>
        <p>março 30, 2022</p>
      </header>
      <div class="post__info">
        <img
          src="https://static.wixstatic.com/media/9c24ce_a08312d3999c429abbb5fe0883b0aae6~mv2.jpg/v1/fill/w_414,h_414,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Primavera%20de%2083_Curso%2025%20Pontos%20de%20Bordado%20Livre%20(2).jpg"
          alt="bordado">
        <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis laudantium pariatur beatae repellendus
          labore doloribus aspernatur, eligendi voluptatem exercitationem saepe totam unde molestias. Ipsa vero non
          veniam earum commodi laborum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad velit reiciendis,
          nam cum aliquid odit! Suscipit ratione placeat itaque repellat reprehenderit fugit natus sequi inventore,
          architecto aliquid necessitatibus nostrum rerum...</span>
      </div>
      <div class="post__interaction">
        <div class="post__interaction--liked">
          <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24"
            style="fill: rgb(255, 0, 0);transform: ;msFilter:;">
            <path
              d="M20.205 4.791a5.938 5.938 0 0 0-4.209-1.754A5.906 5.906 0 0 0 12 4.595a5.904 5.904 0 0 0-3.996-1.558 5.942 5.942 0 0 0-4.213 1.758c-2.353 2.363-2.352 6.059.002 8.412L12 21.414l8.207-8.207c2.354-2.353 2.355-6.049-.002-8.416z">
            </path>
          </svg>
        </div>
        <div class="post__interaction--commented">
          <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24"
            style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
            <path
              d="M20 1.999H4c-1.103 0-2 .897-2 2v18l4-4h14c1.103 0 2-.897 2-2v-12c0-1.103-.897-2-2-2zm-6 11H7v-2h7v2zm3-4H7v-2h10v2z">
            </path>
          </svg>
          <p>50 comentários</p>
        </div>
      </div>
    </article>

  </body>

  </html>

</body>

</html>""";

  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.dataFromString(html,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller!);
  }
}
