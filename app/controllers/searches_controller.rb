class SearchesController < ApplicationController
  include SearchesHelper

  def new
  end
  
  def advance_search
    @risk = search(params[:search]).order("project_id, created_at DESC")
  end

end
