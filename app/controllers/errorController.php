<?php


class errorController extends ControllerBase
{

    public function error404Action()
    {
        die('error404Action');
        $this->view->pick('notfound/index');
    }

}