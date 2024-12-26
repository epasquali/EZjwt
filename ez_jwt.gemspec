require_relative "lib/ez_jwt/version"

Gem::Specification.new do |spec|
  spec.name        = "ez_jwt"
  spec.version     = EzJwt::VERSION
  spec.authors     = ["Elisa Pasquali"]
  spec.email       = ["epasquali@hotmail.com"]
  spec.homepage    = "http://github.com/epasquali/ez_jwt"
  spec.summary     = "Implements simple JWT authentication for Rails APIs."
  spec.description = "Implements simple JWT authentication for Rails APIs."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/epasquali/ez_jwt"
  spec.metadata["changelog_uri"] = "http://github.com/epasquali/ez_jwt"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.6"
  spec.add_dependency "jwt"
end
