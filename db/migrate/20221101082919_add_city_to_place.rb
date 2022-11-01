class AddCityToPlace < ActiveRecord::Migration[7.0]
  def change
    add_reference :places, :city, null: false, foreign_key: true
  end
end
