class Topic < ActiveRecord::Base
  validates :title, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 20 }, presence: true

  has_many :posts
end
