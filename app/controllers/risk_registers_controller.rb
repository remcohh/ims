class RiskRegistersController < ApplicationController
  before_action :authorize
  before_action :set_risk_register, only: [:show, :edit, :update, :destroy]

  # GET /risk_registers
  # GET /risk_registers.json
  def index
    @risk_registers = RiskRegister.all
  end

  # GET /risk_registers/1
  # GET /risk_registers/1.json
  def show
  end

  # GET /risk_registers/new
  def new
    @risk_register = RiskRegister.new
  end

  # GET /risk_registers/1/edit
  def edit
  end

  # POST /risk_registers
  # POST /risk_registers.json
  def create
    @risk_register = RiskRegister.new(risk_register_params)
    @risk_register.created_by = current_user.id
    
    respond_to do |format|
      if @risk_register.save
        format.html { redirect_to @risk_register, notice: 'Risk register was successfully created.' }
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
    respond_to do |format|
      if @risk_register.update(risk_register_params)
        format.html { redirect_to @risk_register, notice: 'Risk register was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk_register }
      else
        format.html { render :edit }
        format.json { render json: @risk_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_registers/1
  # DELETE /risk_registers/1.json
  def destroy
    @risk_register.destroy
    respond_to do |format|
      format.html { redirect_to risk_registers_url, notice: 'Risk register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_register
      @risk_register = RiskRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_register_params
      params.require(:risk_register).permit(:risk_no, :project_id, :description, :probability, :impact, :target_date, :status, :category_ids => [], :user_ids => [])
    end
end
