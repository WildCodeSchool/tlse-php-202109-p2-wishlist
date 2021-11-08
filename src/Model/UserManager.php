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
}
