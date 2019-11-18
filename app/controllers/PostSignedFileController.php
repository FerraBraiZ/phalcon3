<?php

use Phalcon\Di;
use Phalcon\DiInterface;

class PostSignedFileController extends ControllerBase {

    protected $di;

    public function OnConstruct(DiInterface $di)
    {
        $this->di = $di;
    }

    public function index() {

        if( isset( $_SERVER['HTTP_ORIGIN'] ) && $_SERVER['HTTP_ORIGIN'] != '' )
        {
            header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
            header('Access-Control-Allow-Credentials: true');
            header('Access-Control-Max-Age: 0');    // cache for 0 day
        }

        // Access-Control headers are received during OPTIONS requests
        if( $_SERVER['REQUEST_METHOD'] == 'OPTIONS')
        {
            if( isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
                header("Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS");
            if( isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
                header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
            exit;
        }

        if ('POST' !== $_SERVER['REQUEST_METHOD'] ) {

            http_response_code(405);
            exit( "Method not allowed!");

        }

        $stdin = (object)\GuzzleHttp\json_decode( file_get_contents("php://input"), true );

        if( !isset( $stdin ) ) {

            http_response_code(422);
            exit( "no content was received on this endpoint, looks like you forgot something!" );

        }

        [ 'fileName' => $fileName, 'folder' => $folder, 'uuid' => $uuid  ] = get_object_vars($stdin);

        $filename = "$folder/$uuid/$fileName";

        header('Content-Type:application/json');
        http_response_code(200);

        $bucketName = "https://ferrabraiz-test-bucket.s3.amazonaws.com/";

        $postAwsPreSignedForm =  $this->di->postAwsPreSignedForm($filename,$bucketName );

    }

 
}
