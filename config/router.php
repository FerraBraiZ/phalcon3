<?php

use Phalcon\Mvc\Router;

try {

    $router = new Router(false);
//    $router->setDefaultController('index');
//    $router->setDefaultAction('index');

    $router->add(
        '/',
        [
            'controller' => 'index',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/dashboard',
        [
            'controller' => 'index',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/login',
        [
            'controller' => 'login',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/social-login',
        [
            'controller' => 'sociallogin',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/oauth-callback',
        [
            'controller' => 'oauthcallback',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/customer',
        [
            'controller' => 'customer',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/customer/create',
        [
            'controller' => 'customer',
            'action'     => 'create',
        ]
    );

    $router->add(
        '/customer/edit',
        [
            'controller' => 'customer',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/customer/update',
        [
            'controller' => 'customer',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/customer/delete',
        [
            'controller' => 'customer',
            'action'     => 'delete',
        ]
    );

    $router->add(
        '/user',
        [
            'controller' => 'user',
            'action'     => 'index',
        ]
    );


    $router->add(
        '/user/create',
        [
            'controller' => 'user',
            'action'     => 'create',
        ]
    );

    $router->add(
        '/user/edit',
        [
            'controller' => 'user',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/user/update',
        [
            'controller' => 'user',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/user/delete',
        [
            'controller' => 'user',
            'action'     => 'delete',
        ]
    );

    $router->add(
        '/attendance',
        [
            'controller' => 'attendance',
            'action'     => 'index',
        ]
    );

    $router->add(
        '/attendance/create',
        [
            'controller' => 'attendance',
            'action'     => 'create',
        ]
    );

    $router->add(
        '/attendance/edit',
        [
            'controller' => 'attendance',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/attendance/update',
        [
            'controller' => 'attendance',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/attendance/delete',
        [
            'controller' => 'attendance',
            'action'     => 'delete',
        ]
    );


    $router->handle();

} catch (\Throwable $e) {
    echo $e->getMessage();
}