class CreateRiskRegisters < ActiveRecord::Migration[4.2]
  def change
    create_table :risk_registers do |t|
      t.string :risk_no, index: true
      t.references :project, index: true, foreign_key: true
      t.text :description
      t.string :probability
      t.string :impact
      t.integer :created_by
      t.integer :updated_by
      t.date :target_date
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
