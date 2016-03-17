require_relative "./spec_helper"
require 'date'
#require_relative "../far_mar"
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

      it "should return information for particular sale" do
        selected_sale = FarMar::Sale.find(78)
        selected_sale.product_info.must_equal 44
      end

      describe "FarMar::Sale#vendor" do
        it "FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field" do
          selected_vendor = FarMar::Sale.find(89)
          selected_vendor.vendor[0].name.must_equal "Langosh, Krajcik and Langosh"
        end
      end

      describe "FarMar::Sale#between" do
        it "returns a collection of sales data in a given date range" do
          begin_date = DateTime.parse('11th Nov 2013 04:05:06 PM')
          end_date = DateTime.parse('20th Nov 2013 04:05:06 PM')
            FarMar::Sale.between(begin_date, end_date).size.must_equal 3703
            FarMar::Sale.between(begin_date, end_date).class.must_equal Array
        end
      end
end
