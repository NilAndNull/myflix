source 'https://rubygems.org'
ruby '2.2.0'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'coffee-rails'
gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0.3'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'

gem 'bcrypt'

# Automatically adds the proper vendor prefixes to CSS code when it is compiled
gem 'autoprefixer-rails', '~> 5.1.7'

# The default_value_for plugin allows one to define default values for ActiveRecord models in a declarative manner.
gem "default_value_for", '~> 3.0.1'

# Rails form builder that makes it super easy to integrate twitter bootstrap-style forms into your rails application.
gem 'bootstrap_form'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'ruby-prof'
  gem 'rails-perftest'

  # Create customizable Minitest output formats
  gem 'minitest-reporters', '1.0.8'
  
  # Allows to take advantage of the Rails.backtrace_cleaner when using MiniTest.
  gem 'mini_backtrace', '0.1.3'
  
   # Add a comment summarizing the current schema, in model files, routes, tests and fixtures
  gem 'annotate', '~> 2.6.8'

  gem 'shoulda'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 4.0.3'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
end

group :production do
  gem 'rails_12factor'
end

