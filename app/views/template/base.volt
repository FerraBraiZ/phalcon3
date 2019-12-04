{# template/base.volt #}
<!doctype html>
<html lang="pt-br">
<head>
    {{ get_title() }}
    {% block head %}
    {% endblock %}
</head>
<body>

    {{ flash.output()}}

    {% block messages %}
    {% endblock %}

    {% block content %}
    {% endblock %}

    {% block footer %}
    {% endblock %}

</body>
</html>