class CreateUsersVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :users_videos do |t|
      t.references :user, foreign_key: true
      t.boolean :is_deleted
      t.boolean :is_downloadable
      t.attachment :video

      t.timestamps
    end
  end
end
