class CreateRiskRegistersUsers < ActiveRecord::Migration
  def change
    create_table :risk_registers_users do |t|
      t.references :risk_register, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
