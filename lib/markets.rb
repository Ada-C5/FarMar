class FarMar::Market
  attr_accessor :market_id, :market_name, :market_address, :market_city, :market_county, :market_state, :market_zip

  def initialize(id, name, address, city, county, state, zip)
    @market_id = id
    @market_name = name
    @market_address = address
    @market_city = city
    @market_county = county
    @market_state = state
    @market_zip = zip
  end

  def self.all
    CSV.read('support/markets.csv').collect { |row| self.new(row[0].to_i,row[1].upcase,row[2],row[3],row[4],row[5],row[6]) }
  end

  def self.find(id)
    FarMar::Market.all.each do |market|
      if market.market_id == id.to_i
        return market
        elsif
        id.to_i > FarMar::Market.all.length
        return nil
      end
    end
  end

  def vendors
    FarMar::Vendor.all.select { |vendor| vendor.market_id == market_id.to_i }
  end

  def products
    # market_test.market_id = "18"
    #returns a collection of FarMar::Product instances that are associated
    #to the market through the FarMar::Vendor class.

    vendors_id = vendors.collect {|vendor| vendor.vendor_id} #10 vendors with differents vendor_id
      #[82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
    FarMar::Product.all.select { |product| vendors_id.include?(product.vendor_id) }
  end

  def self.search(search_term)
    #returns a collection of FarMar::Market instances where the market name
    # or vendor name contain the search_term.
    #For example FarMar::Market.search('school') would return 3 results,
    #one being the market with id 75 (Fox School Farmers FarMar::Market).
    # if search_term != false

    search_term_in_all_vendors = FarMar::Vendor.all.select { |vendor| vendor.vendor_name.include? search_term.upcase }

    if search_term_in_all_vendors.empty? == true
      search_term_in_all_markets = FarMar::Market.all.select { |market| market.market_name.include? search_term.upcase }
      else
      search_term_in_all_vendors
    end
  end

  def prefered_vendor(given_day = false)
    if given_day == false
      vendors_id_in_this_market = vendors.collect { |vendor| vendor.vendor_id }
      # => [82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
      vendors_hash = FarMar::Sale.all.group_by { |sale| sale.vendor_id }
      the_sales_of_the_vendors_in_this_market = vendors_hash.select { |key_vendor_id, object_array| vendors_id_in_this_market.include?key_vendor_id }
      best_vendor = the_sales_of_the_vendors_in_this_market.max_by do |vendor_id, array_sales_info|
        array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      end
      FarMar::Vendor.find(best_vendor[0])

    elsif given_day != false
    #  #returns the vendor with the highest revenue for the given date
      given_day = DateTime.parse(given_day)
    #
      vendors_id_in_this_market = vendors.collect { |vendor| vendor.vendor_id }
    # #   # => [82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
    # =>test2 [2608, 2609, 2610, 2611]

      sales_hash = FarMar::Sale.all.group_by { |sale| sale.purchase_time.day }
      #returns a hash that the key is the day. the value in an array with Sale objects
      sales_this_day_hash = sales_hash.select { |key_day_of_sale, object_array| key_day_of_sale == given_day.day }
    #   # the one I need all 09 november
    #   # 12=>[
    #   #<FarMar::Sale:0x007f9a8bac92e8 @sale_id=16, @ammount=2277, @purchase_time=#<DateTime: 2013-11-09T01:16:47-08:00 ((2456606j,33407s,0n),-28800s,2299161j)>, @vendor_id=3, @product_id=4>,
      sales_this_day_hash_in_this_market = sales_this_day_hash.values[0].group_by { |sales| sales.vendor_id }
      the_sales_of_the_vendors_in_this_market = sales_this_day_hash_in_this_market.select { |key_vendor_id, object_array| vendors_id_in_this_market.include?key_vendor_id }

      best_vendor_day = the_sales_of_the_vendors_in_this_market.max_by do |vendor_id, array_sales_info|
        array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      end
      FarMar::Vendor.find(best_vendor_day[0])
    end
  end

  def worst_vendor(given_day = false)
    if given_day == false
      vendors_id_in_this_market = vendors.collect { |vendor| vendor.vendor_id }
      # => [82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
      vendors_hash = FarMar::Sale.all.group_by { |sale| sale.vendor_id }
      the_sales_of_the_vendors_in_this_market = vendors_hash.select { |key_vendor_id, object_array| vendors_id_in_this_market.include?key_vendor_id }
      best_vendor = the_sales_of_the_vendors_in_this_market.min_by do |vendor_id, array_sales_info|
        array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      end
      FarMar::Vendor.find(best_vendor[0])

    elsif given_day != false
      given_day = DateTime.parse(given_day)
    #
      vendors_id_in_this_market = vendors.collect { |vendor| vendor.vendor_id }
    # #   # => [82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
    # =>test2 [2608, 2609, 2610, 2611]

      sales_hash = FarMar::Sale.all.group_by { |sale| sale.purchase_time.day }
      #returns a hash that the key is the day. the value in an array with Sale objects
      sales_this_day_hash = sales_hash.select { |key_day_of_sale, object_array| key_day_of_sale == given_day.day }

      sales_this_day_hash_in_this_market = sales_this_day_hash.values[0].group_by { |sales| sales.vendor_id }
      the_sales_of_the_vendors_in_this_market = sales_this_day_hash_in_this_market.select { |key_vendor_id, object_array| vendors_id_in_this_market.include?key_vendor_id }

      best_vendor_day = the_sales_of_the_vendors_in_this_market.min_by do |vendor_id, array_sales_info|
        array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      end
      FarMar::Vendor.find(best_vendor_day[0])
    end
  end
end
