require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Sale do

  before do
    info = [3,44,"tomorrow at 5pm", 5,7]
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

  describe 'find' do

    it "can find a specific sale based on sale_id" do
      FarMar::Sale.find(10).amount.must_equal(5160)
    end
  end

  describe 'datetime conversion with new' do

    it "should convert purchase time to datetime" do
      FarMar::Sale.find(1).purchase_time.hour.must_equal(4)
    end

  end

  describe '.vendor' do
    it "should return vendor instance that made that sale" do
      this_sale = FarMar::Sale.find(30)
      this_sale.vendor.class.must_equal FarMar::Vendor
    end
  end

  describe '.product' do
    it "should return product instance" do
      this_sale = FarMar::Sale.find(30)
      this_sale.product.class.must_equal FarMar::Product
    end
  end

  describe "self.between" do
    it "should return all sales between two times" do
      sales = FarMar::Sale.between("11/8/2013 at 4pm", "11/8/2013 at 8pm")
      sales[0].purchase_time.class.must_equal Time
    end
  end


end
