class Add50pcToRiskRegister < ActiveRecord::Migration[4.2]
  def change
    add_column :risk_registers, :fifty_pc, :boolean, default: false
  end
end
