# lib/farmar_market.rb
class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip
  def initialize(hash)
    @id = hash[:id].to_i
    @name = hash[:name]
    @address = hash[:address]
    @city = hash[:city]
    @county = hash[:county]
    @state = hash[:state]
    @zip = hash[:zip]
  end

  # ID - (Fixnum) a unique identifier for that market
  # Name - (String) the name of the market (not guaranteed unique)
  # Address - (String) street address of the market
  # City - (String) city in which the market is located
  # County - (String) county in which the market is located
  # State - (String) state in which the market is located
  # Zip - (String) zipcode in which the market is located

  # creates instances (500) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    markets_info = []
    CSV.foreach("support/markets.csv") do |row|
      info = self.new(id: row[0], name: row[1], address: row[2],
      city: row[3], county: row[4], state: row[5], zip: row[6])
      markets_info << info
    end
    return markets_info
  end

  # finds all instances of market that match the given id
  def self.find(id)
    self.all.each do |instance|
      if instance.id == id.to_i
        return instance
      end
    end
  end

  # returns all instances of vendors based on given market_id
  def vendors
    FarMar::Vendor.all.find_all {|instance| instance.market_id == id}
  end

  # returns a collection of product instances by referring to the vendor id's
  # from #vendors. shovels the products into subarrays within prod array
  def products
    prod = []
    vendors.each do |vendor_instance|
      prod += FarMar::Product.all.find_all {|instance| instance.vendor_id ==
        vendor_instance.id}
    end
    return prod
  end

  # returns a collection of market instance where the market name of vendor name
  # contain the search_term
  def self.search(search_term)
    market = self.all.find_all {|instance| instance.name.downcase.include?(search_term)}
    vendor = FarMar::Vendor.all.find_all {|instance| instance.name.downcase.include?(search_term)}
    match = market + vendor
    return match
  end

  def sales
    sale = []
    vendors.each do |vendor_instance|
      sale << FarMar::Sale.all.find_all{|instance| instance.vendor_id == vendor_instance.id}
    end
    return sale

  end

  def preferred_vendor
    amount = []
    total_sales = sales
    total_sales.length.times do |num| #loop through 6
      array = []
      total_sales[num].length.times do |num2|
        array << total_sales[num][num2].amount
      end
      amount << array.inject(:+) # [38259, 5727, 40126, 26866, 61749, 2977]
    end
    sorted_amount = vendors.zip(amount).sort_by {|array| array[1]}
    return sorted_amount[-1]
  end

  # def preferred_vendor(date)
  #   chosen_date = Date.Parse(date)
  # end
end


#[[#<FarMar::Sale:0xXXXXXX @id=1, @amount=9290, @purchase_time="2013-11-07 04:34:56 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=2, @amount=2262, @purchase_time="2013-11-10 02:44:56 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=3, @amount=9588, @purchase_time="2013-11-13 01:49:37 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=4, @amount=1634, @purchase_time="2013-11-06 20:44:00 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=5, @amount=4440, @purchase_time="2013-11-10 05:19:05 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=6, @amount=6950, @purchase_time="2013-11-11 11:29:52 -0800", @vendor_id=1, @product_id=1>,
#<FarMar::Sale:0xXXXXXX @id=7, @amount=4095, @purchase_time="2013-11-12 14:38:29 -0800", @vendor_id=1, @product_id=1>],
#[#<FarMar::Sale:0xXXXXXX @id=8, @amount=5727, @purchase_time="2013-11-12 06:03:54 -0800", @vendor_id=2, @product_id=2>],
#[#<FarMar::Sale:0xXXXXXX @id=9, @amount=9128, @purchase_time="2013-11-13 01:48:15 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=10, @amount=5160, @purchase_time="2013-11-08 04:31:41 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=11, @amount=1030, @purchase_time="2013-11-10 18:56:53 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=12, @amount=5179, @purchase_time="2013-11-08 16:36:03 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=13, @amount=3450, @purchase_time="2013-11-12 12:00:35 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=14, @amount=4978, @purchase_time="2013-11-10 01:51:24 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=15, @amount=8924, @purchase_time="2013-11-10 11:31:16 -0800", @vendor_id=3, @product_id=4>,
#<FarMar::Sale:0xXXXXXX @id=16, @amount=2277, @purchase_time="2013-11-09 01:16:47 -0800", @vendor_id=3, @product_id=4>],
#[#<FarMar::Sale:0xXXXXXX @id=17, @amount=3442, @purchase_time="2013-11-10 04:16:12 -0800", @vendor_id=4, @product_id=7>,
#<FarMar::Sale:0xXXXXXX @id=18, @amount=5375, @purchase_time="2013-11-08 12:21:41 -0800", @vendor_id=4, @product_id=5>,
#<FarMar::Sale:0xXXXXXX @id=19, @amount=9035, @purchase_time="2013-11-11 03:37:15 -0800", @vendor_id=4, @product_id=6>,
#<FarMar::Sale:0xXXXXXX @id=20, @amount=51, @purchase_time="2013-11-10 09:48:05 -0800", @vendor_id=4, @product_id=5>,
#<FarMar::Sale:0xXXXXXX @id=21, @amount=8963, @purchase_time="2013-11-10 12:26:30 -0800", @vendor_id=4, @product_id=7>],
#[#<FarMar::Sale:0xXXXXXX @id=22, @amount=7180, @purchase_time="2013-11-12 06:40:46 -0800", @vendor_id=5, @product_id=9>,
#<FarMar::Sale:0xXXXXXX @id=23, @amount=8382, @purchase_time="2013-11-09 08:13:09 -0800", @vendor_id=5, @product_id=8>,
#<FarMar::Sale:0xXXXXXX @id=24, @amount=3776, @purchase_time="2013-11-08 16:12:20 -0800", @vendor_id=5, @product_id=8>,
#<FarMar::Sale:0xXXXXXX @id=25, @amount=4951, @purchase_time="2013-11-09 23:42:41 -0800", @vendor_id=5, @product_id=9>,
#<FarMar::Sale:0xXXXXXX @id=26, @amount=9690, @purchase_time="2013-11-09 21:45:12 -0800", @vendor_id=5, @product_id=9>,
#<FarMar::Sale:0xXXXXXX @id=27, @amount=2851, @purchase_time="2013-11-13 04:14:40 -0800", @vendor_id=5, @product_id=10>,
#<FarMar::Sale:0xXXXXXX @id=28, @amount=9015, @purchase_time="2013-11-06 14:19:49 -0800", @vendor_id=5, @product_id=8>,
#<FarMar::Sale:0xXXXXXX @id=29, @amount=8445, @purchase_time="2013-11-11 06:44:12 -0800", @vendor_id=5, @product_id=8>,
#<FarMar::Sale:0xXXXXXX @id=30, @amount=7459, @purchase_time="2013-11-10 01:44:14 -0800", @vendor_id=5, @product_id=8>],
#[#<FarMar::Sale:0xXXXXXX @id=31, @amount=2977, @purchase_time="2013-11-09 10:57:21 -0800", @vendor_id=6, @product_id=13>]]
