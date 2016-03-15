require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Vendor do
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
    it "should return object's city Cruickshank Group" do
      FarMar::Vendor.find("2676").vendor_name.must_equal "Cruickshank Group"
    end

    it "should return an object of the class Vendor" do
      FarMar::Vendor.find("142").must_be_instance_of FarMar::Vendor
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

    it "should return an array the sale(s) that of that vendor" do
      vendor_test.sales.must_be_instance_of Array
    end

    it "should wont be nil " do
      vendor_test.sales.wont_equal nil
    end

    it "should return an object of the class Sales" do
      classes = vendor_test.sales.map { |m| m.class }
      classes.uniq.must_equal [FarMar::Sale]
    end


  end


end
