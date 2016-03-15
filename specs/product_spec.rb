require_relative 'spec_helper'

describe FarMar::Product do
  let(:all_products) { FarMar::Product.all }
  let(:product) { FarMar::Product.find(14) }

  it "exists" do
    FarMar::Product.wont_be_nil
  end

  describe "Product#self.all" do
    it "creates an array of Product objects" do
      all_products.must_be_instance_of Array
      all_products[0].must_be_instance_of FarMar::Product
    end
  end

  describe "Product#self.find(find_id)" do
    it "returns the Product object with matching id" do
      this_id = all_products[13].id

      product.must_be_instance_of FarMar::Product
      product.id.must_equal this_id
      product.name.must_equal "Stupendous Carrots"
    end
  end

  describe "Product#vendor" do
    it "finds the Vendor that the Product belongs to" do
      # uncomment the following line to see the instance of vendor for this product
      # p product.vendor
      product.vendor.must_be_instance_of FarMar::Vendor
      product.vendor.name.must_equal "Bechtelar Inc"
    end
  end

  describe "Product#sales" do
    it "returns all instances of Sale that match the Product's id" do
      # uncomment the following line to see the sales array
      # ap product.sales
      product.sales.must_be_instance_of Array
      product.sales.length.must_equal 7
      product.sales[0].product_id.must_equal "14"
    end
  end

  describe "Product#number_of_sales" do
    it "should sum the sale amounts" do
      product.number_of_sales.must_equal 7
    end
  end

end
