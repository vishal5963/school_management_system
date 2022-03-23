require "application_system_test_case"

class Users::VideosTest < ApplicationSystemTestCase
  setup do
    @users_video = users_videos(:one)
  end

  test "visiting the index" do
    visit users_videos_url
    assert_selector "h1", text: "Users/Videos"
  end

  test "creating a Video" do
    visit users_videos_url
    click_on "New Users/Video"

    check "Is deleted" if @users_video.is_deleted
    check "Is downloadable" if @users_video.is_downloadable
    fill_in "User", with: @users_video.user_id
    fill_in "Video", with: @users_video.video
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "updating a Video" do
    visit users_videos_url
    click_on "Edit", match: :first

    check "Is deleted" if @users_video.is_deleted
    check "Is downloadable" if @users_video.is_downloadable
    fill_in "User", with: @users_video.user_id
    fill_in "Video", with: @users_video.video
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "destroying a Video" do
    visit users_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video was successfully destroyed"
  end
end
