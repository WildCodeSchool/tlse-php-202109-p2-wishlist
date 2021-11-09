<?php

namespace App\Controller;

class SignUpController extends AbstractController
{
    /**
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     * @throws \Twig\Error\LoaderError
     */
    public function index(): string
    {
        session_start();
        return $this->twig->render('Signup/index.html.twig');
    }
}
