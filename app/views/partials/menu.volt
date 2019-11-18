<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!-- MENU STARTS -->
<div class="masthead hidden-xs hidden-print">
     <h1 title="Um dos segredos de nosso sucesso é o amor pelos animais" 
         class="resizableH1"><?=APPNAME;?> - Veterin&#225;ria Parque da Fonte</h1>
</div>

<!-- Static navbar -->
      <nav class="navbar navbar-default"> <!-- navbar-fixed-top-->
        <div class="container-fluid">
          <div class="navbar-header">
          
            <button type="button" class="navbar-toggle  pull-left" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <img class="toggle-pawvigation tooltipBubble" src="<?=base_url('/public/img/Paw_25x25.png')?>" alt="Menu Principal"/>
            </button>
              
              <a class="navbar-brand hidden-sm hidden-md hidden-lg" href="<?=base_url('/principal')?>"><?=APPNAME;?></a>
              
          </div>
          
          <div id="navbar" class="navbar-collapse collapse" >
            <ul class="nav navbar-nav tooltipBubble">

                <li class="active active-bordered"><a  title="Inicio" class="tooltipBubble"  href="<?=base_url('/principal');?>"><i class="glyphicon glyphicon-home"></i></a></li>
    
                 <li class="dropdown dropdown2p"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <i class="glyphicon glyphicon-edit"></i>&nbsp;&nbsp;Cadastrar<span class="caret"></span></a>
                        
                        <ul class="dropdown-menu menu-custom" role="menu">
                                                 
                            <li><a  title="Cadastar novo cliente no sistema" class="tooltipBubble"
                                href="<?= base_url('novo/cliente/'); ?>">
                                <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                Novo Cliente
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a  title="Cadastrar novo Animal no sistema" class="tooltipBubble"
                                href="<?= base_url('novo/animal/'); ?>">
                                <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                Novo Animal
                                </a>
                            </li>
                            
                            <li class="divider"></li>    

                            <li><a  title="Cadastrar nova consulta no sistema"  class="tooltipBubble"
                                href="<?= base_url('nova/consulta/'); ?>">
                                <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                Nova Consulta
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a title="Gerar uma novs receita" class="tooltipBubble"
                                   href="<?= base_url('nova/receita/'); ?>" target="_blank">
                                   <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                   Nova Receita
                                </a>
                            </li>
                            
                            <li class="divider"></li>    

                            <li><a  title="Cadastrar nova consulta no sistema"  class="tooltipBubble"
                                href="<?= base_url('novo/medico/'); ?>">
                                <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                Novo M&#233;dico
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a  title="Cadastrar novo recado no sistema"  class="tooltipBubble"
                                    href="<?=base_url('novo/recado/');?>">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Novo Recado
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a  title="Cadastrar novo banho e tosa"  class="tooltipBubble"
                                    href="<?=base_url('novo/banho/');?>">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Novo Banho e Tosa
                                </a>
                            </li>
                            
                     </ul>
                 </li>

                 <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;Buscar<span class="caret"></span></a>
                        <ul class="dropdown-menu menu-custom" role="menu">
                        
                            <li><a title="Procurar um cliente no sistema" class="tooltipBubble"
                                   href="<?= base_url('/cliente/'); ?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   Cliente
                                </a>
                            </li>
                        
                            <li class="divider"></li>
                            
                            <li><a title="Procurar um Animal no sistema" class="tooltipBubble"
                                   href="<?= base_url('/animal/'); ?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   Animal (Pet)
                                </a>
                            </li>
                        
                            <li class="divider"></li>    

                            <li class="disabled">
                                <a title="Procurar uma consulta no sistema" class="tooltipBubble text-muted" onclick="window.event.preventDefault();"
                                   href="<?= base_url('/consulta/'); ?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   Consulta
                                </a>                                
                            </li>
                            
                            <li class="divider"></li>    

                            <li><a title="Procurar um m&#233;dico no sistema" class="tooltipBubble"
                                   href="<?= base_url('/medico/'); ?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   M&#233;dico
                                </a>
                            </li>
                            
                            
                            <li class="divider"></li>
                            
                            <li><a title="Procurar um banho e tosa" class="tooltipBubble"
                                   href="<?= base_url('/banho/'); ?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Banho e Tosa
                                </a>
                            </li>
                        
                            <li class="divider"></li>
                            
                            <li class="disabled">
                                <a title="Procurar hist&#243;rico m&#233;dico de animais no sistema" class="tooltipBubble" 
                                   href="<?=base_url('/historico/'); ?>" onclick="window.event.preventDefault();">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   Hist&#243;rico M&#233;dico
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a  title="Exibe uma lista de clientes anivers&#225;riantes, ordenada por m&#234;s" class="tooltipBubble"
                                    href="<?=base_url('aniversariantes/cliente/');?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Anivers&#225;rios - Clientes
                                </a>
                            </li>
                            <li class="divider"></li>
                            
                            <li><a  title="Exibe uma lista de animais anivers&#225;riantes, ordenada por m&#234;s" class="tooltipBubble"
                                    href="<?=base_url('aniversariantes/animal/');?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Anivers&#225;rios - Animais ( pet )
                                </a>
                            </li>
                            
                            <li class="divider"></li>
                            
                            <li><a title="Procurar um recado no sistema" class="tooltipBubble"
                                   href="<?=base_url('/recado/');?>">
                                   <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                   Recado
                                </a>
                            </li>

                     </ul>
                 </li>			
                
    		</ul>
              
              <?php $user_id = $this->session->userdata('user_id')?>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a  href="<?=base_url('usuario/perfil');?>"><?=isset($user_id)? $user_id :'Convidado'?></a></li>		
                    <li class="dropdown"><a  href="<?=base_url('configuracoes');?>"><i class="glyphicon glyphicon-cog"></i></a></li>		
                </ul>
    		
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>



