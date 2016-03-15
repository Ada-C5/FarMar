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
    sale1 = FarMar::Sale.new(id: 10)
    it "should return 'Kertzmann LLC' vendor name for vendor_id" do
      sale1.vendor(10).name.must_equal "Kertzmann LLC"
    end
  end

  describe "FarMar::Sale#product" do
    sale2 = FarMar::Sale.new(id: 40)
    it "should return 'Bad Chicken' product associated with sale" do
      sale2.product(40).name.must_equal "Bad Chicken"
    end
  end

  describe "FarMar::Sale#self.between" do
    it "should return 'Bad Chicken' product associated with sale" do
      FarMar::Sale.between("2013-11-10 05:19:05", "2013-11-10 11:31:16").length.must_equal 471
    end
  end

end
