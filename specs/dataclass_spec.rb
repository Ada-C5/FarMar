require_relative './spec_helper'

#should only hold the self.all and self.find methods that other classes inherit

describe FarMar::DataClass do
  it "is an object we have access to" do
    FarMar::DataClass.wont_be_nil
  end
end
