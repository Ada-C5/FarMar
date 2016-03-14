require 'simplecov'
SimpleCov.start

require_relative '../far_mar'

require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
