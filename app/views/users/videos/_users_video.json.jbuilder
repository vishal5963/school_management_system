json.extract! users_video, :id, :user_id, :is_deleted, :is_downloadable, :video, :created_at, :updated_at
json.url users_video_url(users_video, format: :json)
