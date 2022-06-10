source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.2', '>= 7.0.2.4'

gem 'active_storage_validations'
gem 'aws-sdk-s3'
gem 'cssbundling-rails'
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'image_processing', '>= 1.2'
# gem 'jquery-rails'
gem 'jsbundling-rails'
gem 'mailjet'
gem 'omniauth'
gem 'omniauth-vkontakte'
gem 'omniauth-yandex'
gem 'puma', '~> 5.0'
gem 'rails-i18n'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
  gem 'letter_opener'
end

group :production do
  gem 'pg'
end
