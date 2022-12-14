class AddCompanyToCity < ActiveRecord::Migration[7.0]
  def change
    add_reference :cities, :company, null: false, foreign_key: true
  end
end
