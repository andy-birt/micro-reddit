require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = User.new(id: 1, name: "Dick", email: "dick@hole.com", password: "doodoo", password_confirmation: "doodoo")
    @post = Post.new(title: "Title", body: "body", user_id: 1)
    @user.save
  end

  test "title is not empty" do
    assert @post.valid?, @post.errors.full_messages.inspect
  end

  test "title should not be empty" do
    @post.title = "      "
    assert_not @post.valid?
  end

  test "title should be unique" do
    other = @post.dup
    other.title = @post.title.upcase
    @post.save
    assert_not other.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test "body should not be empty" do
    @post.body = "       "
    assert_not @post.valid?
  end

  test "user_id should not be nil" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
