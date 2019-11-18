<?php



class Email extends CRUD {
    
    /**
     *
     * @var string The database table name.
     */
    protected $table_name = 'email';
    
    /**
     *
     * @var integer The table primary key. 
     */    
    protected $primary_key = 'id_email';
    
    /**
     *
     * @var mixed A concatenation of a bunch of PHP functions for debug purposes. 
     */
    protected $stacktrace  = 'File: '.__FILE__.' Method: '.__FUNCTION__ or __METHOD__.' Line: '.__LINE__;

    
//------------------------------------------------------------------------------    
    
    function OnConstruct() {

    }
    
//------------------------------------------------------------------------------
      
}