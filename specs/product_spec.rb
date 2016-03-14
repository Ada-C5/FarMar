require_relative 'spec_helper'

describe FarMar::Product do
  it "exists" do
    FarMar::Product.wont_be_nil
  end

  describe "Product#self.all" do
    it "creates an array of Product objects" do
      FarMar::Product.all.must_be_instance_of Array
      FarMar::Product.all[0].must_be_instance_of FarMar::Product
    end
  end

end
