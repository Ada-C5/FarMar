module FarMar::FarMarMethods

  # example key_array = [:id, :name, :address, :city, :county, :state, :zip]
  def make_all(file, key_array)
    instance_array = []

    CSV.open(file, 'r').each do |line|
      instance_hash = {}

      # assigns a value to each key in the hash
      key_array.each_with_index do |key, index|
        instance_hash[key] = line[index]
      end

      # creates a new instance using the hash info
      instance_array << self.new(instance_hash)
    end

    # returns an array full of instances
    return instance_array
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