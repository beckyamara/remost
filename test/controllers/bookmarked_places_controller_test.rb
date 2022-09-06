require "test_helper"

class BookmarkedPlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookmarked_places_new_url
    assert_response :success
  end
end
