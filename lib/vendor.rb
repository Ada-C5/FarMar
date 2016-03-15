class FarMar::Vendor
	CSV_DATA = './support/vendors.csv'

	attr_reader :vendor_id, :vendor_name, :employees, :market_id

	def initialize(all_vendors)
		@vendor_id 		= 	all_vendors[:vendor_id]
		@vendor_name 	=		all_vendors[:vendor_name]
		@employees 		= 	all_vendors[:employees]
		@market_id 		=		all_vendors[:market_id]
	end 

	def self.all

		all_vendors = CSV.read(CSV_DATA, 'r')

		all_vendors.collect do |row|
		  individual_vendor =	{
	  	vendor_id: 		row[0].to_i,
	   	vendor_name: 	row[1],
	   	employees: 		row[2].to_i,
	   	market_id:		row[3].to_i,
	   }
	 	self.new(individual_vendor)
	 	end

	end

	def self.find(vendor_id)
		matched_vendor = nil
		self.all.each do |vendor|
			if vendor.vendor_id == vendor_id
				matched_vendor = vendor
				return matched_vendor
			end 
		end
	end 
end