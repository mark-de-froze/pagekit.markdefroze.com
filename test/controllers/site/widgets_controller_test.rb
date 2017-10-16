require 'test_helper'

class Site::WidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_widget = site_widgets(:one)
  end

  test "should get index" do
    get site_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_site_widget_url
    assert_response :success
  end

  test "should create site_widget" do
    assert_difference('Site::Widget.count') do
      post site_widgets_url, params: { site_widget: { api_key: @site_widget.api_key, content: @site_widget.content, position: @site_widget.position, section: @site_widget.section, status: @site_widget.status, subtitle: @site_widget.subtitle, title: @site_widget.title } }
    end

    assert_redirected_to site_widget_url(Site::Widget.last)
  end

  test "should show site_widget" do
    get site_widget_url(@site_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_widget_url(@site_widget)
    assert_response :success
  end

  test "should update site_widget" do
    patch site_widget_url(@site_widget), params: { site_widget: { api_key: @site_widget.api_key, content: @site_widget.content, position: @site_widget.position, section: @site_widget.section, status: @site_widget.status, subtitle: @site_widget.subtitle, title: @site_widget.title } }
    assert_redirected_to site_widget_url(@site_widget)
  end

  test "should destroy site_widget" do
    assert_difference('Site::Widget.count', -1) do
      delete site_widget_url(@site_widget)
    end

    assert_redirected_to site_widgets_url
  end
end
