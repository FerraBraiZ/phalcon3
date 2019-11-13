<?php

defined('BASE_PATH') || define('BASE_PATH', dirname(__DIR__));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');

// Delegate static file requests back to the PHP built-in webserver
if (PHP_SAPI === 'cli-server' && $_SERVER['SCRIPT_FILENAME'] !== __FILE__) {
    return false;
}

if ( !file_exists( BASE_PATH.'/config/bootstrap.php') ){
    throw new Error('Failed to load application\'s bootstrap file');
}

require_once BASE_PATH.'/config/bootstrap.php';