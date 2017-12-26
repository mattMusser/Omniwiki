source 'https://rubygems.org'

ruby "2.4.3"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Bootstrap 4
gem 'bootstrap', '~> 4.0.0.beta2.1'
# Use Sprockets Rails
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Bootstrap Javascript depends on jQuery
gem 'jquery-rails', '~> 4.3.1'

# Used to access font-awesome fonts
gem 'font-awesome-rails', '~> 4.7.0'
# Used to format Rspec
gem 'fuubar', '~> 2.2.0'

# Use Devise for authentication
gem 'devise', '~> 4.3.0'

# Use mail gun to send emails
#gem 'mailgun_rails'

# Use figaro for to store environment variables
gem 'figaro', '~> 1.1.1'

# Use Pundit for authorization
gem 'pundit', '~> 1.1.0'

# User Faker to generate seed data
gem 'faker', '~> 1.8.7'

# Use Stripe to handle payments
gem 'stripe', '~> 3.9.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  #Use pg as the production database for Active Record
  gem 'pg', '~> 0.21.0'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.13'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  gem 'rspec-rails', '3.6.1'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'shoulda', '~> 3.5.0'
  gem 'foreman', '~> 0.84.0'
end
