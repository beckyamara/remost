class AddPictureToBookmarkedPlace < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarked_places, :picture, :string
  end
end
