require_relative './spec_helper'

describe FarMar::Product do
  it "is an object that I have access to" do
    FarMar::Product.wont_be_nil
  end

  describe "FarMar::Product class methods" do
    let(:product_ten) { FarMar::Product.find(10) }

    it "should return an array when calling the self.all method" do
      FarMar::Product.all.must_be_instance_of Array
    end

    it "should return a specific instance of FarMar::Product using the self.find method" do
      product_ten.id.must_equal 10
      product_ten.name.must_equal "Black Apples"
      product_ten.must_be_instance_of FarMar::Product
    end
  end
end