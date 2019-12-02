<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">Listagem de Usuários
            <span class="total_clientes_encontrados_span">
                  , <?=template_show_total_records( $total_clientes,'cliente' )?> 
            </span>
            <?=PGT;?>
        </h3>
    </div>

    <div class="panel-body">
        
    <div class="row"><!-- /row -->
        
        <div class="col-xs-12"><!-- /col-xs-12-->         
        
        <div id="List_view_submenu">
        
            <a href="<?=base_url('novo/cliente/')?>" class="btn btn-success pull-left">Adicionar Novo Usuário</a>
            
            <!-- BUSCA -->
            <form id="buscaUsuárioFrm" class="form-horizontal"  method="post" action="<?=base_url('listar/cliente/')?>">
                <div id="div_busca" class="input-group">
                    <span class="input-group-addon">Busca</span>
                    <input title="Informe NOME, CPF ou TELEFONE do cliente" type="text" class="form-control tooltipBubble" id="busca" name="busca"
                           value="<?=$this->session->userdata('busca_cliente')?>" placeholder="NOME, CPF ou TELEFONE do Usuário" autofocus>
                    <span class="input-group-btn">
                        <button type="submit" id="buscaBtn" class="btn btn-default">
                            <i class="glyphicon  glyphicon-search"></i>
                        </button> 
                    </span>
                </div>
            </form>
            <!-- BUSCA -->
            
        <i class="clearfix"></i>
        </div><!-- List_view_submenu --> 
        
                 
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th class="acao">A&#231;&#227;o</th>
                <th>Nome Completo</th>
                <th>Financeiro</th>
                <th>Pets</th>
                <th>Informa&#231;&#245;es</th>
            </tr>
        </thead>
        <tbody>

        <tr id="contador_clientes" class="alert alert-warning resizable_text hide">
            <td colspan="8">Nenhum cliente encontrado.</td>
        </tr>

        <?php foreach ($clientes as $key => $cliente):?>
        
        <tr>
            <td class="acao">
                <div class="btnWarp">
                    
                    <a data-id="<?=$cliente['Personal_data']['id_cliente'];?>" title='Editar cliente: <?=$cliente['Personal_data']['nome'];?>' 
                       class="btn btn-xs btn-default tooltipBubble" 
                       href="<?=base_url('/editar/cliente/'.$cliente['Personal_data']["id_cliente"]);?>">
                       <i class="glyphicon glyphicon-pencil"></i>
                    </a> 

                    <a data-id="<?=$cliente['Personal_data']['id_cliente'];?>" title="Excluir cliente: <?=$cliente['Personal_data']['nome'];?>" 
                       class="btn btn-xs btn-default deleta_cliente tooltipBubble" 
                       href="<?=base_url('/excluir/cliente/'.$cliente['Personal_data']["id_cliente"]);?>">
                        <i class="glyphicon glyphicon-trash"></i>
                    </a>

                </div> <!-- btnWarp -->
            </td>

            <!-- CLIENTE NOME -->
            <td class="resizable_text">
            <!-- Modal Excluir Usuário NOME -->
                <?=$cliente['Personal_data']['nome'];
                template_modal_confirm_delition("excluir_cliente_id_".
                                                $cliente['Personal_data']['id_cliente'],
                                                "sm","cliente", $cliente['Personal_data']["nome"]);
                ?>
            <!-- Modal Excluir Usuário NOME -->
            </td>
            <!-- /CLIENTE NOME -->


            <td><!--FINANCEIRO -->

                <div class="btnWarp">    
                <a title="Visualizar movimenta&#231;&#227;o financeira" class="btn btn-xs btn-default tooltipBubble" data-toggle="modal" 
                   data-target="#financeiro_<?=$cliente['Personal_data']['id_cliente'];?>"><span class="glyphicon glyphicon-eye-open"></span></a> 
                </div>

                <!-- MODAL FINANCEIRO-->
                <?php
                template_modal_display_content('financeiro_'.$cliente['Personal_data']['id_cliente'],'lg','Movimentação financeira',"Nenhum registro encontrado")
                ?>                
                <!-- /MODAL FINANCEIRO-->
                
            </td><!--/FINANCEIRO -->


            <td><!-- PETS -->

                <div class="btnWarp">                    
                <a title="Visualizar animais cadastrados" class="btn btn-xs btn-default visualizar_pet tooltipBubble" data-toggle="modal" 
                   data-target="#animal_<?=$cliente['Personal_data']['id_cliente'];?>"><span class="glyphicon glyphicon-eye-open"></span></a>
                </div> 


                <!-- MODAL PETS -->
                <div class="modal fade" id="animal_<?=$cliente['Personal_data']['id_cliente']?>" role="dialog">
                    <div class="modal-dialog modal-dialog-lg hidden-xs">
                        <div class="modal-content">
                            <div class="modal-header box-shadow">
                                <h2 class="modal-title" id="modal">Animais do cliente: <?=$cliente['Personal_data']['nome'];?></h2>
                            </div>
                            <div class="modal-body">
                                <table class="table table-condensed table-bordered table-striped table-hover box-shadow">
                                    <thead>
                                        <tr>
                                            <th class="acao">A&#231;&#227;o</th>                                        
                                            <th>Nome</th>
                                            <th>Especie</th>
                                            <th>Ra&#231;a</th>                                        
                                            <th class="hidden-sm">Idade</th>
                                            <th>Anivers&#225;rio</th>
                                            <th>Sexo</th>
                                            <th>Cor Pelagem</th>                                        
                                        </tr>
                                    </thead>
                        <?php $pet_count = 0;?>                                    
                        <?php foreach ($cliente as $pets_keys => $pets_values):?>                                                                                
                        <?php if($pets_keys === 'Pets' && !empty($pets_keys)):?>                                                
                        <?php foreach ($pets_values as $pet_keys => $pet_values) :?>
                            <?php $pet_count++;?>
                            <tr>  
                                
                            <td class="acao">
                                
                                <div class="btnWarp">
                                
                                    <a data-id="<?=$pet_values['id_animal']?>" title="Editar" 
                                        class="btn btn-xs btn-default tooltipBubble" 
                                        href="<?=base_url('/editar/animal/'.$pet_values['id_animal']);?>">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </a>

                                    <a data-id="<?=$pet_values['id_animal']?>" title="Excluir" 
                                       class="btn btn-xs btn-default deleta_animal tooltipBubble" 
                                       data-target="#excluir_animal_id_<?=$pet_values['id_animal']?>"
                                       href="<?=base_url('/excluir/animal/'.$pet_values['id_animal'])?>">
                                       <i class="glyphicon glyphicon-trash"></i>
                                    </a>
                                
                                </div>

                            <!-- Modal Excluir Animal --> 
                            <?php

                            template_modal_confirm_delition("excluir_animal_id_".$pet_values['id_animal'],"sm","Animal", $pet_values['nome'] );

                            ?>    
                            <!-- /Modal Excluir Animal --> 

                            <!-- Histórico Médico PET <?=$pet_values['nome']?>" -->
                            <div class="btnWarp">
                            <a title="Hist&#243;rio M&#233;dico" class="btn btn-xs btn-default tooltipBubble" data-toggle="modal"
                                data-target="#historico_medico_animal_id_<?=$pet_values['id_animal']?>"><i class="glyphicon glyphicon-list-alt"></i></a>         
                            </div>            

                            <!-- Modal Histórico Médico PET <?=$pet_values['nome']?>" -->

                                        <div id="historico_medico_animal_id_<?=$pet_values['id_animal']?>"  class="modal fade" tabindex="-1" role="dialog">
                                            <div class="modal-dialog modal-dialog-lg hidden-xs">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title">Hist&#243;rio M&#233;dico <?=$pet_values['nome']?></h1>
                                                    </div>
                                                        <div class="modal-body" >
                                                            <div class="historico-medico-conteudo"> 
                                                            <p class="alert alert-warning span-bold-size20 pdng-30">Nenhum registro encontrado</p>
                                                            <br/>
                                                            </div><!-- table-responsive-->
                                                            <div class="modal-footer">
                                                                <button type="button" data-dismiss="modal" class="btn btn-danger"> Fechar </button>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div> 
                                        <!-- /Modal Excluir PET <?=$pet_values['nome']?>" --> 
                                        </td>                
                                        <td class="resizable_text"><?=ucfirst($pet_values['nome'])?></td>
                                        <td class="resizable_text"><?=ucfirst($pet_values['especie'])?></td>
                                        <td class="resizable_text"><?=ucfirst($pet_values['raca'])?></td>   
                                        <td class="resizable_text hidden-sm">
                                            <span class="hidden-sm">
                                                <?=calculaIdade($pet_values['data_aniversario'])?>
                                            </span>
                                        </td>
                                        <td class="resizable_text"><?=convert_date_ISO_into_NBR($pet_values['data_aniversario'])?></td>
                                        <td class="resizable_text"><?=ucfirst($pet_values['sexo'])?></td>
                                        <td class="resizable_text"><?=ucfirst($pet_values['cor_pelagem'])?></td>               
                                        </tr>   
                                   <?php endforeach;?>                                                   
                                <?php endif;?>
                            <?php endforeach;?>

                            <?php    
                                if($pet_count<=0){        
                                    echo '<tr><td colspan="8" class="alert alert-warning span-bold-size20 pdng-30">Nenhum registro encontrado</td></tr>';
                                }    
                            ?>
                                </table>

                                <div class="modal-footer">
                                    <form id="novoAnimalForm" method="post" action="<?=base_url('/animal/novo');?>">
                                        <input type="hidden" name="id_cliente" value="<?=$cliente['Personal_data']['id_cliente'];?>">
                                        <input type="hidden" name="cliente_nome" value="<?=$cliente['Personal_data']['nome'];?>">
                                        <input type="hidden" name="cliente_cpf" value="<?=$cliente['Personal_data']['cpf'];?>">                                       
                                        <button type="submit" title="Adicionar novo animal" class="btn btn-success pull-left">
                                        Adicionar Novo Animal</button>
                                    </form>

                                    <button type="button" class="btn btn-danger" data-dismiss="modal"> Fechar </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </td><!-- /PETS -->

            <!-- INFORMACOES -->
            <td>

            <div class="btnWarp">

            <a title="Visualizar foto, dados pessoais, telefones, emails, endere&#231;os e observa&#231;&#245;es" 
               class="btn btn-xs btn-default tooltipBubble" data-toggle="modal" data-target="#info_cliente_<?=$cliente['Personal_data']['id_cliente']?>">
               <span class="glyphicon glyphicon-eye-open"></span>
            </a>
                
            </div> 

                <!-- MODAL -->

                <div class="modal fade"  id="info_cliente_<?=$cliente['Personal_data']['id_cliente'] ?>" role="dialog">
                    <div class="modal-dialog modal-dialog-xl hidden-xs">
                        <div class="modal-content">
                            <div class="modal-header box-shadow">
                                <button type="button" class="btn btn-danger pull-right hidden-lg hidden-md" data-dismiss="modal"> Fechar </button> 
                                <h2 class="modal-title informacao_h2"><?=$cliente['Personal_data']['nome']?></h2>
                            </div>

                            <div class="modal-body" id="informacoes">

                                <div class="row">

                                    <div id="coluna-foto" class="col-lg-4 col-md-6 col-sm-12">

                                        <div class="modal-header borderless">
                                            <h2 class="modal-title">Foto</h2>
                                        </div>

                                        <?php 
                                        
                                            if($cliente['Personal_data']['foto_nome']){
                                                
                                                \template_modal_informacoes_profile_img($cliente['Personal_data']['foto_nome']);

                                            }else{
                                                
                                                \template_blank_profile_pic_no_btn();
                                                
                                            }
                                            
                                        ?>    

                                        <hr class="hidden-lg"/>

                                        <div class="hidden-lg hidden-sm">

                                        <div class="modal-header box-shadow">
                                            <h2 class="modal-title">Observa&#231;&#245;es</h2>
                                        </div>
                                            
                                        <div class="text-justify pdng-30">
                                            <?=$cliente['Personal_data']['observacao']?>
                                        </div>

                                        </div>

                                    </div><!-- /#coluna-foto  -->

                                    <div id="coluna-resto" class="col-lg-8 col-md-6 col-sm-12">

                                        <div class="col-lg-7 col-md-12 col-sm-12"> 

                                            <!-- Dados pessoais -->      
                                            <div class="modal-header modal-header-custom">
                                                <h2 class="modal-title">Dados pessoais</h2>
                                            </div>
                                            <table class="table table-condensed table-bordered table-striped box-shadow">
                                                <thead>
                                                    <tr id="dados_pessoais">
                                                        <th class="th_cpf">CPF</th>
                                                        <th class="th_aniversario">Anivers&#225;rio</th>
                                                        <th class="th_cliente_desde">Usuário Desde</th>
                                                    </tr>
                                                </thead>    

                                                    <tr>
                                                        <td><?=$cliente['Personal_data']['cpf']?></td>
                                                        <td>
                                                        <?php
                                                        if ($cliente['Personal_data']['data_aniversario'] === '0000-00-00'){
                                                            $dt_aniversario = 'N&#227;o Informado';
                                                        } else {
                                                            $dt_aniversario = convert_date_ISO_into_NBR($cliente['Personal_data']['data_aniversario']);
                                                        }
                                                        echo $dt_aniversario
                                                        ?>
                                                        </td>
                                                        <td>
                                                            <?php
                                                            $data_cadastro = convert_date_ISO_into_NBR($cliente['Personal_data']['data_cadastro']);
                                                            if($data_cadastro != AGORA){
                                                                echo $data_cadastro.' ( '.calculaIdade($cliente['Personal_data']['data_cadastro']).' )';
                                                            }else{
                                                               echo $data_cadastro.' ( Hoje! ) ';
                                                            }
                                                            ?>
                                                        </td>
                                                    </tr>
                                            </table>
                                            <!-- /Dados pessoais -->

                                        </div> 

                                        <div class="col-lg-5 col-md-12 col-sm-12"> 

                                            <!-- emails --> 
                                                <div class="modal-header">
                                                    <h2 class="modal-title">E-mails</h2>
                                                </div>

                                                <table class="table table-condensed table-bordered table-striped box-shadow">
                                                    <thead></thead>
                                                    
                                                    <?php \template_Display_Emails($cliente)?>

                                                </table>
                                            <!-- /emails -->

                                        </div> 

                                        <div class="col-lg-7 col-md-12 col-sm-12">

                                            <!-- endereco  -->
                                                <div class="modal-header modal-header-custom">
                                                    <h2 class="modal-title">Endere&#231;o</h2>
                                                </div>
                                                <table class="table table-condensed table-bordered table-striped box-shadow">
                                                    <tbody>

                                                        <?php \template_Display_Enderecos($cliente)?>

                                                    </tbody>
                                                </table>
                                            <!-- /endereco  -->

                                        </div> 

                                <div class="col-lg-5 col-md-12 col-sm-12"> 

                                    <!-- Fones -->
                                        <div class="modal-header modal-header-custom">
                                            <h2 class="modal-title">Telefones</h2>
                                        </div>
                                        <table class="table table-condensed table-bordered table-striped box-shadow">
                                            <tbody>
                                                
                                            <?php \template_Display_Telefones( $cliente ) ?>
                                                
                                            </tbody>    
                                        </table>
                                    <!-- /Fones -->         

                                </div> 

                                    </div> <!-- /#coluna-resto --> 

                                </div><!-- /row  first -->

                                <div class="row hidden-md">

                                    <div class="col-md-12">

                                        <div class="modal-header modal-header-custom">
                                            <h2 class="modal-title">Observa&#231;&#245;es</h2>
                                        </div>
                                        <div class="text-justify pdng-30"><?=$cliente['Personal_data']['observacao']?></div>

                                    </div><!-- /col-md-12-->

                                </div><!-- /row  Observacoes--> 

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal"> Fechar </button>                
                                </div>
                            </div>
                        </div>
                    </div><!-- /modal-dialog modal-dialog-informacao -->
                </div>
                <!-- / MODAL INFORMACOES -->
            </td><!-- /td_informacoes -->
        </tr>
        <?php endforeach;?>
    </tbody>
    </table>


        <!-- Paginação -->    

        <div  id="box_paginacao" class="text-center">   
            <?=isset($paginacao) ? $paginacao : '' ?>
        </div>

        <!-- /Paginação -->
        </div><!-- /col-xs-12--> 
    </div><!-- /row --> 
    </div><!--panel-body-->

</div><!-- /panel panel-default-->


<script async>
    
    var total_clientes = parseInt('<?=$total_clientes?>');
    
    
    if ( total_clientes > 0 ){
        
        document.getElementById("contador_clientes").classList.add("hide");
        
    }else{
        
        document.getElementById("contador_clientes").classList.remove("hide");
        
    }
</script>


<!-- /LISTAGEM DE CLIENTE VIEW -->
