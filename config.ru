require 'sinatra/base'
require './app'

Charter.run! :host => 'localhost', :port => 4567

