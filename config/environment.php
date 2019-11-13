<?php
use Dotenv\Dotenv;

try {

    /**
     * Handle environment variables
     */
    $env = (new Dotenv('../', '.env'))->load();

    switch ( $environment = getenv('APPLICATION_ENV') ) {
        case 'development';
        case 'staging';

            ini_set('ignore_repeated_errors', 'On');
            ini_set('html_errors', 'On');
            ini_set('display_errors', 'On');
            error_reporting(E_ALL);
            break;

        default:
            echo 'production';
            break;

    }

} catch (\Throwable $t) {
    echo $t->getMessage() . '<br>';
    echo '<pre>' . $t->getTraceAsString() . '</pre>';
}

