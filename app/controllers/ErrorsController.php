<?php

class ErrorsController extends ControllerBase
{

    public function error404Action()
    {
        $this->view->pick('errors/error404');
    }

    public function error500Action()
    {
        $this->view->pick('errors/error500');
    }


}