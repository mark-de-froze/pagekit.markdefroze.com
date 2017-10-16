require 'test_helper'

class Users::AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_account = users_accounts(:one)
  end

  test "should get index" do
    get users_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_users_account_url
    assert_response :success
  end

  test "should create users_account" do
    assert_difference('Users::Account.count') do
      post users_accounts_url, params: { users_account: { email: @users_account.email } }
    end

    assert_redirected_to users_account_url(Users::Account.last)
  end

  test "should show users_account" do
    get users_account_url(@users_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_account_url(@users_account)
    assert_response :success
  end

  test "should update users_account" do
    patch users_account_url(@users_account), params: { users_account: { email: @users_account.email } }
    assert_redirected_to users_account_url(@users_account)
  end

  test "should destroy users_account" do
    assert_difference('Users::Account.count', -1) do
      delete users_account_url(@users_account)
    end

    assert_redirected_to users_accounts_url
  end
end
