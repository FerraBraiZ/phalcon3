<!DOCTYPE html>

<!--[if lt IE 10 ]>
<script type="text/javascript"> window.location.href="<?= base_url('/public/atualize/index.php') ?>"; </script>
<!--[endif]-->

<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--[if IE]><link rel="shortcut icon" href="<?= base_url('/public/img/favicon.ico') ?>"><![endif]-->
        <link rel="icon" href="<?= base_url('/public/img/favicon.ico') ?>">
        <title>Registrar</title>
        <script type="text/javascript"> var base_url = '<?= base_url(); ?>';</script>
        <script type="text/javascript"> var sistema = '<?= site_url('/principal') ?>';</script>

        <link rel="stylesheet" type="text/css" href="<?= base_url('/public/css/bootstrap.min.css') ?>"/> 
        <link rel="stylesheet" type="text/css" href="<?= base_url('/public/css/bootstrap-theme.min.css') ?>"/>        
        <link rel="stylesheet" type="text/css" href="<?= base_url('/public/css/jquery-ui.min.1.11.4.css') ?>"/>
        <link rel="stylesheet" type="text/css" href="<?= base_url('/public/css/css.css') ?>"/>

    </head>

    <body>

        <!-- Mensagem de erro -->  
        <div id="error_message" class="alert alert-danger hide"></div>
        <div id="success_message" class="alert alert-success hide"></div>
        <div id="warning_message" class="alert alert-warning hide"></div>
        <div id="ajax_loader" class="alert alert-warning hide">
            <div>
                <h1>
                    <span><img class="ajaxHourglassGif" src="<?= base_url('public/img/hourglass.gif') ?>"alt="Por favor aguarde, carregando..."></span>                
                    Por favor aguarde, carregando...

                </h1>            
            </div>
        </div>
        <!-- /Mensagem de erro -->         



        <div class="container" >  

            <div id="register">

                <div class="panel panel-default panel-register" >

                    <div class="panel-heading">
                        <h3 class="panel-title">Registrar<?=PGT;?></h3>
                    </div>

                    <div class="panel-body">
                        <div id="error_message" class="alert alert-danger"></div>
                        <form class="form-horizontal" id="RegisterFrm" role="form" method="post" action="<?= base_url('/registrar/salvar') ?>">

                            <div class="input-group">   

                                <span class="input-group-addon" id="sizing-addon2">Usu&#225;rio</span>		
                                <input title="Informe o nome de Usu&#225;rio" type="text"
                                       class="form-control input-lg" id="usuario" name="usuario" 
                                       placeholder="Nome de Usu&#225;rio" aria-describedby="sizing-addon2"> 
                            </div>

                            <div class="input-group">

                                <span class="input-group-addon" id="sizing-addon2">&nbsp;&nbsp;&nbsp;Senha</span>		 
                                <input title="Informe a senha" type="password" 
                                       class="form-control input-lg" id="senha" name="senha"  
                                       placeholder="Senha" aria-describedby="sizing-addon2">
                            </div> 

                            <div class="input-group">

                                <span class="input-group-addon" id="sizing-addon2">Confirma Senha</span>		 
                                <input title="Confirme a senha" type="password" 
                                       class="form-control input-lg" id="confirma_senha" name="confirma_senha"  
                                       placeholder="Confirme a senha" aria-describedby="sizing-addon2">
                            </div>                 

                            <input type="hidden" name="token" id="token" value="<?=$token?>">
                            <br/>
                            <div class="input-group pull-right">

                                <button id="btn_registrar" type="submit" title="Login" class="btn btn-success">Registrar</button>

                            </div>

                            

                        </form> <!-- /RegisterFrmView -->



                    </div> <!-- /panel-body  -->

                </div> <!-- /panel panel-default  -->
                

            </div> <!-- /register -->
        </div> <!-- /container -->   

        <script type="text/javascript" src="<?= base_url('/public/js/jquery-1.11.2.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/jquery-ui.min.1.11.4.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/jquery.form.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/jquery.validate.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/bootstrap.min.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/resize-Font.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/result.js') ?>"></script>
        <script type="text/javascript" src="<?= base_url('/public/js/registrar.js') ?>"></script>

    </body>
</html>