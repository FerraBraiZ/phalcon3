<?php


class NotFoundController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('notfound/index');
    }

}