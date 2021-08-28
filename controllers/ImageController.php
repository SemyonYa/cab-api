<?php

namespace app\controllers;

use app\models\Image;
use app\models\UploadForm;
use Throwable;
use Yii;
use yii\helpers\FileHelper;
use yii\rest\ActiveController;
use yii\web\UploadedFile;

class ImageController extends ActiveController
{
    public $modelClass = 'app\models\Image';
    public $enableCsrfValidation = false;

    public function actions()
    {
        $actions = parent::actions();

        unset($actions['create'], $actions['update']);

        return $actions;
    }

    public function actionCreate()
    {
        // $model = new UploadForm();

        // if (Yii::$app->request->isPost) {
        //     $model->file = UploadedFile::getInstance($model, 'data');
        //     if ($model->upload()) {
        //         // file is uploaded successfully
        //         return;
        //     }
        // }

        // return $this->render('upload', ['model' => $model]);
        $qwe = Yii::$app->request->post('data');
        return $qwe;
        // try {
        //     $model = new UploadForm();
        //     return $model;
        //     $model->file = UploadedFile::getInstances($model, 'file');
        //     if ($model->validate()) {
        //         $path = Yii::getAlias('@webroot/images/');
        //         FileHelper::createDirectory($path);
        //         $name = Yii::$app->security->generateRandomString(20) . '.' . $model->file->extension;
        //         $model->file->saveAs($path . $name);
        //         $image = new Image($name);
        //         if ($image->save()) {
        //             return $image->name;
        //         }
        //     }
        // } catch (Throwable $th) {
        //     throw $th;
        // }


        // $names = $_FILES['image']['name'];
        // $tmp_names = $_FILES['image']['tmp_name'];
        // $images = [];
        // for ($i = 0; $i < count($names); $i++) {
        //     $image = new Image();
        //     $image->upload($names[$i], $tmp_names[$i]);
        //     if ($image->save()) {
        //         $images[] = $image;
        //     }
        // }
        // return $images;
    }
}
