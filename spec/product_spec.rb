require_relative './spec_helper'
require_relative '../lib/product'

describe FarMar::Product do
  it "Product Class exist?" do
    FarMar::Product.wont_be_nil
  end

  describe "#self.all(file)" do
    let(:all_products) { FarMar::Product.all}

    it "Return an array?" do
      all_products.must_be_instance_of Array
    end

    it "Return an array full of FarMar::Product Instances?" do
      classes = all_products.map { |m| m.class}
      classes.uniq.must_equal [FarMar::Product]
    end
  end

  describe "#self.find(id)" do
    let(:product) { FarMar::Product.find(1) }

    it "Know basic data about product?" do
      product.must_be_instance_of FarMar::Product
      product.id.must_equal(1)
      product.name.must_equal("Dry Beets")
      product.vendor_id.must_equal(1)
    end

    it "Returns nil if product is not found?" do
      FarMar::Product.find(10_000).must_equal(nil)
    end
  end

  # describe "#vendors" do
  #   it "Returns an array of vendor objects that match a specific market_id" do
  #     market = FarMar::Product.find(1)
  #     vendors = market.vendors
  #     vendors.length.must_equal(6)
  #   end
  # end

end
