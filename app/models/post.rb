class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :topic
  mount_uploader :image, ImageUploader
end
