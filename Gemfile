# encoding: utf-8

# RubyGems Source
source 'http://rubygems.org'

# Include gem dependencies from the gemspec for development purposes
gem 'thor',   '~> 0.14.6'
gem 'POpen4', '~> 0.1.4'

# Load Backup::Dependency
["cli/helpers", "dependency"].each do |library|
  require File.expand_path("../lib/backup/#{library}", __FILE__)
end

# Dynamically define the dependencies specified in Backup::Dependency.all
Backup::Dependency.all.each do |name, gemspec|
  gem(name, gemspec[:version])
end

# Define gems to be used in the 'test' environment
group :test do
  gem 'rspec'
  gem 'mocha'
  gem 'timecop'
  gem 'fuubar'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent' # guard notifications for osx
  gem 'growl'      # $ brew install growlnotify
  gem 'rb-inotify' # guard notifications for linux
  gem 'libnotify'  # $ apt-get install ???
end