require_relative './spec_helper'

describe FarMar::Sale do
  it "should be an object we have access to" do
    FarMar::Sale.wont_be_nil
  end
end

describe "FarMar::Sale#all" do
  it "should return an array with instances form csv file" do
    FarMar::Sale.all.class.must_equal Array
  end

end

describe "FarMar::Sale#find(id)" do
  it "should return an instance of FarMar::Product for FarMar::Product.find(1)" do
    FarMar::Sale.find(12).must_be_instance_of FarMar::Sale
  end

  it "should return 'Dry Beets' for instance of FarMar::Product.find(1)" do
    FarMar::Sale.find(12).id.must_equal 12
  end

  # check if the amount being passed is converted from 4978 cents to 49.78
  it "should return 'Dry Beets' for instance of FarMar::Product.find(1)" do
    FarMar::Sale.find(14).amount.must_equal 4978
  end
end
