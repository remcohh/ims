class DashboardController < ApplicationController
  before_action :authorize
  def index
     @risk_registers = RiskRegister.project_wise(params[:project_id]).where(probability: 'High',impact: 'High',status: false).order("project_id, created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show_risk
    @risk_register = RiskRegister.find(params[:risk_no])
  end
end
