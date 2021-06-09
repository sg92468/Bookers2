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
    @day_quotient = @books.created_today.count / @books.created_yesterday.count rescue 0
    @count_2_week = @books.created_2_week_sum.count - @books.created_1_week.count
    @count_1_week = @books.created_1_week.count
    @week_quotient = @count_1_week / @count_2_week rescue 0
    @search_params = book_search_params
    if @search_params[:date] != nil
      @search_books = @books.search(@search_params)
    end
    
  end
  
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following_user
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end
 

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_search_params
    params.fetch(:search, {}).permit(:date)
  end
  
end
