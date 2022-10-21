class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :company_code
      t.string :slack_sub_domain
      t.string :email_domain
      t.string :company_size
      t.references :admin, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
