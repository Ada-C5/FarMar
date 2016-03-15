# lib/farmar_market.rb
class FarMar::Product

  attr_reader :product_id, :product_name, :vendor_id #these are like the instance variables, but now methods!

    def initialize (market_hash)
      @product_id = market_hash[:product_id]
      @product_name = market_hash[:product_name]
      @vendor_id = market_hash[:vendor_id]
    end
end
