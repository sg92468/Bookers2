class UsersController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @book = Book.new
    @users = User.page(params[:page]).reverse_order
    
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
    
  end
  
  def edit
  end
  
  def update
  end
  
end
