require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Market do
  # make sure there is a market class
  it "Is there a class? Anything?" do
    FarMar::Market.wont_be_nil
  end
end
