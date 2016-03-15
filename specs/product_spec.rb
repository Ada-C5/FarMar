require_relative './spec_helper'
require_relative '../far_mar'


describe FarMar::Product do

  it "does this exist" do
    FarMar::Product.wont_be_nil
  end

  it "can create instance of product class" do
    FarMar::Product.new(name: "super-toy").must_be_instance_of(FarMar::Product)
  end

  describe ".all" do
    let(:products) { FarMar::Product.all}

    it "can create array of all products from csv file" do
      products.class.must_equal(Array)
    end

    it "creates instances of product" do
      all_products = products.map { |product| product.class}
      all_products.uniq.must_equal [FarMar::Product]
    end
  end

  describe ".find" do
    let(:product_eight) { FarMar::Product.find(8)}

    it "can find a product given an id" do
      product_eight.name.must_equal("Shaky Honey")
    end

  end
#14,Stupendous Carrots,7
  describe '.vendor' do
    let(:carrot) { FarMar::Product.find(14)}

    it 'should return vendor that sells this product' do
      carrot.vendor[0].vendor_id.must_equal(7)
    end

  end

  describe '.sales' do
    let (:toy) { FarMar::Product.find(40)}
    it 'returns collection of all sales instances for this product' do
      classes = toy.sales.map { |sale| sale.class}
      classes.uniq.must_equal [FarMar::Sale]
    end
  end

  describe '.number_of_sales' do
    let (:car) { FarMar::Product.find(50)}

    it "should return the number of sales for that item" do
      car.number_of_sales.must_be_instance_of Fixnum
    end

  end

  describe 'self.by_vendor' do
    it "should return all products with given vendor_id" do
      goods = FarMar::Product.by_vendor(30)
      classes = goods.map { |product| product.class}
      classes.uniq.must_equal [FarMar::Product]
    end

  end


end
