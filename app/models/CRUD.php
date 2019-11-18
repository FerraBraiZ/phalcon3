<?php

 use \Phalcon\Mvc\Model;

class CRUD extends Model{
    
    /**
    * @var string database table name 
    */
    protected $table_name = null;
    
    /**
    * @var integer primary key 
    */
    protected $primary_key = null;
    
    /**
    * @var string A regular expression for Brazillian CPF( Type of Social Security number ). 
    */
    protected $cpf_pattern = "^( [0-9] ){3} \,|[[:blank:]]| \.|[-]?( [0-9] ){3} \,|[[:blank:]]| \.|[-]?( [0-9] ){3} \,|[[:blank:]]| \.|[-]?( [0-9] ){2}$^"; 
    
    /**
    * @var string A regular expression for Brazillian Phone Number. 
    */    
    protected $phone_pattern = "^[1-9]{2}( \-| )[0-9]{4,5}( \-| )[0-9]{4}$^";
    
    /**
    * @var mixed A concatenation of a bunch of PHP functions for debug purposes. 
    */
    protected $stacktrace  = PHP_EOL.'File: '.__FILE__.PHP_EOL.' Method: '.__FUNCTION__ or __METHOD__.PHP_EOL.' Line: '.__LINE__;
    
//------------------------------------------------------------------------------
    
    public function __construct( ){
        
        parent::__construct( );

    }
    
//------------------------------------------------------------------------------
    
    /**
    * addPKtoAnArray
    * 
    * Adds a primary key to an array. Uses $fk_id_name to find the array key and replace it's values
    * 
    * @param array $array_name Array's name that will receive the primary key ( PK ).
    * @param string $fk_id_name Foreign's key field name used in the search.  
    * @param integer $id_to_insert  User id that will be inserted in $fk_id_name value.
    * @return array
    *      
    */
    
    public function addPKtoAnArray( $array_name, $fk_id_name, $id_to_insert ){
        
        if( empty( $array_name ) ){
            
            log_message('error','$this->addPKtoAnArray( $array_name ) falhou! '.$this->stacktrace,true);
            
            $this->sendMail( 'error' );
           
            return false; 
            
        }    
        
        foreach ( $array_name as $indexes => $arrays_values ) {

            if ( $indexes === $fk_id_name ) {  

                $array_name[$fk_id_name] = $id_to_insert;                     

            }

            if ( is_array( $arrays_values ) ) {

                foreach ( $arrays_values as $key => $value ) {

                    if ( $key === $fk_id_name ) {  

                        $array_name[$indexes][$fk_id_name] = $id_to_insert;                     

                    }

                }

            }

        }
        
        return $array_name;
        
    }
    
//------------------------------------------------------------------------------
    
    /**
    * isThisRecordActive
    * 
    * Check if the record is active in the database.
    * 
    * @uses codeigniter database class
    * @param integer $id
    * @return string on success or boolean false in failure
    * 
    */
    
    public function isThisRecordActive( $id ){
        
        if( !is_numeric( $id ) || $id <= 0 ) {
            
            return false;
            
        }
        
        $query = $this->db->where( ['status' => 1, $this->primary_key => $id] )->select( $this->primary_key )->get( $this->table_name )->row( );
        
        if( !$query ){
        
            return false;
        
        }
        
        return $query;
        
    }

//------------------------------------------------------------------------------
    
    /**
    * get
    * 
    * Executes a select on the database based on the parameter passed.
    * 
    * @usage
    *  All:    $this->your_model->get( );
    *  Single: $this->your_model->get( 2 );
    *  Custom: $this->your_model->get( array( 'age' => '32', 'gender' => 'male' ) )
    * 
    * @uses codeigniter database class
    * @param integer|null|array
    * @return array
    * 
    */
    
