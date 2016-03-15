# lib/farmar_market.rb
#require_relative './FarMar'

class FarMar::Market
  attr_reader :market_id, :market_name, :address, :city, :county, :state, :zip #these are like the instance variables, but now methods!

    def initialize (market_hash)
      @market_id = market_hash[:market_id]
      @market_name = market_hash[:market_name]
      @address = market_hash[:address]
      @city = market_hash[:city]
      @county = market_hash[:county]
      @state = market_hash[:state]
      @zip = market_hash[:zip]

    end


  #self.all - returns a collection of Market instances
  #representing all of the Markets described in the CSV.
  def self.all
    market_collection = []
    market_array = []
    market_array = CSV.read("./support/markets.csv", 'r')  #this is reading the csv file and creating and array of arrays

        #iterating through the array and setting each index within the inner array to the hash below(then we can call on a key instead of an index)
    market_array.each do |market|  # local variable you can use within your loop
        #this is making an account_hash to hold the info
      market_hash = {market_id: market[0], market_name: market[1], address: market[2], city: market[3], county: market[4], state: market[5], zip: market[6]}
        #making new market from my market_hash I just created, but I need to save it somewhere, see below:
      new_market = FarMar::Market.new(market_hash)
      market_collection << new_market
        #(with the .new so its running through the initialize method here BEFORE the next step)
    end
      return market_collection  #this is an array of FarMar::Market instances***
  end


  # self.find(id) - returns an instance of Market where the value of the id field in the CSV matches the passed parameter
  def self.find(id_requested)
    id_requested = id_requested.to_s  #need to switch either this to a string bc everything from CSV's come in as a string!! OR i can change it to_i as it comes in from CSV (look up at self.all market_hash={})
    market_array = []
    market_array = self.all  #doing this bc i already read through the csv and create this          #CSV.read("./support/markets.csv", 'r')
    #puts market_array
    #info_hash = {}
     #same as above to create an array of the csv file
     #iterate through this array and set each index in each inner array as a has with these things below:
    market_array.each do |market|  #length.times do |id_requested|(could also do it this way) #this is an array of SPECIFIC MARKETS
      if market.market_id == id_requested  #if id matches the user-requested id, do this:
        # info_hash[:market_id] = market.market_id
        # info_hash[:market_name] = market.market_name
        # info_hash[:address] = market.address
        # info_hash[:city] = market.city
        # info_hash[:county] = market.county
        # info_hash[:state] = market.state
        # info_hash[:zip] = market.zip
        # requested_market = FarMar::Market.new(info_hash)   #for a find i would pass in the id, but for creating a new object i pass in the hash
        return market #break out of the loop when you find the id that matches
      end
    end
        return nil   #return nil if the id is not found (this needs to be outside the method that is finding the id)
  end

























  #this will create a new instance as an array based on the index you call for:
  # def create_new_market(csv_index)
  #   market_array = []
  #   market_array = CSV.read("./support/markets.csv", 'r')
  #
  #    #So this is going through the file and it's saying that whatever the person choses for the csv_index,
  #    #look at that index and go through that index and assign each of the internal indexes to instance variables****
  #
  #    @market_id = market_array[csv_index][0]
  #    @market_name = market_array[csv_index][1]
  #    @address = market_array[csv_index][2]
  #    @city = market_array[csv_index][3]
  #    @county = market_array[csv_index][4]
  #    @state = market_array[csv_index][5]
  #    @zip = market_array[csv_index][6]
  #
  #   puts "#{@market_id}, #{@market_name}, #{@address}, #{@city}, #{@county}, #{@state}, #{@zip}."
  #
  # end
  #
  # my_account = FarMar::Market.new
  # my_account.create_new_market(4)


end


#def read_csv(markets.csv)
  #allmarket = CSV.read(file, 'r')
  #return read_csv
#end
