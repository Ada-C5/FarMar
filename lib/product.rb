class FarMar::Product
	CSV_DATA = './support/products.csv'

	attr_reader :product_id, :product_name, :vendor_id

	def initialize(all_products)
		@product_id 		= 	all_products[:product_id]
		@product_name 	=		all_products[:product_name]
		@vendor_id 			= 	all_products[:vendor_id]
	end 

	def self.all
		all_products = CSV.read(CSV_DATA, 'r')

		all_products.collect do |row|
		   individual_product = {
		   	product_id: 		row[0].to_i,
		   	product_name: 	row[1],
		   	vendor_id: 			row[2].to_i,
		   }
			self.new(individual_product)
		end
	end

	def self.find(product_id)
		matched_product = nil
		self.all.each do |product|
			if product.product_id == product_id
				matched_product = product
				return matched_product
			end 
		end
	end
#
# Everything below here needs to be tested and sanity checked 
#
	def get_vendors
		FarMar::Vendor.all.find_all {|vendor| product.vendor_id == vendor_id}
	end

	def get_sales
		FarMar::Sale.all.find_all {|sale| sale.product_id == product_id}
	end 

	def get_number_of_sales
		product_sales = FarMar::Sale.all.find_all {|product| sale.product_id == product_id}		 
		total = product_sales.collect {|sale| sale.amount}
		total = total.reduce(0, :+)
		return total 
	end

	def	self.by_vendor(vendor_id)
		FarMar::Product.all.find_all {|product| product.vendor_id == vendor_id}
	end 
end
