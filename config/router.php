<?php

use Phalcon\Mvc\Router;

try {

    $router = new Router(false);

    /*

    $router->setDefaultModule('backend');
    $router->setDefaultNamespace('Backend\Controllers');
    $router->setDefaultController('index');
    $router->setDefaultAction('index');

    $router->setDefaults(
        [
            'controller' => 'index',
            'action'     => 'index',
        ]
    );


    $router->notFound(
        [
            'controller' => 'index',
            'action'     => 'index',
        ]
    );

    */

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
        '/customer/edit/{id}',
        [
            'controller' => 'customer',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/customer/update/{id}',
        [
            'controller' => 'customer',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/customer/delete/{id}',
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
        '/user/edit/{id}',
        [
            'controller' => 'user',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/user/update/{id}',
        [
            'controller' => 'user',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/user/delete/{id}',
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
        '/attendance/edit/{id}',
        [
            'controller' => 'attendance',
            'action'     => 'edit',
        ]
    );

    $router->add(
        '/attendance/update/{id}',
        [
            'controller' => 'attendance',
            'action'     => 'update',
        ]
    );

    $router->add(
        '/attendance/delete/{id}',
        [
            'controller' => 'attendance',
            'action'     => 'delete',
        ]
    );


    $router->handle();

} catch (\Throwable $e) {
    echo $e->getMessage();
}