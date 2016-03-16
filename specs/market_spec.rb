require_relative 'spec_helper'

describe FarMar::Market do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Market.wont_be_nil
  end

  let(:markets_all) {FarMar::Market.all}
  let(:markets_find) {FarMar::Market.find 1}

  # runs the self.all method to create instances for each row in markets.csv
  it "returns total numbers of markets csv => 500 instances" do
    markets_all.length.must_equal 500  # checks the length
  end

  # check the self.find(id) method
  it "should return the id of the instance if .find(id = 1)" do
    mar = markets_find
    mar.id.must_equal 1
    mar.name.must_equal %q[People's Co-op Farmers Market]
    mar.city.must_equal "Portland"
    mar.address.must_equal "30th and Burnside"
    mar.county.must_equal "Multnomah"
    mar.state.must_equal "Oregon"
    mar.zip.must_equal "97202"
    # included ALL info to refer to for later method testings
  end

  # check the vendor method
  it "should return the number of vendors with the matching market id" do
    markets_find.vendors.length.must_equal 6
    #<FarMar::Vendor:0xXXXXXX @id=1, @name="Feil-Farrell", @employees=8, @market_id=1>,
    #<FarMar::Vendor:0xXXXXXX @id=2, @name="Hamill, Kilback and Pfeffer", @employees=5, @market_id=1>,
    #<FarMar::Vendor:0xXXXXXX @id=3, @name="Breitenberg Inc", @employees=5, @market_id=1>,
    #<FarMar::Vendor:0xXXXXXX @id=4, @name="Kris and Sons", @employees=5, @market_id=1>,
    #<FarMar::Vendor:0xXXXXXX @id=5, @name="Reynolds, Schmitt and Klocko", @employees=3, @market_id=1>,
    #<FarMar::Vendor:0xXXXXXX @id=6, @name="Zulauf and Sons", @employees=8, @market_id=1>
  end

  # check the products method
  it "should return 13 products belonging to those 6 vendors" do
      markets_find.products.length.must_equal 13
  end

  # check the self.search(search_term) method
  it "should return markets and vendors containing the word 'school'" do
      FarMar::Market.search('school').length.must_equal 3
  end
end
