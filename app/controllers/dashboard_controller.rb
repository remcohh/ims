class DashboardController < ApplicationController
  before_action :authorize
  def index
     @risk_registers =RiskRegister.where(probability:'High',impact:'High',status:false).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
  def critical_risks
   
  end 
  
end
