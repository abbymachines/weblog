require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "should create comment" do
  #   assert_difference("Comment.count") do
  #     post comments_url, params: { comment: {  } }, as: :json
  #   end

  #   assert_response :created
  # end

  test "should not save comment without params" do
    comment = Comment.new
    assert_not comment.save
  end

end
