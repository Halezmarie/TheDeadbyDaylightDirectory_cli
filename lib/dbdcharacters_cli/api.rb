class API

def self.get_data
    response = RestClient.get('https://dbd-stats.info/api/characters')
    data = JSON.parse(response)
    character_keys = data.keys 
    characters_array = [] 
    (0..character_keys.size()-1).each do |i| 
        characters_array.push(data.fetch(character_keys[i]))
    end
    characters_array.delete_at(39)
    characters_array.each do |character| 
        Character.new(character) 
end
end
end