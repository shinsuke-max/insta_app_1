class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @comment = Comment.new(comment_params)
    @micropost = @comment.micropost
    if @comment.save
      flash[:success] = "Comment Created!!!"
      redirect_to root_url
    else
      flash[:alert] = "Failed comment posted"
    end
  end
  
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @micropost = @comment.micropost
    if @comment.destroy
      flash[:success] = "Comment deleted"
      redirect_to request.referrer || root_url
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :micropost_id, :comment)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
