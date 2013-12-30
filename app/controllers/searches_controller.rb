class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  
  def create
    @search = current_user.searches.create!(params[:search])
    @search.user_id = current_user.id if current_user
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
  end

end



