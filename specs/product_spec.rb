require_relative './spec_helper'

describe FarMar::Product do

  TEST_INFO = {
    vid: 1,
    name: "name",
    pid: 3
  }
  describe "Product#new" do
    it "can create new instances of Product with correct name" do
      item = FarMar::Market.new(TEST_INFO)
      item.name.must_equal "name"
    end
  end

end
