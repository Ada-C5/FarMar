require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "../farmar_market"

describe FarMar::Market do
  it "it is an object we have acccess to" do
    FarMar::Market.wont_be_nil
  end
end
