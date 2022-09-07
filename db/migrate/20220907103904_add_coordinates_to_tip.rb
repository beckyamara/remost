class AddCoordinatesToTip < ActiveRecord::Migration[7.0]
  def change
    add_column :tips, :latitude, :float
    add_column :tips, :longitude, :float
  end
end
