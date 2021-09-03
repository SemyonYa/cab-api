<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "filial".
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property string $code
 * @property string $emails
 * @property string $phones
 * @property string $addresses
 */
class Filial extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'filial';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name', 'description', 'code', 'emails', 'phones', 'addresses'], 'required'],
            [['id'], 'integer'],
            [['description', 'emails', 'phones', 'addresses'], 'string'],
            [['name'], 'string', 'max' => 100],
            [['code'], 'string', 'max' => 20],
            [['id'], 'unique'],
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
            'description' => 'Description',
            'code' => 'Code',
            'emails' => 'Emails',
            'phones' => 'Phones',
            'addresses' => 'Addresses',
        ];
    }
}
