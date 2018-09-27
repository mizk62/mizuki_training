class LikesController < ApplicationController

  before_action :set_post, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @posts = post.all
  end

  def destroy
    like = current_user.likes.find_by(post_id: params[:post_id])
    like.destroy
    @posts = post.all
  end

  private

  def set_post
    @post = post.find(params[:post_id])
  end
end
