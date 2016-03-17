# gems your project needs
require 'csv'
require 'chronic'
require 'date'

# our namespace module
module FarMar
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
