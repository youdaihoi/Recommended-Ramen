class PostCommentsController < ApplicationController
  def create
    @ramen = Ramen.find(params[:ramen_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.ramen_id = @ramen.id
    unless @post_comment.save
      render 'ramens/show'
    end
  end

  def destroy
    @ramen = Ramen.find(params[:ramen_id])
    @post_comment = PostComment.find_by(id: params[:id])
    @post_comment.destroy
    #redirect_to ramen_path(params[:ramen_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
end
