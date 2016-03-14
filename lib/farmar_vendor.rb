# lib/farmar_vendor.rb
class FarMar::Vendor
  def initialize
    @vendors = CSV.read('../support/vendors.csv')
  end
end
