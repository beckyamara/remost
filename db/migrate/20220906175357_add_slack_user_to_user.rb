class AddSlackUserToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :slack_user, :string
  end
end
