require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Sale do                                         #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Sale.wont_be_nil
  end
end
