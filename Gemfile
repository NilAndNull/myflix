source 'https://rubygems.org'
ruby '2.2.0'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'coffee-rails'
gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0.3'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'

# Automatically adds the proper vendor prefixes to CSS code when it is compiled
gem 'autoprefixer-rails', '~> 5.1.7'

# The default_value_for plugin allows one to define default values for ActiveRecord models in a declarative manner.
gem "default_value_for", '~> 3.0.1'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '~> 3.2.1'
  
   # Add a comment summarizing the current schema, in model files, routes, tests and fixtures
  gem 'annotate', '~> 2.6.8'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
end

group :production do
  gem 'rails_12factor'
end

