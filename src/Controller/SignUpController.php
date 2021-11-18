<?php

namespace App\Controller;

use App\Model\UserManager;

class SignUpController extends AbstractController
{

    public function index(): string
    {
        if (isset($_SESSION['user']) && isset($_SESSION['session_id'])) {
            header('Location: /list/user/lists');
        }
        if (session_status() !== PHP_SESSION_NONE) {
            session_regenerate_id(true);
            $_COOKIE['PHPSESSID'] = session_id();
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userConnection = new UserManager();
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
            header('Location: /login');
        }
        return $this->twig->render('Signup/index.html.twig');
    }
}
