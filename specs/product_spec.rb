require_relative './spec_helper'

describe FarMar::Product do
  it "is an object that is an instance of a Class" do
    FarMar::Product.must_be_instance_of Class
  end

  describe "FarMar::Product#self.all" do
    it "should return an incredibly large array" do
      FarMar::Product.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Product#self.find" do
    it "should return 'Depressed Beets' as Product name" do
      FarMar::Product.find(30).name.must_equal "Depressed Beets"
    end

    it "should return nil when self.find called by id 9000" do
      FarMar::Product.find(9000).must_equal nil
    end
  end

  describe "FarMar::Product#vendor" do
    products1 = FarMar::Product.new(vendor_id: 86)
    it "should return 'Purdy-Kerluke' as Vendor name" do
      products1.vendor.name.must_equal "Purdy-Kerluke"
    end
  end

  describe "FarMar::Product#sales" do
    products2 = FarMar::Product.new(id: 58)
    it "should return array of sales associated w/product_id" do
      products2.sales.length.must_equal 5
    end
  end

  describe "FarMar::Product#number_of_sales" do
    products3 = FarMar::Product.new(id: 74)
    products4 = FarMar::Product.new(id: 14000)

    it "should return number of times product has been sold" do
      products3.number_of_sales.must_equal 7
    end

    it "should return nil for id that doesn't exist" do
      products4.number_of_sales.must_equal  nil
    end

  end

  describe "FarMar::Product#self.by_vendor" do
    it "should return number of times product has been sold" do
      FarMar::Product.by_vendor(21).length.must_equal 5
    end
  end

  # describe "FarMar::Product#number_of_sales" do
  #   products4 = FarMar::Product.new(id: 14000)
  #   it "should return nil for id that doesn't exist" do
  #     products4.number_of_sales.must_equal  nil
  #   end
  # end

end
