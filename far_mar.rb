# gems your project needs
require 'csv'

module FarMar

  # class General_FarMar 
  #
  #   def self.create_all
  #       vendor_csv_file = CSV.read(CSV_FILE)
  #       vendor_csv_file.map {|line| self.new(line)
  #     end
  #   end
  #
  #   def self.find(id)
  #     self.all.find {|vendor| vendor.id == id}.first
  #   end
  # end
end


require_relative './lib/market'
require_relative './lib/vendor'
require_relative './lib/product'
require_relative './lib/sale'
