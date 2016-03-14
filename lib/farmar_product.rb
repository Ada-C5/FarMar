require_relative '../farmar'

class FarMar::Product

  def initialize(id, name, vendor_id)
    @id         = id #product ID
    @name       = name
    @vendor_id  = vendor_id
  end

  def self.all
    all_products = CSV.read("./support/products.csv", "r")

    all_products.collect do |individual_array|
      @id           = individual_array[0]
      @name         = individual_array[1]
      @vendor_id    = individual_array[2]

      self.new(@id, @name, @vendor_id)
    end
  end

  def self.find(id)
    all_products = CSV.read("./support/products.csv", "r")

    all_products.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        return self.new(individual_array[0], individual_array[1], individual_array[2])
      end
    end
  end

end
