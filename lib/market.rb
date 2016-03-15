class FarMar::Market
  attr_reader :id, :name

  extend FarMar::FarMarMethods

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @address = info_hash[:address]
    @city = info_hash[:city]
    @county = info_hash[:county]
    @state = info_hash[:state]
    @zip = info_hash[:zip]
  end

  def self.all(file_name = './support/markets.csv')
    market_keys = [:id, :name, :address, :city, :county, :state, :zip]

    make_all(file_name, market_keys)
  end

  def vendor
    FarMar::Vendor.by_market(id)
  end
end