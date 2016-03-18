require_relative './spec_helper'

describe FarMar::Product do
  # Random IDs for tests
  let(:random_product_id) { ("1".."8193").to_a.sample }
  let(:random_vendor_id) { ("1".."2690").to_a.sample }

  let(:product_by_vendor_id_test) { FarMar::Product.new( [nil, nil, random_vendor_id] ) }
  let(:product_by_product_id_test) { FarMar::Product.new( [random_product_id, nil, nil] ) }

  it "is an object we have access to" do
    FarMar::Product.wont_be_nil
  end

  describe "self.all" do
    it "returns an array of instances" do
    FarMar::Product.all.must_be_kind_of(Array)
    end
  end

  describe "self.find" do
    it "can find a product instance based on ID" do
    FarMar::Product.find(random_product_id).must_be_instance_of(FarMar::Product)
    end
  end

  describe "self.by_vendor(vendor_id)" do
    it "returns all of the products with the given vendor_id" do
      products_collection = FarMar::Product.by_vendor(random_vendor_id)
      products_collection.must_be_kind_of(Array)
      # each item in the Array will be an instance of FarMar::Vendor
      products_collection.each { |instance| instance.must_be_instance_of(FarMar::Product) }
    end
  end

  describe "FarMar::Product#vendor" do
    it "will return the FarMar::Vendor instance associated with this vendor using the FarMar::Product vendor_id" do
      product_by_vendor_id_test.vendor.must_be_instance_of(FarMar::Vendor)
    end
  end

  describe "FarMar::Product#sales" do
    it "will return a collection of FarMar::Sale instances that are associated by the product_id field." do
      sales_collection = product_by_product_id_test.sales
      sales_collection.must_be_kind_of(Array)
      # each item in the Array will be an instance of FarMar::Sale
      sales_collection.each { |instance| instance.must_be_instance_of(FarMar::Sale) }
    end
  end

  describe "FarMar::Product#number_of_sales" do
    it "will return the number of times this product has been sold." do
    assert_operator(product_by_product_id_test.number_of_sales, :>=, 0.0)
    # :>= because although some products may not have been sold, I know for sure we can't have negative sales.
    end
  end


end
