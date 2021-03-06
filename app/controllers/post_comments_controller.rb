# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create
    @ramen = Ramen.find(params[:ramen_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.ramen_id = @ramen.id
    render 'error' unless @post_comment.save
  end

  def destroy
    @ramen = Ramen.find(params[:ramen_id])
    @post_comment = PostComment.find_by(id: params[:id])
    @post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
end
