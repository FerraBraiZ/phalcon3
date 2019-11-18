<?php

class OutdatedBrowserController extends ControllerBase {

    public function index() {

        $this->view->pick('outdated-browser/index');
    }

}