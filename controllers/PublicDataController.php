<?php

namespace app\controllers;

use app\models\Ctor;

class PublicDataController extends PublicRestController
{

    public function actionInfo()
    {
        return ['info'];
    }

    public function actionPersonal()
    {
        return ['Personal'];
    }

    public function actionPositions()
    {
        return ['Positions'];
    }

    public function actionGalery()
    {
        return ['Galery'];
    }

    public function actionServices()
    {
        return ['Services'];
    }

    public function actionPrograms()
    {
        return ['Programs'];
    }

    public function actionArticles()
    {
        // $ctors = Ctor::find()->with('ctorItems')->all();
        // $response = [];

        // foreach ($ctors as $ctor) {
        //     $response[] = [
        //         $ctor,
        //         $ctor->ctorItems
        //     ];
        // }

        return Ctor::find()->all();
    }

    public function actionArticle($id)
    {
        // TODO: Lazy 
        $ctor = Ctor::find()->where(['id' => $id])->one();
        $items = $ctor->ctorItems;
        $ctor = $ctor->toArray();
        $ctor['items'] = $items;
        return $ctor;
    }
}
