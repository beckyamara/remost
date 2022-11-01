class RemoveCityFromTips < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tips, :city, null: false, foreign_key: true
  end
end
