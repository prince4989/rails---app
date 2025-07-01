require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end




  test "should get destroy" do
    delete logout_path
    assert_redirected_to root_url
  end
end
