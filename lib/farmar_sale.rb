# lib/farmar_sale.rb
class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id
  def initialize(hash)
    @id = hash[:id]
    @amount = hash[:amount]
    @purchase_time = hash[:purchase_time]
    @vendor_id = hash[:vendor_id]
    @product_id = hash[:product_id]
  end

  # ID - (Fixnum) uniquely identifies the sale
  # Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
  # Purchase_time - (Datetime) when the sale was completed
  # Vendor_id - (Fixnum) a reference to which vendor completed the sale
  # Product_id - (Fixnum) a reference to which product was sold

  # creates instances (500) of each row of data in the csv
  # and pushes them into an array -- *blank cells are nil
  def self.all
    sales_info = []
    CSV.foreach("support/sales.csv") do |row|
      info = self.new(id: row[0].to_i, amount: row[1].to_i,
      purchase_time: row[2], vendor_id: row[3], product_id: row[4])
      sales_info << info
    end
    return sales_info
  end

  def self.find(id)
    self.all.each do |instance|
      if instance.id == id
        return instance
      end
    end
  end
end
