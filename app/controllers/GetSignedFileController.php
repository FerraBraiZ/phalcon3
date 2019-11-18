<?php

use Phalcon\Di;
use Phalcon\DiInterface;

class GetSignedFileController extends ControllerBase {

    protected $di;

    public function OnConstruct(DiInterface $di)
    {
        $this->di = $di;
    }

    public function index() {

       /*
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

        if ('GET' !== $_SERVER['REQUEST_METHOD'] ) {

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
       */

       /*
       @app.route('/' + app.app_name + '/get/{url}', methods=['GET'], content_types=['application/json'],
           cors=True)
def get_url(url):
    key = re.sub(r'^((http[s]?|ftp):\/)?\/?([^:\/\s]+)(\/)', '', urllib.parse.unquote(url))
    key = re.sub(r'(?=\?).*$', '', key)

    response = create_pre_signed_url(bucket, key)

    payload = {'url': [response]}
    headers = {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJNTVNob3J0ZW5lciBMb2dpc3RpYyIsImlhdCI6MTU0MzI2MTMxMywiZXhwIjozNDA1MTgxMzEzLCJhdWQiOiJodHRwczovL21kci5tcyIsInN1YiI6IiJ9.2dkFGI1bT_IH3U1pOPYAuBXqdsa3hL5Qt9beA-Psnps'}

    r = requests.post(url='https://mdr.ms/', data=json.dumps(payload), headers=headers)

    shortened = r.json().get('url')[0]['shortUrl']

    return generate_json_response(body={"resignedUrl": shortened})

def generate_json_response(body, status=200):
    print(str(status) + " - " + str(json.dumps(body)))
    return json.dumps(body)


def create_pre_signed_post(bucket_name, key,
                           fields=None, conditions=None, expiration=3600):
    """Generate a pre-signed URL S3 POST request to upload a file
    :param key: string
    :param bucket_name: string
    :param fields: Dictionary of pre-filled form fields
    :param conditions: List of conditions to include in the policy
    :param expiration: Time in seconds for the pre-signed URL to remain valid
    :return: Dictionary with the following keys:
        url: URL to post to
        fields: Dictionary of form fields and values to submit with the POST
    :return: None if error.
    """

    # Generate a pre-signed S3 POST URL
    s3_client = boto3.client('s3')
    try:
        response = s3_client.generate_presigned_post(bucket_name,
                                                     key,
                                                     Fields=fields,
                                                     Conditions=conditions,
                                                     ExpiresIn=expiration)
    except ClientError as e:
        logging.error(e)
        return None

    # The response contains the pre-signed URL and required fields
    return response


def create_pre_signed_url(bucket_name, key, expiration=3600):
    """Generate a pre-signed URL to share an S3 object
    :param bucket_name: string
    :param key: string
    :param expiration: Time in seconds for the pre-signed URL to remain valid
    :return: Pre-signed URL as string. If error, returns None.
    """

    # Generate a pre-signed URL for the S3 object
    s3_client = boto3.client('s3')
    try:
        response = s3_client.generate_presigned_url('get_object',
                                                    Params={'Bucket': bucket_name,
                                                            'Key': key},
                                                    ExpiresIn=expiration)
    except ClientError as e:
        logging.error(e)
        return None

    # The response contains the pre-signed URL
    return response


def _get_parts():
    rfile = BytesIO(app.current_request.raw_body)
    content_type = app.current_request.headers['content-type']
    _, parameters = cgi.parse_header(content_type)
    parameters['boundary'] = parameters['boundary'].encode('utf-8')
    parsed = cgi.parse_multipart(rfile, parameters)
    return parsed
       */

    }

 
}
