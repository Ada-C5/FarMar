# lib/farmar_product.rb
class FarMar::Product
  def initialize
    @products = CSV.read('../support/products.csv')
  end

end
