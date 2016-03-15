# lib/farmar_market.rb
class FarMar::Vendor
      attr_reader :vendor_id, :vendor_name, :num_employ, :market_id #these are like the instance variables, but now methods!

        def initialize (market_hash)
          @vendor_id = market_hash[:vendor_id]
          @vendor_name = market_hash[:vendor_name]
          @num_employ = market_hash[:num_employ]
          @market_id = market_hash[:market_id]
        end







end
