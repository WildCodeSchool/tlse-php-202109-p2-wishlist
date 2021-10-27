<?php

namespace App\Model;

use _HumbugBox5ccdb2ccdb35\Nette\Utils\DateTime;

class ListModel extends AbstractManager
{
    public const TABLE = 'list';

    /**
     * @param array $list
     * @return int
     */
    public function createList(array $list): int
    {
        $userId = 1;
        $eventId = 1;

        $query = "INSERT INTO " . self::TABLE . " (`name`, `share_link`, `description`, `limit_date`, `creation_date`, 
        `user_id`, `event_id`) 
        VALUES (:name, :share_link, :description, :limit_date, :creation_date, :user_id, :event_id)";
        $date = new DateTime();
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":name", $list['name'], \PDO::PARAM_STR);
        $statement->bindValue(":share_link", $list['share_link'], \PDO::PARAM_INT);
        $statement->bindValue(":description", $list['description'], \PDO::PARAM_STR);
        $statement->bindValue(":limit_date", $list['limit_date'], \PDO::PARAM_STR);
        $statement->bindValue(":creation_date", $date);
        $statement->bindValue(":user_id", $userId);
        $statement->bindValue(":event_id", $eventId);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
