require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do
  # make sure there is a market class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  # test self.all method to make sure the CSV is being parced correctly
  # it "Is there an id, name and ven_id?" do
  #   FarMar::Product.all.must_equal "1 Dry Beets 1"
  # end

  # test self.all method to make sure it makes an array of product instances
  it "self.all returns an array of instances!" do
    FarMar::Product.all.class.must_equal Array
  end

  # test the self.find(id) returns correct instance
  it "self.find(id) returns its corresponding instance" do
    FarMar::Product.find(36).must_equal "Mute Beef"
  end
end