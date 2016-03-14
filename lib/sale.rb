class FarMar::Sale
  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(sale_hash) #for all, csv length -1?
    @sale_id = sale_hash[:sid]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vid]
    @product_id = sale_hash[:pid]
  end

  def read_csv
    CSV.open('../support/sales.csv')
  end

  def self.all
    sale_instances = []
    self.pull_from_csv.each do |sale|
      sale_info = {
        sid: sale[0],
        amount: sale[1],
        purchase_time: sale[2],
        vid: sale[3],
        pid: sale[4],
      }
      new_sale = FarMar::Sale.new(sale_info)
      sale_instances << new_sale
    end
      sale_instances
  end
end
