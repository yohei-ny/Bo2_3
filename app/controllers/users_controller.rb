class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
    @user = current_user
    @book = Book.new
    @users = User.all  
  end
  def show
  	@book = Book.new
    @user =User.find(params[:id])
    @books =@user.books
    # @books = @user.books.page(params[:page]).reverse_order
  end
  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    else
    render :edit
    end
  end 

  def edit
    @user =User.find(params[:id])
render action: :show if @user != current_user  end
  private
def user_params
params.require(:user).permit(:name, :introduction, :profile_image)
end
def correct_user
    @user = User.find(params[:id])
  if @user.id != current_user.id
        redirect_to user_path
end
  end
end
