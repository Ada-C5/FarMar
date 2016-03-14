require_relative './spec_helper'
require_relative '../far_mar'

describe FarMar::Market do
  it "Does the Market Class exist test?" do
    FarMar::Market.wont_be_nil
  end
end
