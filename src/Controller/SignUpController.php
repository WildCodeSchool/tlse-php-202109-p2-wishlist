<?php

namespace App\Controller;

use App\Model\UserManager;

class SignUpController extends AbstractController
{

    public function index(): string
    {
        session_start();
        $userConnection = new UserManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $errors = $userConnection->errorsInForm($_POST);

            if (!empty($errors)) {
                return $this->twig->render('Signup/index.html.twig', ['errors' => $errors]);
            }

            foreach ($_POST as $key => $value) {
                $_POST[$key] = $userConnection->cleanUser($value);
            }
            $sessionId = session_id();
            $_POST['session'] = $sessionId;
            $userConnection->createUser($_POST);
            return $this->twig->render('List/lists.html.twig');
        }
        return $this->twig->render('Signup/index.html.twig');
    }
}
