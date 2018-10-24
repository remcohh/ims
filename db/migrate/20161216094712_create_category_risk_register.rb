class CreateCategoryRiskRegister < ActiveRecord::Migration[4.2]
  def change
    create_table :categories_risk_registers do |t|
      t.references :risk_register, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
