<?php

namespace App\Model;

class UserManager extends AbstractManager
{
    public function cleanUser(string $user): string
    {
        $user = trim($user);
        $user = stripslashes($user);
        $user = htmlspecialchars($user);
        return $user;
    }

    public function errorsForm(array $user): array
    {
        $errors = [];

        foreach ($user as $key => $data) {
            switch ($data) {
                case 'lastname':
                    $key = "lastname";
                    break;
                case 'firstname':
                    $key = "firstname";
                    break;
                case 'password':
                    $key = "mot de passe";
                    break;
                case 'birthday':
                    $key = "date de naissance";
                    break;
                case 'email':
                    $key = "email";
                    break;
                default:
                    break;
            }
            if (empty($data)) {
                $errors[$key] = "Le champ $key est requis";
            } elseif ($key === "email") {
                if (filter_var($data, FILTER_VALIDATE_EMAIL) === false) {
                    $errors[$key] = "Veuillez saisir une adresse mail valide";
                }
            }
        }
        return $errors;
    }

    public const TABLE = 'user';

    public function createUser(array $user): int
    {
        $password = $this->cleanUser($user['password']);
        $password = password_hash($password, PASSWORD_DEFAULT);
        $query = "INSERT INTO " . self::TABLE . " (`lastname`, `firstname`, `email`, `password`, `birthday`, `session`) 
        VALUES (:lastname, :firstname, :email, :password, :birthday, :session)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":lastname", $user["lastname"], \PDO::PARAM_STR);
        $statement->bindValue(":firstname", $user["firstname"], \PDO::PARAM_STR);
        $statement->bindValue(":email", $user["email"], \PDO::PARAM_STR);
        $statement->bindValue(":password", $password, \PDO::PARAM_STR);
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

    public function updateUserSession(array $sessionInfos)
    {
        $query = "UPDATE " . self::TABLE . " SET 
            `session` = :session_id,
             WHERE `id` = :user_id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":session_id", $sessionInfos["session_id"], \PDO::PARAM_STR);
        $statement->bindValue(":user_id", intval($sessionInfos["user_id"]), \PDO::PARAM_INT);
    }

    public function selectUserBySessionId($sessionId)
    {
        $query = "SELECT id, firstname, lastname, birthday FROM " . static::TABLE . " WHERE `session` = :session_id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":session_id", $sessionId);
        $statement->execute();
        return $statement->fetch();
    }

    public function checkUser($userInfos)
    {
        $passwordHash = $this->getPasswordHash($userInfos['email']);
        if (!$passwordHash) {
            return ['errorEmail' => "Aucun compte n'est associé à cette adresse email."];
        } else {
            $isRightPassword = password_verify($userInfos['password'], $passwordHash['password']);
        }
        if (!$isRightPassword) {
            return ['errorPassword' => "Le mot de passe est incorrect."];
        }
        $query = "SELECT id, firstname, lastname, birthday FROM " . static::TABLE . " 
        WHERE `email` = :email";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":email", $userInfos['email'], \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetch();
    }

    public function getPasswordHash(string $email)
    {
        $query = "SELECT password FROM " . static::TABLE . " WHERE `email` = :email";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":email", $email, \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetch();
    }
}
