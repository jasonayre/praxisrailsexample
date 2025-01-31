require 'link_header'
require 'parslet'
require 'praxis'
require 'praxis/extensions/field_selection'
require 'praxis/extensions/rendering'
require 'praxis/plugins/mapper_plugin'
require_relative '../design/api'

Praxis::Application.configure do |application|
  application.bootloader.use Praxis::Plugins::MapperPlugin

  puts application.inspect

  # binding.pry

  # This is a commented out copy of the default Praxis layout
  # This example app follows the standard practices, so there is no reason to override it
  # If we wanted to organize the structure and ordering of files, we can uncomment the layout
  # and define it at our own leisure
  application.layout do
    map :initializers, 'config/initializers/**/*'
    map :lib, 'lib/**/*'
    map :design, 'design/' do
      map :api, 'api.rb'
      map :helpers, '**/helpers/**/*'
      map :types, '**/types/**/*'
      map :media_types, '**/media_types/**/*'
      map :endpoints, '**/endpoints/**/*'
    end
    map :app, 'app/' do
      map :models, 'models/**/*'
      map :responses, '**/responses/**/*'
      map :exceptions, '**/exceptions/**/*'
      map :concerns, '**/concerns/**/*'
      map :resources, '**/resources/**/*'
      map :controllers, '**/controllers/**/*'
    end
  end
end
