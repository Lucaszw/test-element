class UserModel < ActiveRecord::Base
	belongs_to :user
	has_many :comments
  has_attached_file :stlfile
  has_attached_file :thumbnail,
    :styles => {
      :thumb => "100x100#",
      :small => "150x150>",
      :medium => "200x200"
    }
  validates :name, presence: true
  validates :description, presence: true
  validates :stlfile, presence: true
  validates :thumbnail, presence: true
  # validates_attachment_content_type :stlfile, :content_type => 'application/octet-stream'
  validates_attachment_content_type :thumbnail, :content_type => ['image/gif','image/jpeg','image/jpg','image/pjpeg','image/png','image/svg+xml']
end
