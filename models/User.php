<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property string $name
 * @property string $login
 * @property string $role
 * @property int $age
 * @property string $birth
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'login', 'age', 'birth'], 'required'],
            [['role'], 'string'],
            [['age'], 'integer'],
            [['birth'], 'safe'],
            [['name'], 'string', 'max' => 100],
            [['login'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'login' => 'Login',
            'role' => 'Role',
            'age' => 'Age',
            'birth' => 'Birth',
        ];
    }
}
