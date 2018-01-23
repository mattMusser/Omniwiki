# Omniwiki

Omniwiki is a encyclopdia of wikis based on just about anything. Wikis can be created or edited by users who are knowledgeable about a certain topic. Any user can create and edit public wikis; however, premium users can create private wikis. Other users can be added to these private wikis and edit them as collaborators.

## Why

After the the creation of Wikipedia thousands of copycats sprung up dedicated to a single over-arching subject instead of dedicated to a wide range of subjects. Thats where Omniwiki comes in. Omniwiki strides to be better than Wikipedia but to be a better alternative where users can discover and create a wikis on any subject they choose.

## How (Tech)

Built on Rails 5.1.4 using PostgresSQL and deployed on Heroku.

#### Key Gems

* Devise
* Pundit
* Faker
* Figaro
* pg (PostgresSQL)
* Stripe
* Redcarpet
* Bootstrap 3.3.7

## Getting Started

### Prerequisites

* Rails 5.1.4 ([Install](http://installrails.com/steps/choose_os))
* PostgresSQL ([Install](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04))

### Run locally

1) Clone this repository and navigate to it within the terminal
2) Install gems: bundle install
3) Create local database: rake db:create
4) Run Migrations: rake db:migrate
5) Open the db/seeds.rb and edit the admin user to your own details
6) Seed the database: rake db:seed
7) Run the server: rails s
8) View the project at localhost:3000
9) Ctrl + C to shutdown the server

## Who

Created and maintained by [Matt Musser](http://www.github.com/mattMusser)

