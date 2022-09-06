class AddJobTitleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :job_title, :string
  end
end
