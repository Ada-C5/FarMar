class FarMar::Sale

	CSV_DATA = './support/sales.csv'
	
	attr_reader :sale_id, 	:amount,	 :purchase_time,
							:vendor_id,	:product_id
	
	def initialize(all_sales)
		@sale_id 				= 	all_sales[:sale_id]
		@amount 				=		all_sales[:amount]
		@purchase_time 	= 	all_sales[:purchase_time]
		@vendor_id 			=		all_sales[:vendor_id]
		@product_id 		= 	all_sales[:product_id]

	end 

	def self.all
		all_sales = CSV.read(CSV_DATA, 'r')

		all_sales.collect do |row|
	  	individual_sale = {
	   	sale_id: 				row[0].to_i,
	   	amount: 				row[1].to_i,
	   	purchase_time: 	DateTime::parse(row[2]),
	   	vendor_id:  		row[3].to_i,
	   	product_id: 		row[4].to_i
	  	}
	  	self.new(individual_sale)
	  end
	end

	def self.find(sale_id)
		matched_sale = nil
		self.all.each do |sale|
			if sale.sale_id == sale_id
				matched_sale = sale
				return matched_sale
			end 
		end
	end

	def get_vendors
		FarMar::Vendor.all.find_all {|vendor| vendor.vendor_id == vendor_id}
	end

	def get_products
		FarMar::Product.all.find_all {|product| product.vendor_id == vendor_id}
	end 

	def self.between(beginning_time, ending_time)
		filtered_sales = []
		beginning_time = DateTime.parse(beginning_time)
		ending_time = DateTime.parse(ending_time)

		sales = FarMar::Sale.all.find_all {|sale| sale.purchase_time}
		sales.each do |sale|
			if sale.purchase_time >= beginning_time && sale.purchase_time <= ending_time
				filtered_sales << sale.purchase_time
			end
		end
		if filtered_sales.length == 0 
			 puts "Error: No sales found between those dates"
			return filtered_sales
		end 
		return filtered_sales
	end
end
