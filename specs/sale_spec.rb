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
end
