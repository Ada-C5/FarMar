require_relative '../farmar'

class FarMar::Sale
  attr_accessor :transaction_amount

  def initialize(id, transaction_amount, purchase_time, vendor_id, product_id)
    @id                 = id #sale id
    @transaction_amount = transaction_amount  #in cents
    @purchase_time      = purchase_time
    @vendor_id          = vendor_id
    @product_id         = product_id
  end

  def self.all
    all_sales = CSV.read("./support/sales.csv", "r")

    all_sales.collect do |individual_array|
      @id                   = individual_array[0]
      @transaction_amount   = individual_array[1]
      @purchase_time        = individual_array[2]
      @vendor_id            = individual_array[3]
      @product_id           = individual_array[4]

      self.new(@id, @transaction_amount, @purchase_time, @vendor_id, @product_id)
    end
  end

  def self.find(id)
    all_sales = CSV.read("./support/sales.csv", "r")

    all_sales.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        return self.new(individual_array[0], individual_array[1], individual_array[2], individual_array[3], individual_array[4])
      end
    end
  end

  private
    def self.vendor_sales(vendor_id)   #used by the Vendor.sales method
      all_sales = CSV.read("./support/sales.csv", "r")
      sale_array = []
      all_sales.each do |individual_array|
        if individual_array[3].to_f == vendor_id.to_f
          sale = self.new(individual_array[0], individual_array[1], individual_array[2], individual_array[3], individual_array[4])
          sale_array << sale
        end
      end
      sale_array
    end


end
