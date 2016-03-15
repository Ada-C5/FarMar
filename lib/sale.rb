
class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  SALE_FILE = "support/sales.csv"

  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    sales = []
    CSV.foreach(SALE_FILE) do |row|
      sales << FarMar::Sale.new(id: row[0].to_i, amount: row[1].to_i, purchase_time: row[2],
        vendor_id: row[3].to_i, product_id: row[4].to_i)
    end
    return sales

  end

  def self.find(id)
    self.all.find { |sale| sale.id == id }
  end

end
