<?php

namespace App\Controller;

use App\Model\ArticleManager;
use App\Model\ItemManager;
use App\Model\ListModel;

class ItemController extends AbstractController
{
    /**
     * List items
     */
    public function index(): string
    {
        $itemManager = new ItemManager();
        $items = $itemManager->selectAll('title');

        return $this->twig->render('Item/index.html.twig', ['items' => $items]);
    }


    /**
     * Show informations for a specific item
     */
    public function show(int $id): string
    {
        $itemManager = new ItemManager();
        $item = $itemManager->selectOneById($id);

        return $this->twig->render('Item/show.html.twig', ['item' => $item]);
    }


    /**
     * Edit a specific item
     */
    public function edit(int $id): string
    {
        $itemManager = new ItemManager();
        $item = $itemManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $item = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $itemManager->update($item);
            header('Location: /items/show?id=' . $id);
        }

        return $this->twig->render('Item/edit.html.twig', [
            'item' => $item,
        ]);
    }


    /**
     * Add a new item
     */
    public function add(): string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['share_link'])) {
            $newList = new ListModel();
            $list = $newList->showByLinkShare($_GET['share_link']);
            $userLists = new ListModel();
            $lists = $userLists->showListsByUserId(intval($_SESSION['user']['id']));
            return $this->twig->render('Item/add.html.twig', [
                'list' => $list,
                'user' => $_SESSION['user'],
                'lists' => $lists
            ]);
        } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $_POST["is_gifted"] = "0";
            $insertArticle = new ArticleManager();
            $insertArticle->insertArticle($_POST);
            $newList = new ListModel();
            $list = $newList->showByLinkShare($_GET['share_link']);
            $userLists = new ListModel();
            $lists = $userLists->showListsByUserId(intval($_SESSION['user']['id']));
            return $this->twig->render('Item/add.html.twig', [
                'user' => $_SESSION['user'],
                'list' => $list,
                'lists' => $lists
            ]);
        }
        return $this->twig->render('Item/add.html.twig');
    }

    /**
     * Delete a specific item
     */
    public function delete()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $itemManager = new ItemManager();
            $itemManager->delete((int)$id);
            header('Location:/items');
        }
    }
}
