class RamensController < ApplicationController

  def new
    @ramen = Ramen.new
  end

  def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_id = current_user.id
    @ramen.save
    redirect_to ramens_path
  end

  def index
    @ramens = Ramen.all
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
    params.require(:ramen).permit(:shop_name, :image, :address, :category, :parking_lot)
  end
end
