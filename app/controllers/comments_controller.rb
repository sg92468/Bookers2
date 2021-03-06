class CommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    @comment.save
    
    @comments = @book.comments.order(created_at: :desc)
    
  end
  
  def destroy
    Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find(params[:book_id])
    @comments = @book.comments.order(created_at: :desc)
    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
