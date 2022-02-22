class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ramens = @user.ramens.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @ramen = User.find(params[:id])
    @ramen.user_id = current_user.id
    if @ramen.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
