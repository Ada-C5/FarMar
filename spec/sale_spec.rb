require_relative './spec_helper'

describe FarMar::Sale do
  before do
    @sale = FarMar::Sale.new
  end

  it "is an object we have access to" do
    @sale.wont_be_nil
  end
end

describe FarMar::Sale do
  before do
  @sale = FarMar::Sale
  end
  it "will return an array of sale instances" do
    @sale.all.class.must_equal Array
  end

  it "will return a sale with id 5" do
    @sale.find(5).must_be_instance_of FarMar::Sale
  end

  it "will return amount of transaction for the sale class" do
  @sale.find("5").amount.must_equal "4440"
  end

  it "will return amount of transaction for the sale class" do
  @sale.find("5").vendor_id.must_equal "1"
  end



end
