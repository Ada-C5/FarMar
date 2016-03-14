require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "./lib/farmar_sale"

describe FarMar::Sale do
  it "it is an object we have acccess to" do
    FarMar::Sale.wont_be_nil
  end
end
