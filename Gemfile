# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'apartment'
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dry-validation'
gem 'jsonapi-utils', '~> 0.7.0'
gem 'jwt'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', github: 'varvet/pundit'
gem 'rack-cors'
gem 'rails', github: 'rails/rails', branch: '5-2-stable'
gem 'reform', '>= 2.2.0'
gem 'reform-rails'
gem 'warden'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'jsonapi-resources-matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
