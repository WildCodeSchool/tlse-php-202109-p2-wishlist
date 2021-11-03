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
        $query = "SELECT * FROM " . static::TABLE . " WHERE share_link = :share_link";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue('share_link', $linkShare, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
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
}
