class AddPlaceToBookmarkedPlace < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarked_places, :place, null: false, foreign_key: true
  end
end
