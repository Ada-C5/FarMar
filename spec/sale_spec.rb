require_relative './spec_helper'

describe FarMar::Sale do
  before do
    @sale = FarMar::Sale.new
  end

  it "is an object we have access to" do
    @sale.wont_be_nil
  end

  describe FarMar::Sale do
    before do
      @sale = FarMar::Sale
    end
  end

  describe "FarMar::Sale#.all" do
    it "will return an array of sale instances" do
      FarMar::Sale.all.class.must_equal Array
    end
  end

  describe "FarMar::Sale#.all" do
    it "will return an array that is greater than 0" do
      (FarMar::Sale.all.count > 0).must_equal	true
    end
  end

  describe "FarMar::Sale#.all" do
    it "will return an instance of FarMar::Sale" do
      FarMar::Sale.all.pop.must_be_instance_of FarMar::Sale
    end
  end

  describe "FarMar::Sale#.find" do
    it "will return a sale with id 5" do
      FarMar::Sale.find(5).must_be_instance_of FarMar::Sale
    end
  end

  describe "FarMar::Sale#.find.amount" do
    it "will return amount of transaction for the sale class" do
    FarMar::Sale.find("5").amount.must_equal "4440"
    end
  end

  describe "FarMar::Sale#.find.vendorid" do
    it "will return the vendor that is assoicated with this sale" do
    FarMar::Sale.find("5").vendor_id.must_equal 1
    end
  end

  describe "FarMar::Sale#self.between" do
    it "will return FarMar::Sale instances between the beginning and end date" do
      FarMar::Sale.between("2013-11-07 04:34:56 -0800","2013-11-10 02:44:56 -0800").must_be_instance_of Array
    end
  end

  describe "FarMar::Sale#self.between" do
    it "Will return FarMar::Sale instances between the beginning and end date" do
    FarMar::Sale.between("2013-11-07 04:34:56 -0800","2013-11-10 02:44:56 -0800").pop.must_be_instance_of FarMar::Sale
    end
  end

  describe "FarMar::Sale#self.between" do
    it "will return FarMar::Sale instances between the begining and end date" do
    FarMar::Sale.between("2013-11-07 04:34:56 -0800","2013-11-10 02:44:56 -0800").count.must_be_instance_of Fixnum
    end

  end

end
