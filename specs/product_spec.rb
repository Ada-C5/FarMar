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
end
