<?php
use Phalcon\Di\FactoryDefault;

date_default_timezone_set('America/Sao_Paulo');

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');

if (file_exists(BASE_PATH . '/vendor/autoload.php') ){
    require_once BASE_PATH . '/vendor/autoload.php';
}

try {

    /**
     * Handle environment variables
     */
    (new Dotenv\Dotenv('../', '.env'))->load();


    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();

    /**
     * Handle routes
     */
    include APP_PATH . '/config/router.php';

    /**
     * Read services
     */
    include APP_PATH . '/config/services.php';

    /**
     * Get config service for use in inline setup below
     */
    $config = $di->getConfig();

    /**
     * Include Autoloader
     */
    include APP_PATH . '/config/loader.php';

    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);

    if( getenv('APPLICATION_ENV') ==='development'){
        #echo 'development';
        ini_set('ignore_repeated_errors', 'On');
        ini_set('html_errors', 'On');
        ini_set('display_errors', 'On');
        error_reporting(E_ALL);

        $connection = new \Phalcon\Db\Adapter\Pdo\Mysql((array)($config->database));

        $sql = 'SELECT * FROM phalcon3.user ORDER BY username';

        // Send a SQL statement to the database system
        $result = $connection->query($sql);

        // Print each robot name
        while ($robot = $result->fetch()) {
            echo $robot['name'];
        }

        // Get all rows in an array
        $users = $connection->fetchAll($sql);
        echo '<pre>';
        foreach ($users as $user) {
            print_r( $user );
        }

        // Get only the first row
        $user = $connection->fetchOne($sql);

        print_r($user);
        die;
    }

    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
