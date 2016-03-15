require_relative './spec_helper'

describe FarMar::Market do
  let(:market_found) { FarMar::Market.find(495) }
  
  it "is an object that I have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market class methods" do
    let(:searched_school) { FarMar::Market.search('school') }
    let(:searched_fletcher) { FarMar::Market.search('Fletcher') }
    let(:searched_swift) { FarMar::Market.search("Swift") }

    it "is an instance of Array using the self.all method" do
      FarMar::Market.all.must_be_instance_of Array
    end

    it "returns nil if no matching id number is found using self.find method" do
      FarMar::Market.find(1_111_111_111).must_be_nil
    end

    it "returns the correct instance of FarMar::Market if the matching id is found using self.find method" do
      market_found.must_be_instance_of FarMar::Market
      market_found.id.must_equal 495
      market_found.name.must_equal "South Bend Farmers Market"
    end

    it "returns an array of instances where the search term is included in market or vendor name" do
      searched_school.must_be_instance_of Array
      searched_school.length.must_equal 3

      # search for something in markets.csv but not vendors.csv
      searched_fletcher.length.must_equal 1
      searched_fletcher[0].name.must_equal "Fletcher Allen's Farmers' Market"

      # search for something in vendors.csv but not markets.csv
      searched_swift.length.must_equal 4
    end
  end

  describe "FarMar::Market#vendor" do
    let(:vendor_list) {market_found.vendors }

    it "should return an Array of vendors that are associated with the given market" do
      vendor_list.must_be_instance_of Array
      vendor_list[0].id.must_equal 2662
      vendor_list.last.id.must_equal 2666
      vendor_list.length.must_equal 5
    end
  end

  describe "FarMar::Market#products" do
    let(:product_list) { market_found.products }

    it "should return an Array of FarMar::Product instances" do
      product_list.must_be_instance_of Array
      product_list.first.must_be_instance_of FarMar::Product
      product_list[0].id.must_equal 8103
    end
  end
end