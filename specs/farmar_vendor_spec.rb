require_relative 'spec_helper'

describe FarMar::Vendor do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Vendor.wont_be_nil
  end
end
