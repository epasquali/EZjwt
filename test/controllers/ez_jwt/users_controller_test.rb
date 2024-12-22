require "test_helper"

module EzJwt
  class UsersControllerTest < ActionDispatch::IntegrationTest
    
    setup do
      @user = User.create(email: "ben@example.com", password: "aabcDEFg12!")
      #Login and get the JWT token.
      @token = get_token(@user)
    end

    test "should get index" do
      get users_path, headers: { Authorization: "Bearer #{@token}" }, as: :json
      assert_response :success
    end

    test "should not get index without correct JWT" do
      get users_path, headers: { Authorization: "Bearer bad_jwt" }, as: :json
      assert_response :unauthorized
    end


    test "should create user" do
      #Delete all users first so can create a new one because needs unique email.
      #Note we don't need a JWT to create a new user so we don't send one, but we could.
      User.destroy_all
      assert_difference("User.count") do
        post new_user_registration_path, 
            params: {user: {email: @user.email, password: @user.password}}, 
            as: :json
      end
      assert_response :created
    end

    test "should not create user with bad parameters" do
      assert_no_difference("User.count") do
        post new_user_registration_path, 
        params: {user: {email: @user.email, password: 'abc'}}, 
        as: :json
      end
      assert_response :unprocessable_entity
    end

    test "should show user" do
      get user_path, 
      headers: { Authorization: "Bearer #{@token}" },
      as: :json
      assert_response :success
    end

    test "should not show user without correct JWT token" do
      get user_path, 
      headers: { Authorization: "Bearer a_bad_jwt" }, 
      as: :json
      assert_response :unauthorized

    end


    test "should edit" do
      put user_path, 
      params: {user: {email: 'a@a.com', password: "123asdASD!"}}, 
      headers: { Authorization: "Bearer #{@token}" },
      as: :json
      assert_response :success
    end

    test "should not edit without JWT token" do
      put user_path, 
      params: {user: {email: 'a@a.com', password: "123asdASD!"}}, 
      as: :json
      assert_response :unauthorized
    end

  
    #test "should destroy user" do
    #  delete user_path(@user), 
    #  headers: { Authorization: "Bearer #{@token}" },
    #  as: :json
    #  assert_response :success
    #end

    #test "should not destroy user without JWT token" do
    #  delete user_path(@user), 
    #  as: :json
    #  assert_response :unauthorized
    #end



  end
  

end
