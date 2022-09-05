class AddDepartmentToUser < ActiveRecord::Migration[7.0]
  def chang
    add_column :users, :department, :string
  end
end
