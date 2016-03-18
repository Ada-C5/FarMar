require 'csv'
#require_relative '../far_mar'


class FarMar::Market

  CSV_FILE = "./support/markets.csv"

  @@markets = nil

  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_info)

    @id, @name, @address, @city, @county, @state, @zip = market_info
    @id = @id.to_i

    # market_info
    # @id       = market_info [ :id ]         # (Fixnum) a unique identifier for that market
    # @name     = market_info [ :name]        # (String) the name of the market (not guaranteed unique)
    # @address  = market_info [ :address ]    # (String) street address of the market
    # @city     = market_info [ :city ]       # (String) city in which the market is located
    # @county   = market_info [ :county ]     # (String) county in which the market is located
    # @state    = market_info [ :state ]      # (String) state in which the market is located
    # @zip      = market_info [ :zip ]        # (String) zipcode in which the market is located
  end


  def self.all
    @@markets ||= begin
      markets_csv_info = CSV.read(CSV_FILE)  # an array of each line as an element
      markets_csv_info.map { |line| self.new(line) }
  end

  def self.find(id)
    self.all.find {|market| market.id == id }
  end

  # return a list of vendor instances (FarMar::Vendor) by matching market_id
  def vendor
    FarMar::Vendor.all.select {|vendor| vendor.market_id == id }
  end

  def products
    vendor.map {|vendor| FarMar::Product.find(vendor.id) }
  end

  def self.search(search_term)
    search_results = []
    search_results = self.all.select {|market| market.name.downcase.include? search_term.downcase }
    search_results += FarMar::Vendor.all.select {|vendor| vendor.name.downcase.include? search_term.downcase}
  end

  def prefered_vendor
    vendor.max_by {|vendor| vendor.revenue }
  end

  def worst_vendor
    vendor.min_by {|vendor| vendor.revenue }
  end

  def prefered_vendor_by (date)
    prefered_sale = market_sales_by(date)
    FarMar::Vendor.find(prefered_sale.max.vendor_id)
  end

  def worst_vendor_by (date)
    worst_sale = market_sales_by(date)
    FarMar::Vendor.find(worst_sale.min.vendor_id)
  end

  def market_sales_by (date)
    vendor_sales_by_date = {}
    sales_on_date = FarMar::Sale.between(date, date)

    sales_on_date.each do |sale|
      if vendor_sales_by_date[vendor].nil?
        vendor_sales_by_date[vendor] = sale.amount
      else
        vendor_sales_by_date[vendor] += sale.amount
      end
    end
  end

end


    # vendor_sales_on_date = vendor.select {|vendor| vendor.sales.purchase_time.day == day}
    #
    # vendor_sales_on_date.each do
    #   if vendor_sales_by_date[vendor].nil?
    #     vendor_sales_by_date[vendor] = amount
    #   else
    #     vendor_sales_by_date[vendor] += amount
    #   end
    # end


  #
  # vendor_sales_by_date.max_by {|vendor, total_sales| total_sales}
  # end
  #
  #   vendor.each do |vendor|
  #
  #     if vendor.sale.purchase_time.day == day
  #       vendor_sales_by_date[vendor] = amount
  #
  #
  #
  #   end
  #
  #
  #   # find total, then max of the values by vendor
  #
  #   sales = FarMar::Sale.between(date, date)
  #
  #   vendors = sales.select do |sale|
  #     vendor_total_sales[vendor] = vendor.sales.map {|sales| sales.amount}.reduce(0, :+)
  #   end
  #
  #   vendor_total_sales.max_by {|vendor, total_sales| total_sales}.first
  # end



  #   vendor_total_sales.max_by {|vendor, total_sales| total_sales}.first
  # end

  # def prefered_vendor(date)
  #   prefered_vendor.select { |vendor| }

    # def prefered_vendor (beginning_time, end_time)     # 5 - 7
    #   start_date = Chronic.parse(beginning_time)
    #   end_date   = Chronic.parse(end_time)
    #
    #   date_range = (start_date..end_date)
    #
    #   return "Please try again" if start_date >= end_date
    #
    #   select_sales = self.all.select {|sale| (date_range).cover? (sale.purchase_time) }
    #
    #   select_sales_by_vendor = {}
    #
    #   select_sales.each do |sale| # 10-11-2016 5pm, $300, "Joe"
    #     amount = sale.amount
    #     vendor = sale.vendor_id
    #
    #     #key = vendor_name
    #
    #     if select_sales_by_vendor [vendor].nil?
    #       select_sales_by_vendor[vendor] = amount
    #     else
    #       select_sales_by_vendor[vendor] += amount
    #     end
    #   end
    #
    #   select_sales_by_vendor.max_by {|vendor, amount| amount}
    #
    # end
