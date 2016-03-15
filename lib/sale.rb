# #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
# #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
# self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments

class FarMar::Sale

  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount].to_f
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    all_sales = []
    keys = [:id, :amount, :purchase_time, :vendor_id, :product_id]
    sale_hash = CSV.read('./support/sales.csv').map {|values| Hash[ keys.zip(values) ]}
    sale_hash.each do |sale|
      all_sales << self.new(sale)
    end
    return all_sales
  end

  def self.find(find_id)
    self.all.each do |sale|
      return sale if sale.id == find_id.to_s
    end
  end

##### DateTime.strptime("2013-11-11 06:21:52 -0800" "formatted version here")
##### DateTime.strptime("2013-11-11 06:21:52 -0800" "%Y-%m-%d %H:%M:%S %z")
  # def self.between(beginning_time, end_time)
  #   between_times = []
  #   beginning_time = DateTime.strptime(beginning_time, "%Y-%m-%d %H:%M:%S %z")
  #   end_time = DateTime.strptime(end_time, "%Y-%m-%d %H:%M:%S %z")
  #   self.all.each do |sale|
  #     if (end_time - DateTime.strptime(sale.purchase_time, "%Y-%m-%d %H:%M:%S %z")) < (end_time - beginning_time) && (end_time - DateTime.strptime(sale.purchase_time, "%Y-%m-%d %H:%M:%S %z")) >= 0
  #       between_times << sale
  #     end
  #   end
  # end

  # same as above but using an enumerable instead of an each loop
  def self.between(beginning_time, end_time)
    beginning_time = DateTime.strptime(beginning_time, "%Y-%m-%d %H:%M:%S %z")
    end_time = DateTime.strptime(end_time, "%Y-%m-%d %H:%M:%S %z")
    self.all.find_all {
      |sale| (end_time - DateTime.strptime(sale.purchase_time, "%Y-%m-%d %H:%M:%S %z")) < (end_time - beginning_time) && (end_time - DateTime.strptime(sale.purchase_time, "%Y-%m-%d %H:%M:%S %z")) >= 0
    }
  end

  def vendor
    FarMar::Vendor.all.find { |ven| ven.id == self.vendor_id }
  end

  def product
    FarMar::Product.all.find { |prod| prod.id == self.product_id }
  end

end
