require_relative 'spec_helper'

describe FarMar::Sale do
  it "exists" do
    FarMar::Sale.wont_be_nil
  end

  describe "Sale#self.all" do
    it "creates an array of Sale objects" do
      FarMar::Sale.all.must_be_instance_of Array
      FarMar::Sale.all[0].must_be_instance_of FarMar::Sale
    end
  end

  describe "Sale#self.find(find_id)" do
    it "returns the Sale object with matching id" do
      this_id = FarMar::Sale.all[13].id

      FarMar::Sale.find(14).must_be_instance_of FarMar::Sale
      FarMar::Sale.find(14).id.must_equal this_id
      FarMar::Sale.find(14).purchase_time.must_equal "2013-11-10 01:51:24 -0800"
    end
  end

end
