class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates :name,length: { minimum: 2, maximum: 20}
  validates :introduction,length: { maximum: 50}
# has_many :books,class_name: "Book",foreign_key: "user_id"
#ここでもrelationshipモデルをフォローとフォロワーに分けている
has_many :follower, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy# フォロー取得
#架空のモデルを作成
#くらすname:リレーションシップのモデルことだと
#foreign_key: "follower_id"と記述することでuser1.followerの記述でrelationshipテーブルのfollower_idにuser1のidが入ったレコードを引っ張れる
#follower_idにuserレコードのidが入る
has_many :followed, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy # フォロワー取得
has_many :following, through: :follower, source: :followed  # 自分がフォローしている人
#followingは今命名した架空のモデルであり、through: :followerは自分で命名した中間テーブルはrelationshipで設定したfollowerだよ
#source: :followedとあるが、これはrelationshipsテーブルのfollowedを参考にして、followingsモデルにアクセスしてね」って事です。
#真ん中にfolloewingの中間テーブル
# through: :follower,造られたモデルのもの、relationshipsと同じみたいなもの
# source: :followed ,架空のモデルのもの
has_many :followers, through: :followed, source: :follower # 自分がフォローされている人
# フォローする人(follower)は中間テーブル(Relationshipのfollower)を通じて(through)、フォローされる人(followed)と紐づく
# フォローされる人(followed) は中間テーブル(Relationshipのfollowed)を通じて(through)、 フォローする人(follower) と紐づく
# ユーザーをフォローする

include JpPrefecture
jp_prefecture :prefecture_code, method_name: :pref
def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
end
def prefecture_name=(prefecture)
  self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
end
# include JpPrefecture
# jp_prefecture :prefecture_code, method_name: :pref
 # t.string "post_code"
 #    t.string "address"
 #    t.string "prefecture"




def follow(user)
	follower.create(followed_id: user.id)
end
# ユーザーをアンフォローする
def unfollow(user)
    follower.find_by(followed_id: user.id).destroy
end
 # 現在のユーザーがフォローしてたらtrueを返す
def following?(user)
    following.include?(user)
end

end
