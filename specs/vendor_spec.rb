require_relative 'spec_helper'

describe FarMar::Vendor do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Vendor.wont_be_nil
  end


  # runs the .all method to create instances for each row in vendors.csv
  # checks the length
  it "returns total number of vendors => 2690 instances" do
    vendors = FarMar::Vendor.all
    vendors.length.must_equal(2690)
  end

  # check the .find(id) method
  it "should return the id of the instance if .find(id: 1)" do
    FarMar::Vendor.find(1).id.must_equal(1)
    # <FarMar::Vendor:0xXXXXXX @id=1, @name="Feil-Farrell", @employees=8,
    #  @market_id=1>
  end

  # check the market method
  it "should return the num of markets (2) associated with the vendor id: 9" do
    vendors = FarMar::Vendor.find(1) # market_id = 2
    vendors.market.zip.must_equal("97202")
    # <FarMar::Market:0xXXXXXX @id=1, @name="People's Co-op Farmers Market",
    # @address ="30th and Burnside", @city="Portland", @county="Multnomah",
    # @state="Oregon", @zip="97202">
  end

  # check the products method
  it "should return the num of products (4) associated with vendor id: 9" do
    vendors = FarMar::Vendor.find(9) # market_id = 2
    vendors.products.length.must_equal(4)
  end

  # check the sales method
  it "should return the num of sales (4) associated with vendor id: 9" do
    vendors = FarMar::Vendor.find(9) # market_id = 2
    vendors.sales.length.must_equal(5)
  end

  # check the revenue method
  it "should return the sum of all of the vendors sales in cents" do
    vendors = FarMar::Vendor.find(9) # market_id = 2
    vendors.revenue.must_equal(24429)
  end

  # check the self.by_market method
  it "should return all of the vendors with the given market_id: 1" do
    FarMar::Vendor.by_market(1).length.must_equal(6)
  end

end
