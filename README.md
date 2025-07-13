# Omniwiki

Omniwiki is a Rails application that allows users to create wikis for anything they can think of (familiy friendly of course). Wikis can be created or edited by users who are knowledgeable about a certain topic. Any user can create and edit public wikis; however, premium users can create private wikis. Other users can be added to these private wikis and edit them as collaborators.

Deployed at https://omni-wiki.herokuapp.com

## Built With

* HTML5
* CSS3
* Bootstrap
* Ruby
* Rails
* Devise
* Pundit
* Faker
* Figaro
* Stripe
* Redcarpet

## Installation

If you want to install Omniwiki locally, you need to make sure you have Ruby installed on your machine, and then fork and clone this repository. After you have cloned the repository locally, use bundler to install dependencies.

```bash
#if needed
gem install bundle

bundle install
```
After that you will need to set up the databases.
```bash
rails db:setup
```
Start up the local development server adn vistit the default port at `http://localhost:3000'.
```bash
rails s
```

## Author
Matt Musser
