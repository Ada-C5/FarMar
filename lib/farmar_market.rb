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
      return instance if instance.id == id.to_i
    end
  end

  # returns a collection of product instances by referring to the vendor id's
   # from #vendors. shovels the products into subarrays within prod array
   def products
     ven = vendors_id
     FarMar::Product.all.collect {|instance| instance if ([instance.vendor_id] & ven).any? }.compact
   end

  # returns all instances of vendors based on given market_id
  def vendors
    FarMar::Vendor.all.find_all {|instance| instance.market_id == id}
  end

  def vendors_id
    vendors.collect {|ven| ven.id}
  end

  # returns a collection of market instance where the market name of vendor name
  # contain the search_term
  def self.search(search_term)
    market = self.all.find_all {|instance| instance.name.downcase.include?(search_term)}
    vendor = FarMar::Vendor.all.find_all {|instance| instance.name.downcase.include?(search_term)}
    match = market + vendor
    return match
  end

  # returns sales in an array
  def sales
    ven = vendors_id
    FarMar::Sale.all.collect {|instance| instance if ([instance.vendor_id] & ven).any? }.compact
  end

  # return sales in subarrays NOPEEE
  # def sales_instance_array
  #   sale_instances = []
  #   vendors.each do |vendor_instance|
  #     sale_instances += sales.find_all{|instance| instance.vendor_id == vendor_instance.id}
  #   end
  #   return sale_instances
  # end
  # #
  # return sales all in ONE array NO subs allowed here!!
  def sales_sum_array
    sale_sums = []
    ven = vendors_id
    ven.each do |vendor_instance|
      sale_sums << sales.collect {|instance| instance.amount if ([instance.vendor_id] & [vendor_instance]).any? }.compact
    end
    sale_sums.map {|meo| meo.inject(:+)}
  end

  def preferred_vendor
    vendor_array = vendors
    sum = sales_sum_array
    max_vendor = sum.max
    index_vendor = sum.index(max_vendor)
    vendor_array[index_vendor]
  end

  def worst_vendor
    vendor_array = vendors
    sum = sales_sum_array
    min_vendor = sum.min
    index_vendor = sum.index(min_vendor)
    vendor_array[index_vendor]
  end

  # returns vendor with the highest revenue for the given date
  def prefered_vendor(date)
    chosen_date = Date.parse(date).mjd
    total_sales = sales
    date_sale = total_sales.find_all do |instance|
      DateTime.strptime(instance.purchase_time, %q[%Y-%m-%d %H:%M:%S %z]).mjd == chosen_date
    end
    sale_sums = []
    ven_id = date_sale.collect {|ven| ven.vendor_id}
    ven_id.each do |vendor_instance|
      sale_sums << sales.collect {|instance| instance.amount if ([instance.vendor_id] & [vendor_instance]).any? }.compact
    end
    total_amounts = sale_sums.map {|meo| meo.inject(:+)}
    max_vendor = total_amounts.max
    index_vendor = total_amounts.index(max_vendor)
    ven_id[index_vendor] # [40126, 40126, 26866, 61749]
  end

  def worst_vend(date)
    chosen_date = Date.parse(date).mjd
    total_sales = sales
    date_sale = total_sales.find_all do |instance|
      DateTime.strptime(instance.purchase_time, %q[%Y-%m-%d %H:%M:%S %z]).mjd == chosen_date
    end
    sale_sums = []
    ven_id = date_sale.collect {|ven| ven.vendor_id}
    ven_id.each do |vendor_instance|
      sale_sums << sales.collect {|instance| instance.amount if ([instance.vendor_id] & [vendor_instance]).any? }.compact
    end
    total_amounts = sale_sums.map {|meo| meo.inject(:+)}
    max_vendor = total_amounts.min
    index_vendor = total_amounts.index(max_vendor)
    ven_id[index_vendor] # [40126, 40126, 26866, 61749]
  end
end
