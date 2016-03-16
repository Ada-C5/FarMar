require 'csv'
require 'time' 
# tests pass without this, but irb requires it to use Time.parse
# is it a version issue? included it to cover all bases.

module FarMar; end

require_relative './lib/far_mar_methods'
require_relative './lib/market'
require_relative './lib/product'
require_relative './lib/sale'
require_relative './lib/vendor'