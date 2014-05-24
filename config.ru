require 'rubygems'
require 'bundler'

Bundler.require

require './app'

use Rack::Deflater

run App
