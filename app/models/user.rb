class User < ApplicationRecord
  has_many :collaborators
  has_many :wikis, through: :collaborators

  after_initialize { self.role ||= :standard }

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
end
