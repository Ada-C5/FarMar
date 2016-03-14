require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Vendors do
  it "it is an object we have acccess to" do
    FarMar::Vendors.wont_be_nil
  end
end