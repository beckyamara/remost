class RemoveCategoryFromTips < ActiveRecord::Migration[7.0]
  def change
    remove_column :tips, :category, :string
  end
end
