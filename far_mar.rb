# gems your project needs
require 'csv'
require 'time'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
# (require all needed classes)
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'
require_relative 'lib/farmar_vendor'
