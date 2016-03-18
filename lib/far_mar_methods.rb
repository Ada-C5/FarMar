module FarMar::FarMarMethods

  def make_all(file, key_array)
    # create an array of instances by using map enumerable
    CSV.open(file, 'r').map do |line|
      instance_hash = {}

      # assigns a value to each key in the hash
      key_array.each_with_index do |key, index|
        instance_hash[key] = line[index]
      end

      self.new(instance_hash)
    end
  end

  def find(id)
    # iterates through each instance in the collection
    self.all.each do |instance|
      return instance if id == instance.id
    end

    # if an instance matching the given id isn't found, return nil
    nil
  end
end