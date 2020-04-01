require 'test_helper'

class UserlistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userlist_index_url
    assert_response :success
  end

end
