class SearchesController < ApplicationController
  def search
    @ramens = Ramen.search(params[:search])
    @categories = Category.all
    render "index"
  end

end
