class BooksController < ApplicationController
  def index
    @user = User.find([:id])
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end
  
  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @bookid = Book.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
