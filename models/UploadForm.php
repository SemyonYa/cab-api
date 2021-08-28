<?php

namespace app\models;

use ErrorException;
use Yii;
use yii\base\Model;
use yii\helpers\FileHelper;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $file;

    public function rules()
    {
        return [
            // [['file'], 'safe'],
            [['file'], 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg'],
        ];
    }

    public function upload()
    {
        try {
            if ($this->validate()) {
                $path = Yii::getAlias('@webroot/images/');
                FileHelper::createDirectory($path);
                $name = Yii::$app->security->generateRandomString(20) . '.' . $this->file->extension;
                $this->file->saveAs($path . $name);
                return true;
            } else {
                var_dump($this->getErrors());
                return false;
            }
        } catch (ErrorException $e) {
            var_dump($e->getMessage());
        }
    }
}
