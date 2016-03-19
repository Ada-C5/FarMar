require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Market do
  let(:all_markets) { FarMar::Market.all }
  let (:market) { FarMar::Market.find("142") }
  let(:market_test) { FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504") }
  let(:market_test2) { FarMar::Market.new("484", "Bellingham Farmers Market", "1100 Railroad Avenue", "Bellinhgam", "Whatcom", "Washington", "98225") }
  let (:market_info) { FarMar::Market.search("school") }

  it "is an object that isn't empty" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do
    it "should return an ARRAY with all markets" do
      all_markets.must_be_instance_of Array
    end

    it "each element in the array is a instance of FarMar::Market" do
      classes = all_markets.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end

    it "should return an array with all 500 markets" do
      all_markets.length.must_equal 500
    end
  end

  describe "FarMar::Market#self.find" do
    it "should return an object of the class Market" do
      market.must_be_instance_of FarMar::Market
    end

    it "should return to an object, and be ablae to acces to the objetc's data" do
      market.market_name.must_equal "Wildwood Growers' Market".upcase
      market.market_address.must_equal "100 N. Main Street"
      market.market_county.must_equal "Sumter"
      market.market_city.must_equal "Wildwood"
      market.market_state.must_equal "Florida"
      market.market_zip.must_equal "34785"
    end

    it "should return nil if the market does not exist" do
      FarMar::Market.find("504").must_equal nil
    end
  end

  describe "FarMar::Market#vendor" do
    it "should return the instances of Vendor that matches the market_id" do
      market_test.vendors.length.must_equal 10
    end

    it "should return an ARRAY" do
      market_test.vendors.must_be_instance_of Array
    end

    it "each element in the array is a instance of FarMar::Vendor" do
      classes = market_test.vendors.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "FarMar::Market#products" do
    it "should return an ARRAY" do
      market_test.products.must_be_instance_of Array
    end

    it "that array shoulf have more than 10 elemnts" do
      market_test.products.length.must_be :>, 10
    end

    it "returns a collection of FarMar::Product instances" do
      classes = market_test.products.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Product]
    end
  end

  describe "FarMar::Market#self.search(search_term)" do

    it "should return an ARRAY" do
      FarMar::Market.search("Stracke").must_be_instance_of Array
    end

    it "seach for 'Ledner' should return to 9 results" do
      FarMar::Market.search("Ledner").length.must_equal 9
    end

    it "seach for 'School' should return to 13 results" do
      FarMar::Market.search("School").length.must_equal 3
    end

    it "search for worf 'Ledner' returns a collection of FarMar::Vendor instances" do
      classes = FarMar::Market.search('Ledner').map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end

    it "search for worf 'market' returns a collection of FarMar::Market instances" do
      classes = FarMar::Market.search('market').map { |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end
  end

  describe "FarMar::Market#prefered_vendor" do
    it "should return the instance FarMar::Vendor that sales the most in that market" do
      market_test.prefered_vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return the instance FarMar::Vendor that sales the most in that market" do
      market_test2.prefered_vendor.must_be_instance_of FarMar::Vendor
    end

    it "should return a different instances of Vendor when tested with two markets with differents market_id" do
      market_test.prefered_vendor.wont_equal market_test2.prefered_vendor
    end

    it "should return an instance FarMar::Vendor" do
      market_test.prefered_vendor("2013-11-12 10:13:45 -0800").must_be_instance_of FarMar::Vendor
    end

    it "instance FarMar::Vendor should have the same market_id than the test" do
    market_test.prefered_vendor("2013-11-09 10:13:45 -0800").market_id.must_equal 18
    end
    it "should return an instance FarMar::Vendor" do
      market_test2.prefered_vendor("2013-11-09 10:13:45 -0800").must_be_instance_of FarMar::Vendor
    end

    it "instance FarMar::Vendor should have the same market_id than the test" do
      market_test2.prefered_vendor("2013-11-09 10:13:45 -0800").market_id.must_equal 484
    end

    it "market_test.prefered_vendor should be different instances of Vendor if differents market_id" do
      market_test.prefered_vendor("2013-11-12 10:13:45 -0800").wont_equal market_test2.prefered_vendor("2013-11-09 10:13:45 -0800")
    end
  end

  # describe "FarMar::Market#worst_vendor" do
  #   it "should return the instance FarMar::Vendor that sales the least in that market" do
  #     market_test.worst_vendor.must_be_instance_of FarMar::Vendor
  #   end
  #
  #   it "should return the instance FarMar::Vendor that sales the least in that market" do
  #     market_test2.worst_vendor.must_be_instance_of FarMar::Vendor
  #   end
  #
  #   it "should return a different instances of Vendor when tested with two markets with differents market_id" do
  #     market_test.worst_vendor.wont_equal market_test2.worst_vendor
  #   end
  #
  #   it "should return an instance FarMar::Vendor" do
  #     market_test.worst_vendor("2013-11-12 10:13:45 -0800").must_be_instance_of FarMar::Vendor
  #   end
  #
  #   it "instance FarMar::Vendor should have the same market_id than the test" do
  #   market_test.worst_vendor("2013-11-09 10:13:45 -0800").market_id.must_equal 18
  #   end
  #   it "should return an instance FarMar::Vendor" do
  #     market_test2.worst_vendor("2013-11-09 10:13:45 -0800").must_be_instance_of FarMar::Vendor
  #   end
  #
  #   it "instance FarMar::Vendor should have the same market_id than the test" do
  #     market_test2.worst_vendor("2013-11-09 10:13:45 -0800").market_id.must_equal 484
  #   end
  #
  #   it "market_test.worst_vendor should be different instances of Vendor if differents market_id" do
  #     market_test.worst_vendor("2013-11-12 10:13:45 -0800").wont_equal market_test2.worst_vendor("2013-11-09 10:13:45 -0800")
  #   end
  # end
end
