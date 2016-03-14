require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

# gives us pretty output
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new