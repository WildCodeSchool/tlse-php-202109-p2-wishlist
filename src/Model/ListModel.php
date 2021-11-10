<?php

namespace App\Model;

class ListModel extends AbstractManager
{
    public const TABLE = 'list';

    /**
     * @param array $list
     * @return int
     */
    public function createList(array $list): int
    {
        $query = "INSERT INTO " . self::TABLE . " (`name`, `share_link`, `description`, `limit_date`, `creation_date`, 
        `user_id`, `event_id`) 
        VALUES (:name, :share_link, :description, :limit_date, NOW(), :user_id, :event_id)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":name", $list['name'], \PDO::PARAM_STR);
        $statement->bindValue(":share_link", $this->createShareLink(), \PDO::PARAM_INT);
        $statement->bindValue(":description", $list['description'], \PDO::PARAM_STR);
        $statement->bindValue(":limit_date", $list['limit_date'], \PDO::PARAM_STR);
        $statement->bindValue(":user_id", $list["user_id"]);
        $statement->bindValue(":event_id", $list["event_id"]);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function showByLinkShare(int $linkShare)
    {
        $query = "SELECT article.name AS aname, article.market_link, article.picture, article.price, article.is_gifted,
                article.description AS adescription, list.name AS lname, event.name AS ename,
                list.description AS ldescription, list.limit_date
                FROM article
                JOIN list ON list.id = article.list_id
                JOIN event ON event.id = list.event_id 
                WHERE list.share_link = :share_link";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('share_link', $linkShare, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }

    /**
     * @return int
     */
    private function createShareLink(): int
    {
        $strNumber = "";
        for ($i = 0; $i < 5; $i++) {
            $strNumber .= rand(0, 10);
        }
        return intval($strNumber);
    }

    public function showListsByUserId(int $userId)
    {
        $queryList = "SELECT l.id AS lid
                FROM list l 
                JOIN user u ON u.id = l.user_id
                WHERE u.id = :user_id";
        $statement = $this->pdo->prepare($queryList);
        $statement->bindValue('user_id', $userId, \PDO::PARAM_INT);
        $statement->execute();
        $listsId = $statement->fetchAll();

        $lists = [];
        foreach ($listsId as $list) {
            $query = "SELECT l.id AS lid, a.name AS aname, a.is_gifted, u.id, u.lastname, u.firstname, u.birthday, 
                l.name AS lname, e.name AS ename, l.description AS ldescription, l.limit_date
                FROM user u
                JOIN list l ON u.id = l.user_id
                JOIN event e ON e.id = l.event_id
                JOIN article a ON l.id = a.list_id
                WHERE l.id = :list_id";
            $statement = $this->pdo->prepare($query);
            $statement->bindValue('list_id', intval($list['lid']), \PDO::PARAM_INT);
            $statement->execute();
            $lists[] = $statement->fetchAll();
        }
        return $lists;
    }
}
