<?php

date_default_timezone_set('America/Sao_Paulo');
setlocale(LC_ALL, 'ptb', 'portuguese-brazil', 'pt-br', 'bra', 'brazil');

return new \Phalcon\Config([
    'database' => [
        'adapter' => 'Mysql',
        'host' => 'mysql',
        'username' => 'root',
        'password' => '753159',
        'dbname' => 'phalcon3',
        'charset' => 'utf8',
    ],
    'application' => [
        'appDir' => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/controllers/',
        'modelsDir' => APP_PATH . '/models/',
        'migrationsDir' => APP_PATH . '/migrations/',
        'viewsDir' => APP_PATH . '/views/',
        'pluginsDir' => APP_PATH . '/plugins/',
        'libraryDir' => APP_PATH . '/library/',
        'cacheDir' => BASE_PATH . '/data/cache/',
        'validatorsDir' => APP_PATH . '/validators/',
        'vendorDir' => BASE_PATH . '/vendor/',
        'domainUri' => 'http://phalcon3',
        'baseUri' => preg_replace('/public([\/\\\\])index.php$/', '', $_SERVER["PHP_SELF"]),
    ],
    'settings' => [
        'development' => true,
    ]
]);
