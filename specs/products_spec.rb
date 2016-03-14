require_relative "./spec_helper"
require_relative "../far_mar"


describe FarMar::Products do
  it "it is an object we have acccess to" do
    FarMar::Products.wont_be_nil
  end
end