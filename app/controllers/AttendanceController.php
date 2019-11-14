<?php

class AttendanceController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('attendance/index');
    }

}

