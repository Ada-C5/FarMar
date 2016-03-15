require_relative './spec_helper'

describe FarMar::Vendor do
  let(:vendor_ten) { FarMar::Vendor.find(10) }

  it "is an object that I have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor class methods" do
    it "should return an array of instances using the self.all method" do
      FarMar::Vendor.all.must_be_instance_of Array
    end

    it "should return a specific instance matching given id using the self.find method" do
      vendor_ten.must_be_instance_of FarMar::Vendor
      vendor_ten.name.must_equal "Kertzmann LLC"
      vendor_ten.id.must_equal 10
    end
  end

  describe "FarMar::Vendor#market" do
    let(:market_instance) { vendor_ten.market }

    it "should return an instance of FarMar::Market that matches its market_id" do
      market_instance.must_be_instance_of FarMar::Market
      market_instance.id.must_equal 3
      market_instance.name.must_equal "Dolgeville Farmer's Market"
    end
  end

  describe "FarMar::Vendor#products" do
    let(:products) { vendor_ten.products }

    it "should return an array of products associated with vendor by vendor_id" do
      products.must_be_instance_of Array
      products.length.must_equal 5
      products.first.id.must_equal 23
      products.last.id.must_equal 27
    end
  end

  describe "FarMar::Vendor#sales" do
    let(:sales) { vendor_ten.sales }

    it "should return an array of sales associated with vendor by vendor_id" do
      sales.must_be_instance_of Array
      sales.length.must_equal 8
      sales.first.id.must_equal 53
      sales.last.id.must_equal 60 
    end
  end
end