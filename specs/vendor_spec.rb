require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Vendor do

  it "does this exist" do
    FarMar::Vendor.wont_be_nil
  end

  describe "self.all" do
    let(:all_vendors) { FarMar::Vendor.all}

    it "creates an array of vendor info" do
      all_vendors.must_be_instance_of(Array)
    end

    it "creates an array of vendor instances" do
      classes = all_vendors.map { |vendor| vendor.class }
      classes.uniq.must_equal [FarMar::Vendor]
    end
  end

  describe "self.find" do
    let(:vendor_ten) {FarMar::Vendor.find(10)}

    it "should find instance of vendor given id" do
      vendor_ten.name.must_equal("Kertzmann LLC")
    end

    it "should return nil when it can't find vendor" do
      FarMar::Vendor.find(-3).must_be_nil
    end

  end

  describe ".market" do
    let(:vendor_five) { FarMar::Vendor.find(5)}

    it "should return the market where the vendor sells" do
      vendor_five.market.market_id.must_equal(1)
    end

  end

  describe '.products' do
    let(:adam) {FarMar::Vendor.find(8)}
    let(:adams_products) {adam.products}

    it "should return array of products that the vendor sells" do
      adams_products.must_be_instance_of Array
    end

    it "should return array of instances of FarMar::Product" do
      classes = adams_products.map { |product| product.class}
      classes.uniq.must_equal [FarMar::Product]
    end
  end

  describe '.sales' do
    let(:johnny_sales) {FarMar::Vendor.find(6).sales}

    it "should return array of sales instances belonging to vendor" do
      classes = johnny_sales.map { |sale| sale.class}
      classes.uniq.must_equal [FarMar::Sale]
    end

  end

  describe '.revenue' do
    let(:mark) {FarMar::Vendor.find(10)}

    it "should return sum of all vendor's sales" do
      mark.revenue.class.must_equal Fixnum
    end

  end

  describe 'self.by_market' do
    let(:market_one_vendors) {FarMar::Vendor.by_market(2)}

    it "should array of vendors with the given market_id" do
      market_one_vendors.class.must_equal Array
    end

    it "should return array of vendor instances" do
      classes = market_one_vendors.map { |vendor| vendor.class}
      classes.uniq.must_equal [FarMar::Vendor]
    end

  end

  # describe "self.most_revenue(n)" do
  #   it "should provide n vendors with most revenue" do
  #     FarMar::Vendor.most_revenue(2)[0].class.must_equal FarMar::Vendor
  #   end
  # end

end
