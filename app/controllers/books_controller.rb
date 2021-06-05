class BooksController < ApplicationController
  def index
    @book_new = Book.new
    @user = current_user
    @book = Book.page(params[:page]).reverse_order
  end
  
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book_new.id)
    else
      @user = current_user
      @book = Book.page(params[:page]).reverse_order
      render :index
    end
  end
  
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @comment = Comment.new
    @comments = @book.comments.order(created_at: :desc)
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
