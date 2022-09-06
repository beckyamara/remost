require "test_helper"

class BookmarkedUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookmarked_users_new_url
    assert_response :success
  end
end
