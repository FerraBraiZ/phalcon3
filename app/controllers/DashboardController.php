<?php

class DashboardController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('dashboard/index');
    }

}
