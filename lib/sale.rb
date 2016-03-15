class FarMar::Sale

  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount].to_f
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    all_sales = []
    keys = [:id, :amount, :purchase_time, :vendor_id, :product_id]
    sale_hash = CSV.read('./support/sales.csv').map {|values| Hash[ keys.zip(values) ]}
    sale_hash.each do |sale|
      all_sales << self.new(sale)
    end
    return all_sales
  end

  def self.find(find_id)
    self.all.each do |sale|
      return sale if sale.id == find_id.to_s
    end
  end

end
