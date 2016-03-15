
class FarMar::Sale

  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @sale_id = sale_hash[:sale_id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  # self.all: returns a collection of instances, representing all of the objects described in the CSV

  def self.all
    csv_sale_array = []
    CSV.open("./support/sales.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_sale_array << FarMar::Sale.new(sale_id: row[0].to_i, amount: row[1].to_i, purchase_time: DateTime.parse(row[2]), vendor_id: row[3].to_i, product_id: row[4].to_i)
      end
      return csv_sale_array
    end
  end

  # self.find(id): returns an instance of the object where the value of the id field in the CSV matches the passed parameter.

  def self.find(id)
    found = self.all.find_all { |sale_item| sale_item.sale_id == id}
    return found[0]
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

  end
end
