source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'knock'
gem 'will_paginate'
# gem 'kaminari'
gem 'api-pagination' # пагинацию будем передавать в заголовках аля X-total X-page и тд
gem 'pg_search'
gem 'carrierwave', :github => 'carrierwaveuploader/carrierwave'
gem 'carrierwave-bombshelter' # защита от pixel flood attack
gem 'mini_magick'

gem 'faker'
gem 'factory_girl_rails'

group :development, :test do
  gem 'byebug', platform: :mri

  gem 'guard-rspec'
end

group :test do

  gem 'rspec-rails'
  gem 'database_cleaner'
end

group :development do
  gem 'debase'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'meta_request'

  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm', github: 'capistrano/rvm'
  gem 'capistrano3-puma'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
