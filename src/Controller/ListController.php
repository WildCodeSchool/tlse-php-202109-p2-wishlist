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
        session_start();
        return $this->twig->render('List/index.html.twig');
    }

    /**
     * @return string
     * @throws RuntimeError
     * @throws SyntaxError
     * @throws LoaderError
     */
    public function share(): string
    {
        session_start();
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
        session_start();
        return $this->twig->render('List/add_list.html.twig');
    }

    public function user(): string
    {
        session_start();
        if (isset($_SESSION['user'])) {
            var_dump('je suis connecté');
        } else {
            header("Location: /login");
        }
        return $this->twig->render('List/lists.html.twig');
    }

    public function lists(): string
    {
        session_start();
        if (!isset($_SESSION['user'])) {
            header("Location: /login");
        }
        $userLists = new ListModel();
        $lists = $userLists->showListsByUserId(intval($_SESSION['user']['id']));
        return $this->twig->render('List/lists.html.twig', ["lists" => $lists]);
    }
}
