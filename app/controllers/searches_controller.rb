class SearchesController < ApplicationController
  def search
    @ramens = Ramen.search(params[:search])
    render "index"
  end
  
  #ここのindexは必要ない？
  def index
    @ramens = Ramen.search(params[:search])
  end

end
