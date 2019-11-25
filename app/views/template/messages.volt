
{% extends "templates/base.volt" %}

{% block messages %}
    <!-- Mensagens-->  
    <div id="error_message" class="alert alert-danger alert-dismissable hide"><?=btn_close()?></div>    
    <div id="success_message" class="alert alert-success alert-dismissable hide"><?=btn_close()?></div>
    <div id="warning_message" class="alert alert-warning alert-dismissable hide"><?=btn_close()?></div>
    
    <div id="ajax_loader" class="alert alert-warning alert-dismissable hide">
        <?=btn_close()?>
            <h1>
                <span><img class="hourglassGif" src="<?= base_url('public/img/hourglass.gif') ?>"></span>                
                Por favor aguarde, carregando...            
            </h1>            
    </div>
    
    <div id="ajax_file_uploader" class="alert alert-warning alert-dismissable hide">
        <?=btn_close()?>
            <h1>
                <span><img class="hourglassGif" src="<?= base_url('public/img/hourglass.gif') ?>"></span>                
                Por favor aguarde, enviando arquivos...              
            </h1>            
    </div>
    
    <div id="ajax_busca_cep" class="alert alert-warning alert-dismissable hide">
        <?=btn_close()?>
            <h1>
                <span><img class="hourglassGif" src="<?= base_url('public/img/hourglass.gif') ?>"></span>                
                Por favor aguarde, procurando CEP online...              
            </h1>            
    </div>
    <!-- /Mensagens -->
{% endblock %}
