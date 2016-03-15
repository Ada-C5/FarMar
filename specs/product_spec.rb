require_relative './spec_helper'

describe FarMar::Product do

  PROUCT_TEST = [1, "name", 3] #pid, name, vid

  describe "Product#new" do
    it "can create new instances of Product with correct name" do
      item = FarMar::Product.new(PROUCT_TEST)
      item.name.must_equal "name"
    end
  end

  describe "Product#find" do
    it "can find an instance of a product by matching product id" do
      FarMar::Product.find(286).must_be_instance_of FarMar::Product
    end
  end
end
