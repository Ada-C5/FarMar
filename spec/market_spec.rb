require_relative './spec_helper'
require_relative '../lib/market'

describe FarMar::Market do
  let(:all_markets) { FarMar::Market.all}
  let(:market) { FarMar::Market.find(1) }

  it "Market Class exist?" do
    FarMar::Market.wont_be_nil
  end

  describe "#self.all(file)" do
    # let(:all_markets) { FarMar::Market.all}

    it "Return an array?" do
      all_markets.must_be_instance_of Array
    end

    it "Return an array full of FarMar::Market Instances?" do
      classes = all_markets.map { |m| m.class}
      classes.uniq.must_equal [FarMar::Market]
    end
  end

  describe "#self.find(id)" do
    # let(:market) { FarMar::Market.find(1) }

    it "Know basic data about market?" do
      market.must_be_instance_of FarMar::Market
      market.id.must_equal(1)
      market.name.must_equal("People's Co-op Farmers Market")
      market.address.must_equal("30th and Burnside")
      market.city.must_equal("Portland")
      market.county.must_equal("Multnomah")
      market.state.must_equal("Oregon")
      market.zip.must_equal(97202)
    end

    it "Returns nil if market is not found?" do
      FarMar::Market.find(10_000).must_equal(nil)
    end
  end

  describe "#vendors" do
    # let(:market) { FarMar::Market.find(1) }
    it "Returns an array of vendor objects that match a specific market_id" do
      vendors = market.vendors
      vendors.length.must_equal(6)
    end
  end

end