    public function get( $param = null ){ 
        
        if ( is_numeric( $param ) ) {
            
            $this->db->where( $this->primary_key, $param );
            
        } 
        
        if ( is_array( $param ) ) {
            
            foreach ( $param as $_key => $_value ) {
                
                $this->db->where( $_key, $_value );
                
            }
        }
        
        return $this->db->get( $this->table_name )->result_array( );// as array or ->result( ) as object
                                          
        
    }
    
//------------------------------------------------------------------------------
    
    /**
     * insert
     * 
     * Executes a database insert
     * 
     * @usage $result = $this->your_model->insert( ['login' => 'login'] );
     * @uses codeigniter database class
     * @param array A array containing the new data.
     * 
     */
    
    public function insert( array $data ){
        
        if( empty( $data ) ){
            
            log_message( 'error','array $data cannot be empty. '.$this->stacktrace,true );
            
            return false;
            
        }
        
        if( ! $this->db->insert( $this->table_name, $data ) ){
            
            $error = $this->db->error( ); 
            
            log_message( 'error',"CRUD_model insert failed! Error $error $this->stacktrace",true );
            
            return false;
            
        }
        
        return $this->db->insert_id( );
        
    }
    
//------------------------------------------------------------------------------
    
    
    /**
     * update 
     * 
     * Executes a database update
     * 
     * @usage 
     * $this->your_model->update( ['login' => 'Peggy'], 3 );
     * $this->your_model->update( ['login' => 'Ted'], ['date_created' => '0'] );
     * 
     * @uses codeigniter database class
     * 
     *  @return ( int )$affected_row 
     */
    
    public function update( $new_data, $where ){
        
        if ( is_numeric( $where ) ) {
            
            $this->db->where( $this->primary_key, $where );
            
        }
        
        elseif ( is_array( $where ) ){
            
            foreach ( $where as $_key => $_value ){
                
                $this->db->where( $_key, $_value );
                
            }
            
        }
        
        else {
            
            log_message( 'error','You must pass a second parameter to the UPDATE( ) method.',true );
            return ( 'Ocorreu um erro. O administrador foi avisado.' );
            
        }
        
        if( ! $this->db->update( $this->table_name, $new_data ) ){
            
            log_message( 'error','Update failed! '.$this->stacktrace,true );
            
            return false;
            
        }
        
        return $this->db->affected_rows( );
        
    }
    
//------------------------------------------------------------------------------
    
    /**
     * insertOrUpdate
     * 
     * Executes a database insert or update based on the existence of the id.
     * 
     * @usage insertOrUpdate( ['name' => 'ted'], 12 )
     * @return integer|boolean  
     */
    
    public function insertOrUpdate( $data, $id = false ){
        
        if ( !$id ) {
            die( "You must pass a second parameter to the insertUPDATE( ) method." );
        }
        
        $this->db->select( $this->primary_key );
        
        $this->db->where( $this->primary_key, $id );
        
        if ( $this->db->get( $this->table_name )->num_rows( ) === 0 ) {
            
            return $this->insert( $data );
            
        }
        
        return $this->update( $data, $id );
        
    }
    
//------------------------------------------------------------------------------
    
    /**
     * delete
     * 
     * executes a database delete dased on id or where
     *  
     * @usage 
     * delete by id: $this->your_model->delete( 6 ); 
     * delete where: $this->your_model->delete( array( 'name' => 'Markus' ) )
     * 
     * @param integer|array 
     * @return int affected rows or boolean false in case of errors
     * 
     */
    
    public function delete( $param ) {
        
        if ( is_numeric( $param ) ) {
            
            $this->db->where( $this->primary_key, $param );
            
        }
        
        elseif ( is_array( $param ) ) {
            
            foreach ( $param as $_key => $_value ) {
                
                $this->db->where( $_key, $_value );
                
            }
            
        }
        
        else {
            
            log_message( 'error',"You must pass a parameter to the DELETE( ) method.",true );
            
            die( "You must pass a parameter to the DELETE( ) method." );
            
            return false;
            
        }
        
        $this->db->delete( $this->table_name );
        
        return $this->db->affected_rows( );
        
    }
    
    
//------------------------------------------------------------------------------ 
    
