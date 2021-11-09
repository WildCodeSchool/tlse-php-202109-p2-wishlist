<?php

namespace App\Controller;

use App\Model\UserManager;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class LogInController extends AbstractController
{

    /**
     * @throws RuntimeError
     * @throws SyntaxError
     * @throws LoaderError
     */
    public function index(): string
    {
        session_start();
        if (isset($_SESSION['user']) && isset($_SESSION['session_id'])) {
            header('Location: /');
        }
        if ($_SERVER['REQUEST_METHOD'] === "POST") {
            $_POST = array_map('trim', $_POST);
            $email = $_POST['email'];
            $password = $_POST['password'];
            $errorEmail = $this->checkInputEmail($email);
            $errorPassword = $this->checkInputPassword($password);
            if (!empty($errorEmail) || !empty($errorPassword)) {
                return $this->twig->render('Login/index.html.twig', [
                    'errorEmail' => $errorEmail,
                    'errorPassword' => $errorPassword
                ]);
            } else {
                $userInfos = [
                    'email' => $email,
                    'password' => $password
                ];
                $newUser = new UserManager();
                $user = $newUser->checkUser($userInfos);
                if (count($user) > 1) {
                    $sessionId = session_id();
                    $sessionInfos = [
                        'user_id' => $user["id"],
                        'session_id' => $sessionId
                    ];
                    $newUser->updateUserSession($sessionInfos);
                    $_SESSION["user"] = $user;
                    $_SESSION['session_id'] = $sessionId;
                    header("Location: /list");
                } elseif (isset($user['errorEmail'])) {
                    return $this->twig->render('Login/index.html.twig', [
                        'errorEmail' => $user['errorEmail'],
                    ]);
                } elseif (isset($user['errorPassword'])) {
                    return $this->twig->render('Login/index.html.twig', [
                        'errorPassword' => $user['errorPassword'],
                    ]);
                } else {
                    return $this->twig->render('Login/index.html.twig', [
                        'errorUser' => "Cet utilisateur n'existe pas",
                    ]);
                }
            }
        }
        return $this->twig->render('Login/index.html.twig');
    }

    /**
     * check the email for DB query
     * @param string $email
     * @return array
     */
    private function checkInputEmail(string $email): array
    {
        $errorEmail = [];
        if (empty($email)) {
            $errorEmail[] = "Vous devez saisir une adresse mail.";
        } elseif (mb_strlen($email) > 100) {
            $errorEmail[] = "Votre email ne doit pas dépasser 100 caractères.";
        } elseif (!filter_var($email, FILTER_SANITIZE_EMAIL)) {
            $errorEmail[] = "Vous devez saisir une adresse mail valide.";
        }
        return $errorEmail;
    }

    /**
     * check the password for DB query
     * @param string $password
     * @return array
     */
    private function checkInputPassword(string $password): array
    {
        $errorPassword = [];
        if (empty($password)) {
            $errorPassword[] = "Vous devez saisir un mot de passe.";
        } elseif (mb_strlen($password) > 70) {
            $errorPassword[] = "Votre mot de passe ne doit pas dépasser 100 caractères.";
        }
        return $errorPassword;
    }
}
