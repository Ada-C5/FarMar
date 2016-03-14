require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

#give us some really pretty output :)
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
