<?php

use Phalcon\Models\User;

class UserController extends ControllerBase
{

    public function indexAction()
    {
         die('list users');
//        $users = User::find();
//        $this->view->users = $users;
    }

    public function editAction($id)
    {
        die('edit user');

//        if (!$this->request->isPost()) {
//            $user = User::findFirstById($id);
//            if (!$user) {
//                $this->flash->error('User not found');
//                return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//            }
//
//            $user->setPassword('');
//            $this->view->setVar('id', $id);
//            $this->view->setVar('form', new UserForm($user, ['edit' => true]));
//        }
    }

    public function createAction()
    {

        $this->view->pick('user/form');

//        if (!$this->request->isPost()) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//        }
//
//        $form   = new UserForm;
//        $user   = new User;
//        $data   = $this->request->getPost();
//
//        if (!$form->isValid($data, $user)) {
//            foreach ($form->getMessages() as $message) {
//                $this->flash->error($message);
//            }
//            return $this->dispatcher->forward(["controller" => "user", "action" => "new" ]);
//        }
//
//        $password       = $this->request->getPost("password");
//        $user->password = $this->security->hash($password);
//
//        if($this->request->getPost("image") !== '') {
//            if($this->request->hasFiles()) {
//                foreach ($this->request->getUploadedFiles() as $file) {
//                    if($file->getName() != '') {
//                        if ($this->extensionCheck($file->getRealType())) {
//                            $random      = new Random();
//                            $uuid        = $random->uuid();
//                            $user->image = $uuid.'_'.$file->getName();
//
//                            $file->moveTo('img/uploads/'.$uuid.'_'.$file->getName());
//                        }
//                        else {
//                            $this->flash->error('This typ of file is not supported');
//
//                            return $this->dispatcher->forward(["controller" => "user", "action" => "new" ]);
//                        }
//                    }
//                    //there is no image uploading
//                }
//            }
//        }
//
//        if ($user->save() == false) {
//            foreach ($user->getMessages() as $message) {
//                $this->flash->error($message);
//            }
//            return $this->dispatcher->forward(["controller" => "user", "action" => "new" ]);
//        }
//
//        $form->clear();
//        $this->flash->success("User created");
//
//        return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
    }

    public function saveAction()
    {
        die('persist user');

//        if (!$this->request->isPost()) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//        }

//        $id     = $this->request->getPost("id", "int");
//        $user   = User::findFirstById($id);
//
//        if (!$user) {
//            $this->flash->error("User not found");
//            return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//        }
//        $currentPassword = $user->getPassword();
//
//        $form = new UserForm;
//        $this->view->setVar('form', $form);
//
//        if($this->request->getPost("password") !== '') {
//            $data = $this->request->getPost();
//
//            // @TODO on edit screen validation doesn't work
//            // if (!$form->isValid($data, $user)) {
//            //     foreach ($form->getMessages() as $message) {
//            //         $this->flash->error($message);
//            //     }
//            //     return $this->dispatcher->forward(["controller" => "user", "action" => "edit" , "params" => $id]);
//            // }
//
//            $password       = $this->request->getPost("password");
//            $user->password = $this->security->hash($password);
//        }
//        else {
//            $user->password = $currentPassword;
//        }
//
//        if($this->request->getPost("image") !== '') {
//            if($this->request->hasFiles()) {
//                foreach ($this->request->getUploadedFiles() as $file) {
//                    if($file->getName() != '') {
//                        if ($this->extensionCheck($file->getRealType())) {
//                            $random      = new Random();
//                            $uuid        = $random->uuid();
//                            $user->image = $uuid.'_'.$file->getName();
//
//                            $file->moveTo('img/uploads/'.$uuid.'_'.$file->getName());
//                        }
//                        else {
//                            $this->flash->error('This typ of file is not supported');
//
//                            return $this->dispatcher->forward(["controller" => "user", "action" => "edit" , "params" => $id]);
//                        }
//                    }
//                    //there is no image uploading
//                }
//            }
//        }
//
//        if ($user->save() == false) {
//            foreach ($user->getMessages() as $message) {
//                $this->flash->error($message);
//            }
//            return $this->dispatcher->forward(["controller" => "user", "action" => "edit" , "params" => $id]);
//        }
//
//        $form->clear();
//        $this->flash->success('User updated');
//
//        return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
    }

    public function deleteAction($id)
    {

        die('delete user');

//        $user = User::findFirstById($id);
//
//        if (!$user) {
//            $this->flash->error("User not found");
//
//            return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//        }
//        if (!$user->delete()) {
//            foreach ($user->getMessages() as $message) {
//                $this->flash->error($message);
//            }
//            return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
//        }
//
//        $this->flash->success("User deleted");
//        return $this->dispatcher->forward(["controller" => "user", "action" => "index" ]);
    }

}
