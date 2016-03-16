class FarMar::Sale
	attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id
	SALE_DATA = "./support/sales.csv"

	def initialize(sale_hash)
		@id = sale_hash[:id].to_i
		@amount = sale_hash[:amount].to_i
		@purchase_time = sale_hash[:purchase_time]
		@vendor_id = sale_hash[:vendor_id].to_i
		@product_id = sale_hash[:product_id].to_i

	end

	#returns a collection of instances, representing all of 
	#the objects described in the CSV
	def self.all
		all = []
		CSV.foreach(SALE_DATA, "r") do |line|
			sale = FarMar::Sale.new(id: line[0].to_i, 
			amount: line[1].to_i, purchase_time: DateTime.parse(line[2]),
			vendor_id: line[3].to_i, product_id: line[4].to_i)
			all << sale
		end
    return all
	end

	#returns an instance of the object where the value of the
	# id field in the CSV matches the passed parameter.
	def self.find(id)
		find = []
   	CSV.foreach(SALE_DATA, "r") do |line|
      if line[0] == id.to_s
        find =[line[0].to_i, line[1].to_i, line[2].to_i,
      				line[3].to_i, line[4].to_i]
        return find
        break
      end
    end
    return nil	
	end

	#returns the FarMar::Vendor instance that is associated
	# with this sale using the FarMar::Sale vendor_id field
	def vendor
		FarMar::Vendor.all.find do |vendor|
			vendor.id == @vendor_id
		end
	end

	#returns the FarMar::Product instance that is associated 
	#with this sale using the FarMar::Sale product_id field
	def product
		FarMar::Product.all.find do |product|
			product.id == @product_id
		end
	end

	#returns a collection of FarMar::Sale objects where the 
	#purchase time is between the two times given as arguments
	def self.between((beginning_time, end_time)
		sales = []
		beginning_time = DateTime.parse(beginning_time)
		end_time = DateTime.parse(end_time)
        FarMar::Sale.all.find_all do |sale|
          if (sale.purchase_time >= beginning_time) && 
 							(sale.purchase_time <= end_time)
            sales << sale
          end
        end
        return sales
	end


end