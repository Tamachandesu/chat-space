require 'rails/all'


Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
 
  end
    config.generators do |g|
      g.test_framework false
      g.helper false
      g.assets false
    end
    
    end
end
