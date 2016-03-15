class FarMar::Vendor
  attr_reader :market_id, :name, :vendor_id, :employees
  def initialize(line)
    @vendor_id = line[0].to_i
    @name = line[1]
    @employees = line[2].to_i
    @market_id = line[3].to_i
  end

  def self.pull_from_csv
    CSV.read('./support/vendors.csv')
  end

  def self.all
    all_vendors = {}
    self.pull_from_csv.each do |vendor_instance|
        all_vendors[vendor_instance[0]] = FarMar::Vendor.new(vendor_instance)
      end
    return all_vendors
  end

  def self.find(id) #find by vendor id
    pull_from_csv.each do |vendor_instance|
      if vendor_instance[0].to_i == id.to_i
        return FarMar::Vendor.new(vendor_instance)
      end
    end
    return "no instance found"
  end

  def market #find market instance of vendor instance
    FarMar::Market.find(market_id)
  end

  def products
    FarMar::Product.all.reject{|pid, instance| instance.vendor_id != self.vendor_id}
  end

  def sales
    FarMar::Sale.all.reject{|sid, instance| instance.vendor_id != self.vendor_id}
  end

  def revenue
    individual_revenues = sales.map {|sid, instance| instance.amount}
    sum = individual_revenues.inject(:+) #sum
    return sum[0]
  end

  def self.by_market(market_id)
    self.all.reject{|vid, instances| instances.market_id != market_id}
  end


end
