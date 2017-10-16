require 'test_helper'

class Site::LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_link = site_links(:one)
  end

  test "should get index" do
    get site_links_url
    assert_response :success
  end

  test "should get new" do
    get new_site_link_url
    assert_response :success
  end

  test "should create site_link" do
    assert_difference('Site::Link.count') do
      post site_links_url, params: { site_link: { api_key: @site_link.api_key, position_main: @site_link.position_main, position_offcanvas: @site_link.position_offcanvas, section: @site_link.section, status: @site_link.status, title: @site_link.title, url: @site_link.url } }
    end

    assert_redirected_to site_link_url(Site::Link.last)
  end

  test "should show site_link" do
    get site_link_url(@site_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_link_url(@site_link)
    assert_response :success
  end

  test "should update site_link" do
    patch site_link_url(@site_link), params: { site_link: { api_key: @site_link.api_key, position_main: @site_link.position_main, position_offcanvas: @site_link.position_offcanvas, section: @site_link.section, status: @site_link.status, title: @site_link.title, url: @site_link.url } }
    assert_redirected_to site_link_url(@site_link)
  end

  test "should destroy site_link" do
    assert_difference('Site::Link.count', -1) do
      delete site_link_url(@site_link)
    end

    assert_redirected_to site_links_url
  end
end
