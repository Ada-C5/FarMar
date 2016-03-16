class FarMar::Sale
  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(line) #for all, csv length -1?
    @sale_id = line[0].to_i
    @amount = line[1].to_i # see if can => dollars, even with concern over nil *
    @purchase_time = line[2].to_i
    @vendor_id = line[3].to_i
    @product_id = line[4].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/sales.csv')
  end

  def self.all
    sale_instances = {}
    self.pull_from_csv.each do |sale|
          sale_instances[sale[0]] = FarMar::Sale.new(sale)
    end
      sale_instances
  end


  def self.find(id) #find by product id
    pull_from_csv.each do |sale_instance|
      if sale_instance[0].to_i == id.to_i
        return FarMar::Sale.new(sale_instance)
      end
    end
    return "No instance found"
  end

  def vendor
    vendor = FarMar::Vendor.all.select{|vid, instance| instance.vendor_id == self.vendor_id}
    return vendor.values[0] #returns instance
  end

  def product
    product = FarMar::Product.all.select{|pid, instance| instance.product_id == self.product_id}
    return product.values[0] #returns instance
  end

  def self.between(beginning_time = 0, end_time = Time.now.to_i)
    hash_of_instances = self.all.select {|sid, instance| instance.purchase_time > beginning_time.to_i && instance.purchase_time< end_time.to_i}
    hash_of_instances.values #returns an array filled with instances
  end
end
