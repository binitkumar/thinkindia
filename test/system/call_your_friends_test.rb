require "application_system_test_case"

class CallYourFriendsTest < ApplicationSystemTestCase
  setup do
    @call_your_friend = call_your_friends(:one)
  end

  test "visiting the index" do
    visit call_your_friends_url
    assert_selector "h1", text: "Call Your Friends"
  end

  test "creating a Call your friend" do
    visit call_your_friends_url
    click_on "New Call Your Friend"

    fill_in "Your name", with: @call_your_friend.your_name
    click_on "Create Call your friend"

    assert_text "Call your friend was successfully created"
    click_on "Back"
  end

  test "updating a Call your friend" do
    visit call_your_friends_url
    click_on "Edit", match: :first

    fill_in "Your name", with: @call_your_friend.your_name
    click_on "Update Call your friend"

    assert_text "Call your friend was successfully updated"
    click_on "Back"
  end

  test "destroying a Call your friend" do
    visit call_your_friends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Call your friend was successfully destroyed"
  end
end
