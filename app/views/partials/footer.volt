
{% extends "templates/base.volt" %}

{% block footer %}
<div   id="footer" class="navbar navbar-default" >
    <div class="row">
        <div class="col-md-3"><a href="https://www.facebook.com/pages/Veterin&#225;ria-Parque-Da-Fonte/281760491905203" target="_blank">Veterin&#225;ria Parque da Fonte</a></div>
        <div class="col-md-6"><a href="https://www.google.com.br/maps/@-25.505045,-49.181417,3a,75y,343.41h,85.86t/data=!3m4!1e1!3m2!1st9k0ti4302ApCRYduOjM8Q!2e0!6m1!1e1" target="_blank">
        Rua Almirante Alexandrino, 1203, Afonso Pena, S&#227;o Jos&#233; dos Pinhais, PR </a></div>   
        <div class="col-md-3"><a href="">(41) 3081-2554 / 3385-6503</a></div>
    </div>
</div>

</div>

<!-- /.container -->

    <script type="text/javascript">
        var base_url = "<?=base_url()?>";
        var site_url = "<?=site_url()?>";
        var emitir_receita = "<?=site_url('/receita/')?>";
        var img_path = "<?=base_url('/uploads').'/'?>";
        var lst_clientes = "<?=site_url('cliente/listar')?>";
        var frm_cliente = "<?=site_url('cliente/novo')?>";            
        var mes_atual = "<?=MES_ATUAL?>"; 
        var ano_atual = "<?=ANO_ATUAL?>";
        var animal_especie_autocomplete = "<?=base_url('animal/autocomplete/especie')?>";
        var animal_raca_autocomplete = "<?=base_url('animal/autocomplete/raca')?>";
        var cliente_autocomplete = "<?=base_url('cliente/autocomplete/cliente')?>";
        var consulta_autocomplete = "<?=base_url('cliente/autocomplete/consulta')?>";        
        var banho_autocomplete = "<?=base_url('cliente/autocomplete/banho')?>";
        var visualizado = "<?=site_url('recado/visualizado')?>";            
        var total_exames = parseInt('<?=isset($total_exames)?$total_exames:'0'?>');
        var total_vacinas = parseInt('<?=isset($total_vacinas)?$total_vacinas:'0'?>');
        var total_banhos = parseInt('<?=isset($total_banhos)?$total_banhos:'0'?>');
        var total_uploaded_files = parseInt('0');           
        var file_count = parseInt('<?=isset($total_fotos)?$total_fotos:'0'?>');           
    </script> 
    
    <script src="<?=base_url('/public/js/script.js')?>"></script>
    <script src="<?=base_url('/public/js/result.js')?>"></script>
    <script src="<?=base_url('/public/js/event.js')?>"></script>
    <script src="<?=base_url('/public/js/template.js')?>"></script>
    <script src="<?=base_url('/public/js/util.js')?>"></script>
    <script src="<?=base_url('/public/js/principal.js')?>"></script>

    <script  type="text/javascript">
        $(function(){ 
            var principal = new Principal();

            $('.datepicker').datepicker({
                format: "dd/mm/yyyy",
                language: "pt-BR",
                autoclose: true,
                orientation: "left top",
                todayHighlight: true
            }).on('changeDate', function(e) {
                //console.log("e: "+e,typeof e);
                var idade = $("#idade").length;
                if(idade){                    
                    var data_aniversario = $("#data_aniversario").val();
                    //console.log("data_aniversario_NBR: "+data_aniversario);
                    var date_ISO = Util.convert_date_NBR_into_ISO(data_aniversario);
                    //console.log("data_aniversario_ISO: "+date_ISO);
                    
                    var age = Util.calculate_age(date_ISO);
                    //console.log("Idade: "+age);                  
                    Util.show_in_browser(age,"idade");
                }
            });

            $('.mask_cep').mask('00000-000');
            $('.mask_phone_with_ddd').mask('(00) 0000-0000');
            $('.mask_cpf').mask('000.000.000-00', {reverse: true});
            $('.mask_data').mask('00/00/0000');

            $('.mask_only_numbers').mask('0',{
                'translation': {0:{pattern: /[0-9]/, recursive: true}}
            });                
            $('.mask_only_letters_ws').mask('S',{
                'translation': {S:{pattern: /[A-Za-z ]/, recursive: true}, maxlength: false}                    
            });
            $('.mask_letters_numbers_ws').mask('A',{
                'translation': {A:{pattern: /[A-Za-z0-9 ]/, recursive: true}}                    
            });

            $('.tooltipBubble').tooltip({
                track: true
            });

            $(".recado_visualizado").bootstrapToggle({
                on:'Sim',
                off:'N&#227;o',
                size:'mini',
                onstyle:'success',
                offstyle:'danger'
            });

            $('.hora').timepicker({
                minuteStep: 5,
                template: 'dropdown',
                showSeconds: false,
                showMeridian: false,
                defaultTime: false
            });

        });
        
    </script>


{% endblock %}