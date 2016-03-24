require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Vendor do
  # let(:finder_test) { FarMar::Market.new("18", "Grand Valley State University Farmers Market", "1 Campus Drive, Parking Lot F", "Allendale", "Ottawa", "Michigan", "49504") }

  it "is an object that isn't empty" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#self.all" do
    it "should return an array with all vendors" do
      FarMar::Vendor.all.must_be_instance_of Array
    end

    it "should return an array with all 2690 vendors" do
      FarMar::Vendor.all.length.must_equal 2690
    end
  end

  describe "FarMar::Vendor#self.find" do
    it "should return object. and all its data" do
      FarMar::Vendor.find("2676").vendor_id.must_be_same_as 2676
      FarMar::Vendor.find("2676").vendor_name.must_equal "Cruickshank Group".upcase
      FarMar::Vendor.find("2676").num_employees.must_equal "4"
      FarMar::Vendor.find("2676").market_id.must_be_same_as 498
    end

    it "should return an object of the class Vendor" do
      FarMar::Vendor.find("142").must_be_instance_of FarMar::Vendor
    end

  end

  describe "FarMar::Vendor#market" do
    let(:vendor_test) { FarMar::Vendor.new("20","Ledner Group","7","6") }

    it "should return an array the market(s) that of that vendor" do
      vendor_test.market.must_be_instance_of Array
    end

    it "should wont be nil " do
      vendor_test.market.wont_equal nil
    end

    it "should return an object of the class Product" do
      classes = vendor_test.market.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Market]
    end

  end

  describe "FarMar::Vendor#products" do
    let(:vendor_test) { FarMar::Vendor.new("20","Ledner Group","7","6") }

    it "should return an array the product(s) that of that vendor" do
      vendor_test.products.must_be_instance_of Array
    end

    it "should wont be nil " do
      vendor_test.products.wont_equal nil
    end

    it "should return an object of the class Product" do
      classes = vendor_test.products.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Product]
    end

  end


  describe "FarMar::Vendor#sales" do
    let(:vendor_test) { FarMar::Vendor.new("20","Ledner Group","7","6") }

    it "should return an ARRAY the sale that of that vendor" do
      vendor_test.sales.must_be_instance_of Array
    end

    it "should return an array the ONE sale vendor" do
      vendor_test.sales.length.must_equal 5
    end

    it "should wont be nil " do
      vendor_test.sales.wont_equal nil
    end

    it "should return an object of the class Sales" do
      classes = vendor_test.sales.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Sale]
    end


  end

  describe "FarMar::Vendor#revenue" do
    let(:vendor_test) { FarMar::Vendor.new("20","Ledner Group","7","6") }

    it "should return a number, the total of sales" do
      vendor_test.revenue.must_be_kind_of Numeric
    end

    it "all the sales should be tons of money like 100.000" do
      vendor_test.revenue.must_be :>, 100000
    end

  end

  describe "FarMar::Vendor#self.by_market" do

    it "should return an ARRAY" do
      FarMar::Vendor.by_market(12).must_be_instance_of Array
    end

    it "should return to more than one vendor" do
      FarMar::Vendor.by_market("456").length.must_be :>, 1
    end

    it "each object in the array should be an object of the class Vendor" do
      classes = FarMar::Vendor.by_market("456").map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end

  end

  describe "FarMar::Vendor#self.most_revenue" do

    it "should return an ARRAY" do
      FarMar::Vendor.most_revenue("50").must_be_instance_of Array
    end

    it "should return to more than one vendor" do
      FarMar::Vendor.most_revenue("50").length.must_equal 50
    end

    it "each object in the array should be an object of the class Vendor" do
      classes = FarMar::Vendor.most_revenue("456").map { |m| m.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end

  end

end
