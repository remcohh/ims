class AddFullNameToProject < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :full_name, :string
  end
end
