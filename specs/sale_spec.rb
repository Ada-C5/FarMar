require_relative './spec_helper'

describe FarMar::Sale do
  it "is an object that is an instance of a Class" do
    FarMar::Sale.must_be_instance_of Class
  end

  describe "FarMar::Sale#self.all" do
    it "should return an incredibly large array" do
      FarMar::Sale.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Sale#self.find" do
    it "should return 8924 when id 15 passed in" do
      FarMar::Sale.find(15).amount.must_equal 8924
    end

    it "should return nil when self.find called by id 13000" do
      FarMar::Sale.find(13000).must_equal nil
    end

  end

  describe "FarMar::Sale#vendor" do
    sale1 = FarMar::Sale.new(vendor_id: 10)
    it "should return id equal to product_id" do
      sale1.vendor.id.must_equal 10
    end
  end

  describe "FarMar::Sale#product" do
    sale2 = FarMar::Sale.new(product_id: 40)
    it "should return id equal to product_id" do
      sale2.product.id.must_equal 40
    end
  end

  describe "FarMar::Sale#self.between" do
    it "should return array of sales between given dates/times" do
      FarMar::Sale.between("2013-11-10 05:19:05", "2013-11-10 11:31:16").length.must_equal 471
    end
  end

end
