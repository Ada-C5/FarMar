class FarMar::Vendor
  FILENAME = './support/vendors.csv'
  attr_reader :id, :name, :no_of_employess, :market_id
  def initialize(vendor_data)
    @id = vendor_data[:id].to_i #fixnum
    @name = vendor_data[:name] #string
    @no_of_employess = vendor_data[:no_of_employess].to_i #fixnum
    @market_id = vendor_data[:market_id].to_i #fixnum
  end

    def self.all # self is the class and all is the method
      # .all allows me to make a list of vendor instances from the csv file
      # .all is like a bucket that you fill up with all the vendors
      vendor_collection = []
      CSV.open(FILENAME, "r") do |csv|
      csv.read.each do |line|
        vendor_collection << self.new( id: line[0], name: line[1], no_of_employess: line[2], market_id: line[3] )
      end
      end
      return vendor_collection
    end

    def self.find(id)
      all_vendors = self.all
      all_vendors.each do |vendor|
        while vendor.id == id
        end
        return vendor #an instance
      end
      return nil
    end

    def market
      all_markets = FarMar::Market.all
      all_markets.select do |market|
        market.id == market_id
      end
    end

end
