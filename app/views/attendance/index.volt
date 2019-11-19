<!---->
<!--<div class="panel panel-default">-->
<!---->
<!--    <div class="panel-heading">-->
<!--        <h3 class="panel-title">Listagem de Animais            -->
<!--            <span class="total_animais_encontrados_span">-->
<!--                , --><?//=template_show_total_records( $total_animais,'Pet' )?><!-- -->
<!--            </span>-->
<!--            --><?//= PGT; ?><!--        -->
<!--        </h3>-->
<!--    </div>-->
<!---->
<!--    <div class="panel-body">-->
<!---->
<!--        <div id="List_view_submenu">-->
<!---->
<!--            <a href="--><?//= base_url('novo/animal/') ?><!--" class="btn btn-success pull-left">Adicionar Novo Animal</a>-->
<!---->
<!--            <!-- BUSCA -->-->
<!--            <form id="buscaClienteFrm" class="form-horizontal"  method="post" action="--><?//= base_url('listar/animal/') ?><!--">-->
<!---->
<!--                <div id="div_busca" class="input-group">-->
<!--                    -->
<!--                    <span class="input-group-addon">Busca</span>-->
<!--                    <input title="Informe o Nome do Animal ou CPF do proprietário" type="text" class="tooltipBubble form-control" id="busca" name="busca" -->
<!--                           value="--><?//=$this->session->userdata('busca_animal')?><!--" -->
<!--                           placeholder="Nome do Animal ou CPF do proprietário">-->
<!--                    <span class="input-group-btn">-->
<!--                        <button type="submit" id="buscaBtn" class="btn btn-default">-->
<!--                            <i class="glyphicon  glyphicon-search"></i>-->
<!--                        </button> -->
<!--                    </span>-->
<!---->
<!--                </div>-->
<!---->
<!--            </form>-->
<!--            <!-- BUSCA -->-->
<!---->
<!--            <i class="clearfix"></i>-->
<!--        </div><!-- List_view_submenu --> -->
<!---->
<!--        <table class="table table-hover table-striped">-->
<!--            <thead>-->
<!--                <tr>-->
<!--                    <th class="acao">A&#231;&#227;o</th>-->
<!--                    <th>Nome do Animal</th>-->
<!--                    <th>Propriet&#225;rio</th>-->
<!--                    <th>Fotos</th>-->
<!--                    <th>Dados</th>-->
<!--                    <th>Histórico Médico</th>-->
<!---->
<!--                </tr>-->
<!--            </thead>-->
<!--            <tbody>-->
<!---->
<!--                <tr id="contador_animais" class="alert alert-warning resizable_text hide">-->
<!--                    <td colspan="6">Nenhum animal encontrado.</td>-->
<!--                </tr>-->
<!---->
<!--                -->
<!--                --><?php //foreach ($animais as $key => $animal): ?>
<!--                -->
<!--                <tr>-->
<!--                     <td class="acao">-->
<!--                        <div class="btnWarp">-->
<!---->
<!--                            <a data-id="--><?//=$animal['Animal_data']['id_animal'];?><!--" title='Editar animal: --><?//=$animal['Animal_data']['pet_nome'];?><!--' -->
<!--                               class="btn btn-xs btn-default tooltipBubble" -->
<!--                               href="--><?//=base_url('/editar/animal/'.$animal['Animal_data']["id_animal"]);?><!--">-->
<!--                               <i class="glyphicon glyphicon-pencil"></i>-->
<!--                            </a> -->
<!---->
<!--                            <a data-id="--><?//=$animal['Animal_data']['id_animal'];?><!--" title="Excluir animal: --><?//=$animal['Animal_data']['pet_nome'];?><!--" -->
<!--                               class="btn btn-xs btn-default deleta_animal tooltipBubble" -->
<!--                               href="--><?//=base_url('/excluir/animal/'.$animal['Animal_data']["id_animal"]);?><!--">-->
<!--                                <i class="glyphicon glyphicon-trash"></i>-->
<!--                            </a>-->
<!---->
<!--                        </div> <!-- btnWarp -->-->
<!--                    </td>-->
<!---->
<!--                    <td class="resizable_text"><!-- ANIMAL NOME --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->-->
<!---->
<!--                        <!-- MODAL EXCLUIR ANIMAL -->-->
<!--                        --><?//= $animal['Animal_data']['pet_nome'];
//                        template_modal_confirm_delition("excluir_animal_id_".
//                                                        $animal['Animal_data']['id_animal'],
//                                                        "sm","animal", $animal['Animal_data']["pet_nome"]);
//
//                        ?>
<!--                        <!-- /MODAL EXCLUIR ANIMAL --> -->
<!---->
<!--                    </td><!-- /ANIMAL NOME --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->-->
<!---->
<!---->
<!--                    <td class="resizable_text"><!-- PET PROPRIETARIO --> -->
<!--                        -->
<!--                        <span class="hidden-xs hidden-sm">-->
<!--                            --><?//= $animal['Animal_data']['proprietario'] . ', CPF: ' . $animal['Personal_data']['cpf'] ?>
<!--                        </span>-->
<!--                        <span class="hidden-lg hidden-md">-->
<!--                            --><?//= $animal['Animal_data']['proprietario'] . '<br/> CPF: ' . $animal['Personal_data']['cpf'] ?>
<!--                        </span>-->
<!---->
<!--                    </td><!-- /PET PROPRIETARIO -->   -->
<!---->
<!--                    <td> <!-- PET FOTOS -->-->
<!--                        <div class="btnWarp"> -->
<!--                        <a title="Fotos do pet --><?//= $animal['Animal_data']['pet_nome'] ?><!--" class="btn btn-xs btn-default tooltipBubble" data-toggle="modal"-->
<!--                           data-target="#foto_pet_id_--><?//= $animal['Animal_data']['id_animal'] ?><!--"><i class="glyphicon glyphicon-eye-open"></i>-->
<!--                        </a>        -->
<!--                        </div>    -->
<!--                        <!-- MODAL PET FOTOS --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->-->
<!---->
<!--                        <div id="foto_pet_id_--><?//= $animal['Animal_data']['id_animal'] ?><!--"  class="modal fade" tabindex="-1" role="dialog">-->
<!--                            <div class="modal-dialog modal-dialog-lg hidden-xs">-->
<!--                                <div class="modal-content text-center">-->
<!--                                    <div class="modal-header">-->
<!--                                        -->
<!--                                        <h1 class="modal-title">-->
<!--                                            --><?php
//
//                                            $from = $animal['Animal_data']['pet_sexo'] === 'macho' ? ' do ' : ' da ';
//
//                                            echo 'Fotos '.$from. $animal['Animal_data']['pet_nome'];
//                                            ?>
<!--                                        </h1>-->
<!---->
<!--                                    </div>-->
<!--                                    <div class="modal-body">-->
<!---->
<!--                                        <div id="file_box_gallery_box">-->
<!---->
<!--                                        <div id="file_box_gallery">-->
<!--                                            -->
<!--                                        --><?php
//
//                                        isset($animal['Fotos']) ? \template_Display_Fotos($animal['Fotos']) : \template_Display_No_Records_Found();
//
//                                        ?><!--  -->
<!---->
<!--                                        </div><!-- /file_box_gallery --> -->
<!--                                        </div><!-- /file_box_gallery_box --> -->
<!---->
<!--                                      <hr/>-->
<!--                                            <h4 class="text-muted">Clique nas fotos para ampliar</h4>-->
<!--                                      <hr/>-->
<!--                                        <div class="modal-footer text-center">-->
<!--                                            <button type="button" data-dismiss="modal" class="btn btn-danger pull-right"> Fechar </button>-->
<!--                                        </div>-->
<!---->
<!---->
<!---->
<!--                                    </div><!-- modal-body-->-->
<!---->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div> <!-- /MODAL PET FOTOS --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->                                -->
<!--                    </td><!-- /PET FOTOS -->            -->
<!---->
<!--                    <td><!-- DADOS PET --><?//= $animal['Animal_data']['pet_nome'] ?><!---->-->
<!---->
<!--                        <div class="btnWarp"> -->
<!--                        <a title=" Visualizar dados do cadastrados" class="btn btn-xs btn-default tooltipBubble" data-toggle="modal" -->
<!--                           data-target="#dados_--><?//=$animal['Animal_data']['id_animal'] ?><!--"><span class="glyphicon glyphicon-eye-open"></span></a> -->
<!--                        </div>  -->
<!---->
<!--                        <!-- MODAL DADOS PET -->-->
<!--                        <div class="modal fade" id="dados_--><?//= $animal['Animal_data']['id_animal'] ?><!--" tabindex="-1" role="dialog" >-->
<!--                            <div class="modal-dialog modal-dialog-lg hidden-xs">-->
<!--                                <div class="modal-content">-->
<!--                                    <div class="modal-header">-->
<!--                                        <h2 class="modal-title" id="modal">                                                    -->
<!--                                        --><?php
//                                        if ($animal['Animal_data']['pet_sexo'] == 'macho') {
//                                            $d = 'do';
//                                        } else {
//                                            $d = 'da';
//                                        }
//                                        echo 'Dados ' . $d . ' ' . $animal['Animal_data']['pet_nome'];
//                                        ?><!--</h2>-->
<!--                                    </div>-->
<!--                                    <div class="modal-body">-->
<!---->
<!--                                        <table class="table table-condensed table-bordered table-striped table-hover ">-->
<!--                                            <thead>-->
<!--                                                <tr>                                                                                -->
<!--                                                    <th class="pet_nome">Nome</th>-->
<!--                                                    <th class="pet_especie">Especie</th>-->
<!--                                                    <th class="pet_raca">Ra&#231;a</th>                                        -->
<!--                                                    <th class="pet_idade">Idade</th>-->
<!--                                                    <th class="pet_aniversario">Anivers&#225;rio</th>-->
<!--                                                    <th class="pet_sexo">Sexo</th>-->
<!--                                                    <th class="pet_cor_pelagem">Cor Pelagem</th>                                        -->
<!--                                                </tr>-->
<!--                                            </thead>-->
<!--                                            <tbody>-->
<!--                                                <tr>-->
<!--                                                    <td class="pet_td_content_font">--><?//= ucfirst($animal['Animal_data']['pet_nome']) ?><!--</td>-->
<!--                                                    <td class="pet_td_content_font">--><?//= ucfirst($animal['Animal_data']['especie']) ?><!--</td>-->
<!--                                                    <td class="pet_td_content_font">--><?//= ucfirst($animal['Animal_data']['raca']) ?><!--</td>    -->
<!--                                                    <td class="pet_td_content_font">--><?//= calculaIdade($animal['Animal_data']['pet_data_aniversario']) ?><!--</td>-->
<!--                                                    <td class="pet_td_content_font">--><?//= convert_date_ISO_into_NBR($animal['Animal_data']['pet_data_aniversario']) ?><!--</td>-->
<!--                                                    <td class="pet_td_content_font">--><?//= ucfirst($animal['Animal_data']['pet_sexo']) ?><!--</td>-->
<!--                                                    <td class="pet_td_content_font">--><?//= ucfirst($animal['Animal_data']['cor_pelagem']) ?><!--</td>               -->
<!--                                                </tr>-->
<!--                                            </tbody>    -->
<!---->
<!--                                        </table>-->
<!---->
<!--                                        <div class="modal-footer">-->
<!--                                            <button type="button" class="btn btn-danger" data-dismiss="modal"> Fechar </button>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div><!-- /MODAL DADOS PET -->-->
<!--                    </td><!-- /DADOS PET -->-->
<!---->
<!---->
<!--                    <td><!-- HISTORICO MEDICO PET --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->-->
<!--                        <div class="btnWarp">-->
<!--                        <a title="Hist&#243;rio M&#233;dico --><?//= $animal['Animal_data']['pet_nome'] ?><!--" class="btn btn-xs btn-default tooltipBubble" data-toggle="modal"-->
<!--                           data-target="#historico_medico_animal_id_--><?//= $animal['Animal_data']['id_animal'] ?><!--"><i class="glyphicon glyphicon-eye-open"></i></a>        -->
<!--                        </div>  -->
<!---->
<!--                        <!-- MODAL HISTORICO MEDICO PET --><?//= $animal['Animal_data']['pet_nome'] ?><!-- -->-->
<!---->
<!--                        <div id="historico_medico_animal_id_--><?//= $animal['Animal_data']['id_animal'] ?><!--"  class="modal fade" tabindex="-1" role="dialog">-->
<!--                            <div class="modal-dialog modal-dialog-historico-medico hidden-xs">-->
<!--                                <div class="modal-content text-center">-->
<!--                                    <div class="modal-header">-->
<!--                                        <h1 class="modal-title">Hist&#243;rio M&#233;dico  --><?//= $animal['Animal_data']['pet_nome'] ?><!--</h1>-->
<!--                                    </div>-->
<!--                                    <div class="modal-body" >-->
<!--                                        <div class="table-responsive historico-medico-conteudo"> -->
<!---->
<!---->
<!--                                                <div class="alert alert-warning span-bold-size20 pdng-30">Nenhum registro encontrado</div><br>        -->
<!---->
<!---->
<!---->
<!--                                        </div>-->
<!--                                        <div class="modal-footer">-->
<!--                                            <button type="button" data-dismiss="modal" class="btn btn-danger pull-right"> Fechar </button>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div> <!-- /Modal Excluir PET '.$animal['Animal_data']['pet_nome'].' -->-->
<!---->
<!--                    </td><!-- /HISTORICO MEDICO PETS -->-->
<!---->
<!--                </tr>-->
<!---->
<!---->
<!--                --><?php //endforeach; ?>
<!--            </tbody>-->
<!--        </table>-->
<!---->
<!--        <!-- Paginação -->    -->
<!---->
<!--        <div  id="box_paginacao" class="text-center">   -->
<!--            --><?//= isset($paginacao) ? $paginacao : '' ?>
<!--        </div>-->
<!---->
<!--        <!-- /Paginação -->-->
<!---->
<!--    </div><!-- /panel-body-->-->
<!---->
<!--</div><!-- /panel panel-default-->-->
<!---->
<!---->
<!--<script async>-->
<!--    -->
<!--    var total_animais = parseInt('--><?//=$total_animais?>//');
//
//    if (total_animais > 0){
//
//        document.getElementById("contador_animais").classList.add("hide");
//
//    }else{
//
//        document.getElementById("contador_animais").classList.remove("hide");
//
//    }
//
//</script>
//
//<!-- /LISTAGEM DE ANIMAL VIEW -->
