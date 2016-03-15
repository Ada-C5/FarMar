require_relative './spec_helper'

describe FarMar::Sale do
  #we have Sale IDs 1-12001, and will test at random!
  let(:random_sale_id) { ("1".."12001").to_a.sample }
  #we have Product IDs 1-8193, and will test at random!
  let(:random_product_id) { ("1".."8193").to_a.sample }
  #we have Vendor IDs 1-2690, and will test at random
  let(:random_vendor_id) { ("1".."2690").to_a.sample }
  #Market IDs are 1-500, and will test at random.
  let(:random_market_id) { ("1".."500").to_a.sample }

  let(:sale_by_vendor_id_test) { FarMar::Sale.new( [nil, nil, nil, random_vendor_id, nil] ) }
  let(:sale_by_product_id_test) { FarMar::Sale.new( [nil, nil, nil, nil, random_product_id] ) }

  it "is an object we have access to" do
    FarMar::Sale.wont_be_nil
  end

  describe "FarMar::Sale#all" do
    it "returns an array of instances" do
    FarMar::Sale.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Sale#find" do
    it "can find a product instance based on ID" do
    FarMar::Sale.find(random_sale_id).must_be_instance_of(FarMar::Sale)
    end
  end

  describe "#vendor" do
    it "returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
    sale_by_vendor_id_test.vendor.must_be_instance_of(FarMar::Vendor)
    end

  end

end
