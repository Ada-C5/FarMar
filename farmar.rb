require 'csv'

module FarMar
  class FarMar::FarMarClass

    def self.find(id)
        self.all.find { |x| x.id == id }
    end
    
  end
end

require_relative './lib/market'
require_relative './lib/product'
require_relative './lib/sale'
require_relative './lib/vendor'