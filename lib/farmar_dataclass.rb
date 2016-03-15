module FarMar
  class DataClass

    def initialize
    end

    def markets(data_file, data_class, id_to_match, method_name) #from vendor
      match_by(data_file, data_class, id_to_match, method_name)
    end

    #match_by_vendor_id
    def products(data_file, data_class, id_to_match, method_name) #from vendor
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def sales(data_file, data_class, id_to_match, method_name) #from vendor
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def vendors(data_file, data_class, id_to_match, method_name) #from market
      match_by(data_file, data_class, id_to_match, method_name)
    end

    def match_by(data_file, data_class, id_to_match, method_name)
      all = data_class.all(data_file)
      matched = all.find_all do |instance|
        id_to_match == instance.send(method_name) #need to do this with send(string) and not just .method_name because otherwise it thinks there is a method called .method name :(
      end
      matched
    end

    def self.find(data_file, id) # returns an instance where the value of the id field in the CSV matches the passed id parameter.
      all = self.all(data_file)
      all.each do |instance|
        return instance if instance.id == id
      end
    end

    def self.all(data_file) #returns a collection of FarMar::"DataClass" instances, representing all of the Markets described in the CSV.

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
