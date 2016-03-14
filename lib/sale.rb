#require_relative './far_mar' if i want to run it in IRB
require 'CSV'
class FarMar::Sale
  include FarMar
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(id=nil,amount=nil,purchase_time=nil,vendor_id=nil,product_id=nil)
    @id = id.to_s
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end


  def self.all
      sales = []
      CSV.read("./support/sales.csv").each do |line|
      sales << self.new(line[0],line[1],line[2],line[3],line[4])
    end
    return sales #just as a reminder out side of loop
  end

  def self.find(id)
    CSV.read("./support/sales.csv").each do |line|
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2],line[3],line[4])
        end
      end
  end

end
