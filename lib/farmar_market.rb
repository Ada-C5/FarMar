
class FarMar::Market

  attr_reader :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(market_info)
    @market_id, @name, @address, @city, @county, @state, @zip = market_info
    @market_id = @market_id.to_i
  end

  def self.all
    CSV.read(MARKET_CSV).map do |line|
      self.new(line)
    end
  end

  def self.find(id)
    CSV.foreach(MARKET_CSV) do |line|
      return self.new(line) if line[0].to_i == id
    end
  end

  # vendors: returns a collection of FarMar::Vendor instances that are associated with
  # the market by the market_id field.
  def vendors
    vendors = CSV.read(VENDORS_CSV).select do |line|
      line[3].to_i == self.market_id
    end
    vendors.collect { |v| FarMar::Vendor.new(v)}
  end

end


# def vendors_take_1
#   FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id}
# end

#products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
#self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
#prefered_vendor: returns the vendor with the highest revenue
#prefered_vendor(date): returns the vendor with the highest revenue for the given date
#worst_vendor: returns the vendor with the lowest revenue
#worst_vendor(date): returns the vendor with the lowest revenue on the given date
