<?php
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
        'Phalcon3\Models'         => $config->application->modelsDir,
        'Phalcon3\Controllers'    => $config->application->controllersDir,
        'Phalcon3\Forms'          => $config->application->formsDir,
        'Phalcon3\Forms\Elements' => $config->application->formsElementsDir
    ]
);

/**
 * Register Files, Composer autoloader
$loader->registerFiles(
    [
        APP_PATH . '/vendor/autoload.php'
    ]
);
 */

$loader->register();
