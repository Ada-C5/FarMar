require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Sale do
  it "is an object that I have access to" do
    FarMar::Sale.wont_be_nil
  end
end