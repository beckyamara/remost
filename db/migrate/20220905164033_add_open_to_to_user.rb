class AddOpenToToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :open_to, :text
  end
end
