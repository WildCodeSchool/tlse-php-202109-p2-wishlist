<?php

namespace App\Controller;

class LogInController extends AbstractController
{

    /**
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     * @throws \Twig\Error\LoaderError
     */
    public function index(): string
    {
        return $this->twig->render('Login/index.html.twig');
    }
}
