require_relative 'spec_helper'

describe FarMar::Product do
  # make sure there is a Player class
  it "Is there a class? Anything?" do
    FarMar::Product.wont_be_nil
  end

  let(:products_all) {FarMar::Product.all}
  let(:products_find) {FarMar::Product.find 1}


  # runs the .all method to create instances for each row in products.csv
  it "returns total number of products => 8193 instances" do
    products_all.length.must_equal 8193   # checks the length
  end

  # check all methods that can be called after finding the product id
  describe FarMar::Product do  #how do I correctly name this to a method?!?!?
    # check the .find(id) method
    it "should return the id of the instance if .find(id = 1)" do
      pro = products_find
      pro.id.must_equal 1
      pro.name.must_equal "Dry Beets"
      pro.vendor_id.must_equal 1
    end

    # check the vendor method
    it "should return the vendor associated with the product vendor_id: 1" do
      pro_ven = products_find.vendor
      pro_ven.id.must_equal 1
      pro_ven.name.must_equal "Feil-Farrell"
      pro_ven.employees.must_equal 8
      pro_ven.market_id.must_equal 1
    end

    # check the sales method
    it "should verify all sales (7) match the vendor_id:1" do
      products_find.sales.each do |instance|
        instance.vendor_id.must_equal 1
      end
    end

    # check the number_of_sales method
    it "should return 7" do
      products_find.number_of_sales.must_equal 7
    end

    # check the self.by_vendor method
    it "should verify all products (1) found have the vendor_id: 1" do
      FarMar::Product.by_vendor(1).each do |instance|
         instance.vendor_id.must_equal 1
       end
    end
  end
end
