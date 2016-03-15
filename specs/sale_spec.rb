require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Sale do

  before do
    info = {sale_id: 3,
    purchase_time: '2013-11-12 12:00:35'}
    @sale = FarMar::Sale.new(info)
  end

  it "does this exist" do
    FarMar::Sale.wont_be_nil
  end

  it "can create instance of sale" do
    @sale.must_be_instance_of(FarMar::Sale)
  end

  it "creates array of all sales" do
    FarMar::Sale.all.must_be_instance_of(Array)
  end

  it "can find a specific sale based on sale_id" do
    FarMar::Sale.find(10).amount.must_equal(5160)
  end

  it "should convert purchase time to datetime" do
    FarMar::Sale.all[0].purchase_time.day.must_equal(7)
  end

end
