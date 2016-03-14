class FarMar::Market

  def initialize(market)
    @id      = market[:id]
    @name    = market[:name]
    @address = market[:address]
    @city    = market[:city]
    @county  = market[:county]
    @state   = market[:state]
    @zip     = market[:zip]
  end

  def self.all
    all_markets = []
    keys = [:id, :name, :address, :city, :county, :state, :zip]
    market_hash = CSV.read('./support/markets.csv').map {|values| Hash[ keys.zip(values) ]}
    market_hash.each do |market|
      all_markets << self.new(market)
    end
    ap all_markets
  end


end
