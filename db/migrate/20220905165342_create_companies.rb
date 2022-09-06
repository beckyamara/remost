class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slack_sub_domain

      t.timestamps
    end
  end
end
