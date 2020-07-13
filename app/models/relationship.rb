class Relationship < ApplicationRecord
 belongs_to :follower, class_name: "User"
 			#架空のモデル,#フォローする人
 belongs_to :followed, class_name: "User"
 			#架空ののモデル,フォローされる人が存在します

 			#userを二つに分けている
 			#フォローする人
 			#フォローされる人が存在します

end
