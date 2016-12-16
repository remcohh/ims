class CreateRiskMitigations < ActiveRecord::Migration
  def change
    create_table :risk_mitigations do |t|
      t.references :risk_register, index: true, foreign_key: true
      t.text :mitigation_step

      t.timestamps null: false
    end
  end
end
