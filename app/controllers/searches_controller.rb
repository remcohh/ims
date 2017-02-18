class SearchesController < ApplicationController
  include SearchesHelper

  def new
  end
  
  def create
    @risk = advance_search(params[:search])
    redirect_to searches_path_url
  end
  
  def result
  end
end
