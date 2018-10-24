class AddColumnsToRiskRegisters < ActiveRecord::Migration[4.2]
  def change
    add_column :risk_registers, :approved, :boolean, default: false
    add_column :risk_registers, :approved_date, :date
    add_column :risk_registers, :responsible_officer, :integer
  end
end
