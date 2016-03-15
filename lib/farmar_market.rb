class FarMar::Market
  attr_reader :name, :address, :county, :state, :zip, :market_id, :city
  def initialize(line) #for all, csv length -1?
    @market_id = line[0].to_i
    @name = line[1].to_s
    @address = line[2].to_s
    @city = line[3].to_s
    @county = line[4].to_s
    @state = line[5].to_s
    @zip = line[6].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/markets.csv')
  end

  def self.all
    market_instances = {}
    self.pull_from_csv.each do |market|
      market_instances[market[0]] = FarMar::Market.new(market)
    end
      market_instances
  end

  def self.find(id) #search by market id
    self.pull_from_csv.each do |market_instance|
      if market_instance[0].to_i == id.to_i
        return FarMar::Market.new(market_instance)
      end
    end
    return "No instance found"
  end

  def vendors #search by market id
    FarMar::Vendor.all.select {|vendor_id, instance| instance.market_id == self.market_id}
  end
end
