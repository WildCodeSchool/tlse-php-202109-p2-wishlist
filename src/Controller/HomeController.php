<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

class HomeController extends AbstractController
{
    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index(): string
    {
        if (isset($_SESSION['user'])) {
            return $this->twig->render('Home/index.html.twig', ['user' => $_SESSION['user']]);
        } else {
            return $this->twig->render('Home/index.html.twig');
        }
    }
}
