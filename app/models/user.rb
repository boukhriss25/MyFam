class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents
  has_many :subscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :families, through: :memberships
  has_many :conversations, through: :subscriptions
  mount_uploader :avatar, AvatarUploader

  DEFAULT_AVATAR = "f5psjysh6j1nsoxzqgyx"
  def avatar
    read_attribute('avatar') || DEFAULT_AVATAR
  end
end
