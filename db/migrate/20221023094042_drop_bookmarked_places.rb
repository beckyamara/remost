class DropBookmarkedPlaces < ActiveRecord::Migration[7.0]
  def change
    drop_table :bookmarked_places
  end
end
