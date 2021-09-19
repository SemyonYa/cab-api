<?php

namespace app\controllers;

use app\models\Ctor;
use app\models\Filial;
use app\models\Image;

class PublicDataController extends PublicRestController
{

    public function actionInfo($id)
    {
        return [
            'license_path' => '',
            'license_thumb_path' => '',
            'price_path' => '',
            'filials' => Filial::findOne($id)
        ];
    }

    public function actionAbout()
    {
        return Ctor::find()->where(['tag' => 'about'])->one();
    }

    public function actionPersonal()
    {
        return Ctor::find()->where(['tag' => 'personal'])->all();
    }

    public function actionPositions()
    {
        return Ctor::find()->where(['tag' => 'position'])->all();
    }

    // TODO: Ctor component with type Galery
    public function actionGalery()
    {
        return Image::find()->all();
    }

    public function actionServices($region)
    {
        return Ctor::find()->where(['tag' => 'service', 'region' => $region])->all();
    }

    public function actionPrograms()
    {
        return Ctor::find()->where(['tag' => 'program'])->all();
    }

    public function actionArticles()
    {
        return Ctor::find()->where(['tag' => 'article'])->all();
    }

    public function actionArticle($id)
    {
        return Ctor::findOne($id);
    }
}
