#require_relative '../far_mar'
require 'CSV'
class FarMar::Product
  include FarMar
attr_reader :id, :name, :vendor
  def initialize(id=nil,name=nil,vendor_id=nil)
    @id = id
    @name = name.to_s
    @vendor_id = vendor_id.to_i
  end

  def self.all
      products = []
      CSV.read("./support/products.csv").each do |line| #remember to take off dot when using rake
      products << self.new(line[0],line[1],line[2])
    end
    return products #just as a reminder out side of loop
  end

  def self.find(id)
    CSV.read("./support/products.csv").each do |line| #remember to take off dot when using rake
        if line[0] == id.to_s
          return self.new(line[0],line[1],line[2])
        end
      end
  end





end
