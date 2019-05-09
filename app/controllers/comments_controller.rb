class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
  
 private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end
