require_relative './spec_helper'

describe FarMar::Sale do
  it "is an object that I have access to" do
    FarMar::Sale.wont_be_nil
  end
end