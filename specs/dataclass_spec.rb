require_relative './spec_helper'

#should only hold the self.all and self.find methods that other classes inherit

describe FarMar::DataClass do
  it "is an object we have access to" do
    FarMar::DataClass.wont_be_nil
  end

  describe "self.check_file_data_for_fields(data_file)" do
    it "will return arrays with 7 'fields' for Markets data [@id, @name, @street_address, @city, @county, @state, @zip]" do
      field_length = FarMar::DataClass.check_file_data_for_fields('./support/markets.csv')
      assert(field_length == [7])
    end

    it "will return arrays with 3 'fields' for Products data [@id, @name, @vendor_id]" do
      field_length = FarMar::DataClass.check_file_data_for_fields('./support/products.csv')
      assert(field_length == [3])
    end

    it "will return arrays with 4 'fields' for Vendors data [@id, @name, @number_of_employees, @market_id]" do
      field_length = FarMar::DataClass.check_file_data_for_fields('./support/vendors.csv')
      assert(field_length == [4])
    end

    it "will return arrays with 5 'fields' for Sales data [@id, @amount, @purchase_time, @vendor_id, @product_id]" do
      field_length = FarMar::DataClass.check_file_data_for_fields('./support/sales.csv')
      assert(field_length == [5])
    end
  end


end
