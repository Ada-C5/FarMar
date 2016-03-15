# lib/farmar_market.rb
class FarMar::Sale
  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id #these are like the instance variables, but now methods!

    def initialize (market_hash)
      @sale_id = market_hash[:sale_id]
      @amount = market_hash[:amount]
      @purchase_time = market_hash[:purchase_time]
      @vendor_id = market_hash[:vendor_id]
      @product_id = market_hash[:product_id]
    end

end
 #how is this accessing the CSV file???
