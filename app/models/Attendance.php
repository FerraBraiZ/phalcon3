<?php

use \Phalcon\Mvc\Model;

class Attendance extends CRUD {
    
    protected $table_name = 'consulta';
    protected $primary_key = 'id_consulta';

    function onConstruct() {


    }

}