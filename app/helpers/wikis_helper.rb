module WikisHelper
	def is_user_collaborator?(id, collaborator)
		collaborator.find { |user| user[:id] == id }
	end
end
