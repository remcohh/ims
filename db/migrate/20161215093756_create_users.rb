class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :mid_name
      t.string :last_name
      t.references :designation, index: true, foreign_key: true
      t.string :department
      t.references :project, index: true, foreign_key: true
      t.string :password_digest
      t.integer :role

      t.timestamps null: false
    end
  end
end
