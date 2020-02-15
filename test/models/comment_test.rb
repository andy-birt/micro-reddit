require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = User.new(id: 1, name: "Dick", email: "dick@hole.com", password: "doodoo", password_confirmation: "doodoo")
    @post = Post.new(title: "Title", body: "body", user_id: 1)
    @comment = Comment.new(body: "this is a comment", post_id: 1 , user_id: 1)
    @user.save
    @post.save
  end

  test "body should be valid" do
    assert @comment.valid?, @comment.errors.full_messages.inspect
  end

  test "body should not be empty" do
    @comment.body = "      "
    assert_not @comment.valid?
  end

end
