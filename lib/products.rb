class FarMar::Product
	attr_accessor :id, :name, :vendor_id
	PRODUCT_DATA = "./support/products.csv"

	def initialize(product_hash)
		@id = product_hash[:id].to_i
		@name = product_hash[:name]
		@vendor_id = product_hash[:vendor_id].to_i

	end
	#returns a collection of instances, representing all of 
	#the objects described in the CSV
	def self.all
		all = []
		CSV.foreach(PRODUCT_DATA, "r") do |line|
			product = FarMar::Product.new(id: line[0].to_i, name: line[1],
			vendor_id: line[2].to_i)
			all << product
		end
    return all
	end

	#returns an instance of the object where the value of the
	# id field in the CSV matches the passed parameter.
	def self.find(id)
		find = []
   	CSV.foreach(PRODUCT_DATA, "r") do |line|
      if line[0] == id.to_s
        find =[line[0].to_i, line[1], line[2].to_i]
        return find
      end
    end
    return nil	
	end

	def vendor
		FarMar::Vendor.all.find do |vendor|
			vendor.id == @vendor_id
		end
	end

	#returns a collection of FarMar::Sale instances that are 
	#associated using the FarMar::Sale product_id field.
	def sales
		FarMar::Sale.all.find_all do |sale|
			sale.product_id == @id
		end
	end

	#returns the number of times this product has been sold.
	def number_of_sales
		sum = 0
		FarMar::Sale.all.each do |sale|
			if sale.product_id == @id
				sum += 1
			end
		end
		return sum
	end

	#returns all of the products with the given vendor_id
	def self.by_vendor(vendor_id)
		products = []
		CSV.foreach(PRODUCT_DATA, "r") do |line|
			if line[2].to_i == vendor_id
				products << FarMar::Product.new(id: line[0].to_i, name: line[1],
			vendor_id: line[2].to_i)
      end
    end
    return products
	end

end