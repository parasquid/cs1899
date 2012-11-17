source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :development, :test do
  gem 'sqlite3-ruby'
  gem 'rspec-rails'
  gem 'sextant'
  gem 'quiet_assets'
end
gem 'pg', '0.14.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

# challenge requirements
gem 'devise', '~> 2.0.0'
gem 'bootstrap-sass', '2.1.1.0'
gem 'simple_form', '2.0.4'
gem 'refinerycms', '2.0.8'
gem 'refinerycms-bootstrap', git: 'git://github.com/ghoppe/refinerycms-bootstrap.git'

# gems from old site's gemfile
gem 'compass', git: 'git://github.com/chriseppstein/compass.git'
gem 'databasedotcom'
gem 'databasedotcom-rails'
gem 'haml'
gem 'will_paginate'
gem 'httparty'

gem 'ruby-openid', :git => "git://github.com/mbleigh/ruby-openid.git"
gem 'openid_active_record_store'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-openid'
gem 'omniauth-salesforce'
gem 'savon'

gem 'redis'
gem 'aws-s3', :require => 'aws/s3'
gem 'thin'
gem 'resque', :git => 'http://github.com/hone/resque.git', :branch => 'keepalive', :require => 'resque/server'
gem "recaptcha", :require => "recaptcha/rails"
gem 'flash_messages_helper'
gem 'remote_syslog_logger'
gem 'dalli'
gem 'encryptor'
gem 'airbrake'

group :development, :test do
  gem 'annotate', '2.4.0'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'growl'
  gem 'ruby-debug19'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "minitest"
end

gem 'rest-client', '1.6.7', require: 'rest_client'
gem 'hashie', '1.2.0'
