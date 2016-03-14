#require_relative './far_mar'if i want to run it in IRB
require 'CSV'
class FarMar::Vendor
  include FarMar
  attr_reader :id, :name, :no_of_employees, :market_id
  def initialize(id=nil,name=nil,no_of_employees=nil,market_id=nil)
    @id = id.to_s
    @name = name
    @no_of_employees = no_of_employees.to_s
    @market_id = market_id
  end


  def self.all
      vendors = []
      CSV.read("./support/vendors.csv").each do |line|
      vendors << self.new(line[0],line[1],line[2],line[3])
    end
    return vendors #just as a reminder out side of loop
  end

  def self.find(id)
    CSV.read("./support/vendors.csv").each do |line|
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2],line[3])
        end
      end
  end



end
