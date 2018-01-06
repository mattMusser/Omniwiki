class User < ApplicationRecord
  require FriendlyId

  friendly_id :email, use: :slugged

  has_many :wikis, through: :collaborators
  has_many :collaborators

  after_initialize { self.role ||= :standard }

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
end
