# frozen_string_literal: true

class RamensController < ApplicationController
  def new
    @ramen = Ramen.new
  end

  def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_id = current_user.id
    if @ramen.save
      redirect_to ramens_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @ramens = Ramen.where(category_id: @category.id).page(params[:page]).per(6).reverse_order
    else
      @ramens = Ramen.page(params[:page]).per(6).reverse_order
    end
  end

  def show
    @categories = Category.all
    @ramen = Ramen.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @ramen = Ramen.find(params[:id])
    @ramen.destroy
    redirect_to ramens_path
  end

  private

  def ramen_params
    params.require(:ramen).permit(
      :shop_name, :image, :category_id, :parking_lot, :postal_code, :prefecture_code, :city, :street
    )
  end
end
