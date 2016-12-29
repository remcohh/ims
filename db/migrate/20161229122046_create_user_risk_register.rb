class CreateUserRiskRegister < ActiveRecord::Migration
  def change
    create_table :users_risk_registers do |t|
      t.references :risk_register, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
