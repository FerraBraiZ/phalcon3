<?php

class File extends ControllerBase {
    
    protected $number_of_uploaded_images;
    protected $uploaded;
    protected $json_data;
    protected $error;
    protected $upload_error_msg;
    protected $upload_folder = 'uploads/';
    protected $allowed_types = 'jpeg|jpg|png';
    
//------------------------------------------------------------------------------

    public function __construct() {
        
        parent::__construct();

        $this->load->model('Foto_model','foto_model');        
        $this->load->library('upload');        
        $this->load->library('image_lib');
        
    }

//------------------------------------------------------------------------------
    
    public function upload($allowed_number_of_files_per_upload) {

        if ( empty( $_FILES ) ) {
            $this->output->set_output(json_encode(array('result' => 0, '' => 'Erro! Selecione ao menos uma foto para enviar')));
            return false;
        }

        $this->number_of_uploaded_images = count($_FILES['uploadedimages']['tmp_name']);

        if ($this->number_of_uploaded_images > $allowed_number_of_files_per_upload) {
            
            $this->upload_error_msg = $allowed_number_of_files_per_upload === 1 ? 
                    "Erro! &#201; permitido apenas 1 foto por envio." : 
                    "Erro! &#201; permitido apenas 10 fotos por envio.";           
            
            $this->output->set_output(json_encode(array('result' => 0, '' => $this->upload_error_msg)));
            
            return false;
        }

        $temp = $_FILES['uploadedimages'];

        for ($i = 0; $i < $this->number_of_uploaded_images; $i++) {
            
            if ($_FILES['uploadedimages']['error'][$i] != 0) {
                
                $this->error[$i] = $_FILES['uploadedimages']['error'][$i];
                
            }
            
        }
        
        if( !empty( $this->error ) ){
            
            $this->output->set_output( json_encode( array( 'result' => 0, '' => show( $this->error ) ) ) );

            return false;
            
        }
        
        $config['file_name'] = \uniqid() . "_" . \Date('d-m-Y_H-i-s');
        $config['upload_path'] = \FCPATH . $this->upload_folder;
        $config['allowed_types'] = $this->allowed_types;
        $created_images = array();

        for ($i = 0; $i < $this->number_of_uploaded_images; $i++) {
            
            $_FILES['uploadedimage']['name'] = $temp['name'][$i];
            $_FILES['uploadedimage']['type'] = $temp['type'][$i];
            $_FILES['uploadedimage']['tmp_name'] = $temp['tmp_name'][$i];
            $_FILES['uploadedimage']['error'] = $temp['error'][$i];
            $_FILES['uploadedimage']['size'] = $temp['size'][$i];

            $this->upload->initialize($config);
            if ($this->upload->do_upload('uploadedimage')) {
                
                $created_images[$i] = $this->uploaded[$i] = $this->upload->data();
                
            } else {
                
                $this->error[$i] = $this->upload->display_errors('', '');
                
                $this->output->set_output(json_encode(array('result' => 0, '' => $this->error[$i])));
                
                unset($this->error[$i]);
                
                return false;
                
            }
            
        }

        $configs = array();

        foreach ($created_images as $key => $source_image) {

            $configs[$key] = array('source_image' => $source_image['file_name'], 
                                   'new_image' => 'thumbs-' . $source_image['file_name'], 
                                   'width' => 218, 'height' => 257, 'maintain_ratio' => FALSE);
            
        }

        foreach ($configs as $key => $config) {
            //$this->image_lib->_enlarge(true);
            $this->image_lib->thumb($config, FCPATH . $this->upload_folder);
            $this->json_data[$key] = ([ 'result' => 1, 'file_name' => $config['new_image']]);
        }

        echo json_encode($this->json_data, JSON_UNESCAPED_SLASHES);

        unset($_FILES);unset($temp);unset($this->uploaded);
        
        return false;
        
    }/* upload()*/
    
//------------------------------------------------------------------------------

    public function deleteUploadedFile($foto) {
        //SoftDelete
        if ( !is_int( $this->foto_model->update( array( 'status' => '0' ), array( 'foto_nome' => $foto ) ) ) ) {

            log_message( 'error','softDelete falhou! '.$this->stacktrace,true );

            return false;    

        }
     
//        if ( $this->foto_model->deleteFotoFromDiskAndDB($foto) === false ) {
//
//            $error_msg = 'Erro! O arquivo que voc&#234; est&#225; tentado remover n&#227;o existe ou j&#225; fora removido!';
//
//            $this->output->set_output(json_encode(array('result' => 0, 'erro' => $error_msg)));
//
//            return false;
//        }

        $this->output->set_output(json_encode(array('result' => 1, 'deleted_file_name' => $foto)));

        return false;
        
    }    
   
//------------------------------------------------------------------------------
    
}