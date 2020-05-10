require 'test_helper'

class CallYourFriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @call_your_friend = call_your_friends(:one)
  end

  test "should get index" do
    get call_your_friends_url
    assert_response :success
  end

  test "should get new" do
    get new_call_your_friend_url
    assert_response :success
  end

  test "should create call_your_friend" do
    assert_difference('CallYourFriend.count') do
      post call_your_friends_url, params: { call_your_friend: { your_name: @call_your_friend.your_name } }
    end

    assert_redirected_to call_your_friend_url(CallYourFriend.last)
  end

  test "should show call_your_friend" do
    get call_your_friend_url(@call_your_friend)
    assert_response :success
  end

  test "should get edit" do
    get edit_call_your_friend_url(@call_your_friend)
    assert_response :success
  end

  test "should update call_your_friend" do
    patch call_your_friend_url(@call_your_friend), params: { call_your_friend: { your_name: @call_your_friend.your_name } }
    assert_redirected_to call_your_friend_url(@call_your_friend)
  end

  test "should destroy call_your_friend" do
    assert_difference('CallYourFriend.count', -1) do
      delete call_your_friend_url(@call_your_friend)
    end

    assert_redirected_to call_your_friends_url
  end
end
