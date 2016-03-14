class FarMar::Product

    attr_reader :id, :name, :vendor_id

	def initialize(product_hash)
        # ID - (Fixnum) uniquely identifies the product
        # Name - (String) the name of the product (not guaranteed unique)
        # vendor_id - (Fixnum) a reference to which vendor sells this product

        @id = product_hash[:id]
        @name = product_hash[:name]
        @vendor_id = product_hash[:vendor_id]
	end

    def self.all(path_to_csv)
    id = nil

    market_list = []
    
    # this iterates through the CSV and assigns values to variables to be used in the account initialization.
    CSV.foreach(path_to_csv) do |row|
        id = row[0]
        name = row[1]
        vendor_id = row[2]

        market_hash = {id: id, name: name, vendor_id: vendor_id}
        market_list << self.new(market_hash)
    end
    market_list
    end

end
