class FarMar::Product

	def initialize(id)
		@id = id
	end

	def self.all(path_to_csv)
    id = nil

    product_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
        id = row[0]
        product_list << self.new(id)
    end
    product_list
	end

end
