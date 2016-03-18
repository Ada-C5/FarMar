require 'simplecov'
SimpleCov.start

require_relative '../far_mar'
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun' # run all tests
require 'minitest/reporters' # bring in extra reports from minireporters gem

# give us some really pretty output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
