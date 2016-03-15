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


  def markets
        market_list= []
        CSV.read("./support/markets.csv").each do |line|
          if line[0] == @market_id
            market_list<< FarMar::Market.new(line[0],line[1],line[2],line[3],line[4],line[5],line[6])
          end
      end
      return market_list #just as a reminder out side of loop

  end



  def products
        product_list = []
        CSV.read("./support/products.csv").each do |line|
          if line[2] == id.to_s
            product_list<< FarMar::Product.new(line[0],line[1],line[2])
          end
      end
      return product_list #just as a reminder out side of loop

  end

    def sales
      sales_list = []
        CSV.read("./support/sales.csv").each do |line|
        if line[3] == id.to_s
          sales_list << FarMar::Sales.new(line[0],line[1],line[2],line[3],line[4])
        end
      end
      return sales_list
    end

    def revenue
        revenue_list = []
        CSV.read("./support/sales.csv").each do |line|
        if line[3] == id.to_s
        revenue_list << FarMar::Sale.new(line[0],line[1],line[2],line[3],line[4]).amount.to_i
        end
      end
      revenue_list.reduce(0,:+) #fix this later it need to get only index 1

    end

    def self.by_market(market_id)
      market_id_list = []
      CSV.read("./support/vendors.csv").each do |line|
        if line[3] == market_id
          market_id_list <<  self.new(line[0],line[1],line[2],line[3])
        end
      end

        market_id_list
    end

end
