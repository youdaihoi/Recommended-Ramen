# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @ramens = @user.ramens.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
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
