<?php

class DashboardController extends ControllerBase
{

    public function indexAction()
    {
        die('Dashboard');
    }

    public function route404Action()
    {
        echo '404';
    }

}
