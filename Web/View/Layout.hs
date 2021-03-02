module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|

<head>
    {metaTags}

    <link rel="stylesheet" href="//demo.productionready.io/main.css">
    <link rel="stylesheet" href="/app.css"/>

    {scripts}

    <title>Conduit</title>
</head>
<body>
  <nav class="navbar navbar-light">
      <div class="container">
        <a class="navbar-brand" href={ArticlesAction}>conduit</a>
        <ul class="nav navbar-nav pull-xs-right">
          <li class="nav-item">
            <a class="nav-link active" href={ArticlesAction}>Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href={NewArticleAction}>
              <i class="ion-compose"></i>New Post
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href={NewSessionAction}>
              <i class="ion-gear-a"></i>Sign in
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href={NewUserAction}>Sign up</a>
          </li>
        </ul>
      </div>
    </nav>
    {renderFlashMessages}
    {inner}
    <footer>
     <div class="container">
       <a href="/" class="logo-font">conduit</a>
       <span class="attribution">
         An interactive learning project from <a href="https://thinkster.io">Thinkster</a>. Code &amp; design licensed under MIT.
       </span>
     </div>
   </footer>
</body>
|]


scripts = [hsx|
    <script id="livereload-script" src="/livereload.js"></script>
    <script src="/vendor/morphdom-umd.min.js"></script>
    <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
    <script src="/vendor/timeago.js"></script>
    <script src="/vendor/popper.min.js"></script>
    <script src="/vendor/bootstrap.min.js"></script>
    <script src="/helpers.js"></script>
    <script src="/vendor/turbolinks.js"></script>
    <script src="/vendor/morphdom-umd.min.js"></script>
    <script src="/vendor/turbolinksMorphdom.js"></script>
    <script src="/vendor/turbolinksInstantClick.js"></script>
|]


metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
