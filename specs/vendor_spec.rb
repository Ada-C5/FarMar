require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Market do
  it "is an object that I have access to" do
    FarMar::Market.wont_be_nil
  end
end