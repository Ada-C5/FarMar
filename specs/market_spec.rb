require_relative 'spec_helper'

describe FarMar::Market do
  it "exists" do
    FarMar::Market.wont_be_nil
  end

  describe "Market#self.all" do
    it "creates an array of Market objects" do
      FarMar::Market.all.must_be_instance_of Array
      FarMar::Market.all[0].must_be_instance_of FarMar::Market
    end
  end

end
