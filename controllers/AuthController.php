<?php

namespace app\controllers;

use app\models\LoginView;
use Yii;
use yii\rest\Controller;
use yii\web\BadRequestHttpException;

class AuthController extends Controller
{
    public $enableCsrfValidation = false;

    public function behaviors()
    {
        return [
            'corsFilter' => [
                'class' => \yii\filters\Cors::class,
                'cors' => [
                    'Origin' => [
                        'http://localhost:4200',
                        'http://cab.injini.ru',
                    ],
                    'Access-Control-Allow-Origin' => true,
                    'Access-Control-Allow-Credentials' => true,
                    'Access-Control-Request-Method' => ['POST'],
                    'Access-Control-Allow-Headers' => ['Origin', 'Content-Type', 'X-Auth-Token', 'Authorization', 'x-compress']
                ],
            ],
        ];
    }

    public function actionLogin()
    {
        $request = Yii::$app->request;

        $login = $request->post('login');
        $password = $request->post('password');

        $login_view = new LoginView($login, $password);

        if ($login_view->validate()) {
            $token = $login_view->login();
            if ($token) {
                return $token;
            }
        }
        throw new BadRequestHttpException('Неверные имя пользователя / пароль');
    }
}
