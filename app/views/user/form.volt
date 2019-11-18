<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!-- VIEW INSERIR CLIENTE -->

<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">Cadastrar Novo Cliente <?=PGT;?></h3>
    </div>

    <div class="panel-body">
        
        <form id="clientefrm" class="form-horizontal"  method="post" action="<?= base_url('/salvar/cliente/')?>">

            <div class="row">

                <div class="col-lg-9">
                    
                    <div class="input-group input-group-fullwidth">    
                        <span class="input-group-addon">Nome</span>		
                        <input title="Informe o nome completo ( apenas letras )" type="text" maxlength="70"  
                               class="form-control mask_only_letters_ws tooltipBubble" id="nome" name="Nome" 
                               placeholder="Nome Completo" autofocus>		      
                    </div>
                                        
                    <div class="input-group input-group-fullwidth">
                        <span class="input-group-addon">Sexo</span>
                        <select title="Selecione um g&#234;nero sexual" class="form-control tooltipBubble" name="Sexo" id="sexo" 
                                maxlength="50">                       
                            <option value="">Selecione</option>
                            <option value="Feminino">Feminino</option>
                            <option value="Masculino">Masculino</option>
                        </select>
                    </div>

                    <div class="input-group input-group-fullwidth">
                        <span class="input-group-addon">CPF</span>		 
                        <input title="Informe um CPF válido ( apenas numeros )" type="text"  maxlength="15" 
                               class="form-control mask_cpf tooltipBubble" id="cpf" name="CPF"  
                               placeholder="CPF">
                    </div>

                    <input type="hidden" name="data_cadastro" value="data_cadastro"/>
                    
                    <div class="input-group input-group-fullwidth">		  	
                        <span class="input-group-addon data_aniversario">Data de Nascimento</span>		 
                        <input title="informe a data de nascimento" type="text" maxlength="10" 
                               class="form-control datepicker tooltipBubble" id="data_aniversario" name="Data de Nascimento" 
                               placeholder="28/12/1958">		  	
                    </div>
                    
                    <hr class="hidden-lg"/>

                    <h3 class="hidden-lg text-center">Observa&#231;&#245;es(Opcional)</h3>

                    <div class="input-group input-group-fullwidth">		  
                        <textarea title="Observa&#231;&#245;es diversas ( opcional )" id="observacao" name="Observa&#231;&#227;o" 
                                  class="form-control mask_letters_numbers_ws tooltipBubble" maxlength="600"
                                  placeholder="Observa&#231;&#245;es(Opcional)"></textarea>
                    </div>

                    <hr class="hidden-lg"/>
                    </div><!--/col-lg-8-->


                    <div class="col-lg-3 text-center">
                        <h3 class="hidden-lg">Adicionar foto</h3>
                        <div id="file_box" class="text-center">
                            
                            <?php \template_blank_profile_pic()?>

                        </div><!--/file_box-->
                        <br/>    

                    </div><!--/col-lg-3-->

            </div>

            <hr/>


            <div class="row" >                    

                <div class="col-md-6">
                    <br/>
                    <div class="input-group input-group-fullwidth text-center">
                        
                        <a id="adicionar_telefone" data-fk_id_type="cliente" class="btn btn-success">Adicionar Telefone</a>

                        <table  id="telefones_cadastrados"  class="table table-bordered table-striped table-hover">
                            <tr id="contador_telefones" class="alert alert-link resizable_text">
                                <td  colspan="3" class="FoneEmailConteiner">Nenhum Telefone cadastrado.</td>
                            </tr>    
                        </table>
                    </div>
                </div>

                <div class="col-md-6">
                    <br/>
                    <div class="input-group input-group-fullwidth text-center">
                        
                        <a id="adicionar_email" data-fk_id_type="cliente" class="btn btn-success">Adicionar Email</a>

                        <table  id="emails_cadastrados"  class="table table-bordered table-striped table-hover">
                            <tr id="contador_emails" class="alert alert-link resizable_text">
                                <td colspan="2" class="FoneEmailConteiner">Nenhum email cadastrado.</td>
                            </tr> 
                        </table>
                    </div>
                </div>
            </div>
            
            <br/>
            
            <hr/>

            <!-- ENDERECO -->
            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">CEP</span>
                <input title="Informe o CEP ( apenas numeros )" type="text"  maxlength="10" 
                       class="form-control mask_cep tooltipBubble" name="CEP" id="cep"  
                       placeholder="CEP" >

                <span class="input-group-btn">
                    <a  id="busca_cep" class="btn btn-success">Procurar CEP Online</a>
                </span>

            </div>

            <div class="input-group input-group-fullwidth">

                <input type="hidden" name="cliente_id" value="@">
                
                <span class="input-group-addon">Endere&#231;o</span>
                <input title="Informe o nome completo da rua, avenida, estrada ( apenas letras )" type="text" maxlength="150" 
                       class="form-control tooltipBubble mask_letters_numbers_ws" id="logradouro" name="Endere&#231;o"                       
                       placeholder="logradouro, nome da rua, avenida, estrada etc...">

            </div>

            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">Numero</span>
                <input title="Informe o numero do im&#243;vel ( apenas numeros )" type="text" maxlength="10" 
                       class="form-control tooltipBubble mask_only_numbers" id="numero" name="Numero" 
                       placeholder="Numero">

            </div>

            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">Complemento</span>
                <input title="Informe, se existir, um complemento, bloco, andar ou ponto de refer&#234;ncia" 
                       type="text" maxlength="255" class="form-control tooltipBubble mask_letters_numbers_ws" id="complemento" name="Complemento" 
                       placeholder="Complemento, Bloco, Andar, Ponto de refer&#234;ncia etc...">

            </div>

            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">Bairro</span>
                <input title="Informe o bairro ( apenas letras )" type="text" maxlength="150" 
                       class="form-control tooltipBubble mask_letters_numbers_ws" id="bairro" name="Bairro" 
                       placeholder="Bairro">

            </div>

            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">Cidade</span>
                <input title="Informe a Cidade" type="text" maxlength="150" class="form-control tooltipBubble mask_letters_numbers_ws" 
                       placeholder="Cidade" id="localidade" name="Cidade">  

            </div>

            <div class="input-group input-group-fullwidth">

                <span class="input-group-addon">Estado</span>
                <select title="Selecione um estado" class="form-control tooltipBubble" id="uf" name="UF">                       
                    <option value="">Selecione</option>
                    <option value="Acre - AC">Acre - AC</option>
                    <option value="Alagoas - AL">Alagoas - AL</option>
                    <option value="Amazonas - AM">Amazonas - AM</option>
                    <option value="Amap&#225; - AP">Amap&#225; - AP</option>
                    <option value="Bahia - BA">Bahia - BA</option>
                    <option value="Cear&#225; - CE">Cear&#225; - CE</option>
                    <option value="Distrito Federal - DF">Distrito Federal - DF</option>
                    <option value="Esp&#237;rito Santo - ES">Esp&#237;rito Santo - ES</option>
                    <option value="Goi&#225;s - GO">Goi&#225;s - GO</option>
                    <option value="Maranh&#227;o - MA">Maranh&#227;o - MA</option>
                    <option value="Minas Gerais - MG">Minas Gerais - MG</option>
                    <option value="Mato Grosso do Sul - MS">Mato Grosso do Sul - MS</option>
                    <option value="Mato Grosso - MT">Mato Grosso - MT</option>
                    <option value="Par&#225; - PA">Par&#225; - PA</option>
                    <option value="Para&#237;ba - PB">Para&#237;ba - PB</option>
                    <option value="Pernambuco - PE">Pernambuco - PE</option>
                    <option value="Piau&#237; - PI">Piau&#237; - PI</option>
                    <option value="Paran&#225; - PR">Paran&#225; - PR</option>
                    <option value="Rio de Janeiro - RJ">Rio de Janeiro - RJ</option>
                    <option value="Rio Grande do Norte - RN">Rio Grande do Norte - RN</option>
                    <option value="Rio Grande do Sul - RR">Rio Grande do Sul - RS</option>
                    <option value="Roraima - RS">Roraima - RR</option>
                    <option value="Rond&#244;nia - RO">Rond&#244;nia - RO</option>
                    <option value="Santa Catarina - SC">Santa Catarina - SC</option>
                    <option value="Sergipe - SE">Sergipe - SE</option>
                    <option value="S&#227;o Paulo - SP">S&#227;o Paulo - SP</option>
                    <option value="Tocantins - TO">Tocantins - TO</option>
                </select>

            </div>
            <!-- //ENDERECO -->
            <hr/>

            <div class="input-group input-group-fullwidth">

                <a id="btn_lista_cliente" href="<?=base_url('listar/cliente/')?>" class="btn btn-default pull-left"> Listar Clientes </a>
                
                <button type="submit" class="btn btn-success pull-right"> Gravar Dados </button>                

            </div>


            <i class="clearfix"/>

            <div id="file_input_container"></div>


        </form> 
        <!-- /clientefrm -->



    </div> <!-- /panel-body  -->

</div> <!-- /panel panel-default  -->


<!-- modal_file_upload  -->
<?php \template_modal_file_upload(1,'form_upload_img') ?>
<!-- /modal_file_upload  -->

<!-- /VIEW INSERIR CLIENTE -->

<script async>
    var total_emails = 0;
    var total_telefones = 0;
 
    if (total_emails > 0){
        document.getElementById("contador_emails").classList.add("hide");
    }
    if (total_emails < 0){    
        document.getElementById("contador_emails").classList.remove("hide");
    }

    if (total_telefones > 0) {
         document.getElementById("contador_telefones").classList.add("hide");
    }
    if (total_telefones < 0) {
         document.getElementById("contador_telefones").classList.remove("hide");            
    } 
    /*
    console.log("total_telefones: "+total_telefones, typeof total_telefones);
    console.log("total_emails: "+total_emails, typeof total_emails);
    */
</script>