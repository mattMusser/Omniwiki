class Wiki < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  after_initialize { self.private ||= false }
end
