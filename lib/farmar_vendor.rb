class FarMar::Vendor
	
	def initialize(id)
		@id = id
	end

	def self.all(path_to_csv)
    id = nil

    vendor_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
        id = row[0]
        vendor_list << self.new(id)
    end
    vendor_list
	end
end