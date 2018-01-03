class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators

  searchable do
    text :title, :default_boost => 2
    text :body
  end
end
