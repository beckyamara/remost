class RemoveLocationFromTips < ActiveRecord::Migration[7.0]
  def change
    remove_column :tips, :location, :string
  end
end
