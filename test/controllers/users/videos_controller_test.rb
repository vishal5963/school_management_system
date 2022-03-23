require 'test_helper'

class Users::VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_video = users_videos(:one)
  end

  test "should get index" do
    get users_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_users_video_url
    assert_response :success
  end

  test "should create users_video" do
    assert_difference('Users::Video.count') do
      post users_videos_url, params: { users_video: { is_deleted: @users_video.is_deleted, is_downloadable: @users_video.is_downloadable, user_id: @users_video.user_id, video: @users_video.video } }
    end

    assert_redirected_to users_video_url(Users::Video.last)
  end

  test "should show users_video" do
    get users_video_url(@users_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_video_url(@users_video)
    assert_response :success
  end

  test "should update users_video" do
    patch users_video_url(@users_video), params: { users_video: { is_deleted: @users_video.is_deleted, is_downloadable: @users_video.is_downloadable, user_id: @users_video.user_id, video: @users_video.video } }
    assert_redirected_to users_video_url(@users_video)
  end

  test "should destroy users_video" do
    assert_difference('Users::Video.count', -1) do
      delete users_video_url(@users_video)
    end

    assert_redirected_to users_videos_url
  end
end
