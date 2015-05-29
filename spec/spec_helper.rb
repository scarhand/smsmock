SOURCE_ROOT = File.expand_path("..", File.dirname(__FILE__))
$LOAD_PATH.unshift(SOURCE_ROOT)
ENV['RAILS_ENV'] = ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'twilio-ruby'
require 'lib/smsmock'