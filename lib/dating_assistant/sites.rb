class DatingAssistant::Sites 

    attr_accessor :name, :url, :description

    @@all = []

    def initialize
        @name = name
        @url = url 
        @description = description
    end


    def self.all
        @@all
    end

    def save
        @@all << self
    end


end