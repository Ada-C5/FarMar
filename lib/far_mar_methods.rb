module FarMar::FarMarMethods

  # example key_array = [:id, :name, :address, :city, :county, :state, :zip]
  def self.make_all(file, key_array, class_name)
    instance_array = []

    CSV.open(file, 'r').each do |line|
      instance_hash = {}

      key_array.each_with_index do |key, index|
        instance_hash[key] = line[index]
      end

      instance_array << class_name.new(instance_hash)
    end

    return instance_array
  end

  def self.find(id, class_name)
    class_name.all.each do |instance|
      return instance if id == instance.id
    end

    nil
  end
  
end