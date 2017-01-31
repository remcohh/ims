class RiskRegistersController < ApplicationController
  before_action :authorize
  before_action :only_sysadmin_and_risk_manager, only: [:approve]
  before_action :all_except_risk_viewer
  before_action :set_project
  before_action :check_current_user_project
  before_action :set_risk_register, only: [:show, :edit, :update, :destroy]
  before_action :check_risk_register_approved?, only: [:edit, :update, :destroy]
  
  # GET /risk_registers
  # GET /risk_registers.json
  def index #get unapproved list
    @risk_registers = @project.risk_registers.where(approved: false).search(params[:risk_no]).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def approved_list #get approved risk list
     @risk_registers = @project.risk_registers.where(approved: true, status: false).search(params[:risk_no]).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
  
  def completed_list #get completed risk list
    @risk_registers = @project.risk_registers.where(status: true, approved: true).search(params[:risk_no]).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  # GET /risk_registers/1
  # GET /risk_registers/1.json
  def show
  end

  # GET /risk_registers/new
  def new
    @risk_register = @project.risk_registers.build
  end

  # GET /risk_registers/1/edit
  def edit
  end

  # POST /risk_registers
  # POST /risk_registers.json
  def create
    @risk_register = @project.risk_registers.build(risk_register_params)
    @risk_register.created_by = current_user.id
    
    respond_to do |format|
      if @risk_register.save
        #RiskMailer.delay.send_risk_notification(@risk_register) #send email notification to mitigators
        RiskMailer.delay.send_notification_to_rm(@risk_register) if User.risk_manager_exist?(@project) #send email notification to project & corporate risk manager 
        
        format.html { redirect_to [@project, @risk_register], notice: "Risk with Risk No. #{@risk_register.risk_no} was successfully created." }
        format.json { render :show, status: :created, location: @risk_register }
      else
        format.html { render :new }
        format.json { render json: @risk_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risk_registers/1
  # PATCH/PUT /risk_registers/1.json
  def update
    @risk_register.updated_by = current_user.id
    
    respond_to do |format|
      if @risk_register.update(risk_register_params)
        #RiskMailer.delay.send_risk_reminder(@risk_register) #send email notification to mitigators
        
        format.html { redirect_to [@project, @risk_register], notice: "Risk with Risk No. #{@risk_register.risk_no} was successfully updated." }
        format.json { render :show, status: :ok, location: @risk_register }
      else
        format.html { render :edit }
        format.json { render json: @risk_register.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def approve
    @risk_register = @project.risk_registers.find(params[:risk_no])
    respond_to do |format|
      if @risk_register.update_attributes({approved: true, approved_by: current_user.id, approved_date: Date.today })
        RiskMailer.delay.send_risk_notification(@risk_register) #send email notification to mitigators
        format.html { 
          flash[:success] = "Risk with Risk No. #{@risk_register.risk_no} was successfully approved."
          redirect_to project_approved_list_url(@project)
        }
      else
        format.html { 
          flash[:danger] = "Couldn't approve Risk #{@risk_register.risk_no}. Please contact Corporate Risk Manager"
          redirect_to project_risk_registers_url(@project) 
        }
      end
    end
  end

  # DELETE /risk_registers/1
  # DELETE /risk_registers/1.json
  def destroy
    @risk_register.destroy
    respond_to do |format|
      format.html { redirect_to project_risk_registers_url, notice: 'Risk register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end
    
    def set_risk_register
      @risk_register = @project.risk_registers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_register_params
      params.require(:risk_register).permit(:responsible_officer, :probability, :impact, :description, :target_date, :status, :mitigation_plan, :category_ids => [], :user_ids => [])
    end
    
    #verify the project to which the current user belongs to
    def check_current_user_project
      if current_user.project.id != params[:project_id].to_i
        unless (sysadmin? || corporate_rm?)
          flash[:danger] = "You do not belong to #{@project.name} and hence you cannot access its risk register"
          redirect_to project_risk_registers_url(current_user.project) 
        end
      end
    end
    
    #check if risk_register has been approved  
    def check_risk_register_approved?
      if @risk_register.approved?
        flash[:danger] = "Risk No. #{@risk_register.risk_no} has already been Approved."
        redirect_to project_risk_registers_url(@project)
      end
    end
end