    /**
     * tryToGuessSearchTerm
     * 
     * tries to guess the search types using regular expression ( client id, phone, CPF, name ) and complete
     * the sql query string.
     * 
     * @param mixed $search_term
     * @return string
     */
    
    function tryToGuessSearchTerm( $search_term, $primary_key,$optional_param=null ){
        
        $sql = '';
        $field_name = !is_null($optional_param) ? $optional_param : ' C0.nome '; 
        
        switch ( $search_term ) {

            //search cliente/médico by id if its numeric and less 9 caracters long.
            case is_numeric( $search_term ) && strlen( $search_term ) < 9:
            $sql =" AND C0.$primary_key = $search_term ORDER BY $field_name";
            break;

            //search cliente/médico by  cpf 00000000000 
            case is_numeric( $search_term ) && strlen( $search_term ) === 11:
            $a = str_split( $search_term );
            $search_term = $a[0].$a[1].$a[2].'.'.$a[3].$a[4].$a[5].'.'.$a[6].$a[7].$a[8].'-'.$a[9].$a[10];
            $sql =" AND C0.cpf = '$search_term' ORDER BY $field_name";  
            unset( $a );
            break;

            //search cliente/médico by cpf using regular expression  
            case preg_match( $this->cpf_pattern, $search_term ) && strlen( $search_term ) === 14:
            $a = str_split( $search_term );
            $search_term = $a[0].$a[1].$a[2].'.'.$a[4].$a[5].$a[6].'.'.$a[8].$a[9].$a[10].'-'.$a[12].$a[13];   
            $sql =" AND C0.cpf = '$search_term' ORDER BY $field_name";
            break;

            //search cliente/médico by Phone number 4199998888 -> ( 41 ) 9999-8888
            case is_numeric( $search_term ) && strlen( $search_term ) === 10:
            $a = str_split( $search_term );
            $search_term = '('.$a[0].$a[1].') '.$a[2].$a[3].$a[4].$a[5].'-'.$a[6].$a[7].$a[8].$a[9];
            $sql =" AND C1.Telefones LIKE '%$search_term%' ORDER BY $field_name";  
            unset( $a );
            break;

            //search cliente/médico by Phone number using regular expression  
            case preg_match( $this->phone_pattern, $search_term ) && ( is_numeric( $search_term ) || is_string( $search_term ) ):
            if( strlen( $search_term ) === 12 ){
                $a = str_split( $search_term );
                $search_term = '('.$a[0].$a[1].') '.$a[3].$a[4].$a[5].$a[6].'-'.$a[8].$a[9].$a[10].$a[11];
            }                  
            if( strlen( $search_term ) === 13 ){
                $a = str_split( $search_term );
                $search_term = '('.$a[0].$a[1].') '.$a[3].$a[4].$a[5].$a[6].$a[7].'-'.$a[9].$a[10].$a[11].$a[11];
            }
            
            //$field_name = !is_null($optional_param) ? $optional_param : ' C0.nome ';  
            //$sql =' AND '.$field_name.' LIKE "%'.$search_term.'%" ORDER BY '.$field_name;
            $sql =' AND C1.Telefones LIKE "%'.$search_term.'%" ORDER BY '.$field_name;   
            break;

            //search cliente/médico/animal by Name using SQL LIKE statement
            case is_string( $search_term ):
            //$sql =' AND C0.nome LIKE "%'.$search_term.'%" ORDER BY C0.nome ';             
            $sql =' AND '.$field_name.' LIKE "%'.$search_term.'%" ORDER BY '.$field_name;
            break;

        }

        return $sql;        

    }

//------------------------------------------------------------------------------
    
    
    /**
     * dbInsertBatch
     * 
     * Executes addPKtoAnArray and insert_batch 
     * 
     * @param array $data_array
     * @param string $fk
     * @param integer $id
     * @return boolean
     * 
     */
    
    
    public function dbInsertBatch( array $data_array, $fk, $id ){

        if ( ! $array = $this->addPKtoAnArray( $data_array, $fk, $id ) ){
            
            log_message( 'error','addPKtoAnArray falhou! '.$this->stacktrace,true );

            return false;

        }

        if ( !$this->db->insert_batch( $this->table_name, $array ) ) {

            log_message( 'error','$this->db->insert_batch( ) falhou! '.$this->stacktrace,true );
                
            return false;

        }
        
        return true;
        
    }
  
//------------------------------------------------------------------------------
    
