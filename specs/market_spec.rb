require_relative './spec_helper'

describe FarMar::Market do
  it "is an object that I have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Market#self.all" do
    it "is an instance of Array" do
      FarMar::Market.all.must_be_instance_of Array
    end
  end
end