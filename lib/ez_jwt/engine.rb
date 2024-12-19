module EzJwt
  class Engine < ::Rails::Engine
    isolate_namespace EzJwt
    config.generators.api_only = true
  end
end
