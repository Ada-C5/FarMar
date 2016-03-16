# lib/farmar_sale.rb
class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(hash)
    @id = hash[:id].to_i
    @amount = hash[:amount].to_i
    @purchase_time = hash[:purchase_time]
    @vendor_id = hash[:vendor_id].to_i
    @product_id = hash[:product_id].to_i
  end

  # ID - (Fixnum) uniquely identifies the sale
  # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
  # Purchase_time - (Datetime) when the sale was completed
  # Vendor_id - (Fixnum) a reference to which vendor completed the sale
  # Product_id - (Fixnum) a reference to which product was sold

  # creates instances (12798) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    sales_info = []
    CSV.foreach("support/sales.csv") do |row|
      info = self.new(id: row[0], amount: row[1], purchase_time: row[2],
      vendor_id: row[3], product_id: row[4])
      sales_info << info
    end
    return sales_info
  end

  # finds all instances of sales that match the given id
  def self.find(id)
    self.all.each do |instance|
      if instance.id == id
        return instance
      end
    end
  end

  # finds instance of vendor that matches the vendor_id (based on given sale id)
  def vendor #there should only be one right?
    FarMar::Vendor.all.find {|instance| instance.id == vendor_id}
  end

  # finds all instances of product that match the given sale id
  def product
    FarMar::Product.all.find_all {|instance| instance.vendor_id == vendor_id}
  end

  # returns a collection of sale OBJECTS where the purchase time is between the
  # two given times
  def self.between(beginning_time, end_time)
    beginning_t = DateTime.strptime(beginning_time, %q[%Y-%m-%d %H:%M:%S %z])
    end_t = DateTime.strptime(end_time, %q[%Y-%m-%d %H:%M:%S %z])
    all_times = []
    CSV.foreach("support/sales.csv") do |row|
      market_time = DateTime.strptime(row[2], %q[%Y-%m-%d %H:%M:%S %z])
      if (end_t-market_time) < (end_t-beginning_t) && (end_t-market_time) >= 0
        all_times << row
      end
    end
    return all_times
  end
  # messy date method
  # start = DateTime.strptime('2000-01-01 00:00:00 -0800', %q[%Y-%m-%d %H:%M:%S %z])
  # beginning_t = DateTime.strptime(beginning_time, %q[%Y-%m-%d %H:%M:%S %z]).mjd
  # end_t = DateTime.strptime(end_time, %q[%Y-%m-%d %H:%M:%S %z]).mjd
  # b = (beginning_t - start).to_f
  # e = (end_t - start).to_f
  # all_times = []
  # CSV.foreach("support/sales.csv") do |row|
  #   market_time = DateTime.strptime(row[2], %q[%Y-%m-%d %H:%M:%S %z])
  #   m = (market_time - start).to_f
  #   if m > b && m < e
  #     all_times << row
  #   end
  # end
  # return all_times
end
