require_relative './spec_helper'
require_relative '../farmar'

describe FarMar::Product do

# TEST 1
	it  "is an object we have access to" do
		FarMar::Product.wont_be_nil
	end
end
