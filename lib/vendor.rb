class FarMar::Vendor
attr_reader :vendor_id, :vendor_name, :num_employ, :market_id

  def initialize (vendor_hash)
    @vendor_id = vendor_hash[:vendor_id]
    @vendor_name = vendor_hash[:vendor_name]
    @num_employ = vendor_hash[:num_employ]
    @market_id = vendor_hash[:market_id]
  end


  def self.all
    vendor_collection = []
    vendor_array = []
    vendor_array = CSV.read("./support/vendors.csv", 'r')


    vendor_array.each do |vendor|
      vendor_hash = {vendor_id: vendor[0], vendor_name: vendor[1], num_employ: vendor[2], market_id: vendor[3]}
      new_vendor = FarMar::Vendor.new(vendor_hash)
        vendor_collection << new_vendor
    end
      return vendor_collection  #this is an array of FarMar::Vendor instances***
  end


  def self.find(id_requested)
    id_requested = id_requested.to_s
    vendor_array = []
    vendor_array = self.all
    vendor_array.each do |vendor|                     #this is an array of SPECIFIC VENDORS
      if vendor.vendor_id == id_requested
        return vendor                                 #break out of the loop when you find the id that matches
      end
    end
      return nil                                    #return nil if the id is not found
  end


  def products(assoc_vendor_id)
    assoc_products = []
    FarMar::Product.all.each do |product|
      if product.vendor_id.to_i == assoc_vendor_id
        assoc_products << product
      end
    end
      return assoc_products
  end


  def sales(assoc_vendor_id)
    assoc_sales = []
    FarMar::Sale.all.each do |sale|
      if sale.vendor_id.to_i == assoc_vendor_id
      assoc_sales << sale
      end
    end
      return assoc_sales
  end

  def market
    self.market_id #@market_id
    FarMar::Market.all.each do |market|
      if market.market_id == self.market_id
        return market
      end
    end
  end


  def revenue
    amount_variable = 0
    vendor_sales = []
    this_vendor_id = self.vendor_id

    FarMar::Sale.all.each do |sale|
      if sale.vendor_id == this_vendor_id
        vendor_sales << sale
      end
    end

    vendor_sales.each do |sale|
      amount_variable = amount_variable + sale.amount.to_i
    end

    return amount_variable
  end


  def self.by_market(market_id)
    these_market_vendors = []

    FarMar::Vendor.all.each do |vendor|
      if vendor.market_id.to_i == market_id.to_i
        these_market_vendors << vendor
      end
    end

    return these_market_vendors
  end



end

#go back and refactor! enumerables! one line comparisons! let at the beginning of tests and only once!
