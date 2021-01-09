class Character

@@all = []

attr_accessor :displayName, :backStory, :biography



def initialize(character_hash)
    character_hash.each do |k, v|
    self.send("#{k}=", v) if self.respond_to?("#{k}=")
    end
    save
end

def save
    @@all << self 
end

def self.all
    @@all
end


def self.find_character(character_displayName)
    self.all.find do |character|
        character.displayName == character_displayName
end
end
end





