require_relative './spec_helper'

describe FarMar::Sale do

  SALE_TEST = {
    sid: 1,
    amount: 3,
    purchase_time: Time.new,
    vid: 2,
    pid: 4,
  }
  describe "Sale#new" do
    it "can create new instances of Sale with correct amount" do
      sale = FarMar::Sale.new(SALE_TEST)
      sale.amount.must_equal 3
    end
  end

end
