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

    public function insertArticle(array $article)
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE .
            " (`name`, `market_link`,`picture`, `description`, `price`, `is_gifted`, `list_id`) 
        VALUES (:name, :market_link, :picture, :description, :price, :is_gifted, :list_id)");
        $statement->bindValue(':name', $article['giftName'], \PDO::PARAM_STR);
        $statement->bindValue(':market_link', $article['giftLink'], \PDO::PARAM_STR);
        $statement->bindValue(':picture', $article['imgLink'], \PDO::PARAM_STR);
        $statement->bindValue(':description', $article['description'], \PDO::PARAM_STR);
        $statement->bindValue(':price', $article['price'], \PDO::PARAM_INT);
        $statement->bindValue(':is_gifted', $article['is_gifted']);
        $statement->bindValue(':list_id', $_GET['listId']);
        $statement->execute();
        return $this->pdo->lastInsertId();
    }

    public function updateArticleIsGiftedById(int $id): int
    {
        $isGifted = $this->selectOneById($id);
        $query = "UPDATE " . self::TABLE . " SET `is_gifted` = :is_gifted WHERE `id` = :id";
        $statement = $this->pdo->prepare($query);
        if (intval($isGifted["is_gifted"]) === 0) {
            $statement->bindValue(':is_gifted', 1);
        } else {
            $statement->bindValue(':is_gifted', 0);
        }
        $statement->bindValue(':id', $id, \PDO::PARAM_INT);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
