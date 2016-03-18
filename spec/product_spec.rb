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
    FarMar::Product.find("3").vendor.pop.must_be_instance_of FarMar::Vendor
    end
  end

  describe " FarMar::Product#sales" do
      it "should return the FarMar::Sales instances that are associated with this product" do
      FarMar::Product.find("4").sales.pop.must_be_instance_of FarMar::Sale
      end
    end

    describe "FarMar::Product#number_of_sales" do
      it "should return the added instances of sales" do
        FarMar::Product.find("3").number_of_sales.class.must_equal Fixnum
      end
    end

    describe "FarMar::Product#vendors" do
      it "should return the vendor associated with vendors" do
        FarMar::Product.find("6").vendor.count.must_equal 1
      end
    end

    describe "FarMarProduct#by_vendor()" do
      it "should return a vendor with the given vendor id" do
        FarMar::Product.by_vendor("11").count.must_equal 5
      end
    end

end




  describe FarMar::Product do
  it "will return an array of product instances" do
    (FarMar::Product.all.count > 0).must_equal true
  end

  it "will return a product with id 5" do
    FarMar::Product.find(5).must_be_instance_of FarMar::Product
  end

end
