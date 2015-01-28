
require 'rails/railtie'

module CoffeelintRails
  class Railtie < ::Rails::Railtie
    VERSION = '0.0.1'

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end


  end
end
