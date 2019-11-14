<?php
use Phalcon\Http\Response;

class AliveController extends ControllerBase
{

    public function indexAction()
    {
        $response = new Response();
        $response->setStatusCode(200, 'It is alive!');
        $response->setContent('It is alive!');
        return $response->send();
    }

}

