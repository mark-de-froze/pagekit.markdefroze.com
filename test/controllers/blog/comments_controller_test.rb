require 'test_helper'

class Blog::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_comment = blog_comments(:one)
  end

  test "should get index" do
    get blog_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_comment_url
    assert_response :success
  end

  test "should create blog_comment" do
    assert_difference('Blog::Comment.count') do
      post blog_comments_url, params: { blog_comment: { api_key: @blog_comment.api_key, blog_post_id: @blog_comment.blog_post_id, comment: @blog_comment.comment, from_email: @blog_comment.from_email, from_name: @blog_comment.from_name, status: @blog_comment.status } }
    end

    assert_redirected_to blog_comment_url(Blog::Comment.last)
  end

  test "should show blog_comment" do
    get blog_comment_url(@blog_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_comment_url(@blog_comment)
    assert_response :success
  end

  test "should update blog_comment" do
    patch blog_comment_url(@blog_comment), params: { blog_comment: { api_key: @blog_comment.api_key, blog_post_id: @blog_comment.blog_post_id, comment: @blog_comment.comment, from_email: @blog_comment.from_email, from_name: @blog_comment.from_name, status: @blog_comment.status } }
    assert_redirected_to blog_comment_url(@blog_comment)
  end

  test "should destroy blog_comment" do
    assert_difference('Blog::Comment.count', -1) do
      delete blog_comment_url(@blog_comment)
    end

    assert_redirected_to blog_comments_url
  end
end
