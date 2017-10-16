require 'test_helper'

class Site::PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_page = site_pages(:one)
  end

  test "should get index" do
    get site_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_site_page_url
    assert_response :success
  end

  test "should create site_page" do
    assert_difference('Site::Page.count') do
      post site_pages_url, params: { site_page: { api_key: @site_page.api_key, content: @site_page.content, metadescription: @site_page.metadescription, metakeywords: @site_page.metakeywords, metatitle: @site_page.metatitle, slug: @site_page.slug, status: @site_page.status, title: @site_page.title } }
    end

    assert_redirected_to site_page_url(Site::Page.last)
  end

  test "should show site_page" do
    get site_page_url(@site_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_page_url(@site_page)
    assert_response :success
  end

  test "should update site_page" do
    patch site_page_url(@site_page), params: { site_page: { api_key: @site_page.api_key, content: @site_page.content, metadescription: @site_page.metadescription, metakeywords: @site_page.metakeywords, metatitle: @site_page.metatitle, slug: @site_page.slug, status: @site_page.status, title: @site_page.title } }
    assert_redirected_to site_page_url(@site_page)
  end

  test "should destroy site_page" do
    assert_difference('Site::Page.count', -1) do
      delete site_page_url(@site_page)
    end

    assert_redirected_to site_pages_url
  end
end
