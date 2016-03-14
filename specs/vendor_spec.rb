require_relative './spec_helper'

describe FarMar::Vendor do
  it "is an object we have access to" do
    FarMar::Vendor.wont_be_nil
  end

  describe "FarMar::Vendor#all" do
    it "returns an array of instances" do
    FarMar::Vendor.all.must_be_kind_of(Array)
    end
  end

  describe "FarMar::Vendor#find" do
    it "can find a product instance based on ID" do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    FarMar::Vendor.find(id).must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "FarMar::Vendor#markets" do
    it "returns a collection of FarMar::Market instances that are associated with the vendor by the market_id field." do
    #we have Market IDs 1-500, and will test at random!
    market_id = (1..500).to_a.sample
    test_vendor = FarMar::Vendor.new( market_id: market_id )
    markets_collection = test_vendor.markets
    markets_collection.must_be_kind_of(Array)

    #any item in the Array will be an instance of FarMar::Market
    number_of_markets = markets_collection.length
    random_market = (0...number_of_markets).to_a.sample
    markets_collection[random_market].must_be_instance_of(FarMar::Market)
    end
  end

  describe "FarMar::Vendor#products" do
    it "returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field." do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    test_vendor = FarMar::Vendor.new( id: id )
    products_collection = test_vendor.products
    products_collection.must_be_kind_of(Array)

    #any item in the Array will be an instance of FarMar::Product
    number_of_products = products_collection.length
    random_product = (0...number_of_products).to_a.sample
    products_collection[random_product].must_be_instance_of(FarMar::Product)
    end
  end

  describe "FarMar::Vendor#sales" do
    it "returns a collection of FarMar::Sale instances that are associated by the vendor_id field." do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    test_vendor = FarMar::Vendor.new( id: id )
    sales_collection = test_vendor.sales
    sales_collection.must_be_kind_of(Array)

    #any item in the Array will be an instance of FarMar::Product
    number_of_sales = sales_collection.length
    random_sale = (0...number_of_sales).to_a.sample
    sales_collection[random_sale].must_be_instance_of(FarMar::Sale)
    end
  end

  describe "FarMar::Vendor#revenue" do
    it "returns the the sum of all of the vendor's sales (in cents)" do
    #we have Vendor IDs 1-2690, and will test at random!
    id = (1..2690).to_a.sample
    test_vendor = FarMar::Vendor.new( id: id )
    test_vendor.revenue.must_be_kind_of(Float) #we want the number back in cents!

    end
  end


end
