class Family < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :documents
  has_many :tags, -> { select('distinct name') }, through: :documents
  has_many :users, through: :memberships
  has_many :shares, through: :conversations
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  after_create :default_avatar

  def default_avatar
    self.remote_avatar_url = "https://res.cloudinary.com/glenwarren/image/upload/v1566916585/nqsmgxawxwk1qirqom3s.jpg" unless self.avatar.present?
  end
end
