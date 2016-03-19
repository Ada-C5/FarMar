# gems your project needs
require 'csv'
require 'chronic'
require 'date'

# our namespace module
module FarMar
end

class RepeatMethods
  # DATA = "./support/vendors.csv"

  def self.all
    CSV.read(self::DATA).map { |line|  self.new(line) }
  end

  def self.find(id)
    CSV.foreach(self::DATA) do |line|
      return self.new(line) if line[0].to_i == id
    end
  end

end

PRODUCT_CSV = "./support/products.csv"
MARKET_CSV = "./support/markets.csv"
VENDORS_CSV = "./support/vendors.csv"
SALE_CSV = "./support/sales.csv"
# all of our data classes that live in the module
require_relative './lib/farmar_market'
# ...require all needed classes

require_relative "./lib/farmar_sale"
require_relative './lib/farmar_vendor'
require_relative './lib/farmar_product'
