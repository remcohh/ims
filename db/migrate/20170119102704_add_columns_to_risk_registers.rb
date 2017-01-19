class AddColumnsToRiskRegisters < ActiveRecord::Migration
  def change
    add_column :risk_registers, :authorised, :boolean, default: false
    add_column :risk_registers, :authorised_by, :integer
    add_column :risk_registers, :authorised_date, :date
    add_column :risk_registers, :responsible_officer, :string
  end
end
