class FavoritesController < ApplicationController
  before_action :book_params
  
  def create
    Favorite.create(user_id: current_user.id, book_id: @book.id)
  end
  
  def destroy
    Favorite.find_by(user_id: current_user.id, book_id: @book.id).destroy
  end
  
  private
  
  def book_params
    @book = Book.find(params[:book_id])
  end
  
  
end
