require_relative './spec_helper'
require_relative '../far_mar'
require_relative '../lib/farmar_market'

describe FarMar::Market do
	it "exists" do
		FarMar::Market.wont_be_nil
	end
end
