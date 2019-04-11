# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.3'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
# gem 'rack-cors'

# Paranoia is a re-implementation of acts_as_paranoid for Rails 3, 4, and 5,
# using much, much, much less code. You would use either plugin / gem if you
# wished that when you called destroy on an Active Record object that it didn't
# actually destroy it, but just "hid" the record. Paranoia does this by setting
# a deleted_at field to the current time when you destroy a record, and hides it
# by scoping all queries on your model to only include records which do not have
# a deleted_at field.
gem 'paranoia', '~> 2.4'

# Provides validates :password for ActiveModel
gem 'password_validation', '~> 0.0.1'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard
gem 'jwt', '~> 2.1.0'

# Is a simple mixin to add thread-safe configuration behaviour to your classes
gem 'dry-configurable', '~> 0.7.0'

# GraphQL strategies
gem 'graphql', '~> 1.8'

# Interactor provides a common interface for performing complex user
# interactions
gem 'interactor-rails', '~> 2.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails', '~> 5.0'

  # A library for generating fake data such as names, addresses, and phone
  # numbers
  gem 'faker', '~> 1.9'

  # BDD for Ruby
  gem 'rspec-rails', '~> 3.8'

  # Code coverage for Ruby 1.9+ with a powerful configuration library and
  # automatic merging of coverage across test suites
  gem 'simplecov', '~> 0.16.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Code smell detector for Ruby
  gem 'reek', '~> 5.3'

  # A Ruby static code analyzer and formatter, based on the community Ruby style
  # guide.
  gem 'rubocop', '~> 0.67.2'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :doc do
  # Use Thin for `yard server -s thin -r`
  gem 'thin', '~> 1.7'

  # A Ruby documentation tool
  gem 'yard', '~> 0.9.19'
  gem 'yard-rspec', '~> 0.1'
end

gem 'seedbank', '~> 0.5.0'
