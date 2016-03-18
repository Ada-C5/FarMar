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

  # check the vendors method
  it "should return the number of vendors with the matching market id" do
    markets_find.vendors.length.must_equal 6
  end

  it "checks the vendors_id method" do
      markets_find.vendors_id.must_equal [1, 2, 3, 4, 5, 6] #[1]
  end

  # check the products method
  it "should return 13 products belonging to those 6 vendors" do
      markets_find.products.length.must_equal 13
  end

  # check the self.search(search_term) method
  it "should return markets and vendors containing the word 'school'" do
      FarMar::Market.search('school').length.must_equal 3
  end

  # check the sales method
  it "should return the total amount of sales" do
      markets_find.sales.length.must_equal 31
  end

  # check the sales_sum_array method
  it "should return total sales sum amounts in array based on vendors (6)" do
      markets_find.sales_sum_array.length.must_equal 6
  end

  # check the preferred_vendor method
  it "should return the vendor with the highest revenue, checks value" do
      markets_find.preferred_vendor.id.must_equal 5 #[1]
  end

  # check the worst_vendor method
  it "should return the vendor with the lowest revenue" do
      markets_find.worst_vendor.id.must_equal 6 #[1]
  end

  # check the preferred_vendor(date) method
  it "should return the vendor id with the highest revenue, on 2013-11-08" do
      markets_find.prefered_vendor('2013-11-08').must_equal 5 #[1]
  end

  # check the preferred_vendor(date) method
  it "should return the vendor id with the lowest revenue on 2013-11-08" do
      markets_find.worst_vend('2013-11-08').must_equal 4
  end

end
