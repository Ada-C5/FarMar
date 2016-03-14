
class FarMar::Sale

  attr_reader :sale_id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sale_hash)
    @sale_id = sale_hash[:sale_id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  def self.all
    csv_sale_array = []
    CSV.open("./support/sales.csv", 'r') do |csv|
      csv.read.each do |row|
        csv_sale_array << FarMar::Sale.new(sale_id: row[0].to_i, amount: row[1].to_i, purchase_time: DateTime.parse(row[2]), vendor_id: row[3].to_i, product_id: row[4].to_i)
      end
      return csv_sale_array
    end
  end

  def self.find(id)
    CSV.open("./support/sales.csv", 'r') do |csv|
      csv.read.each do |row|
        if row[0].to_i == id
          found_account = FarMar::Sale.new(sale_id: row[0].to_i, amount: row[1].to_i, purchase_time: DateTime.parse(row[2]), vendor_id: row[3].to_i, product_id: row[4].to_i)
          return [found_account]
        end
      end
    end
  end
end
