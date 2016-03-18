class FarMar::Sale < FarMar::SharedStuff
  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(line) #for all, csv length -1?
    @sale_id = line[0].to_i
    @amount = line[1].to_i
    @purchase_time = line[2].to_i #unix_time, or as close as I could get.
    @vendor_id = line[3].to_i
    @product_id = line[4].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/sales.csv')
  end

  def self.make_new_instance(instance)
    to_unix_time = instance[2].split("-")
    to_unix_time[2] = to_unix_time[2].split
    to_unix_time[2] = to_unix_time[2].first
    instance[2] = Date.new(to_unix_time[0].to_i,to_unix_time[1].to_i,to_unix_time[2].to_i).to_time
    FarMar::Sale.new(instance)
  end

  def vendor
    vendor = FarMar::Vendor.all.select{|vid, instance| instance.vendor_id == self.vendor_id}
    return vendor.values[0] #returns instance
  end

  def product
    product = FarMar::Product.all.select{|pid, instance| instance.product_id == self.product_id}
    return product.values[0] #returns instance
  end

  def self.between(beginning_time, end_time) #input format day/month/year only
    end_array = end_time.split("/")
    end_array.map! {|string| string.to_i}
    end_time = Date.new(end_array[2], end_array[0], end_array[1]).to_time

    start_array = beginning_time.split("/")
    start_array.map! {|string| string.to_i}
    beginning_time = Date.new(start_array[2], start_array[0], start_array[1]).to_time

    hash_of_instances = self.all.select {|sid, instance| instance.purchase_time.to_i >= beginning_time.to_i && instance.purchase_time.to_i <= end_time.to_i}
    return hash_of_instances.values
  end
end
