<?php
use Phalcon\Mvc\Controller;
use Phalcon\Forms\LoginForm;
use Phalcon\Forms\RequestResetForm;
use Phalcon\Forms\ResetPasswordForm;
use Phalcon\Models\User;
use Phalcon\Models\UserRole;
use Phalcon\Security;
use Phalcon\Security\Random;
//use Phalcon\Mvc\Url;
use Overtrue\Socialite\SocialiteManager;


class OauthCallbackController extends Controller
{

    private $socialite = false;
    public static $error = [];

    public function indexAction()
    {
        die('OauthCallback');
        //$this->view->pick('social-login/index');
    }


    public function onConstruct()
    {
//        $this->socialite = new SocialiteManager([
//            'google' => [
//                'client_id' => getenv('GOOGLE_KEY'),
//                'client_secret' => getenv('GOOGLE_SECRET'),
//                'redirect' => getenv('GOOGLE_REDIRECT_URI'),
//            ],
//        ]);

    }


    public function authAction()
    {
        //echo $this->socialite->driver('google')->redirect();
        //echo $response;
    }

    public function oauthCallback()
    {

        die('oauthCallback');
//        try {

//            $user = $this->socialite->driver('google')->user();
//
//            die('<pre>' . print_r($user) . '</pre>');


//            $system_user = UserModel::getUserEmail($user->email);
//            if (!empty($system_user[0]['id'])) {
//                $dataUser = $system_user[0];
//                $dataUser['permissions'] = UserCan::getAcessPermission($dataUser['id']);
//                $dataUser['status'] = StatusUserModel::getStatusByUserId($dataUser['id'])[0]['pause_type_id'];
//                $dataUser['portal_access_token'] = null;
//                $dataUser['portal_access_expires_on'] = null;
//                $_SESSION['User'] = $this->getPortalAccess($dataUser);
//                if ($system_user[0]['grupo_id'] === 3 ) {
//                    $redirect = env('APP_URL') . '/v2/atendimento';
//                    header("location:$redirect");
//                } else {
//                    $redirect = env('APP_URL') . '/v2/dashboard';
//                    header("location:$redirect");
//                }
//            } else {
//                unset($_SESSION);
//                $data['error_message'] = 'Email não cadastrado no sistema';
//                self::view('auth.login', $data);
//            }
//
//
//        } catch (\Throwable $e) {
//            $this->logOnNewRelic($e);
//        }
    }


    /**
     * The login action, validates user
     */
    public function loginAction()
    {

//        $username = $this->request->getPost('username');
//        $password = $this->request->getPost('password');
//        $csrf     = $this->request->getPost('csrf');
//
//        $user     = User::findFirstByName($username);
//        $role     = UserRole::findFirstById($user->role_id);
//
//        if($user && $user->active == 1) {
//            if($this->security->checkToken($csrf, $this->security->getSessionToken()) && $this->security->checkHash($password, $user->password)) {
//                $this->session->set('auth-identity', [
//                    'id'       => $user->id,
//                    'username' => $user->name,
//                    'image'    => $user->image,
//                    'role'     => $role->name
//                ]);
//                return $this->dispatcher->forward(["controller" => "project", "action" => "index"]);
//            }
//            else {
//                $this->flash->error('User/Password combination incorrect');
//                return $this->dispatcher->forward(["controller" => "auth", "action" => "index"]);
//            }
//        }
//        else {
//            $this->flash->error('User not found');
//            return $this->dispatcher->forward(["controller" => "auth", "action" => "index"]);
//        }
    }

    /**
     * The logout action, remove user session
     */
    public function logoutAction()
    {
//        $this->session->remove('auth-identity');
//
//        return $this->dispatcher->forward([
//            "controller" => "auth",
//            "action" => "index"
//        ]);
    }

    /**
     * The password forgotten action
     */
    public function requestResetAction()
    {
        $this->view->setVar('form', new RequestResetForm(null, ['edit' => false]));
    }

    /**
     * the create token action
     */
    public function createTokenAction()
    {
//        if (!$this->request->isPost()) {
//            return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset"]);
//        }
//
//        $csrf  = $this->request->getPost('csrf');
//        $email = $this->request->getPost("email", "string");
//        $user  = User::findFirstByEmail($email);
//
//        if($this->security->checkToken($csrf, $this->security->getSessionToken())) {
//            if (!$user) {
//                $this->flash->error('User not found');
//                return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset" ]);
//            }
//
//            $random      = new Random();
//            $uuid        = $random->uuid();
//            $user->token = $uuid;
//
//            if($user->save()) {
//
//                $headers = "From: ".$this->config->application->domainUri."\n";
//                $headers .= "X-Mailer: PHP/" . phpversion() . "\n";
//                $headers .= "MIME-Version: 1.0\n";
//                $headers .= "Content-Type: text/html; charset=utf-8\n";
//                $headers .= "Content-Transfer-Encoding: 8bit\n";
//
//                $subject = 'Reset password for '.$this->config->application->domainUri;
//
//                $content = $this->view->getRender('emails', 'reset-password', ['token' => $uuid, 'url' => $this->config->application->domainUri]);
//
//                if(mail($email, $subject, $content, $headers)) {
//                    $this->flash->success('An e-mail with instruction to reset the password has been send');
//                    return $this->dispatcher->forward(["controller" => "auth", "action" => "index" ]);
//                }
//
//                $this->flash->error('Could not send e-mail');
//                return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset" ]);
//
//            }
//
//        }
//
//        $this->flash->error('Something went wrong');
//        return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset" ]);
    }

    /**
     * The password reset action
     */
    public function resetAction($token)
    {

//        if($this->request->isPost()) {
//            $token   = $this->request->getPost('token');
//            $csrf    = $this->request->getPost('csrf'); // is empty
//
//            // @TODO csrf is empty on POST
//            //if($this->security->checkToken($csrf, $this->security->getSessionToken())) {
//                $user  = User::findFirstByToken($token);
//
//                if (!$user) {
//                    $this->flash->error('Token is not valid, request a new token');
//                    return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset" ]);
//                }
//
//                // @TODO check if form is valid
//                $password       = $this->request->getPost("password");
//                $user->password = $this->security->hash($password);
//                $user->token    = NULL;
//
//                if ($user->save() == false) {
//                    foreach ($user->getMessages() as $message) {
//                        $this->flash->error($message);
//                    }
//                    $this->flash->error('Something went wrong, request a new token');
//
//                    return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset"]);
//                }
//                $this->flash->success('Password changed');
//
//                return $this->dispatcher->forward(["controller" => "auth", "action" => "index" ]);
//
//            //}
//        }
//
//        if(!$token) {
//            $this->flash->error('Request a reset token first');
//            return $this->dispatcher->forward(["controller" => "auth", "action" => "requestreset" ]);
//        }
//        $this->view->setVar('form', new ResetPasswordForm(null, ['edit' => false, 'usertoken' => $token]));


    }

}
