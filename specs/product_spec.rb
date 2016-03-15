require_relative 'spec_helper'

describe FarMar::Product do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  let(:products_all) {FarMar::Product.all}
  let(:products_find) {FarMar::Product.find(1)}

  # checks the length
  it "returns total number of products => 8193 instances" do
    products_all.length.must_equal(8193)
  end

  # check all methods that can be called after finding the product id
  describe FarMar::Product do
    # check the .find(id) method
    it "should return the id of the instance if .find(id = 1)" do
      var = FarMar::Product.find(1)
      var.id.must_equal(1)
      var.name.must_equal("Dry Beets")
      var.vendor_id.must_equal(1)
      #<FarMar::Product:0xXXXXXX @id=1, @name="Dry Beets", @vendor_id=1>
    end

    # check the vendor method
    it "should return the vendor associated with the product vendor_id: 1" do
      products_find.vendor.id.must_equal(1)
      # <FarMar::Vendor:0xXXXXXX @id=1, @name="Feil-Farrell", @employees=8,
      # @market_id=1>
    end

    # check the sales method
    it "should return the num of sales associated with the product vendor_id:1" do
      products_find.sales.length.must_equal(7)
    end
  end
end
