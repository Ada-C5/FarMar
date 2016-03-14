# lib/farmar_sale.rb
class FarMar::Sale
  def initialize
    @sales = CSV.read('../support/sales.csv')
  end
end
