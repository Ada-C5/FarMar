require_relative 'spec_helper'

describe FarMar::Product do
  it "exists" do
    FarMar::Product.wont_be_nil
  end

  describe "Product#self.all" do
    it "creates an array of Product objects" do
      FarMar::Product.all.must_be_instance_of Array
      FarMar::Product.all[0].must_be_instance_of FarMar::Product
    end
  end

  describe "Product#self.find(find_id)" do
    it "returns the Product object with matching id" do
      this_id = FarMar::Product.all[13].id

      FarMar::Product.find(14).must_be_instance_of FarMar::Product
      FarMar::Product.find(14).id.must_equal this_id
      FarMar::Product.find(14).name.must_equal "Stupendous Carrots"
    end
  end

end
