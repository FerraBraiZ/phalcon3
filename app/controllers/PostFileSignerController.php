<?php

require_once('../../vendor/autoload.php');
ini_set('ignore_repeated_errors', 'On');
ini_set('html_errors', 'On');
ini_set('display_errors', 'On');
error_reporting(E_ALL);
date_default_timezone_set('America/Sao_Paulo');

use Aws\S3\S3Client;
use Aws\S3\PostObjectV4;
use Aws\Exception\AwsException;

class PostFileSignerController extends ControllerBase {
 
    public function index() {
        
       try {

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




    $client = new S3Client([
        'version' => 'latest',
        'region' => 'sa-east-1',
//        'profile' => 'default', it would read credentials from /home/${USER}/.aws/credentials
        'credentials' => [
            'key'    => AWS_KEY,
            'secret' => AWS_SECRET,
        ],
    ]);

    // Set some defaults for form input fields
    $formInputs = ['acl' => 'private'];

    // Construct an array of conditions for policy
    $options = [
        ["acl" => "private"],
        ["bucket" => AWS_BUCKET],
        ["content-type"=>""],
        ["key"=>"${filename}"],
        ["success_action_status"=>"201"]
    ];

    // Optional: configure expiration time string
    $expires = '+1 hours';

    $postObject = new PostObjectV4(
        $client,
        AWS_BUCKET,
        $formInputs,
        $options,
        $expires
    );

    // Get attributes to set on an HTML form, e.g., action, method, enctype
    $formAttributes = $postObject->getFormAttributes();

    // Get form input fields. This will include anything set as a form input in
    // the constructor, the provided JSON policy, your AWS access key ID, and an
    // auth signature.
    $formInputs = $postObject->getFormInputs();

    header('Content-Type:application/json');
    http_response_code(200);
    die(json_encode([
        "contentType" => ["content-type"=>""],
        "acl" => [ "acl"=>"private" ],
        "successActionStatus" => ["success_action_status"=>"201"],
        "policy" => ["policy"=>$formInputs["Policy"]],
        "credential" => ["X-amz-credential"=>$formInputs["X-Amz-Credential"]],
        "algorithm" => ["x-amz-algorithm"=>$formInputs["X-Amz-Algorithm"]],
        "date" => ["x-amz-date"=>$formInputs["X-Amz-Date"]],
        "signature" => ["x-amz-signature"=>$formInputs["X-Amz-Signature"]],
        "key" => ["key"=>"${filename}"],
        "postEndpoint" => ["postEndpoint"=>"https://ferrabraiz-test-bucket.s3.amazonaws.com/"]
    ]));

} catch (AwsException $e) {

    header('Content-Type:application/json');
    http_response_code(200);
    die(json_encode(["AwsException" => $e->getMessage()]));

} catch (\Throwable $e) {

    header('Content-Type:application/json');
    http_response_code(200);
    die(json_encode(["error" => $e->getMessage()]));
}
        
    }

 
}
