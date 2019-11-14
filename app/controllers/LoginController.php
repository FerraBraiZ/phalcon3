<?php


class LoginController extends ControllerBase
{

    public function indexAction()
    {
        $this->view->pick('login/index');
    }


    public function authOthers()
    {
//        try {
//            $json = [];
//            $validator = $this->validatorForm($_REQUEST);
//            if ($this->validatorForm($_REQUEST)) {
//                $json['error'] = $validator;
//                self::response(200, $json);
//            } else {
//                $email = $_REQUEST['email'];
//                $password = sha1($_REQUEST['password']);
//                $system_user = UserModel::getUserForm($email, $password);
//                if (is_null($system_user[0]['id'])) {
//                    $json['error']['system_user'] = 'Usuário não cadastrado. ou senha inválida';
//                    self::response(200, $json);
//                }
//                if (!is_null($system_user[0]['id'])) {
//                    $dataUser = array();
//                    foreach ($system_user as $value) {
//                        $dataUser['id'] = $value['id'];
//                        $dataUser['name'] = $value['name'];
//                        $dataUser['email'] = $value['email'];
//                        $dataUser['grupo'] = $value['grupo'];
//                        $dataUser['grupo_id'] = $value['grupo_id'];
//                        $dataUser['team_id'] = $value['team_id'];
//                        $dataUser['permissions'] = UserCan::getAcessPermission($value['id']);
//                        $dataUser['time'][$value['team_id']] = $value['time'];
//                        $dataUser['limit'] = $value['limit'];
//                        $dataUser['company'] = $value['company'];
//                        $dataUser['status'] = StatusUserModel::getStatusByUserId($value['id'])[0]['pause_type_id'];
//                    }
//                    $dataUser['portal_access_token'] = null;
//                    $dataUser['portal_access_expires_on'] = null;
//
//                    $_SESSION['User'] = $this->getPortalAccess($dataUser);
//                    if ($system_user[0]['changed'] == 0) {
//                        $json['success']['redirect'] = env('APP_URL') . '/v2/changedpassword';
//                    }
//                    if ($system_user[0]['changed'] === 1) {
//                        if ($dataUser['grupo_id'] === 3) {
//                            $json['success']['redirect'] = env('APP_URL') . '/v2/atendimento';
//                        } else {
//                            $json['success']['redirect'] = env('APP_URL') . '/v2/dashboard';
//                        }
//                    }
//                    self::response(200, $json);
//                }
//            }
//        } catch (\Exception $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Error $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Throwable $e) {
//            $this->logOnNewRelic($e);
//        }
    }

    public function changedpassword()
    {
//        $this->checkLogin();
//        $data = [];
//        foreach ($_SESSION['User'] as $key => $value) {
//            $data['userLogin'][$key] = $value;
//        }
//        $config = self::config();
//        self::view('auth.changedpass');
    }

    public function savechangedpassword()
    {
//        $this->checkLogin();
//        try {
//            $json = [];
//            $validator = $this->validatorForm($_REQUEST);
//            if ($this->validatorForm($_REQUEST)) {
//                $json['error'] = $validator;
//                self::response(200, $json);
//            }
//            $password = sha1($_REQUEST['new_pass']);
//            $confpassword = sha1($_REQUEST['confirm_password']);
//            if ($password != $confpassword) {
//                $json['error']['confirm_password'] = 'Senhas não conferem.';
//            } else {
//                $system_user = UserModel::changedPassword($_SESSION['User']['id'], $password);
//                $json['success']['message'] = 'Senha atualizadas.';
//                $json['success']['redirect'] = env('APP_URL') . '/v2/dashboard';
//            }
//            self::response(200, $json);
//        } catch (\Exception $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Error $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Throwable $e) {
//            $this->logOnNewRelic($e);
//        }
    }


    public function logout()
    {
//        try {
//            $user_id = (int)$_SESSION['User']['id'];
//            $status_id = 0;
//            $status_description = 'OFFLINE';
//            $statusUser = StatusUserModel::getStatusByUserId($user_id);
//            if (is_array($statusUser)) {
//                if ($statusUser[0]['pause_type_id'] == $status_id) {
//                    StatusUserModel:: updatePause($user_id, $status_id, $status_description);
//                } else {
//                    StatusUserModel::setStatusByUserId($user_id, $status_id, $status_description);
//                }
//            }
//            unset($_SESSION['User']);
//            RedisLib::del('dopinder','getAcessPermission_' . $user_id);
//            session_destroy();
//            $redirect = env('APP_URL') . '/v2/login';
//            header("location:$redirect");
//            exit;
//        } catch (\Exception $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Error $e) {
//            $this->logOnNewRelic($e);
//        } catch (\Throwable $e) {
//            $this->logOnNewRelic($e);
//        }
    }

}