# lib/farmar_market.rb
class FarMar::Vendor
      attr_reader :vendor_id, :vendor_name, :num_employ, :market_id

        def initialize (vendor_hash)
          @vendor_id = vendor_hash[:vendor_id]
          @vendor_name = vendor_hash[:vendor_name]
          @num_employ = vendor_hash[:num_employ]
          @market_id = vendor_hash[:market_id]
        end


        def self.all
          vendor_collection = []
          vendor_array = []
          vendor_array = CSV.read("./support/vendors.csv", 'r')


         vendor_array.each do |vendor|
            vendor_hash = {vendor_id: vendor[0], vendor_name: vendor[1], num_employ: vendor[2], market_id: vendor[3]}
            new_vendor = FarMar::Vendor.new(vendor_hash)
            vendor_collection << new_vendor
          end
          return vendor_collection  #this is an array of FarMar::Vendor instances***
        end


        def self.find(id_requested)
          id_requested = id_requested.to_s
          vendor_array = []
          vendor_array = self.all
          vendor_array.each do |vendor|                     #this is an array of SPECIFIC VENDORS
            if vendor.vendor_id == id_requested
              return vendor                                 #break out of the loop when you find the id that matches
            end
          end
              return nil                                    #return nil if the id is not found
        end





end
