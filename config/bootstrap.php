<?php
declare(strict_types=1);

use \Phalcon\Di\FactoryDefault;
use \Phalcon\Mvc\Application;


try {

    if ( !file_exists(BASE_PATH . '/vendor/autoload.php') ){
          throw new Error('Failed to load composer\'s vendor autoload');
    }

    require_once BASE_PATH . '/vendor/autoload.php';

    /**
     * Include Environment
     */
    include_once BASE_PATH . '/config/environment.php';


    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();

    /**
     * Handle routes
     */
    include_once BASE_PATH . '/config/router.php';

    /**
     * Read services
     */
    include_once BASE_PATH . '/config/services.php';

    /**
     * Get config service for use in inline setup below
     */
    $config = $di->getConfig();

    /**
     * Include Autoloader
     */
    include_once BASE_PATH . '/config/loader.php';

    /**
     * Handle the request
     */
    $application = new Application($di);

     echo $application->handle()->getContent();

} catch (\Throwable $t) {
    echo $t->getMessage() . '<br>';
    echo '<pre>' . $t->getTraceAsString() . '</pre>';
}

