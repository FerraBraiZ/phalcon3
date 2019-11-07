<?php

date_default_timezone_set('America/Sao_Paulo');
setlocale(LC_ALL, 'ptb', 'portuguese-brazil', 'pt-br', 'bra', 'brazil');

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs(
    [
        $config->application->controllersDir,
        $config->application->modelsDir
    ]
);
/**
 * Register custom namespaces for the Phalcon autoloader
 */
$loader->registerNamespaces(
    [
        'PhalconTime\Models'         => $config->application->modelsDir,
        'PhalconTime\Controllers'    => $config->application->controllersDir,
        'PhalconTime\Forms'          => $config->application->formsDir,
        'PhalconTime\Forms\Elements' => $config->application->formsElementsDir
    ]
);

/**
 * Register Files, Composer autoloader
 */
$loader->registerFiles(
    [
        APP_PATH . '/vendor/autoload.php'
    ]
);

$loader->register();
