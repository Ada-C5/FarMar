
class FarMar::Sale < RepeatMethods
  DATA = "./support/sales.csv"

  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_info)
    @sale_id, @amount, @purchase_time, @vendor_id, @product_id = sale_info
    @sale_id = @sale_id.to_i
    @amount = @amount.to_i
    @purchase_time = Chronic.parse(@purchase_time)
    @vendor_id = @vendor_id.to_i
    @product_id = @product_id.to_i
  end

  # vendor: returns the FarMar::Vendor instance that is associated with this sale using the
  # FarMar::Sale vendor_id field
  def vendor
    CSV.foreach(VENDORS_CSV) do |line|
      return FarMar::Vendor.new(line) if line[0].to_i == self.vendor_id
    end
  end

  # product: returns the FarMar::Product instance that is associated with this sale using
  # the FarMar::Sale product_id field
  def product
    CSV.foreach(PRODUCT_CSV) do |line|
      return FarMar::Product.new(line) if line[0].to_i == self.product_id
    end
  end

  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where
  # the purchase time is between the two times given as arguments
  # user should put each time in quotes and can write times however they like
  def self.between(beginning_time, end_time)
    begin_time = Chronic.parse(beginning_time)
    end_time = Chronic.parse(end_time)
    time_range = (begin_time..end_time)
    sales = CSV.read(SALE_CSV).select do |line|
      time_range.include? Chronic.parse(line[2])
    end
    sales.collect { |sale| FarMar::Sale.new(sale)}
  end
end
