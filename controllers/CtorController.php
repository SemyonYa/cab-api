<?php

namespace app\controllers;

use app\models\Ctor;
use app\models\CtorItem;
use app\models\User;
use Exception;
use Throwable;
use Yii;
use yii\web\BadRequestHttpException;
use yii\web\HttpException;
use yii\web\ServerErrorHttpException;
use yii\web\UnprocessableEntityHttpException;

class CtorController extends RestController
{
    public $modelClass = 'app\models\User';

    public function actions()
    {
        $actions = parent::actions();

        unset($actions['create']);

        return $actions;
    }

    public function actionCreate()
    {

        try {
            $ctor = new Ctor();

            // $ctor->id = Yii::$app->request->post('id');
            $ctor->title = Yii::$app->request->post('title');
            $ctor->subtitle = Yii::$app->request->post('subtitle');
            $ctor->created_at = Yii::$app->request->post('created_at');
            $ctor->author_name = Yii::$app->request->post('author_name');
            $ctor->author_id = Yii::$app->request->post('author_id');
            $ctor->thumb_id = Yii::$app->request->post('thumb_id');
            $ctor->tag = Yii::$app->request->post('tag');
            $ctor->save();

            $ctor->items = [];
            $items = Yii::$app->request->post('items');
            for ($index = 0; $index < count($items); $index++) {
                $ctor_item = new CtorItem();
                // $ctor_item->id = $items[$index]['id'];
                $ctor_item->type = $items[$index]['type'];
                $ctor_item->value = $items[$index]['value'];
                $ctor_item->ctor_id = $ctor->id;
                $ctor_item->ordering = $index;
                $ctor_item->save();
            }

            return true;
        } catch (Throwable $th) {
            throw $th;
        }


        // throw new ServerErrorHttpException();
    }
}
