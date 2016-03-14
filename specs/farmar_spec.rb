require_relative './spec_helper'
require_relative '../farmar'

require 'simplecov'
SimpleCov.start

describe FarMar do
  it "has a class Market" do
    FarMar::Market.wont_be_nil
  end

  it "has a class Product" do
    FarMar::Product.wont_be_nil
  end

  it "has a class Sale" do
    FarMar::Sale.wont_be_nil
  end

  it "has a class Vendor" do
    FarMar::Vendor.wont_be_nil
  end
end
