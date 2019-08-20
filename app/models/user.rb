class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents
  has_many :subscriptions
  has_many :messages
  has_many :memberships
  has_many :families, through: :memberships
  has_many :conversations, through: :subscriptions
end
