class CommentsController < ApplicationController
  
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}" 
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    redirect_to posts_path, notice: "コメントを削除しました。" 
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
