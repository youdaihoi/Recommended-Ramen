# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    @ramens = Ramen.search(params[:search]).page(params[:page]).per(6).reverse_order
    @categories = Category.all
    render 'index'
  end
end
