{% extends "templates/base.volt" %}

{% block menu %}
    <div class="masthead hidden-xs hidden-print">
        <h1 title="" class="resizableH1"><?=APPNAME;?> </h1>
    </div>
    <nav class="navbar navbar-default">
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
                                    href="<?= base_url('/customer/create'); ?>">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Novo Cliente
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a  title="Cadastrar novo Animal no sistema" class="tooltipBubble"
                                    href="<?= base_url('/user/create'); ?>">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Novo Usuario
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a  title="Cadastrar nova consulta no sistema"  class="tooltipBubble"
                                    href="<?= base_url('/attendance/create'); ?>">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Nova Consulta
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a title="Gerar uma novs receita" class="tooltipBubble"
                                   href="<?= base_url('/receita/create'); ?>" target="_blank">
                                    <i class="glyphicon glyphicon-arrow-right"></i>&nbsp;&nbsp;
                                    Nova Receita
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;Buscar<span class="caret"></span></a>
                        <ul class="dropdown-menu menu-custom" role="menu">

                            <li><a title="Procurar um cliente no sistema" class="tooltipBubble"
                                   href="<?= base_url('/customer/'); ?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Cliente
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li><a title="Procurar um Animal no sistema" class="tooltipBubble"
                                   href="<?= base_url('/user/'); ?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Usuário
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li class="disabled">
                                <a title="Procurar uma consulta no sistema" class="tooltipBubble text-muted" onclick="window.event.preventDefault();"
                                   href="<?= base_url('/attendance/'); ?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Consulta
                                </a>
                            </li>

                            <li class="divider"></li>

                            <li><a  title="Exibe uma lista de clientes anivers&#225;riantes, ordenada por m&#234;s" class="tooltipBubble"
                                    href="<?=base_url('/customer/birthdays/');?>">
                                    <i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;
                                    Anivers&#225;rios - Clientes
                                </a>
                            </li>

                        </ul>
                    </li>

                </ul>

                <?php $user_id = $this->session->userdata('user_id')?>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a  href='<?=base_url("/user/edit/{$user_id}");?>'><?=isset($user_id)? $user_id :'Convidado'?></a></li>
                </ul>

            </div>
        </div>
    </nav>
{% endblock %}