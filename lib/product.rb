# lib/farmar_market.rb
class FarMar::Product

  attr_reader :product_id, :product_name, :vendor_id #these are like the instance variables, but now methods!

    def initialize (product_hash)
      @product_id = product_hash[:product_id]
      @product_name = product_hash[:product_name]
      @vendor_id = product_hash[:vendor_id]
    end


    def self.all
      product_collection = []
      product_array = []
      product_array = CSV.read("./support/products.csv", 'r')


      product_array.each do |product|
        product_hash = {product_id: product[0], product_name: product[1], vendor_id: product[2]}
        new_product = FarMar::Product.new(product_hash)
        product_collection << new_product
      end
      return product_collection  #this is an array of FarMar::Product instances***
    end


    def self.find(id_requested)
      id_requested = id_requested.to_s
      product_array = []
      product_array = self.all
      product_array.each do |product|                     #this is an array of SPECIFIC PRODUCTS
        if product.product_id == id_requested
          return product                                 #break out of the loop when you find the id that matches
        end
      end
      return nil
    end                                 #return nil if the id is not found
end
