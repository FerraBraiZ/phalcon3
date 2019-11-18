<?php

class LoginController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('login/index');
    }

    public function doLogIn()
    {

    }

}