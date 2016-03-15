require_relative 'spec_helper'

describe FarMar::Product do
  let(:all_products) { FarMar::Product.all }
  let(:market) { FarMar::Product.find(14) }

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

      market.must_be_instance_of FarMar::Product
      market.id.must_equal this_id
      market.name.must_equal "Stupendous Carrots"
    end
  end

end
