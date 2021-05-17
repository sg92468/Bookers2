class BooksController < ApplicationController
  def index
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def show
    @book = Book.new
    @bookid = Book.find(params[:id])
    @user = @bookid.user
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
