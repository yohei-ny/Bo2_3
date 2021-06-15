class RelationshipsController < ApplicationController

def create
	@user =User.find(params[:user_id])
	# binding.pry
	current_user.follow(@user)
	redirect_to request.referer
end
def destroy
	@user =User.find(params[:user_id])
	current_user.unfollow(@user)
  redirect_to request.referer
end
def follower
	@user =User.find(params[:user_id])
	@users =@user.following.page(params[:page]).reverse_order
end
def followed
	@user =User.find(params[:user_id])
	@users =@user.followers.page(params[:page]).reverse_order
end
private

end
