<?php

class AttendanceController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('attendance/index');
    }

    public function editAction()
    {
        die('editAction Attendance');
    }

    public function createAction()
    {
        die('createAction Attendance');
    }


    public function deleteAction()
    {
        die('deleteAction Attendance');
    }

}

