<?php

namespace App\Model;

class ArticleManager extends AbstractManager
{
    public const TABLE = 'article';


    /**
     * @param int $listId
     * @return array|false
     */
    public function showArticlesByListId(int $listId)
    {
        $query = 'SELECT * from ' . static::TABLE . " WHERE list_id = :list_id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":list_id", $listId, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }
}
