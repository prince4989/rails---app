require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count'  , 1 do
      post users_path, params: { user: { name:  "user",
                                         email: "user@invalid.com",
                                         password:              "",
                                         password_confirmation: "foo" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@mail.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    # Confirm email was sent
    assert_equal 1, ActionMailer::Base.deliveries.size

    # Make sure user is not activated or logged in
    user = assigns(:user)
    assert_not user.activated?
    assert_not is_logged_in?

    # Should redirect to root
    assert_redirected_to root_url
  end

end
