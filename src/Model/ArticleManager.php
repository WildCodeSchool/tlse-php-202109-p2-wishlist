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
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " ('name', 'market_link','picture','price','list_id') VALUES (:name, :market_link, :picture, :price, :list_id, :market_link)");
        $statement->bindValue('title', $article['title'], \PDO::PARAM_STR);
        $statement->bindValue('market_link', $article['market_link'], \PDO::PARAM_STR);
        $statement->bindValue('picture', $article['picture'], \PDO::PARAM_STR);
        $statement->bindValue('price', $article['price'], \PDO::PARAM_INT);
        $statement->bindValue('list_id', $article['list_id']);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    

}
