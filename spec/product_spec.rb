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

  describe "#vendor" do
    let(:product) { FarMar::Product.find(1) }
    it "Returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field" do
      vendor = product.vendor
      vendor.must_be_instance_of FarMar::Vendor
    end
  end

  describe "#sales" do
    let(:product) { FarMar::Product.find(1) }
    it "Returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field." do
      sales = product.sales
      sales[0].must_be_instance_of FarMar::Sale
      sales.must_be_instance_of Array
      sales.length.must_equal(7)
    end
  end

  describe "#number_of_sales" do
    let(:product) { FarMar::Product.find(1) }
    it "Returns the number of times this product has been sold" do
      count = product.number_of_sales
      count.must_equal(7)
    end
  end
end
