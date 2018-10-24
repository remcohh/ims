class AddMitigationPlanToRiskRegister < ActiveRecord::Migration[4.2]
  def change
    add_column :risk_registers, :mitigation_plan, :text
  end
end
