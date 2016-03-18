require_relative './spec_helper'

describe FarMar::Market do
  let(:market_found) { FarMar::Market.find(495) }
  
  it "is an object that I have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all and #self.find class methods" do
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
  end

  describe "FarMar::Market#self.search" do
    let(:searched_school) { FarMar::Market.search('school') }
    let(:searched_fletcher) { FarMar::Market.search('Fletcher') }
    let(:searched_swift) { FarMar::Market.search("Swift") }

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

  describe "FarMar::Market#preferred_vendor" do
    let(:vendor_pref) { market_found.preferred_vendor }
    let(:vendor_pref_ten) { FarMar::Market.find(10).preferred_vendor }
    let(:vendor_pref_from_date) { FarMar::Market.find(10).preferred_vendor("2013-11-06") }

    it "should return the vendor instance with the highest revenue for market 495" do
      vendor_pref.id.must_equal 2662
      vendor_pref.name.must_equal "Oberbrunner Inc"
      vendor_pref.revenue.must_equal 25930 
      # note that there are duplicate entries in sales.csv for different dates for this vendor_id
      # which have the same sale ID number but are located at the bottom of the file.
    end

    it "should return the vendor instance with the highest revenue for market 10" do
      vendor_pref_ten.id.must_equal 40
      vendor_pref_ten.name.must_equal "Dickens-Weissnat"
      vendor_pref_ten.revenue.must_equal 60127
    end

    it "should return the vendor instance with the highest revenue on a particular day" do
      vendor_pref_from_date.id.must_equal 46
      vendor_pref_from_date.revenue("2013-11-06").must_equal 10513
    end
  end

  describe "FarMar::Market#worst_vendor" do
    let(:vendor_worst) { market_found.worst_vendor }
    let(:vendor_worst_ten) { FarMar::Market.find(10).worst_vendor }
    let(:vendor_worst_from_date) { FarMar::Market.find(10).worst_vendor("2013-11-06") }

    # only considers markets that sold something
    # in case those that didn't sell anything weren't present
    it "should return the vendor with the lowest revenue from market 495" do
      vendor_worst.id.must_equal 2666
      vendor_worst.name.must_equal "Lemke-Bernhard"
      vendor_worst.revenue.must_equal 5722 # NOTE!! there are 4 sales that are in different 
      # spots in the sales.csv file (same numbers for 2nd set but diff time stamp)
    end

    it "should return the vendor with the lowest revenue from market 10" do
      vendor_worst_ten.id.must_equal 42
      vendor_worst_ten.name.must_equal "Tillman, Lockman and Klein"
      vendor_worst_ten.revenue.must_equal 9960
    end

    it "should return the vendor with the lowest revenue on a particular date" do
      vendor_worst_from_date.id.must_equal 48
      vendor_worst_from_date.revenue("2013-11-06").must_equal 4094
    end
  end
end

