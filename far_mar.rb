# gems your project needs
require 'csv'
require 'time'

# our namespace module
module FarMar

MARKETS_CSV = './support/markets.csv'
VENDORS_CSV = './support/vendors.csv'
PRODUCTS_CSV = './support/products.csv'
SALES_CSV = './support/sales.csv'

end

# all of our data classes that live in the module
# (require all needed classes)
require_relative 'lib/farmar_market'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_sale'
require_relative 'lib/farmar_vendor'
