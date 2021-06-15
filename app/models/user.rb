class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_mail
  #createされた後に次のメソッドを読み出す
  def send_welcome_mail
    ThankMailer.welcome_email(self).deliver_now
  end


  
  attachment :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates :name,length: { minimum: 2, maximum: 20}
  validates :introduction,length: { maximum: 50}

  has_many :user_rooms
  has_many :chats




has_many :follower, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy# フォロー取得
#follower_id を参照するモデルの作成 

                            
#foreign_key: "follower_id"と記述することでuser1.followerの記述でrelationshipテーブルのfollower_idにuser1のidが入ったレコードを引っ張れる
has_many :followed, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy # フォロワー取得


has_many :following, through: :follower, source: :followed  #followedモデルを参照

has_many :followers, through: :followed, source: :follower # 自分がフォローされている人

include JpPrefecture
jp_prefecture :prefecture_code
def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
end

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
