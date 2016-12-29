class RiskResponsibilitiesController < ApplicationController
  before_action :authorize
  before_action :set_risk_responsibility, only: [:show, :edit, :update, :destroy]

  # GET /risk_responsibilities
  # GET /risk_responsibilities.json
  def index
    @risk_responsibilities = RiskResponsibility.all
  end

  # GET /risk_responsibilities/1
  # GET /risk_responsibilities/1.json
  def show
  end

  # GET /risk_responsibilities/new
  def new
    @risk_responsibility = RiskResponsibility.new
  end

  # GET /risk_responsibilities/1/edit
  def edit
  end

  # POST /risk_responsibilities
  # POST /risk_responsibilities.json
  def create
    @risk_responsibility = RiskResponsibility.new(risk_responsibility_params)

    respond_to do |format|
      if @risk_responsibility.save
        format.html { redirect_to @risk_responsibility, notice: 'Risk responsibility was successfully created.' }
        format.json { render :show, status: :created, location: @risk_responsibility }
      else
        format.html { render :new }
        format.json { render json: @risk_responsibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risk_responsibilities/1
  # PATCH/PUT /risk_responsibilities/1.json
  def update
    respond_to do |format|
      if @risk_responsibility.update(risk_responsibility_params)
        format.html { redirect_to @risk_responsibility, notice: 'Risk responsibility was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk_responsibility }
      else
        format.html { render :edit }
        format.json { render json: @risk_responsibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_responsibilities/1
  # DELETE /risk_responsibilities/1.json
  def destroy
    @risk_responsibility.destroy
    respond_to do |format|
      format.html { redirect_to risk_responsibilities_url, notice: 'Risk responsibility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_responsibility
      @risk_responsibility = RiskResponsibility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_responsibility_params
      params.require(:risk_responsibility).permit(:risk_register_id, :user_id)
    end
end
