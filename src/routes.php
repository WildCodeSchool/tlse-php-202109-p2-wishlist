<?php

// list of accessible routes of your application, add every new route here
// key : route to match
// values : 1. controller name
//          2. method name
//          3. (optional) array of query string keys to send as parameter to the method
// e.g route '/item/edit?id=1' will execute $itemController->edit(1)
return [
    '' => ['HomeController', 'index',],
    'list' => ['ListController', 'index',],
    'list/share' => ['ListController', 'share', ['share_link']],
    'list/user' => ['ListController', 'user',],
    'list/user/lists' => ['ListController', 'lists',],
    'list/user/lists/addList' => ['ListController', 'addList',],
    'list/user/lists/addArticle' => ['ListController', 'addArticle', ['listId']],
    'signup' => ['SignUpController', 'index',],
    'login' => ['LogInController', 'index',],
    'logout' => ['LogOutController', 'index',],

];
