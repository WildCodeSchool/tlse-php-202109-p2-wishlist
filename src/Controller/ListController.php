<?php

namespace App\Controller;

use App\Model\ArticleManager;
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
            header("Location: /list/user/lists");
        } else {
            $userLists = new ListModel();
            $lists = $userLists->showListsByUserId(1);
            return $this->twig->render('List/index.html.twig', [
                'lists' => $lists,
            ]);
        }
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
        if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['share_link'])) {
            $newList = new ListModel();
            $list = $newList->showByLinkShare($_GET['share_link']);
            if (count($list) === 0) {
                header('Location: /');
            }

            if (isset($_GET['article_id'])) {
                $newArticle = new ArticleManager();
                $newArticle->updateArticleIsGiftedById($_GET['article_id']);
                $list = $newList->showByLinkShare($_GET['share_link']);
                return $this->twig->render('List/share.html.twig', [
                    'list' => $list
                ]);
            }

            return $this->twig->render('List/share.html.twig', [
                'list' => $list
            ]);
        }
        return $this->twig->render('List/index.html.twig');
    }

    /**
     * @throws SyntaxError
     * @throws RuntimeError
     * @throws LoaderError
     */
    public function addList(): string
    {
        if (!isset($_SESSION['user'])) {
            header("Location: /login?notConnected=Tu n'es pas connecté");
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $createList = new ListModel();
            $_POST["user_id"] = $_SESSION["user"]["id"];
            $createList->createList($_POST);
            header("Location: /list/user/lists/");
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
            header("Location: /login?notConnected=Tu n'es pas connecté");
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
            $events = [
                "Mariage" => "wedding",
                "Anniversaire" => "birthday",
                "Crémaillère" => "rack",
                "Fêtes religieuses" => "christmas",
                "Fête Prénatale" => "baby_shower",
                "Autre" => "other"
            ];
            return $this->twig->render('List/lists.html.twig', [
                'user' => $_SESSION['user'],
                'lists' => $lists,
                'events' => $events,
            ]);
        } else {
            header("Location: /login?notConnected=Tu n'es pas connecté");
            return $this->twig->render('Login/index.html.twig');
        }
    }

    public function addArticle()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['listId'])) {
            $newList = new ArticleManager();
            $list = $newList->showArticlesByListId($_GET['listId']);
            $userLists = new ListModel();
            $lists = $userLists->selectOneById($_GET['listId']);
            return $this->twig->render('List/add_article.html.twig', [
                'list' => $list,
                'user' => $_SESSION['user']['id'],
                'lists' => $lists,

            ]);
        } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST["is_gifted"] = "0";
            $insertArticle = new ArticleManager();
            $insertArticle->insertArticle($_POST);
            $newList = new ArticleManager();
            $list = $newList->showArticlesByListId($_GET['listId']);
            $userLists = new ListModel();
            $lists = $userLists->selectOneById($_GET['listId']);
            return $this->twig->render('List/add_article.html.twig', [
                'user' => $_SESSION['user']['id'],
                'list' => $list,
                'lists' => $lists
            ]);
        }
        header("Location: /login?notConnected=Tu n'es pas connecté");
    }
}
