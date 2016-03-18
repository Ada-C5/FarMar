class FarMar::Vendor
	attr_accessor :id, :name, :no_of_employees, :market_id
	
	VENDOR_DATA = "./support/vendors.csv"

	def initialize(vendor_hash)
		@id = vendor_hash[:id].to_i
		@name = vendor_hash[:name]
		@no_of_employees = vendor_hash[:no_of_employees].to_i
		@market_id = vendor_hash[:market_id].to_i

	end
	#returns a collection of instances, representing all of 
	#the objects described in the CSV
	def self.all
		all = []
		CSV.foreach(VENDOR_DATA, "r") do |line|
			vendor = FarMar::Vendor.new(id: line[0].to_i, name: line[1],
			no_of_employees: line[2].to_i, market_id: line[3].to_i)
			all << vendor
		end
    return all
	end

	#returns an instance of the object where the value of the
	# id field in the CSV matches the passed parameter.
	def self.find(id)
		find = []
   	CSV.foreach(VENDOR_DATA, "r") do |line|
      if line[0] == id.to_s
        find =[line[0].to_i, line[1], line[2].to_i,
      				line[3].to_i]
        return find
      end
    end
    return nil	
	end


	#returns the FarMar::Market instance that is associated 
	#with this vendor using the FarMar::Vendor market_id field
	def market
		FarMar::Market.all.find do |market|
			market.id == @market_id
		end
	end

	#returns a collection of FarMar::Product instances that 
	#are associated by the FarMar::Product vendor_id field.
	def products
		FarMar::Product.all.find_all do |product|
			product.vendor_id == @id
		end
	end

	#returns a collection of FarMar::Sale instances that are
	#associated by the vendor_id field.
	def sales
		FarMar::Sale.all.find_all do |sale|
			sale.vendor_id == @id
		end
	end

	#returns the the sum of all of the vendor's sales(in cents)
	def revenue
		sum = 0
		FarMar::Sale.all.each do |sale|
			if sale.vendor_id == @id
				sum += sale.amount
			end
		end
		return sum
	end

	#returns all of the vendors with the given market_id
	def self.by_market(market_id)
		vendors = []
		CSV.foreach(VENDOR_DATA, "r") do |line|
			if line[3].to_i == market_id
				vendors << FarMar::Vendor.new(id: line[0].to_i, name: line[1],
			no_of_employees: line[2].to_i, market_id: line[3].to_i)
      end
    end
    return vendors
  end
end