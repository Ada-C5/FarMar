require 'csv'

module FarMar


  require_relative './lib/market.rb'
  require_relative './lib/product.rb'
  require_relative './lib/sale.rb'
  require_relative './lib/vendor.rb'

  puts Market.new({market_id: 5, market_name: "Quincy Farmers Market", address: "0 Denis Ryan Parkway", city: "Quincy", county: "Norfolk", state: "Massachusetts", zip: "2169"})






end
