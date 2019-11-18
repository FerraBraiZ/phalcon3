<?php


class LogoutController extends ControllerBase
{
    public function doLogOut()
    {

        try {

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

        } catch (\Throwable $e) {
            echo $e->getMessage();
        }

    }

}