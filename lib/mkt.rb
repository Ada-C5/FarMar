# lib/farmar_market.rb
#need to access the csv 'markets', retrieve instances of market + create new instances
class FarMar::Market
  attr_accessor :id, :name, :city
  def initialize(id, name, city)
    @id = id
    @name = name
    @city = city
  end


#csv holds: id, name, address, city, county, state, zip
    def self.all
      all_mkt = { }
      CSV.read('support/markets.csv').each do |line|
        all_mkt[line[0]] = Account.new(line[1..line.length])
        #(line[1]line[0], DateTime.parse(line[2]))
        # ^this may be appropriate depending on how the csv data prints.
      end
      return all_mkt
    end

#     def self.find(id)
#       CSV.read('support/markets.csv').each do |line|
#         if line[0] == id
#           return Account.new(line[1..line.length])
#         end
#       end
#     end
end
