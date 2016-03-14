# lib/farmar_market.rb
class FarMar::Market
  def initialize
    @markets = CSV.read('../support/markets.csv')
  end
end
