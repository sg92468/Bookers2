class UsersController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.page(params[:page]).reverse_order
    
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
  
end
