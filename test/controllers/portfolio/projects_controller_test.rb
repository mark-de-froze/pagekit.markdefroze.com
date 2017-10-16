require 'test_helper'

class Portfolio::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_project = portfolio_projects(:one)
  end

  test "should get index" do
    get portfolio_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_project_url
    assert_response :success
  end

  test "should create portfolio_project" do
    assert_difference('Portfolio::Project.count') do
      post portfolio_projects_url, params: { portfolio_project: { api_key: @portfolio_project.api_key, client: @portfolio_project.client, content: @portfolio_project.content, portfolio_category_id: @portfolio_project.portfolio_category_id, priority: @portfolio_project.priority, published_at: @portfolio_project.published_at, slug: @portfolio_project.slug, status: @portfolio_project.status, subtitle: @portfolio_project.subtitle, title: @portfolio_project.title } }
    end

    assert_redirected_to portfolio_project_url(Portfolio::Project.last)
  end

  test "should show portfolio_project" do
    get portfolio_project_url(@portfolio_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_project_url(@portfolio_project)
    assert_response :success
  end

  test "should update portfolio_project" do
    patch portfolio_project_url(@portfolio_project), params: { portfolio_project: { api_key: @portfolio_project.api_key, client: @portfolio_project.client, content: @portfolio_project.content, portfolio_category_id: @portfolio_project.portfolio_category_id, priority: @portfolio_project.priority, published_at: @portfolio_project.published_at, slug: @portfolio_project.slug, status: @portfolio_project.status, subtitle: @portfolio_project.subtitle, title: @portfolio_project.title } }
    assert_redirected_to portfolio_project_url(@portfolio_project)
  end

  test "should destroy portfolio_project" do
    assert_difference('Portfolio::Project.count', -1) do
      delete portfolio_project_url(@portfolio_project)
    end

    assert_redirected_to portfolio_projects_url
  end
end
