require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../far_mar'

# Give pretty output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
