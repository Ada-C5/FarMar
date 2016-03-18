require 'csv'

module FarMar
  class FarMar::FarMarClass
    # method to create all instances from CSV file
    FILE = nil
    def self.all
      all = []
      CSV.foreach(self::FILE) do |line|
        init_param = []
        line.each do |word|
          init_param << word
        end
        all << self.new(*init_param)
      end
      return all
    end

    # method to find instance with id
    def self.find(id)
        self.all.find { |x| x.id == id }
    end

  end
end

require_relative './lib/market'
require_relative './lib/product'
require_relative './lib/sale'
require_relative './lib/vendor'