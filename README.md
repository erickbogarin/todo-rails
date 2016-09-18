## Todo Rails

[![Build Status](https://travis-ci.org/erickbogarin/todo-rails.svg?branch=master)](https://travis-ci.org/erickbogarin/todo-rails)
[![Code Climate](https://codeclimate.com/github/erickbogarin/todo-rails/badges/gpa.svg)](https://codeclimate.com/github/erickbogarin/todo-rails)

Basic application with <tt>Ruby on Rails</tt> where users can control, visualize and organize tasks.

[Live Demo](https://todos-eb.herokuapp.com)

### Technology Stack

Server-side:

* Ruby on Rails 4.2.6
* TDD and BDD (rspec, capybara)
* Rails Authentication with OAuth (devise, omniauth)
* Restful API
* Heroku fully cloud deployable

Client-side:

* Foundation for Sites 6
* BackboneJS (Underscore.js template)
* Sass
* CoffeScript

## How to run this application
1. Make sure to set YOUR **TWITTER_KEY** and **TWITTER_SECRET** ENV variables
2. Open a CLI and then copy the following commands
```
git clone https://github.com/erickbogarin/todo-rails.git
cd todo-rails
bundle exec rake db:drop db:create db:migrate
rails s
```
Go to localhost:3000/ to see the app

## Credits
Vertical Timeline by [CodyHouse](https://codyhouse.co/gem/vertical-timeline/)
