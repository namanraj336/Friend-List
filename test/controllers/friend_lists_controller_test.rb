require "test_helper"

class FriendListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_list = friend_lists(:one)
  end

  test "should get index" do
    get friend_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_list_url
    assert_response :success
  end

  test "should create friend_list" do
    assert_difference("FriendList.count") do
      post friend_lists_url, params: { friend_list: { email: @friend_list.email, first_name: @friend_list.first_name, insta: @friend_list.insta, last_name: @friend_list.last_name, phone: @friend_list.phone } }
    end

    assert_redirected_to friend_list_url(FriendList.last)
  end

  test "should show friend_list" do
    get friend_list_url(@friend_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_list_url(@friend_list)
    assert_response :success
  end

  test "should update friend_list" do
    patch friend_list_url(@friend_list), params: { friend_list: { email: @friend_list.email, first_name: @friend_list.first_name, insta: @friend_list.insta, last_name: @friend_list.last_name, phone: @friend_list.phone } }
    assert_redirected_to friend_list_url(@friend_list)
  end

  test "should destroy friend_list" do
    assert_difference("FriendList.count", -1) do
      delete friend_list_url(@friend_list)
    end

    assert_redirected_to friend_lists_url
  end
end
