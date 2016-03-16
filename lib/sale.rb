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
    sales = CSV.read('./support/sales.csv')
    sales.each do |sale|
      all_sales << self.new(id: sale[0], amount: sale[1], purchase_time: sale[2], vendor_id: sale[3], product_id: sale[4])
    end
    all_sales
  end

  def self.find(find_id)
    self.all.each do |sale|
      return sale if sale.id == find_id.to_s
    end
  end

##### DateTime.strptime("2013-11-11 06:21:52 -0800" "formatted version here")
##### DateTime.strptime("2013-11-11 06:21:52 -0800" "%Y-%m-%d %H:%M:%S %z")
##### Basically, check if the difference between the end_time and searched_time is
#     smaller than the difference between the end_time and beginning_time, if so,
#     then the searched_time is between the beginning_time and end_time. Excludes
#     difference results that are negative because that means the time was after
#     the end_time

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
