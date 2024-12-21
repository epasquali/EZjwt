require "test_helper"

module EzJwt
  class UserTest < ActiveSupport::TestCase
    setup do
      @user = User.new(email: "ben@example.com", password: "aabcDEFg12!")
    end
  
    test 'user should be valid' do
      assert @user.valid?
    end
  
  
    test 'emails should be present' do
       @user.email = ''
       assert_not @user.valid?
    end
  
    test 'email should be unique' do
      @dupuser = @user.dup
      @user.save
      assert_not @dupuser.valid?
    end
  
    test 'email should not be too long' do
      @user.email = "a"*256
      assert_not @user.valid?
    end
  
    test 'email should be right format' do
      @user.email = 'asdasdfa'
      assert_not @user.valid?
    end
  
    test 'password should be present' do
      @buser = User.new(email: "bin@abc.com")
      assert_not @buser.valid?
    end
  
    test 'password should meet regex' do
      @user.password = 'abc'
      assert_not @user.valid?
    end
  

  end
end
