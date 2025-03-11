require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Ex user", email: "asd@asd.com", password: "password", password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template "users/show"
  end
end
