require 'test_helper'

class Blog::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_post = blog_posts(:one)
  end

  test "should get index" do
    get blog_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_post_url
    assert_response :success
  end

  test "should create blog_post" do
    assert_difference('Blog::Post.count') do
      post blog_posts_url, params: { blog_post: { api_key: @blog_post.api_key, content: @blog_post.content, published_at: @blog_post.published_at, slug: @blog_post.slug, status: @blog_post.status, tags: @blog_post.tags, title: @blog_post.title, user_id: @blog_post.user_id } }
    end

    assert_redirected_to blog_post_url(Blog::Post.last)
  end

  test "should show blog_post" do
    get blog_post_url(@blog_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_post_url(@blog_post)
    assert_response :success
  end

  test "should update blog_post" do
    patch blog_post_url(@blog_post), params: { blog_post: { api_key: @blog_post.api_key, content: @blog_post.content, published_at: @blog_post.published_at, slug: @blog_post.slug, status: @blog_post.status, tags: @blog_post.tags, title: @blog_post.title, user_id: @blog_post.user_id } }
    assert_redirected_to blog_post_url(@blog_post)
  end

  test "should destroy blog_post" do
    assert_difference('Blog::Post.count', -1) do
      delete blog_post_url(@blog_post)
    end

    assert_redirected_to blog_posts_url
  end
end
