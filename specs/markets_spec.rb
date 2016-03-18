require_relative './spec_helper'

describe FarMar::Market do
#mid, name, address, county, state, zip
  MARKET_TEST = [1, "name", "someplace", "not country", "of being", "44444"]
  let(:market) {FarMar::Market.new(MARKET_TEST)}
  let(:market_all) {FarMar::Market.all}

  describe "Market new" do
    it "can create new instances of Market with correct name" do
      market.name.must_equal "name"
    end
  end

  describe "Market all" do
    it "can create a hash filled with market ids as keys and instances as values" do
      market_all.must_be_instance_of Hash
    end
  end

  describe "Market find" do
    it "can find an instance of a market by matching id" do
      FarMar::Market.find(286).must_be_instance_of FarMar::Market
    end

    it "will return 'No instance found' if no instance found" do
      FarMar::Market.find(333333).must_equal "No instance found"
    end
  end

  describe "Market#vendors" do
    it "can find instances of vendors by market id" do
      market.vendors.must_be_instance_of Hash
    end
  end

  describe "Market find_by_name" do
    it "can find an instance of market matching the passed name" do
      FarMar::Market.find_by_name("farmer").must_be_instance_of FarMar::Market
    end
  end

  describe "Market find_all_by_name" do
    it "can find a collection (array) of markets matching the passed name" do
      FarMar::Market.find_all_by_name("farmer").must_be_instance_of Array
    end
  end

end
