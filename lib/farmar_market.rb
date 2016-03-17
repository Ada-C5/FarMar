#require_relative "../far_mar"

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

  def vendors
    vendors = CSV.read(VENDORS_CSV).select do |line|
      line[3].to_i == self.market_id
    end
    vendors.collect { |v| FarMar::Vendor.new(v)}
  end

end


# vendors: returns a collection of FarMar::Vendor instances that are associated with
# the market by the market_id field.

# def vendors_take_1
#   FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id}
# end

#products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
#self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
#prefered_vendor: returns the vendor with the highest revenue
#prefered_vendor(date): returns the vendor with the highest revenue for the given date
#worst_vendor: returns the vendor with the lowest revenue
#worst_vendor(date): returns the vendor with the lowest revenue on the given date




# def initialize(market_info)
#   @market_id = market_info[:market_id].to_i
#   @name = market_info[:name]
#   @address = market_info[:address]
#   @city = market_info[:city]
#   @county = market_info[:county]
#   @state = market_info[:state]
#   @zip = market_info[:zip]
# end


#self.all: returns a collection of instances, representing all of the objects described in the CSV
# def self.all
#   all_market_info = []
#   CSV.open(MARKET_CSV, 'r') do |csv|
#     csv.read.each do |line|
#       all_market_info.push(self.new(market_id: line[0], name: line[1], address: line[2], city: line[3], county:line[4], state: line[5], zip: line[6]))
#     end
#   end
#   return all_market_info
# end


# def self.find_first_try(id)
#   all_markets = self.all
#   all_markets.each do |market|
#     return market if market.market_id == id
#   end
#   nil
# end
