<?php
require_once '../vendor/autoload.php';

use App\Controller\PersonController;

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($uri === '/persons') {
    $controller = new PersonController();
    $controller->index();
    exit;
}

if ($uri === '/') {
    require 'views/home.php';
    exit;
}

?>
