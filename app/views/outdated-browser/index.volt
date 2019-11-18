<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="img/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name='author' content='Angelo G. Weiss - angelo.g.w@gmail.com'>
        <link rel="stylesheet" type="text/css" href="<?= base_url('/public/css/atualize.css') ?>" />

        <title>Atualize seu navegador!</title>
    </head>

    <body>

        <div id="warp">
            <h1>
                Seu navegador atual est&#225; desatualizado !
            </h1>
            <br/>
            <p>Navegadores desatualizados cont&#233;m falhas de segurança que colocam seu computador em risco.</p>
            <br/>
            <p>Tenha a bondade de atualizar o seu navegador favorito utilizando um dos links abaixo.</p>

            <br/>
            <p>Clique no ícone e faça o download gr&#225;tis.</p> 



            <div id="browser">

                <a href="http://www.opera.com/download/" target="_blank" title="Opera">
                    <img src="<?= base_url('/public/img/opera.jpg') ?>" alt="Opera"> 
                    Opera
                </a>

                <a href="http://www.apple.com/br/safari/download/" target="_blank" title="Safari">
                    <img src="<?= base_url('/public/img/safari.jpg') ?>" alt="Safari">
                    Safari
                </a>

                <a href="http://www.google.com/Chrome" target="_blank" title="Google Chrome">
                    <img src="<?= base_url('/public/img/chrome.jpg') ?>" alt="Google Chrome">
                    Google Chrome
                </a>

                <a href="http://www.mozilla.org/firefox/" target="_blank" title="Mozilla Firefox">
                    <img src="<?= base_url('/public/img/firefox.jpg') ?>" alt="Mozilla Firefox">
                    Mozilla Firefox
                </a>

                <a href="http://windows.microsoft.com/pt-BR/internet-explorer/downloads/ie" target="_blank" title="Internet Explorer">
                    <img src="<?= base_url('/public/img/internet_explorer.jpg') ?>" alt="Internet Explorer">
                    Internet Explorer
                </a>

            </div><!-- browser --> 

        </div><!-- warp -->
    </body>
</html>