require_relative './spec_helper'
# require_relative '../lib/product'

describe FarMar::Product do 

	it "is an object we have access to" do 
		FarMar::Product.wont_be_nil 
	end

end