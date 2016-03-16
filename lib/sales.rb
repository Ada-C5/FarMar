class FarMar::Sale
  attr_accessor :sale_id, :ammount, :purchase_time, :vendor_id, :product_id

  def initialize(id, ammount, purchase_time, vendor_id, product_id)
    @sale_id = id
    @ammount = ammount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    csv_array = CSV.read('support/sales.csv')
    @all_sales = csv_array.collect do |row|
     self.new(row[0].to_i,row[1].to_i,row[2],row[3].to_i,row[4].to_i)
    end
  end

  def self.find(id)
    FarMar::Sale.all
    @all_sales.each do |sale|
      if sale.sale_id == id.to_i
        return sale
      end
    end
  end

  def vendor
    # returns the FarMar::Vendor instance that is associated with this sale
    #using the FarMar::Sale vendor_id field
    FarMar::Vendor.all.each do |vendor|
      if vendor.vendor_id == vendor_id.to_i
        return vendor
      end
    end
  end
end
