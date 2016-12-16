class CreateRiskResponsibilities < ActiveRecord::Migration
  def change
    create_table :risk_responsibilities do |t|
      t.references :risk_register, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
