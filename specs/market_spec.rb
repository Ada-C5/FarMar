require_relative './spec_helper'

describe FarMar::Market do
  it "is an object that is an instance of a Class" do
    FarMar::Market.must_be_instance_of Class
  end

  describe "FarMar::Market#self.all" do
    it "should return an incredibly large array" do
      FarMar::Market.all.must_be_instance_of Array
    end
  end

  describe "FarMar::Market#self.find" do
    it "should return 'People's Co-op Farmers Market' as market name when self.find called by id 1" do
      FarMar::Market.find(1).name.must_equal "People's Co-op Farmers Market"
    end

    it "should return 'ID not found!' when self.find called by id 550" do
      FarMar::Market.find(550).must_equal "ID not found!"
    end

  end

  describe "FarMar::Market#vendors" do
    market1 = FarMar::Market.new(id: 1)
    it "should return 6 vendors associated with market id 1" do
      market1.vendors(1).length.must_equal 6
    end
  end

end
