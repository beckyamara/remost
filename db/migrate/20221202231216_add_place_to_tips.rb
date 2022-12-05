class AddPlaceToTips < ActiveRecord::Migration[7.0]
  def change
    add_reference :tips, :place, null: false, foreign_key: true
  end
end
