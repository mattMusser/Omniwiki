class Collaborator < ApplicationRecord::Base
	belongs_to :wiki
	belongs_to :user
end
