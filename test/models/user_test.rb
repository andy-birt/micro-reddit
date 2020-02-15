require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Bobzilla", email: "bobzilla@bomb.com", password: "burzum", password_confirmation: "burzum")
  end

  test "name should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 247 + "@bomb.com"
    assert_not @user.valid?
  end

  test "email should be unique" do 
    other = @user.dup
    other.email = @user.email.upcase
    @user.save
    assert_not other.valid?
  end

  test "password cannot be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
