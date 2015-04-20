require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: 'username', email: 'email@email.com')
  end

  test "name should be present" do 
    @user.name = ''
    assert_not @user.valid?
  end

  test "email should be present" do 
    @user.email = ''
    assert_not @user.valid?
  end

  test "username should be longer than 5 letters" do 
    @user.name = 'name'
    assert_not @user.valid? 
  end

  test "username should be shorter than 16 letters" do 
    @user.name = 'a' * 17
    assert_not @user.valid?
  end

  test "email should be shorter than 30 letters" do
    @user.email = 'a' * 19 + '@example.com'
    assert_not @user.valid?
  end

  test "should accept valid email addresses" do 
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |valid_address| 
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "should not accept invalid email addresses" do 
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address| 
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be longer than 5 characters" do 
    @user.password = @user.password_confirmation = 'a' * 4
    assert_not @user.valid?
  end
end