class AddCompanyToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :company, null: false, foreign_key: true
  end
end
