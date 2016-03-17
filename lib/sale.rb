class FarMar::Sale

	CSV_DATA = './support/sales.csv'
	PENNY_CONVERTER = 100.0

	attr_reader :sale_id, 	:amount,	 :purchase_time,
							:vendor_id,	:product_id
	
	def initialize(all_sales)
		@sale_id 				= 	all_sales[:sale_id]
		@amount 				=		all_sales[:amount]  # / PENNY_CONVERTER
		@purchase_time 	= 	all_sales[:purchase_time]
		@vendor_id 			=		all_sales[:vendor_id]
		@product_id 		= 	all_sales[:product_id]

	end 

	def self.all
		all_sales = CSV.read(CSV_DATA, 'r', {:converters => :all}) 

		all_sales.collect do |row|
	  	individual_sale = {
	   	sale_id: 				row[0].to_i,
	   	amount: 				row[1].to_i,
	   	purchase_time: 	DateTime.parse(row[2]) ,# figure out how to do date_time shenanigans 
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
end