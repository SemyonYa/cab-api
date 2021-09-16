<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ctor".
 *
 * @property int $id
 * @property string $title
 * @property string $subtitle
 * @property string $created_at
 * @property string $author_name
 * @property int $author_id
 * @property int $thumb_id
 * @property string|null $tag
 *
 * @property User $author
 * @property CtorItem[] $ctorItems
 * @property Image $thumb
 */
class Ctor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ctor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'subtitle', 'created_at', 'author_name', 'author_id', 'thumb_id'], 'required'],
            [['title', 'subtitle'], 'string'],
            [['created_at'], 'safe'],
            [['author_id', 'thumb_id'], 'integer'],
            [['author_name'], 'string', 'max' => 200],
            [['tag'], 'string', 'max' => 50],
            [['author_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['author_id' => 'id']],
            [['thumb_id'], 'exist', 'skipOnError' => true, 'targetClass' => Image::className(), 'targetAttribute' => ['thumb_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'subtitle' => 'Subtitle',
            'created_at' => 'Created At',
            'author_name' => 'Author Name',
            'author_id' => 'Author ID',
            'thumb_id' => 'Thumb ID',
            'tag' => 'Tag',
        ];
    }

    /**
     * Gets query for [[Author]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'author_id']);
    }

    /**
     * Gets query for [[CtorItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCtorItems()
    {
        return $this->hasMany(CtorItem::className(), ['ctor_id' => 'id']);
    }

    /**
     * Gets query for [[Thumb]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getThumb()
    {
        return $this->hasOne(Image::className(), ['id' => 'thumb_id']);
    }

    // public function getImagePath()
    // {
    //     if ($image = Image::findOne($this->thumb_id)) {
    //         return $image->
    //     }
    //     // return $this->hasOne(Image::className(), ['id' => 'thumb_id']);
    // }

    public function fields()
    {
        return array_merge(parent::fields(), ['ctorItems', 'thumb']);
    }
}
