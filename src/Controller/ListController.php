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

    public function add(): string
    {
        $createList = new ListModel();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST["user_id"] = $_SESSION["user"]["id"];
            $createList->createList($_POST);
            return $this->twig->render('List/profile.html.twig');
        }
        return $this->twig->render('List/add_list.html.twig', ['user' => $_SESSION['user']]);
    }

    public function user(): string
    {
        if (isset($_SESSION['user'])) {
            header("Location: /list/user/lists");
        } else {
            header("Location: /login");
        }
        return $this->twig->render('List/lists.html.twig');
    }

    public function lists(): string
    {
        if (!isset($_SESSION['user'])) {
            header("Location: /login");
        }
        $userLists = new ListModel();
        $lists = $userLists->showListsByUserId(intval($_SESSION['user']['id']));
        return $this->twig->render('List/lists.html.twig', [
            'user' => $_SESSION['user'],
            "lists" => $lists
        ]);
    }
}
