require "application_system_test_case"

class GalleryPicsTest < ApplicationSystemTestCase
  setup do
    @gallery_pic = gallery_pics(:one)
  end

  test "visiting the index" do
    visit gallery_pics_url
    assert_selector "h1", text: "Gallery Pics"
  end

  test "creating a Gallery pic" do
    visit gallery_pics_url
    click_on "New Gallery Pic"

    fill_in "Pic collection", with: @gallery_pic.pic_collection
    fill_in "User", with: @gallery_pic.user_id
    click_on "Create Gallery pic"

    assert_text "Gallery pic was successfully created"
    click_on "Back"
  end

  test "updating a Gallery pic" do
    visit gallery_pics_url
    click_on "Edit", match: :first

    fill_in "Pic collection", with: @gallery_pic.pic_collection
    fill_in "User", with: @gallery_pic.user_id
    click_on "Update Gallery pic"

    assert_text "Gallery pic was successfully updated"
    click_on "Back"
  end

  test "destroying a Gallery pic" do
    visit gallery_pics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gallery pic was successfully destroyed"
  end
end
