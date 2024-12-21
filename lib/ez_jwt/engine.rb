module EzJwt
  class Engine < ::Rails::Engine
    isolate_namespace EzJwt
    config.generators.api_only = true

    config.autoload_paths << root.join('lib')
  end
end
