{% extends "templates/base.volt" %}

{% block head %}
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if IE]><link rel="shortcut icon" href="<?=base_url('/public/img/favicon.ico')?>"><![endif]-->

    <link rel="icon" href="<?=base_url('/public/img/favicon.ico')?>">
    <link rel="stylesheet" href="<?=base_url('/public/css/third_party.css')?>"/>
    <link rel="stylesheet" href="<?=base_url('/public/css/css.css')?>"/>


    <title><?=APPNAME;?></title>
</head>

{% endblock %}