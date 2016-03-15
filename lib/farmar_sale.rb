class FarMar::Sale
  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(line) #for all, csv length -1?
    @sale_id = line[0].to_i
    @amount = line[1].to_i # see if can => dollars, even with concern over nil *
    @purchase_time = line[2]
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
    return "no instance found"
  end
end
