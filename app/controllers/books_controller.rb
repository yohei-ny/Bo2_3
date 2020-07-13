class BooksController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
    @books =Book.page(params[:page]).reverse_order
    @book =Book.new
    @user =current_user
  end
  def create
  	@book =Book.new(book_params)
  	@book.user = current_user
    @user =current_user
  	if @book.save
      flash[:notice] = 'successfully'
  	redirect_to book_path(@book)
  else
    @books =Book.page(params[:page]).reverse_order
  	render :index
  end
end
  def show
    @book = Book.new
  	@mybook =Book.find(params[:id])
    @user =@mybook.user
    end

  def edit
  	@book =Book.find(params[:id])

  end
  def update
  	@book =Book.find(params[:id])
  	if @book.update(book_params)
  	   redirect_to book_path(@book)
       flash[:notice] = 'successfully'
  	else
      @user =current_user
  		render :edit
  end
end
def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path #リダイレクトするときは_urlを使用する。それ以外は_pathを使う。
  end
  private
def book_params
params.require(:book).permit(:title, :body)
end
def correct_user
	@book =Book.find(params[:id])
  if @book.user != current_user
      redirect_to books_path
    end
    end
end
