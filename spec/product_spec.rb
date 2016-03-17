require_relative './spec_helper'

describe FarMar::Product do

  before do
    @product = FarMar::Product.new
    @productfind = FarMar::Product.find("3")
  end

  it "is an object we have access to" do
    @product.wont_be_nil
  end

  describe " FarMar::Product#vendor" do
    it "should return the FarMar::Vendor instances that are associated with this product" do
    FarMar::Product.new.vendors.must_be_instance_of Array
    end
  end

  describe " FarMar::Product#sales" do
      it "should return the FarMar::Sales instances that are associated with this product" do
      @productfind.sales.must_be_instance_of Array
      end
    end

    describe "FarMar::Product#number_of_sales" do
      it "should return the added instances of sales" do
        @productfind.number_of_sales.class.must_equal Fixnum
      end
    end

end




  describe FarMar::Product do
  before do
  @product = FarMar::Product
  @product_find = FarMar::Product.find("3")
  end

  it "will return an array of product instances" do
    @product.all.class.must_equal Array
  end

  it "will return a product with id 5" do
    @product.find(5).must_be_instance_of FarMar::Product
  end



end
