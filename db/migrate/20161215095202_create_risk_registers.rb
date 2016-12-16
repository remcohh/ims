class CreateRiskRegisters < ActiveRecord::Migration
  def change
    create_table :risk_registers do |t|
      t.string :risk_no, index: true
      t.references :project, index: true, foreign_key: true
      t.text :description
      t.string :probability
      t.string :impact
      t.references :user, index: true, foreign_key: true
      t.date :target_date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
