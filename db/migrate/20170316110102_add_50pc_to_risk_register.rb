class Add50pcToRiskRegister < ActiveRecord::Migration
  def change
    add_column :risk_registers, :fifty_pc, :boolean, default: false
  end
end
