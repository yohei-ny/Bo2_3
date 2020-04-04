class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@book = Book.new
  end
  def show
  	@book = Book.new
  end

  def edit
  end
  private
def user_params
params.require(:user).permit(:name, :introduction, :profile_image)
end
end
