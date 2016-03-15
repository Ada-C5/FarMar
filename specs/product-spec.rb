require_relative './spec-helper'

describe FarMar::Product do
  it "Does it exist?" do
    FarMar::Product.wont_be_nil
  end
end

describe "Product#all" do
  it "return instances of Product class?" do
    FarMar::Product.all.wont_be_nil
  end
end

describe "Product#all" do
  it "return all instances of Product class?" do
    FarMar::Product.all.length.must_equal(8193)
    # The csv contains 8193 products.
  end
end

describe "Product#find(id)" do
  it "Does it exist?" do
    FarMar::Product.find(1).wont_be_nil
  end
end

describe "Product#find(id)" do
  it "Does it return the found product?" do
    FarMar::Product.find(20).must_be_instance_of FarMar::Product
  end
end

describe "#vendor" do
  it "Does it return the product's vendor?" do
    new_product = FarMar::Product.new(vendor_id: 1)
    new_product.vendor.must_be_instance_of FarMar::Vendor
  end
end

describe "#sales" do
  it "Does it return the sales of the product?" do
    new_product = FarMar::Product.new(product_id: 1)
    new_product.sales.must_be_instance_of Array
  end
end

describe "#number_of_sales" do
  it "Does it return the sales of the product?" do
    new_product = FarMar::Product.new(product_id: 1)
    new_product.sales.length.must_equal(7)
  end
end
