<?php

namespace App\Controller;

class LogOutController extends AbstractController
{
    /**
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     * @throws \Twig\Error\LoaderError
     */
    public function index()
    {
        session_start();
        session_destroy();
        header('Location: /login');
    }
}
