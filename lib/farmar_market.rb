class FarMar::Market < FarMar::SharedStuff
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

  def self.make_new_instance(market_instance)
    FarMar::Market.new(market_instance)
  end

  def vendors #search by market id
    FarMar::Vendor.all.select {|vendor_id, instance| instance.market_id == self.market_id}
  end

  def self.find_by_name(match) #finds first instance of matching name

    self.pull_from_csv.each do |instance|
      if instance[1].include?(match.downcase.to_s)
        return make_new_instance(instance)
      end
    end
    return "No instance found"
  end

  def self.find_all_by_name(match)
    all_match = FarMar::Market.all.select {|vendor_id, instance| instance.name.include?(match.downcase.to_s)}
    if all_match.empty?
      return "No instance found"
    else
      return all_match.values #array of instances
    end

  end

end
