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
    @ramens = Ramen.page(params[:page]).reverse_order
  end

  def show
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
      :shop_name, :image, :category_id, :parking_lot, :postal_code, :prefecture_name, :city, :street
      )
  end
end
