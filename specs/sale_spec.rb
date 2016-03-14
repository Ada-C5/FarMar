require_relative "./spec_helper"
require_relative "../far_mar"
#require_relative "./lib/farmar_sale"

describe FarMar::Sale do
  it "it is an object we have acccess to" do
    FarMar::Sale.wont_be_nil
  end
end

describe "FarMar#Sale" do

  before do
    sale_data = {
      sale_id: 92,
      amount: 150,
      vendor_id: 11
    }
    @sale = FarMar::Sale.new(sale_data)
  end

      it "an instance of class Sale'" do
    	 @sale.must_be_instance_of(FarMar::Sale)
      end

      it "should return number of all sales" do
        all_sales = FarMar::Sale.all
        all_sales.length.must_equal 12798
      end
end
