<?php

use Aws\Exception\AwsException;
use Aws\S3\PostObjectV4;
use Aws\S3\S3Client;
use Phalcon\Events\Event;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Flash\Direct as Flash;
use Phalcon\Mvc\Dispatcher as MvcDispatcher;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Mvc\View\Engine\Php as PhpEngine;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Session\Adapter\Files as SessionAdapter;


/**
 * Shared configuration service
 */
$di->setShared('config', function () {
    return include BASE_PATH . "/config/config.php";
});

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->setShared('url', function () {
    $config = $this->getConfig();
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);
    return $url;
});

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->setShared('db', function () {
    $config = $this->getConfig();
    $class = 'Phalcon\Db\Adapter\Pdo\\' . $config->database->adapter;
    $params = new $class([
        'host'     => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname'   => $config->database->dbname,
        'charset'  => $config->database->charset
    ]);

    if ($config->database->adapter == 'Postgresql') {
        unset($params['charset']);
    }
    return new $class($params);
});

/**
 * Setting up the view component
 */
$di->setShared('view', function () {
    $config = $this->getConfig();
    $view = new Phalcon\Mvc\View();
    $view->setDI($this);
    $view->setViewsDir($config->application->viewsDir);
    $view->setPartialsDir("partials/");

    $view->registerEngines([
        '.volt' => function ($view) {
            $config = $this->getConfig();
            $volt = new VoltEngine($view, $this);
            if($config->settings->development === false) {
                $volt->setOptions([
                    'compiledPath' => $config->application->cacheDir,
                    'compiledSeparator' => '_',
                    'compileAlways' => false
                ]);
            }

            if($config->settings->development === true) {
                array_map('unlink', glob($config->application->cacheDir . '*.php'));
                $volt->setOptions([
                    'compiledSeparator' => '_',
                    'compileAlways' => true
                ]);
            }

            $volt->setOptions([
                'compiledPath' => $config->application->cacheDir,
                'compiledSeparator' => '_'
            ]);

            // Custom volt functions
            $compiler = $volt->getCompiler();
            $compiler->addFunction('split', 'explode');
            $compiler->addFunction('round', 'round');

            return $volt;
        },
        '.phtml' => PhpEngine::class
        ]

    );

    return $view;
});

/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->setShared('modelsMetadata', function () {
    return new MetaDataAdapter();
});

/**
 * Start the session the first time some component request the session service
 */
$di->setShared('session', function() {
    $session = new SessionAdapter();
    $session->start();
    return $session;
});

$di->setShared('s3Client',function(){
    return new S3Client([
        'version' => 'latest',
        'region' => 'sa-east-1',
        /*
         'profile' => 'default', it'd read credentials from $PATH or /home/${USER}/.aws/credentials
        */
        'credentials' => [
            'key'    => getenv('AWS_KEY'),
            'secret' => getenv('AWS_SECRET')
        ],
    ]);
});

$di->setShared('postAwsPreSignedForm', function( $filename,$bucketName ){

    try {

        $client = $this->get('s3Client');

        // Set some defaults for form input fields
        $formInputs = ['acl' => 'private'];

        // Construct an array of conditions for policy
        $options = [
            ["acl" => "private"],
            ["bucket" => AWS_BUCKET],
            ["content-type" => ""],
            ["key" => "${filename}"],
            ["success_action_status" => "201"]
        ];

        // Optional: configure expiration time string
        $expires = '+1 hours';

        $postObject = new PostObjectV4(
            $client,
            AWS_BUCKET,
            $formInputs,
            $options,
            $expires
        );

        // Get attributes to set on an HTML form, e.g., action, method, enctype
        $formAttributes = $postObject->getFormAttributes();

        // Get form input fields. This will include anything set as a form input in
        // the constructor, the provided JSON policy, your AWS access key ID, and an
        // auth signature.
        $formInputs = $postObject->getFormInputs();

        return (object)[
                "contentType" => [
                    "content-type" => ""
                ],
                "acl" => [
                    "acl" => "private"
                ],
                "successActionStatus" => [
                    "success_action_status" => "201"
                ],
                "policy" => [
                    "policy" => $formInputs["Policy"]
                ],
                "credential" => [
                    "X-amz-credential" => $formInputs["X-Amz-Credential"]]
                ,
                "algorithm" => [
                    "x-amz-algorithm" => $formInputs["X-Amz-Algorithm"]
                ],
                "date" => [
                    "x-amz-date" => $formInputs["X-Amz-Date"]
                ],
                "signature" => [
                    "x-amz-signature" => $formInputs["X-Amz-Signature"]
                ],
                "key" => [
                    "key" => "${filename}"
                ],
                "postEndpoint" => [
                    "postEndpoint" => $bucketName
                ]
            ];

    }
    catch(AwsException $e) {
        return $e->getMessage();
    }
    catch (\Throwable $e) {
        return  $e->getMessage();
    }

});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->set('flash', function () {
    return new Flash([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);
});

$di->setShared('dispatcher',function () {
        // Create an EventsManager
        $eventsManager = new EventsManager();

        // Attach a listener
        $eventsManager->attach('dispatch:beforeException',

            function (Event $event, $dispatcher, Exception $exception) {
                // Handle 404 exceptions
//                if ($exception instanceof DispatchException) {
//
//                    echo "SHITTTTTTTTTTTTTTTTT";
//
//                    $dispatcher->forward(
//                        [
//                            'controller' => 'errors',
//                            'action'     => 'error404',
//                        ]
//                    );
//                    echo "SHITTTTTTTTTTTTTTTTT222222222222222222";
//
//                    return false;
//                }

//                // Alternative way, controller or action doesn't exist
//                switch ($exception->getCode()) {
//                    case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
//                    case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
//                        $dispatcher->forward(
//                            [
//                                'controller' => 'errors',
//                                'action'     => 'error500',
//                            ]
//                        );
//
//                        return false;
//                }
                        return false;

            }
        );

        $dispatcher = new MvcDispatcher();

        // Bind the EventsManager to the dispatcher
        $dispatcher->setEventsManager($eventsManager);

        return $dispatcher;
    }
);