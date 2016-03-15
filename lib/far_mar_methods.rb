module FarMar::FarMarMethods

  # example key_array = [:id, :name, :address, :city, :county, :state, :zip]
  def make_all(file, key_array)
    instance_array = []

    CSV.open(file, 'r').each do |line|
      instance_hash = {}

      key_array.each_with_index do |key, index|
        instance_hash[key] = line[index]
      end

      instance_array << self.new(instance_hash)
    end

    return instance_array
  end

  def find(id)
    self.all.each do |instance|
      return instance if id == instance.id
    end

    nil
  end
  
end