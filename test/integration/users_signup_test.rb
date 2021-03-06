require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'Invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, user: {name: 'Jongmin', 
                              email: 'jongmin@invalid', 
                              password: 'foo', 
                              password_confirmation: 'bar'}
    end
    assert_template 'users/new'
  end

  test 'Valid signup information' do 
    get signup_path
    assert_difference 'User.count', 1 do 
      post users_path, user: {name: 'Jongmin', 
                              email: 'Jongmin@gmail.com', 
                              password: 'foobar', 
                              password_confirmation: 'foobar'}
    end
    assert_redirected_to products_path
    follow_redirect!
    assert is_logged_in?
  end
end