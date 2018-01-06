namespace :friendly_id do
  desc "TODO"
  task add_friendly_id: :environment do
    User.find_each(&:save)
  end

end
