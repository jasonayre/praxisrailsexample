# -p 8888

ENV['RACK_ENV'] ||= 'development'
Bundler.setup(:default, ENV['RACK_ENV'])
Bundler.require(:default, ENV['RACK_ENV'])
puts "THIS IS BEING CALLED"
run Praxis::Application.instance.setup
