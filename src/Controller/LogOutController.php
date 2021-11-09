<?php

namespace App\Controller;

use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class LogOutController extends AbstractController
{
    /**
     * Destroy session
     * @throws RuntimeError
     * @throws SyntaxError
     * @throws LoaderError
     */
    public function index()
    {
        session_start();
        session_destroy();
        header('Location: /login');
    }
}
