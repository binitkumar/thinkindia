require 'test_helper'

class Ideas2020sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ideas2020 = ideas2020s(:one)
  end

  test "should get index" do
    get ideas2020s_url
    assert_response :success
  end

  test "should get new" do
    get new_ideas2020_url
    assert_response :success
  end

  test "should create ideas2020" do
    assert_difference('Ideas2020.count') do
      post ideas2020s_url, params: { ideas2020: { email: @ideas2020.email, name: @ideas2020.name, title: @ideas2020.title } }
    end

    assert_redirected_to ideas2020_url(Ideas2020.last)
  end

  test "should show ideas2020" do
    get ideas2020_url(@ideas2020)
    assert_response :success
  end

  test "should get edit" do
    get edit_ideas2020_url(@ideas2020)
    assert_response :success
  end

  test "should update ideas2020" do
    patch ideas2020_url(@ideas2020), params: { ideas2020: { email: @ideas2020.email, name: @ideas2020.name, title: @ideas2020.title } }
    assert_redirected_to ideas2020_url(@ideas2020)
  end

  test "should destroy ideas2020" do
    assert_difference('Ideas2020.count', -1) do
      delete ideas2020_url(@ideas2020)
    end

    assert_redirected_to ideas2020s_url
  end
end
