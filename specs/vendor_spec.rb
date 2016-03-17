require_relative './spec_helper'

describe FarMar::Vendor do
  # Generate random ids for tests based on ranges
  let(:random_vendor_id) { ("1".."2690").to_a.sample }
  let(:random_market_id) { ("1".."500").to_a.sample }

  let(:vendor_by_vendor_id_test) { FarMar::Vendor.new( [random_vendor_id, nil, nil, nil] ) }
  let(:vendor_by_market_id_test) { FarMar::Vendor.new( [nil, nil, nil, random_market_id] ) }


  it "is an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor.all" do
    it "returns an array of instances" do
    FarMar::Vendor.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Vendor.find" do
    it "can find a product instance based on ID" do
    FarMar::Vendor.find(random_vendor_id).must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "FarMar::Vendor.by_market" do
    it "returns *all* of the vendors with the given market_id" do
    vendors_collection = FarMar::Vendor.by_market(random_market_id)
    vendors_collection.must_be_kind_of(Array)

    # each item in the Array will be an instance of FarMar::Vendor
    vendors_collection.each { |instance| instance.must_be_instance_of(FarMar::Vendor) }
    end
  end

  describe "FarMar::Vendor#market" do
    it "returns a FarMar::Market instance that is associated with the vendor by the market_id field." do
    market = vendor_by_market_id_test.market
    market.must_be_instance_of(FarMar::Market)
    end
  end

  describe "FarMar::Vendor#products" do
    it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field." do
    products_collection = vendor_by_vendor_id_test.products
    products_collection.must_be_kind_of(Array)
    # each item in the Array will be an instance of FarMar::Product
    products_collection.each { |instance| instance.must_be_instance_of(FarMar::Product) }
    end
  end

  describe "FarMar::Vendor#sales" do
    it "returns a collection of FarMar::Sale instances that are associated by the vendor_id field." do
    sales_collection = vendor_by_vendor_id_test.sales
    sales_collection.must_be_kind_of(Array)
    # each item in the Array will be an instance of FarMar::Sale
    sales_collection.each { |instance| instance.must_be_instance_of(FarMar::Sale) }
    end
  end

  describe "FarMar::Vendor#revenue" do
    it "returns the the sum of all of the vendor's sales (in cents)" do
      vendor_by_vendor_id_test.revenue.must_be_kind_of(Float) #we want the number back in cents!

    end
  end

end
