class RemoveNameFromTips < ActiveRecord::Migration[7.0]
  def change
    remove_column :tips, :name, :string
  end
end
