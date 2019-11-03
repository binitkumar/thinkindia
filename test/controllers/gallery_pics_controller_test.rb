require 'test_helper'

class GalleryPicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery_pic = gallery_pics(:one)
  end

  test "should get index" do
    get gallery_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_gallery_pic_url
    assert_response :success
  end

  test "should create gallery_pic" do
    assert_difference('GalleryPic.count') do
      post gallery_pics_url, params: { gallery_pic: { pic_collection: @gallery_pic.pic_collection, user_id: @gallery_pic.user_id } }
    end

    assert_redirected_to gallery_pic_url(GalleryPic.last)
  end

  test "should show gallery_pic" do
    get gallery_pic_url(@gallery_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_gallery_pic_url(@gallery_pic)
    assert_response :success
  end

  test "should update gallery_pic" do
    patch gallery_pic_url(@gallery_pic), params: { gallery_pic: { pic_collection: @gallery_pic.pic_collection, user_id: @gallery_pic.user_id } }
    assert_redirected_to gallery_pic_url(@gallery_pic)
  end

  test "should destroy gallery_pic" do
    assert_difference('GalleryPic.count', -1) do
      delete gallery_pic_url(@gallery_pic)
    end

    assert_redirected_to gallery_pics_url
  end
end
