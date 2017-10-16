require 'test_helper'

class Users::KeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_key = users_keys(:one)
  end

  test "should get index" do
    get users_keys_url
    assert_response :success
  end

  test "should get new" do
    get new_users_key_url
    assert_response :success
  end

  test "should create users_key" do
    assert_difference('Users::Key.count') do
      post users_keys_url, params: { users_key: { api_key: @users_key.api_key, content: @users_key.content, site: @users_key.site, title: @users_key.title, user_id: @users_key.user_id } }
    end

    assert_redirected_to users_key_url(Users::Key.last)
  end

  test "should show users_key" do
    get users_key_url(@users_key)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_key_url(@users_key)
    assert_response :success
  end

  test "should update users_key" do
    patch users_key_url(@users_key), params: { users_key: { api_key: @users_key.api_key, content: @users_key.content, site: @users_key.site, title: @users_key.title, user_id: @users_key.user_id } }
    assert_redirected_to users_key_url(@users_key)
  end

  test "should destroy users_key" do
    assert_difference('Users::Key.count', -1) do
      delete users_key_url(@users_key)
    end

    assert_redirected_to users_keys_url
  end
end
