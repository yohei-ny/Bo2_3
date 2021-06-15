class ChatsController < ApplicationController
  def index
    @user=User.find_by(id: params[:user_id])
    rooms = current_user.user_rooms.pluck(:room_id)
    #user_idが@user　且つ　room_idが上で取得したrooms配列の中にある数値のもののみ取得(1個または0個のはずです)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

      if user_rooms.nil?
        @room =Room.new
        @room.save
        UserRoom.create(user_id: @user.id, room_id: @room.id)
        UserRoom.create(user_id: current_user.id, room_id: @room.id)
      else
        @room =user_rooms.room
      end      
    @chats =@room.chats 
    end
  def create
    @chat =current_user.chats.new(chat_params)
    @chat.save
  end
  private
  def chat_params
  params.require(:chat).permit(:message,:user_id,:room_id)
  end
end
