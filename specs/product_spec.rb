require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Product do

  it "does this exist" do
    FarMar::Product.wont_be_nil
  end

  it "can create instance of product class" do
    FarMar::Product.new(name: "super-toy").must_be_instance_of(FarMar::Product)
  end

  describe ".all" do
    let(:products) { FarMar::Product.all}

    it "can create array of all products from csv file" do
      products.class.must_equal(Array)
    end

    it "creates instances of product" do
      all_products = products.map { |product| product.class}
      all_products.uniq.must_equal [FarMar::Product]
    end
  end

  describe ".find" do
    let(:product_eight) { FarMar::Product.find(8)}

  it "can find a product given an id" do
    product_eight.name.must_equal("Shaky Honey")
  end

end

end
