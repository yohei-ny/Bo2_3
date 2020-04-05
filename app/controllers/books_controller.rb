class BooksController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
  	@book =Book.new
    @books =Book.all
    @user =current_user
  end
  def create
  	@book =Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	redirect_to book_path(@book)
  else
    @user =current_user
    @books =Book.all
  	render :index
  end
end
  def show
  	@book = Book.new
  	@bookd =Book.find(params[:id])
  	@user =@bookd.user

  end

  def edit
  	@book =Book.find(params[:id])
  end
  def update
  	@book =Book.find(params[:id])
  	if @book.update(book_params)
  	   redirect_to book_path(@book)
  	else
  		render :edit
  end
end
  private
def book_params
params.require(:book).permit(:title, :body,:user_id)
end
def correct_user
	@book =Book.find(params[:id])
  if @book.user != current_user
      redirect_to books_path
    end
    end
end
