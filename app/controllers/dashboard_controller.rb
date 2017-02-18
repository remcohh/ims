class DashboardController < ApplicationController
  before_action :authorize
  
  def index
  end
  
  def critical_risks
    @risk_registers = RiskRegister.project_wise(params[:project_id]).where(probability: 'High', impact: 'High', approved: true, status: false).order("project_id, created_at DESC")
    respond_to do |format|
      format.pdf do
        pdf = RiskReportPdf.new(@risk_registers, "Critical Risks")
        send_data pdf.render, filename: 'report.pdf', pdf: 'application/pdf',disposition: 'inline'
      end
      format.html do
        @risk_registers = @risk_registers.paginate(page: params[:page], per_page: 10)
      end
    end
  end
  
  def off_target_risks
    @risk_registers = RiskRegister.project_wise(params[:project_id]).where(['approved=? AND status=? AND target_date < ?', true, false, Date.today]).order("project_id, created_at DESC")
    respond_to do |format|
      format.pdf do
        pdf = RiskReportPdf.new(@risk_registers, "Off Target Risks")
        send_data pdf.render, filename: 'report.pdf', pdf: 'application/pdf',disposition: 'inline'
      end
      format.html do
        @risk_registers = @risk_registers.paginate(page: params[:page], per_page: 10)
      end
    end
  end
  
  def report
    respond_to do |format|
      format.pdf do
        if(params[:status] == '1')
          @risk_registers = RiskRegister.where(approved: true, status: true).order("project_id, created_at DESC")
          pdf = RiskReportPdf.new(@risk_registers, "Completed Risks List")
        end
        if(params[:status] == '0')
          @risk_registers = RiskRegister.where(approved: true, status: false).order("project_id, created_at DESC")
          pdf = RiskReportPdf.new(@risk_registers, "Pending Risks List")
        end
        send_data pdf.render, filename: 'report.pdf', pdf: 'application/pdf',disposition: 'inline'
      end
      format.html
    end
  end
  
  def show_risk
    @risk_register = RiskRegister.find(params[:risk_no])
  end
end
