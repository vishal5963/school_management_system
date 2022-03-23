class Users::Video < ApplicationRecord
  belongs_to :user
  has_attached_file :video
    # :styles => {
    #     :mp4video => { :geometry => '520x390', :format => 'mp4',
    #       :convert_options => { :output => { :vcodec => 'libx264',
    #         :vpre => 'ipod640', :b => '250k', :bt => '50k',
    #         :acodec => 'libfaac', :ab => '56k', :ac => 2 } } },
    #      :preview => { :geometry => '300x300>', :format => 'jpg', :time => 5 }
    #   }

  validates_attachment_content_type :video, :content_type => /\Avideo\/.*\Z/
  validates_presence_of :video
end
