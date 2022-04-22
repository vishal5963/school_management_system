class Users::DashboardController < ApplicationController
  def index
    if current_user.role_id.nil? || current_user.role_id == 2
      @users_videos_all = Users::Video.where(user_id: current_user.id)
    else
      @users_videos_all = Users::Video.where(user_id: current_user.teacher_id)
    end
    @users_videos = @users_videos_all.where(is_deleted: nil)
    @deleted_videos = @users_videos_all.where(is_deleted: true)
  end
end
