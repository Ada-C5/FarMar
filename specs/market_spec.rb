require_relative 'spec_helper'

describe FarMar::Market do
  it "exists" do
    FarMar::Market.wont_be_nil
  end

  it "contains all necessary info" do
    FarMar::Market.all.each do |mar|
      puts "#{mar.id} is missing id." if mar.id.nil?
      puts "#{mar.id} is missing name." if mar.name.nil?
      puts "#{mar.id} is missing address." if mar.address.nil?
      puts "#{mar.id} is missing city." if mar.city.nil?
      puts "#{mar.id} is missing county." if mar.county.nil?
      puts "#{mar.id} is missing state." if mar.state.nil?
      puts "#{mar.id} is missing zip." if mar.zip.nil?
    end
  end

  describe "Market#self.all" do
    it "creates an array of Market objects" do
      FarMar::Market.all.must_be_instance_of Array
      FarMar::Market.all[0].must_be_instance_of FarMar::Market
    end
  end

  describe "Market#self.find(find_id)" do
    it "returns the Market object with matching id" do
      this_id = FarMar::Market.all[13].id

      FarMar::Market.find(14).must_be_instance_of FarMar::Market
      FarMar::Market.find(14).id.must_equal this_id
      FarMar::Market.find(14).name.must_equal "Hartford Farmers Market"
    end
  end

  describe "Market#vendors" do
    it "should return all instances of Vendor that match the Market's id" do
      ap FarMar::Market.find(14).vendors
      FarMar::Market.find(14).vendors.must_be_instance_of Array
      FarMar::Market.find(14).vendors.length.must_equal 8
      FarMar::Market.find(14).vendors[0].market_id.must_equal "14"
    end
  end

end
