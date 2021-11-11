<?php

namespace App\Controller;

use App\Model\ListModel;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class ListController extends AbstractController
{
    /**
     * @return string
     * @throws LoaderError
     * @throws RuntimeError
     * @throws SyntaxError
     */
    public function index(): string
    {
        if (isset($_SESSION['user'])) {
            return $this->twig->render('List/index.html.twig', ['user' => $_SESSION['user']]);
        } else {
            return $this->twig->render('List/index.html.twig');
        }
    }

    /**
     * @return string
     * @throws RuntimeError
     * @throws SyntaxError
     * @throws LoaderError
     */
    public function share(): string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['share_link'])) {
            $newList = new ListModel();
            $list = $newList->showByLinkShare($_GET['share_link']);
            if (count($list) === 0) {
                header('Location: /');
            }
            return $this->twig->render('List/share.html.twig', [
                'list' => $list
            ]);
        }
        return $this->twig->render('List/index.html.twig');
    }

    public function addList(): string
    {
        $createList = new ListModel();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST["user_id"] = $_SESSION["user"]["id"];
            $createList->createList($_POST);
            header("Location: /list/user/lists");
        }
        return $this->twig->render('List/add_list.html.twig', ['user' => $_SESSION['user']]);
    }

    /**
     * @throws SyntaxError
     * @throws RuntimeError
     * @throws LoaderError
     */
    public function user(): string
    {
        if (isset($_SESSION['user'])) {
            header("Location: /list/user/lists");
        } else {
            header("Location: /login");
        }
        return $this->twig->render('List/lists.html.twig');
    }

    /**
     * @throws SyntaxError
     * @throws RuntimeError
     * @throws LoaderError
     */
    public function lists(): string
    {
        if (isset($_SESSION['user'])) {
            $userLists = new ListModel();
            $lists = $userLists->showListsByUserId(intval($_SESSION['user']['id']));
            return $this->twig->render('List/lists.html.twig', [
                'user' => $_SESSION['user'],
                "lists" => $lists
            ]);
        } else {
            header("Location: /login");
            return $this->twig->render('Login/index.html.twig');
        }
    }
}
