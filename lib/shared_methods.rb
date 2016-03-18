class FarMar::SharedStuff

  def self.all
    instances = {}
    self.pull_from_csv.each do |instance|
      instances[instance[0]] = make_new_instance(instance)
    end
      instances
  end


  def self.find(id) #search by id
    self.pull_from_csv.each do |instance|
      if instance[0].to_i == id.to_i
        return make_new_instance(instance)
      end
    end
    return "No instance found"
  end

end
