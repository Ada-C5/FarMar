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
    CSV.read('support/markets.csv').collect { |row| self.new(row[0].to_i,row[1],row[2],row[3],row[4],row[5],row[6]) }
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
    search_term_in_all_vendors = FarMar::Vendor.all.select { |vendor| vendor.vendor_name.include?(search_term.downcase) }

    search_term_in_all_markets = FarMar::Market.all.select { |market| market.market_name.include?(search_term.downcase) }


    if search_term_in_all_markets != nil
      return search_term_in_all_markets
      elsif search_term_in_all_vendors != nil
      return search_term_in_all_vendors
      else
      "error"
    end

  end

  # def prefered_vendor#(date = false)
  #   # returns the vendor with the highest revenue
  #   vendors_hash = FarMar::Sale.all.group_by { |sale| sale.vendor_id }
  #   # vendors_hash[2688].collect {|sales_info| sales_info.ammount }.reduce(:+)
  #   best_vendor = vendors_hash.max_by do |vendor_id, array_sales_info|
  #     array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
  #   end
  #
  #   FarMar::Vendor.find(best_vendor[0])
  #
  # end

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

      else
      #returns the vendor with the highest revenue for the given date
      given_day = DateTime.parse(given_day)

      vendors_id_in_this_market = vendors.collect { |vendor| vendor.vendor_id }
      # => [82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
      sales_hash = FarMar::Sale.all.group_by { |sale| sale.purchase_time.day }
      # 9=>[
      #<FarMar::Sale:0x007f9a8bac92e8 @sale_id=16, @ammount=2277, @purchase_time=#<DateTime: 2013-11-09T01:16:47-08:00 ((2456606j,33407s,0n),-28800s,2299161j)>, @vendor_id=3, @product_id=4>,
      #<FarMar::Sale:0x007f9a8bac22e0 @sale_id=23, @ammount=8382, @purchase_time=#<DateTime: 2013-11-09T08:13:09-08:00 ((2456606j,58389s,0n),-28800s,2299161j)>, @vendor_id=5, @product_id=8>,
      #<FarMar::Sale:0x007f9a8bac17f0 @sale_id=25, @ammount=4951, @purchase_time=#<DateTime: 2013-11-09T23:42:41-08:00 ((2456607j,27761s,0n),-28800s,2299161j)>, @vendor_id=5, @product_id=9>,
      #]

      sales_this_day_hash = sales_hash.select { |key_day_of_sale, object_array| key_day_of_sale == given_day.day }
      # the one I need
      # 12=>[
      #<FarMar::Sale:0x007f9a8bac92e8 @sale_id=16, @ammount=2277, @purchase_time=#<DateTime: 2013-11-09T01:16:47-08:00 ((2456606j,33407s,0n),-28800s,2299161j)>, @vendor_id=3, @product_id=4>,
      #<FarMar::Sale:0x007f9a8bac22e0 @sale_id=23, @ammount=8382, @purchase_time=#<DateTime: 2013-11-09T08:13:09-08:00 ((2456606j,58389s,0n),-28800s,2299161j)>, @vendor_id=5, @product_id=8>,
      #<FarMar::Sale:0x007f9a8bac17f0 @sale_id=25, @ammount=4951, @purchase_time=#<DateTime: 2013-11-09T23:42:41-08:00 ((2456607j,27761s,0n),-28800s,2299161j)>, @vendor_id=5, @product_id=9>,
      #]

      best_vendor_day = sales_this_day_hash.max_by do |the_day, array_sales_info|
        array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      end
      
      FarMar::Vendor.find(best_vendor_day[0])

      #
      # FarMar::Vendor.find(best_vendor_day[0])

      # sales_hash[given_day.day].collect do |sales_object|
      #   objesales_object.vendor_id
      # end

      #.max_by {|sales_object| sales_object.ammount }#.reduce(:+)

      # sales_this_day[given_day.day].collect do |sales_object|

      #
      # the_sales_by_day_in_this_market = sales_hash.select { |key_day, object_array| vendors_id_in_this_market.include? day.day }
      # best_vendor = the_sales_by_day_in_this_market.max_by do |vendor_id, array_sales_info|
      #   array_sales_info.collect {|sales_info| sales_info.ammount }.reduce(:+)
      # end

    end
  end

end
