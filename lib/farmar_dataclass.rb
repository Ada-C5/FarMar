module FarMar
  class DataClass

    def initialize
    end

    def markets(data_file, data_class, id_to_match, method_name)
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def products(data_file, data_class, id_to_match, method_name)
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def sales(data_file, data_class, id_to_match, method_name)
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def vendors(data_file, data_class, id_to_match, method_name)
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def match_by(data_file, data_class, id_to_match, method_name)
    # returns an instance where the value of the id field for the instance of data_class (Market, Product, Sale, or Vendor) matches the passed id_to_match parameter.  The method_name returns the ID are trying to match, because it can be market_id, vendor_id, product_id, etc.

      all = data_class.all(data_file)
      matched = all.find_all do |instance|
        id_to_match == instance.send(method_name) # need to do this with send(string) and not just .method_name because otherwise it thinks there is a method called .method name :(
      end

      return matched
    end

    def self.find(data_file, method_name = "id", id)
    # returns an instance where the value of the id field in the CSV matches the passed id parameter.
    # Uses method_name in the same ways as match_by so we can reuse this code more

      all = self.all(data_file)
      all.each do |instance|
        return instance if instance.send(method_name) == id
      end
    end

    def self.all(data_file)
    #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

      data = []
      CSV.foreach(data_file) do |row|
        data << row
      end

      instances = data.collect do |array|
        self.new(array)
      end

      return instances
    end

  end
end
