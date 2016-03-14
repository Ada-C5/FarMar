require_relative './spec_helper'

describe FarMar::Product do
  before do
    @product = FarMar::Product.new
  end

  it "is an object we have access to" do
    @product.wont_be_nil
  end
end

describe FarMar::Product do
  before do
  @product = FarMar::Product
  end
  it "will return an array of product instances" do
    @product.all.class.must_equal Array
  end

  it "will return a product with id 5" do
    @product.find(5).must_be_instance_of FarMar::Product
  end



end
