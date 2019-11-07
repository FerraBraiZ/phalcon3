<?php

$router = new \Phalcon\Mvc\Router();

$router->setUriSource(\Phalcon\Mvc\Router::URI_SOURCE_SERVER_REQUEST_URI);

$router->add(
    '/',
    [
        'controller' => 'Index',
        'action'     => 'index',
    ]
);

$router->add(
    '/test',
    [
        'controller' => 'Test',
        'action'     => 'index',
    ]
);

$router->handle();
