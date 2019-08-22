class Family < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :documents
  has_many :users, through: :memberships
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  after_create :default_avatar

  # DEFAULT_AVATAR = "f5psjysh6j1nsoxzqgyx"
  def default_avatar
    self.remote_avatar_url = "https://res.cloudinary.com/glenwarren/image/upload/v1566486630/f5psjysh6j1nsoxzqgyx.jpg" unless self.avatar.present?
  end
end