    /**
     * insertBatch
     * 
     * Executes a CI insert_batch
     * 
     * @param arrray $data_array
     * @return boolean
     * 
     */
    
    public function insertBatch( $data_array ){
        
        if ( $this->db->insert_batch( $this->table_name, $data_array ) === false ) {
            
            return false; 

        } 
        
        return true;
        
    }
    
//------------------------------------------------------------------------------
    
    /**
     * SoftDelete
     * 
     * Executes an update into a given table setting the flag status to 0 ( record inactive )
     * 
     * @param integer $id
     * @param string $fk_id_name represents the foreign key name on the other side table of the relationship
     * @param integer $level
     * @return boolean
     * 
     * TODO
     * set "levels" of "deleted data"
     * 
     */
    
    public function softDelete( $id, $fk_id_name, $level = null ){
        
        if ( !is_int( $this->update( array( 'status' => '0' ), array( $fk_id_name => $id ) ) ) ) {
            
            return false;    
            
        }

        return true;
        
    }
   
//------------------------------------------------------------------------------
    
    /**
     * updateBatch
     * 
     * Executes a softDelete( ),addPKtoAnArray( ) and an insertBatch( ).
     * 
     * @param array $data_array
     * @param string $fk_id_name
     * @param integer $id
     * @return boolean
     * 
     */
    
    public function updateBatch( $data_array, $fk_id_name, $id ){
        
        if ( $this->softDelete( $id, $fk_id_name ) === false ) {

            log_message( 'error','softDelete falhou! '.$this->stacktrace,true );

            return false;    

        }

        $Modified_Array = $this->addPKtoAnArray( $data_array, $fk_id_name, $id );
        
        if ( !is_array( $Modified_Array ) || $Modified_Array === false ){

            log_message( 'error','addPKtoAnArray falhou! '.$this->stacktrace,true );

            return false;

        }
        
        //show( $Modified_Array );
        
        if ( $this->db->insert_batch( $this->table_name, $Modified_Array ) === false ) {

            log_message( 'error','insertBatch falhou! '.$this->stacktrace,true );

            return false; 

        }
        
        return true;
        
    }
    
//------------------------------------------------------------------------------
    
    /**
    * sortQueryOutputIntoArray
    * 
    * A facade for the others sorting methods.  
    * 
    * @param array $query
    * @return array returns an array of arrays with sorted data.
    * 
    */
    
    public function sortQueryOutputIntoArray( array $query ){
        
        $data = [];

        foreach( $query as $i => $result ) { 
            
            foreach( $result as $key =>$value ) { 
                    
                $data = $this->sortCommonData( $key, $value, $i, $data );
                $data = $this->sortAnimalData( $key, $value, $i, $data );
                $data = $this->sortAddressData( $key, $value, $i, $data );
                $data = $this->sortRecadoData( $key, $value, $i, $data );
                $data = $this->sortBanhoData( $key, $value, $i, $data );

                if( $key === 'Telefones' && $value != '' ){

                    $data = $this->sortPhoneArray( $key, $value, $i, $data );
                    
                } 

                if( $key === 'Emails' && $value != '' ){  

                    $data = $this->sortEmailArray( $key, $value, $i, $data );

                }

                if( $key === 'Pets' && $value != '' ){

                   $data = $this->sortPetArray( $key, $value, $i, $data );

                }
                
                if( $key === 'Fotos' && $value != '' ){
                    
                    $data = $this->sortPhotoArray( $key, $value, $i, $data );
                    
                }     

            }
                
        } 

        return $data;
        
    }
    
//------------------------------------------------------------------------------
    
