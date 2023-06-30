require "application_system_test_case"

class FriendListsTest < ApplicationSystemTestCase
  setup do
    @friend_list = friend_lists(:one)
  end

  test "visiting the index" do
    visit friend_lists_url
    assert_selector "h1", text: "Friend lists"
  end

  test "should create friend list" do
    visit friend_lists_url
    click_on "New friend list"

    fill_in "Email", with: @friend_list.email
    fill_in "First name", with: @friend_list.first_name
    fill_in "Insta", with: @friend_list.insta
    fill_in "Last name", with: @friend_list.last_name
    fill_in "Phone", with: @friend_list.phone
    click_on "Create Friend list"

    assert_text "Friend list was successfully created"
    click_on "Back"
  end

  test "should update Friend list" do
    visit friend_list_url(@friend_list)
    click_on "Edit this friend list", match: :first

    fill_in "Email", with: @friend_list.email
    fill_in "First name", with: @friend_list.first_name
    fill_in "Insta", with: @friend_list.insta
    fill_in "Last name", with: @friend_list.last_name
    fill_in "Phone", with: @friend_list.phone
    click_on "Update Friend list"

    assert_text "Friend list was successfully updated"
    click_on "Back"
  end

  test "should destroy Friend list" do
    visit friend_list_url(@friend_list)
    click_on "Destroy this friend list", match: :first

    assert_text "Friend list was successfully destroyed"
  end
end
