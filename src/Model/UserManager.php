<?php

namespace App\Model;

class UserManager extends AbstractManager
{
    public const TABLE = 'user';

    public function createUser(array $user): int
    {
        $query = "INSERT INTO " . self::TABLE . " (`lastname`, `firstname`, `email`, `password`, `birthday`, `session`) 
        VALUES (:lastname, :firstname, :email, :password, :birthday, :session)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":lastname", $user["lastname"], \PDO::PARAM_STR);
        $statement->bindValue(":firstname", $user["firstname"], \PDO::PARAM_STR);
        $statement->bindValue(":email", $user["email"], \PDO::PARAM_STR);
        $statement->bindValue(":password", $user["password"], \PDO::PARAM_STR);
        $statement->bindValue(":birthday", $user["birthday"]);
        $statement->bindValue(":session", $user["session"], \PDO::PARAM_STR);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function updateUser(array $userModifications): int
    {
        $query = "UPDATE " . self::TABLE . " SET 
            `lastname` = :lastname, 
            `firstname` = :firstname, 
            `birthday` = :birthday
             WHERE `id` = :user_id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":lastname", $userModifications["lastname"], \PDO::PARAM_STR);
        $statement->bindValue(":firstname", $userModifications["firstname"], \PDO::PARAM_STR);
        $statement->bindValue(":birthday", $userModifications["birthday"]);
        $statement->bindValue(":user_id", intval($userModifications["user_id"]));
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function selectUserBySessionId($sessionId)
    {
        $query = "SELECT *  FROM " . static::TABLE . " WHERE `session` = :session_id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":session_id", $sessionId);
        $statement->execute();
        return $statement->fetch();
    }
}
