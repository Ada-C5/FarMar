require_relative './spec_helper'

describe FarMar::Product do

  PROUCT_TEST = {
    vid: 1,
    name: "name",
    pid: 3
  }
  describe "Product#new" do
    it "can create new instances of Product with correct name" do
      item = FarMar::Product.new(PROUCT_TEST)
      item.name.must_equal "name"
    end
  end

end
