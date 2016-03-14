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
  end
end
