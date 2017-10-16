require 'test_helper'

class Site::FilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_file = site_files(:one)
  end

  test "should get index" do
    get site_files_url
    assert_response :success
  end

  test "should get new" do
    get new_site_file_url
    assert_response :success
  end

  test "should create site_file" do
    assert_difference('Site::File.count') do
      post site_files_url, params: { site_file: { api_key: @site_file.api_key, key: @site_file.key, modified: @site_file.modified, size: @site_file.size } }
    end

    assert_redirected_to site_file_url(Site::File.last)
  end

  test "should show site_file" do
    get site_file_url(@site_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_file_url(@site_file)
    assert_response :success
  end

  test "should update site_file" do
    patch site_file_url(@site_file), params: { site_file: { api_key: @site_file.api_key, key: @site_file.key, modified: @site_file.modified, size: @site_file.size } }
    assert_redirected_to site_file_url(@site_file)
  end

  test "should destroy site_file" do
    assert_difference('Site::File.count', -1) do
      delete site_file_url(@site_file)
    end

    assert_redirected_to site_files_url
  end
end
