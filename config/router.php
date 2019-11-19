<?php

try {

    $router = new \Phalcon\Mvc\Router();

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
        '/social-login-oauth-callback',
        [
            'controller' => 'sociallogin',
            'action'     => 'oauthCallback',
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

    $router->handle();

} catch (\Throwable $e) {

    echo $e->getMessage();
}


