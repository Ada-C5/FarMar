require_relative './spec_helper'

describe FarMar::Market do

  TEST_INFO = {
    id: 1,
    name: "name",
    address: "someplace",
    city: "new new york",
    county: "not country",
    state: "of being",
    zip: 4444
  }
  describe "Market#new" do
    it "can create new instances of Market with correct name" do
      market = FarMar::Market.new(TEST_INFO)
      market.name.must_equal "name"
    end
  end

end
