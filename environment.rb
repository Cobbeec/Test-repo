#connect the program so files can talk to each other 
#require our gems 


require 'pry'
require 'net/http'
require 'json'

require_relative './lib/api'
require_relative './lib/cli'
require_relative './lib/ingredient'
require_relative './lib/meal'