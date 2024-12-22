require "test_helper"

module EzJwt

  class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  
    setup do
      #Clear all existing users because user must be unique on email create
      User.destroy_all
      @user = User.create(email: "ben@example.com", password: "aabcDEFg12!")
    end

    test "should get authorized" do
      post auth_login_path, params: {user: {email: @user.email, password: @user.password}}, as: :json
      assert_response :success
    end

    test 'should not get authorized with wrong password' do
      post auth_login_path, params: {user: {email: @user.email, password: 'badpwd'}}, as: :json
      assert_response :unauthorized
      assert_equal '{"error":"Invalid credentials"}', @response.body
    end

    test 'should not get authorized if user not exist' do
      post auth_login_path, params: {user: {email: 'nouser@user.com', password: @user.password}}, as: :json
      assert_response :unauthorized
      assert_equal '{"error":"User not found"}', @response.body
    end

  end

end
