require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_product"

describe FarMar::Product do
  it "it is an object we have acccess to" do
    FarMar::Product.wont_be_nil
  end
end

describe "FarMar#Product" do

  before do
    market_data = {
      product_id: 24,
      product_name: "apple"
    }
    @product = FarMar::Product.new(market_data)
  end

      it "an instance of class Product'" do
    	 @product.must_be_instance_of(FarMar::Product)
      end

      it "should return number of all products" do
        all_products = FarMar::Product.all
        all_products.length.must_equal 8193
      end
end
