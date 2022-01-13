require_relative 'intcode_processor'
require 'debug'

IntcodeProcessor.new(File.read('9.input')).run!
