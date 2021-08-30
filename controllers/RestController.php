<?php

namespace app\controllers;

use Yii;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class RestController extends ActiveController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $auth = $behaviors['authenticator'];
        // $behaviors['authenticator'] = ['class' => HttpBearerAuth::class];
        // $controllersWithoutBearer = ['auth'];
        // if (in_array(Yii::$app->controller->id, $controllersWithoutBearer)) {
        //     $behaviors['authenticator'] = $auth;
        // }

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::class,
            'cors' => [
                'Origin' => ['http://localhost:4200'],
                'Access-Control-Allow-Origin' => true,
                'Access-Control-Allow-Credentials' => true,
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Allow-Headers' => ['Origin', 'Content-Type', 'Authorization', 'x-compress']
            ],
        ];

        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['options'];

        return $behaviors;
    }

    public function checkAccess($action, $model = null, $params = [])
    {
    }
}
