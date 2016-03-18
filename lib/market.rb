#require_relative '../far_mar'
require 'CSV'
class FarMar::Market
  include FarMar
  attr_reader :id, :name, :address, :city, :county, :state ,:zip

  def initialize(id=nil,name=nil,address=nil,city=nil,county=nil,state=nil,zip=nil)
    @id = id.to_s
    @name = name
    @address = address
    @city  = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
      markets = []
      CSV.read("./support/markets.csv").each do |line|
      markets << self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
    end
    return markets #just as a reminder out side of loop
  end


  def self.find(id)
    CSV.read("./support/markets.csv").each do |line|
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
        end
      end
  end

  def vendors
        vendor_list= []
        CSV.read("./support/vendors.csv").each do |line|
          if line[3] == @id.to_s
            vendor_list<< FarMar::Vendor.new(line[0],line[1],line[2],line[3])
          end
      end
      return vendor_list #just as a reminder out side of loop

  end










end
