require 'test_helper'

class PressReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @press_release = press_releases(:one)
  end

  test "should get index" do
    get press_releases_url
    assert_response :success
  end

  test "should get new" do
    get new_press_release_url
    assert_response :success
  end

  test "should create press_release" do
    assert_difference('PressRelease.count') do
      post press_releases_url, params: { press_release: { article: @press_release.article, title: @press_release.title } }
    end

    assert_redirected_to press_release_url(PressRelease.last)
  end

  test "should show press_release" do
    get press_release_url(@press_release)
    assert_response :success
  end

  test "should get edit" do
    get edit_press_release_url(@press_release)
    assert_response :success
  end

  test "should update press_release" do
    patch press_release_url(@press_release), params: { press_release: { article: @press_release.article, title: @press_release.title } }
    assert_redirected_to press_release_url(@press_release)
  end

  test "should destroy press_release" do
    assert_difference('PressRelease.count', -1) do
      delete press_release_url(@press_release)
    end

    assert_redirected_to press_releases_url
  end
end
