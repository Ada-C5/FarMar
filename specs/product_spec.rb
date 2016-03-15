require_relative './spec_helper'

describe FarMar::Product do
  it "exists" do
    FarMar::Product.wont_be_nil
  end
end
describe FarMar::Sale do
    before do
      market_data = {
        id: 1
      }
      @sales = FarMar::Sale.new(market_data)
    end

    it "it creates a new Sale instance" do
    @sales.must_be_instance_of(FarMar::Sale)
    end
  end

  describe "SelfAll" do
    before do
      @sales = FarMar::Sale.all # all is a self class
    end

    it "returns an array" do
      @sales.must_be_instance_of(Array)
    end

    it "returns a collection of instances from the CSV file" do
      @sales[0].must_be_instance_of(FarMar::Sale)
    end
  end

  describe "SelfFindMethod" do
    before do
      # one instance of a sales class with an id value of one
      # this is an actual sales
      @one_sale = FarMar::Sale.find(1)
    end

    it "returns an instance of sales" do
      @one_sale.must_be_instance_of(FarMar::Sale)
    end
  end
