class FarMar::Sale
attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize (sale_hash)
    @sale_id = sale_hash[:sale_id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end




  def self.all
    sale_collection = []
    sale_array = []
    sale_array = CSV.read("./support/sales.csv", 'r')


   sale_array.each do |sale|
      sale_hash = {sale_id: sale[0], amount: sale[1], purchase_time: sale[2], vendor_id: sale[3], product_id: sale[4]}
      new_sale = FarMar::Sale.new(sale_hash)
      sale_collection << new_sale
    end
    return sale_collection  #this is an array of FarMar::Sale instances***
  end


  def self.find(id_requested) #SALE ID!!!!!
    id_requested = id_requested.to_s
    sale_array = []
    sale_array = self.all
    sale_array.each do |sale|                     #this is an array of SPECIFIC SALES
      if sale.sale_id == id_requested             #if id matches the user-requested id, do this:
        return sale                                 #break out of the loop when you find the id that matches
      end
    end
        return nil                                    #return nil if the id is not found
  end

  def self.between(start_time, end_time)
    these_sales = []
    begins = Time.parse(start_time)
    ends = Time.parse(end_time)

    FarMar::Sale.all.each do |sale|
      purchase = Time.parse(sale.purchase_time)
      if (purchase >= begins) && (purchase <= ends)
        these_sales << sale
      end
    end
    return these_sales
  end


  def vendor
    self.vendor_id
    FarMar::Vendor.all.each do |vendor|
      if vendor.vendor_id == self.vendor_id
        return vendor
      end
    end
  end



  def product
    self.product_id
    FarMar::Product.all.each do |product|
      if product.product_id == self.product_id
        return product
      end
    end
  end


end


#go back and refactor! enumerables! one line comparisons! let at the beginning of tests and only once!
