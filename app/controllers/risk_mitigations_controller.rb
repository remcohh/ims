class RiskMitigationsController < ApplicationController
  before_action :set_risk_mitigation, only: [:show, :edit, :update, :destroy]

  # GET /risk_mitigations
  # GET /risk_mitigations.json
  def index
    @risk_mitigations = RiskMitigation.all
  end

  # GET /risk_mitigations/1
  # GET /risk_mitigations/1.json
  def show
  end

  # GET /risk_mitigations/new
  def new
    @risk_mitigation = RiskMitigation.new
  end

  # GET /risk_mitigations/1/edit
  def edit
  end

  # POST /risk_mitigations
  # POST /risk_mitigations.json
  def create
    @risk_mitigation = RiskMitigation.new(risk_mitigation_params)

    respond_to do |format|
      if @risk_mitigation.save
        format.html { redirect_to @risk_mitigation, notice: 'Risk mitigation was successfully created.' }
        format.json { render :show, status: :created, location: @risk_mitigation }
      else
        format.html { render :new }
        format.json { render json: @risk_mitigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risk_mitigations/1
  # PATCH/PUT /risk_mitigations/1.json
  def update
    respond_to do |format|
      if @risk_mitigation.update(risk_mitigation_params)
        format.html { redirect_to @risk_mitigation, notice: 'Risk mitigation was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk_mitigation }
      else
        format.html { render :edit }
        format.json { render json: @risk_mitigation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_mitigations/1
  # DELETE /risk_mitigations/1.json
  def destroy
    @risk_mitigation.destroy
    respond_to do |format|
      format.html { redirect_to risk_mitigations_url, notice: 'Risk mitigation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_mitigation
      @risk_mitigation = RiskMitigation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_mitigation_params
      params.require(:risk_mitigation).permit(:risk_register_id, :mitigation_step)
    end
end
