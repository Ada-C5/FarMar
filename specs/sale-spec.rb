require_relative './spec-helper'

describe FarMar::Sale do
  it "Does it exist?" do
    FarMar::Sale.wont_be_nil
  end
end

describe "Sale#all" do
  it "return instances of Sale class?" do
    FarMar::Sale.all.wont_be_nil
  end
end

describe "Sale#all" do
  it "return all instances of Sale class?" do
    FarMar::Sale.all.length.must_equal(12798)
    # The csv contains 12798 saless.
  end
end

describe "Sale#find(id)" do
  it "Does it exist?" do
    FarMar::Sale.find(1).wont_be_nil
  end
end

describe "Sale#find(id)" do
  it "Does it return the found sale?" do
    FarMar::Sale.find(20).must_be_instance_of FarMar::Sale
  end
end

describe "#vendor" do
  it "Does it return the sale's vendor?" do
    new_product = FarMar::Sale.new(vendor_id: 1)
    new_product.vendor.must_be_instance_of FarMar::Vendor
  end
end

describe "#product" do
  it "Does it return the sale's product?" do
    new_product = FarMar::Sale.new(product_id: 1)
    new_product.product.must_be_instance_of FarMar::Product
  end
end
