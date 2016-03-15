require_relative '../farmar'
require_relative'./farmar_vendor'
require_relative'./farmar_product'
require_relative'./farmar_market'

class FarMar::Sale
  attr_accessor :id, :transaction_amount, :purchase_time, :vendor_id, :product_id

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

  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  def vendor
    FarMar::Vendor.find(@vendor_id)
  end

#product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
def product
  FarMar::Product.find(@product_id)
end

# self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
def self.between(beginning_time, end_time)
  all_sales = CSV.read("./support/sales.csv", "r")
  sale_array = []
  beginning_time = beginning_time.gsub(/[:]/, '_')
  end_time = end_time.gsub(/[:]/, '_')

  all_sales.each do |sale|
    sale_time = sale[2]
    sale_time_array = sale_time.to_s.split(" ")
    time = sale_time_array[1].gsub(/[:]/, '_')
    if time.to_f > beginning_time.to_f && time.to_f < end_time.to_f
      sale_array << sale
    end
  end
  sale_array
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

    def self.product_sales(product_id)
      all_sales = CSV.read("./support/sales.csv", "r")
      sale_array = []
      all_sales.each do |individual_array|
        if individual_array[4].to_f == product_id.to_f
          sale = self.new(individual_array[0], individual_array[1], individual_array[2], individual_array[3], individual_array[4])
          sale_array << sale
        end
      end
      sale_array
    end

end
