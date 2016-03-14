require_relative '../farmar'

class FarMar::Sale

  def initialize(id, transaction_amount, purchase_time, vendor_id, product_id)
    @id                 = id #sale id
    @transaction_amount = transaction_amount  #in cents
    @purchase_time      = purchase_time
    @vendor_id          = vendor_id
    @product_id         = product_id
  end

  def self.all
    require "CSV"
    all_sales = CSV.read("./support/sales.csv", "r")

    all_sales.each do |individual_array|
      @id                   = individual_array[0]
      @transaction_amount   = individual_array[1]
      @purchase_time        = individual_array[2]
      @vendor_id            = individual_array[3]
      @product_id           = individual_array[4]
    end
  end

  def self.find(id)
    require "CSV"
    all_sales = CSV.read("./support/sales.csv", "r")

    all_sales.each do |individual_array|
      if individual_array[0].to_f == id.to_f
        puts "Sale ID:             #{individual_array[0]}"
        puts "Transaction Amount:  #{individual_array[1]}"
        puts "Purchase Time:       #{individual_array[2]}"
        puts "Vendor ID:           #{individual_array[3]}"
        puts "Product ID:          #{individual_array[4]}"
      end
    end
  end

end
