require_relative './spec_helper'



describe FarMar::Vendor do
  it "exists" do
    FarMar::Vendor.wont_be_nil
  end
end

describe FarMar::Vendor do
  let(:vendor) { FarMar::Vendor.new(id: 10) }

    it "it creates a new Vendor instance" do
    vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "Self.All" do
    # before do
    #   @vendor = FarMar::Vendor.all # all is a self class
    # end
    let(:vendor) { FarMar::Vendor.all}

    it "returns an array of FarMar::Vendor instances" do
      vendor.must_be_instance_of(Array)
    end

    it "return a collection of instances from the CSV file in FarMar:Vendor" do
      classes = FarMar::Vendor.all.map { |v| v.class }
      classes.uniq.must_equal([FarMar::Vendor])
    end
  end

  describe "Self.Find" do
    # one instance of a vendor class with an id value of one
    # this is an actual vendor
    let(:vendor) { FarMar::Vendor.find(1) }

    it "returns a collection of FarMar::Vendor instances of id" do
      vendor.must_be_instance_of(FarMar::Vendor)
    end

    it "returns nil for markets it does not find" do
      FarMar::Vendor.find(610).must_equal(nil)
    end
  end

describe "Market" do
  let(:vendor) { FarMar::Vendor.find(3) }

  it "returns an array" do
    vendor.Market.must_be_instance_of(Array)
  end 
end
