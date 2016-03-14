require_relative './spec_helper'
require_relative '../far_mar.rb'

describe FarMar::Market do                                         #this is testing to make sure Player exists
  it "will not be nil" do
    FarMar::Market.wont_be_nil
  end
end
