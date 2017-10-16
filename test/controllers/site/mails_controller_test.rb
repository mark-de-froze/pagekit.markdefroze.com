require 'test_helper'

class Site::MailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_mail = site_mails(:one)
  end

  test "should get index" do
    get site_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_site_mail_url
    assert_response :success
  end

  test "should create site_mail" do
    assert_difference('Site::Mail.count') do
      post site_mails_url, params: { site_mail: { api_key: @site_mail.api_key, from: @site_mail.from, message: @site_mail.message, status: @site_mail.status, subject: @site_mail.subject } }
    end

    assert_redirected_to site_mail_url(Site::Mail.last)
  end

  test "should show site_mail" do
    get site_mail_url(@site_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_mail_url(@site_mail)
    assert_response :success
  end

  test "should update site_mail" do
    patch site_mail_url(@site_mail), params: { site_mail: { api_key: @site_mail.api_key, from: @site_mail.from, message: @site_mail.message, status: @site_mail.status, subject: @site_mail.subject } }
    assert_redirected_to site_mail_url(@site_mail)
  end

  test "should destroy site_mail" do
    assert_difference('Site::Mail.count', -1) do
      delete site_mail_url(@site_mail)
    end

    assert_redirected_to site_mails_url
  end
end