    /**
     * sortEmailArray
     * 
     * sorts the email data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.
     * 
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortEmailArray( $key, $value, $i, $data ){

        $emails = explode( ",", $value );

        foreach( $emails as $key => $value ){ 

           @list( $id_email,$email ) = \explode( "|", $value );                  
           $data[$i]['Emails'][$key]['id_email'] = $id_email;
           $data[$i]['Emails'][$key]['email'] = $email;

        }

        return $data;

    }

//------------------------------------------------------------------------------
        
    /**
     * sortPhotoArray
     * 
     * sorts the Foto data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortPhotoArray( $key,$value,$i,$data ){

        $fotos = explode( ",", $value );

        foreach( $fotos as $key => $value ){ 

           @list( $id_foto,$foto_nome, $legenda ) = explode( "|", $value );
           
           $data[$i]['Fotos'][$key]['id_foto'] = $id_foto;
           
           $data[$i]['Fotos'][$key]['foto_nome'] = $foto_nome;
           
           $data[$i]['Fotos'][$key]['legenda'] = $legenda;

        }

        return $data;

    }

//------------------------------------------------------------------------------
            
    /**
     * sortPhotoArray
     * 
     * sorts the Fone data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortPhoneArray( $key, $value, $i, $data ){

        $fones = explode( ",", $value );

        foreach( $fones as $key => $value ){ 

           @list( $id_telefone,$telefone, $tipo ) = explode( "|", $value );

           $data[$i]['Telefones'][$key]['id_telefone'] = $id_telefone;

           $data[$i]['Telefones'][$key]['numero'] = $telefone;

           $data[$i]['Telefones'][$key]['tipo'] = $tipo;

        }

        return $data;

    }
    
//------------------------------------------------------------------------------
                
    /**
     * sortPetArray
     * 
     * sorts the Pet data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortPetArray( $key, $value, $i, $data ){

        $pets = explode( ",", $value ); 

        foreach( $pets as $key => $value ){

           list( $id_animal,$nome, $raca, $especie, $sexo, $cor_pelagem, $data_aniversario ) = explode( "|", $value ); 

           $data[$i]['Pets'][$key]['id_animal'] = $id_animal;

           $data[$i]['Pets'][$key]['nome'] = $nome;

           $data[$i]['Pets'][$key]['especie'] = $especie; 

           $data[$i]['Pets'][$key]['raca'] = $raca;

           $data[$i]['Pets'][$key]['sexo'] = $sexo;

           $data[$i]['Pets'][$key]['cor_pelagem'] = $cor_pelagem;

           $data[$i]['Pets'][$key]['data_aniversario'] = $data_aniversario; 

        }

        return $data;

    }
    
//------------------------------------------------------------------------------
                
    /**
     * sortCommonData
     * 
     * sorts the Personal data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortCommonData( $key, $value, $i, $data ){

        switch ( $key ) {                     
          
            case $key === 'id_cliente':       
              $data[$i]['Personal_data']['id_cliente'] = $value;
              break;

            case $key === 'id_medico':       
              $data[$i]['Personal_data']['id_medico'] = $value;
              break;

            case $key === 'nome':       
              $data[$i]['Personal_data']['nome'] = $value;
              break;

            case $key === 'sexo':       
              $data[$i]['Personal_data']['sexo'] = $value;
              break;

            case $key === 'cpf':       
              $data[$i]['Personal_data']['cpf'] = $value;
              break;
            
            case $key === 'dia_aniversario':       
              $array[$i]['Personal_data']['dia_aniversario'] = $value;                      
              break;

            case $key === 'mes_aniversario':       
              $array[$i]['Personal_data']['mes_aniversario'] = $value;                      
              break;

            case $key === 'ano_aniversario':       
              $array[$i]['Personal_data']['ano_aniversario'] = $value;                      
              break;  

            case $key === 'crmv':       
              $data[$i]['Personal_data']['crmv'] = $value;
              break; 

            case $key === 'especialidade':       
              $data[$i]['Personal_data']['especialidade'] = $value;
              break;   

            case $key === 'data_aniversario':       
              $data[$i]['Personal_data']['data_aniversario'] = $value;
              break; 

            case $key === 'observacao':       
              $data[$i]['Personal_data']['observacao'] = $value;
              break;

            case $key === 'data_cadastro':
              //2015-06-08 19:17:43 -> 2015-06-08  
              list( $dt_cad,$hr_cad ) = explode( " ", $value );
              $data[$i]['Personal_data']['data_cadastro'] = $dt_cad;
              unset( $hr_cad );                       
              break; 
          
            case $key === 'admissao':       
              $data[$i]['Personal_data']['admissao'] = $value;
              break;
          
            case $key === 'demissao':       
              $data[$i]['Personal_data']['demissao'] = $value;
              break;

            case $key == 'foto_nome':       
              $data[$i]['Personal_data']['foto_nome']= $value;
              break;            

        } 

        return $data;

    }
    
//------------------------------------------------------------------------------
                
    /**
     * sortAnimalData
     * 
     * sorts the animal data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortAnimalData( $key, $value, $i, $data ){

        switch ( $key ) {                     

            case $key === 'id_animal':       
              $data[$i]['Animal_data']['id_animal'] = $value;
              break;
          
            case $key === 'id_especie':       
              $data[$i]['Animal_data']['id_especie'] = $value;
              break;
          
            case $key === 'id_raca':       
              $data[$i]['Animal_data']['id_raca'] = $value;
              break;

            case $key === 'proprietario':       
              $data[$i]['Animal_data']['proprietario'] = $value;
              break;

            case $key === 'pet_nome':       
              $data[$i]['Animal_data']['pet_nome'] = $value;
              break;

            case $key === 'raca':       
              $data[$i]['Animal_data']['raca'] = $value;
              break;

            case $key === 'especie':       
              $data[$i]['Animal_data']['especie'] = $value;
              break;

            case $key === 'pet_sexo':       
              $data[$i]['Animal_data']['pet_sexo'] = $value;
              break;
            
            case $key === 'dia_aniversario':       
              $data[$i]['Animal_data']['dia_aniversario'] = $value;                      
              break;

            case $key === 'mes_aniversario':       
              $data[$i]['Animal_data']['mes_aniversario'] = $value;                      
              break;

            case $key === 'ano_aniversario':       
              $data[$i]['Animal_data']['ano_aniversario'] = $value;                      
              break;  

            case $key === 'pet_data_aniversario':       
              $data[$i]['Animal_data']['pet_data_aniversario'] = $value;
              break; 

            case $key === 'observacao':       
              $data[$i]['Animal_data']['observacao'] = $value;
              break;

            case $key === 'cor_pelagem':       
              $data[$i]['Animal_data']['cor_pelagem'] = $value;
              break;

            case $key === 'data_cadastro':
              //2015-06-08 19:17:43 -> 2015-06-08  
              list( $dt_cad,$hr_cad ) = explode( " ", $value );
              $data[$i]['Animal_data']['data_cadastro'] = $dt_cad;
              unset( $hr_cad );                       
              break; 
          
        } 

        return $data;

    }
//------------------------------------------------------------------------------
                
    /**
     * sortAddressData
     * 
     * sorts the Personal Address data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortAddressData( $key, $value, $i, $data ){

        switch ( $key ) {                     

            case $key === 'tipo':       
              $data[$i]['Enderecos']['tipo'] = $value;
              break;

            case $key === 'endereco':       
              $data[$i]['Enderecos']['endereco']= $value;
              break;

            case $key === 'numero':       
              $data[$i]['Enderecos']['numero'] = $value;
              break;

            case $key === 'cep':       
              $data[$i]['Enderecos']['cep'] = $value;
              break;

            case $key === 'bairro':       
              $data[$i]['Enderecos']['bairro'] = $value;
              break;

            case $key === 'cidade':       
              $data[$i]['Enderecos']['cidade'] = $value;
              break;

            case $key === 'uf':       
              $data[$i]['Enderecos']['uf'] = $value;
              break;

            case $key === 'complemento':       
              $data[$i]['Enderecos']['complemento'] = $value;
              break;

        } 

        return $data;

    }
    
//------------------------------------------------------------------------------
                
    /**
     * sortBirthdayArray
     * 
     * sorts the Clientes, Pets and Medicos Birthdays data from either the 
     * input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortBirthdayArray( $query ){
        
        $data = array( );

        foreach ( $query as $i => $result ) { 
            
            foreach( $result as $key =>$value ){ 

                switch ( $key ) {                     

                    case $key === 'id_cliente':       
                      $data[$i]['id_cliente'] = $value;
                      break;

                    case $key === 'id_medico':       
                      $data[$i]['id_medico'] = $value;
                      break;

                    case $key === 'proprietario':       
                      $data[$i]['proprietario'] = $value;                      
                      break;

                    case $key === 'cpf':       
                      $data[$i]['cpf'] = $value;                      
                      break;

                    case $key === 'nome':       
                      $data[$i]['nome'] = $value;
                      break;

                    case $key === 'cpf':       
                      $data[$i]['cpf'] = $value;
                      break;

                    case $key === 'dia_aniversario':       
                      $data[$i]['dia_aniversario'] = $value;                      
                      break;

                    case $key === 'mes_aniversario':       
                      $data[$i]['mes_aniversario'] = $value;                      
                      break;

                    case $key === 'ano_aniversario':       
                      $data[$i]['ano_aniversario'] = $value;                      
                      break;   

                } 

            }
                
        } 
        
        return $data;

    }
    
//------------------------------------------------------------------------------
               
    /**
     * sortRecadoData
     * 
     * sorts the Recado data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortRecadoData( $key, $value, $i, $data ){

        switch ( $key ) {                     
          
            case $key === 'id_recado':       
              $data[$i]['Recado_data']['id_recado'] = $value;
              break;

            case $key === 'visualizado':       
              $data[$i]['Recado_data']['visualizado'] = $value;
              break;

            case $key === 'para':       
              $data[$i]['Recado_data']['para'] = $value;
              break;

            case $key === 'assunto':       
              $data[$i]['Recado_data']['assunto'] = $value;
              break;

            case $key === 'data':       
              $data[$i]['Recado_data']['data'] = $value;
              break;
            
            case $key === 'hora':       
              $data[$i]['Recado_data']['hora'] = $value;                      
              break;

        } 

        return $data;

    }
    
//------------------------------------------------------------------------------
               
    /**
     * sortRecadoData
     * 
     * sorts the Recado data from either the input( post ) or output ( sql query )  
     * and puts it in an existing array.     
     *  
     * @param integer $key
     * @param mixed $value
     * @param integer $i
     * @param array $data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function sortBanhoData( $key, $value, $i, $data ){

        switch ( $key ) {                     
          
            case $key === 'id_banho_e_tosa':       
              $data[$i]['Banho_data']['id_banho_e_tosa'] = $value;
              break;
          
            case $key === 'descricao':       
              $data[$i]['Banho_data']['descricao'] = $value;
              break;
          
            case $key === 'hora_inicio':       
              $data[$i]['Banho_data']['hora_inicio'] = $value;
              break;
          
            case $key === 'hora_termino':       
              $data[$i]['Banho_data']['hora_termino'] = $value;
              break;
          
            case $key === 'data_procedimento':       
              $data[$i]['Banho_data']['data_procedimento'] = $value;
              break;

          

        } 

        return $data;

    }
    
//------------------------------------------------------------------------------
    
    /**
     * generateDropDownMenu
     * 
     * @param array $query_data
     * @return array $data a sorted array with the new data in it
     * 
     */
    
    public function generateDropDownMenu( array $query_data){
        
        //TODO create a generic method to help or create a dropDownMenu 
        
        return $query_data;
        
    }
    
    
//------------------------------------------------------------------------------
    
}