<?php

namespace app\controllers;

use app\models\User;
use Exception;
use Yii;
use yii\web\BadRequestHttpException;
use yii\web\HttpException;
use yii\web\ServerErrorHttpException;
use yii\web\UnprocessableEntityHttpException;

class UserController extends RestController
{
    public $modelClass = 'app\models\User';

    public function actions()
    {
        $actions = parent::actions();

        // unset($actions['create']);

        return $actions;
    }

    public function actionCreate()
    {
        $user = new User();

        $user->first_name = Yii::$app->request->post('first_name');
        $user->last_name = Yii::$app->request->post('last_name');
        $user->login = Yii::$app->request->post('login');
        $user->role = Yii::$app->request->post('role');
        $user->birth = Yii::$app->request->post('birth');
        $user->activated = Yii::$app->request->post('activated');
        $user->password_hash = Yii::$app->security->generatePasswordHash('90-=op[]');

        if ($user->validate()) {
            if ($user->save()) {
                return $user;
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return [$user->errors];
        }
        throw new ServerErrorHttpException();
    }
}
