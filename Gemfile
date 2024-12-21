source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.3.6'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"


# Use the Puma web server [https://github.com/puma/puma]
gem "puma"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt"

# Other Stuff
gem 'jwt'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "byebug"
  gem 'sqlite3'
end

group :test do
  gem "minitest-reporters"
end

group :production do
  gem 'pg'
end




