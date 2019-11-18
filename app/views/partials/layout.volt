<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
Monta o layout principal do sistema incluindo os arquivos de:
    cabeçalho(common/header.php)
    menu (common/menu.php)
    conteudo dinamico(common/{$view})    
    rodape(common/footer.php)    
 */
                
    include 'header.php';
    include 'messages.php';
    include 'menu.php';
    
    echo'<div class="row"><div class="col-xs-12">';
    
    $this->load->view($view);
    echo'</div><!--/row--></div><!--/col-xs-12-->';
    include 'footer.php'; 