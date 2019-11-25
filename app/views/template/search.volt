
{% extends "templates/base.volt" %}

{% block search %}
<div id="div_busca_cliente" class="input-group">
    <span class="input-group-addon">Buscar Propriet&#225;rio</span>
    <input type="text" title="Informe NOME,CPF ou TELEFONE do cliente" class="autocomplete_cliente form-control tooltipBubble"
           name="search"  id="search" placeholder="por NOME, por TELEFONE ou por CPF" maxlength="255">
    <span class="input-group-addon">
            <i class="glyphicon  glyphicon-search"></i>
    </span>
</div>

{% endblock %}