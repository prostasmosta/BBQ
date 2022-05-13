source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.2', '>= 7.0.2.4'
gem 'devise'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'carrierwave'
gem 'rmagick'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :production do
  gem 'pg'
end

group :development do
  gem 'web-console'
end
