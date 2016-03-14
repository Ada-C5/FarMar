require_relative "./spec_helper"
require_relative "../far_mar"


describe Sales do
  it "it is an object we have acccess to" do
    Sales.wont_be_nil
  end
end