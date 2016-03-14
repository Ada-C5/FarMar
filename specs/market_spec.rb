require_relative './spec_helper'

describe FarMar::Market do
  it "is an object we have access to" do
    FarMar::Market.wont_be_nil
  end

  describe "FarMar::Markets#all" do #how do we show this is a class method?
    it "returns an array of instances" do
    FarMar::Market.all.must_be_kind_of(Array)
    end

    it "can find a market instance based on ID" do
    #we have Market IDs 1-500, and will test at random!
    id = (1..500).to_a.sample
    FarMar::Market.find(id).must_be_instance_of(FarMar::Market)
    end
  end

end
