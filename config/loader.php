<?php
use \Phalcon\Loader;

try {

    $loader = new Loader();

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

        ]
    );

    /**
     * Register Files, Composer autoloader
     */
//    $loader->registerFiles(
//        [
//            BASE_PATH . '/vendor/autoload.php'
////              'vendorDir'         => BASE_PATH . '/vendor/',
//        ]
//    );

    $loader->register();


} catch (\Throwable $e) {
    echo $e->getMessage();
}


