require 'simplecov'
SimpleCov.start

require 'car'
require 'commandOperation'
require 'grid'
require 'position'

# TODO: load all lib files instead (fix system.rb)
#Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }