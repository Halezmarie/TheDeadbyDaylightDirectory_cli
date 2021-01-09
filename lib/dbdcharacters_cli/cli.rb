class CLI

def start
    puts "Welcome to the Dead by Daylight Character Directory!"
    puts "++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "
    ███████████████████████████████████
    ███████████████████████████████████
    ███████████████████████████████████
    █████████████▒▒▒▒▒▒▒▒▒█████████████
    █████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████████
    ███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████
    ██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████
    █████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████
    █████▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒█████
    ████▒▒▒▒███▒▒▒▒▒▒▒▒▒▒▒▒▒███▒▒▒▒████
    ███▒▒▒▒██████▒▒▒▒▒▒▒▒▒██████▒▒▒▒███
    ███▒▒▒███▐▀███▒▒▒▒▒▒▒███▀▌███▒▒▒███
    ███▒▒▒██▄▐▌▄███▒▒▒▒▒███▄▐▌▄██▒▒▒███
    ███▒▒▒▒██▌███▒▒▒█▒█▒▒▒███▐██▒▒▒▒███
    ██▒▒▒▒▒▒███▒▒▒▒██▒██▒▒▒▒███▒▒▒▒▒▒██
    █▒▒▒▒▒▒▒▒█▒▒▒▒██▒▒▒██▒▒▒▒█▒▒▒▒▒▒▒▒█
    █▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒█
    █▒▒▒▒█▒▒█▒▒▒▒██▒▒▒▒▒██▒▒▒▒█▒▒█▒▒▒▒█
    ██▒▒▒█▒▒█▒▒▒▒█▒██▒██▒█▒▒▒▒█▒▒█▒▒▒██
    ███▒█▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒█▒███
    █████▒▒█▒▒▒▐███████████▌▒▒▒█▒▒█████
    ███████▒▒▒▐█▀██▀███▀██▀█▌▒▒▒███████
    ███████▒▒▒▒█▐██▐███▌██▌█▒▒▒▒███████
    ███████▒▒▒▒▒▐▒▒▐▒▒▒▌▒▒▌▒▒▒▒▒███████
    ████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████
    ████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████
    █████████▒▒█▒█▒▒▒█▒▒▒█▒█▒▒█████████
    █████████▒██▒█▒▒▒█▒▒▒█▒██▒█████████
    ██████████████▒▒███▒▒██████████████
    ██████████████▒█████▒██████████████
    ███████████████████████████████████
    ███████████████████████████████████"


    puts ""
    puts "First, what is your name? I promise I won't tell Freddy."
    puts ""
    API.get_data
    greet(user_input)
end


def user_input
    gets.strip
end


def greet(name)
    if name == 'exit'
        goodbye
    end 
    puts ""
    puts "What a deadly name, #{name}!" 
    puts ""
    puts "Would you like to learn about the characters of Dead by Daylight?"
    puts ""
    puts "Type 'yes' to see the list, 'exit' to leave the DbD Character Directory"
    puts ""
    menu
end 


def characters_list
   Character.all.each.with_index(1) do |character,i|
        puts "#{i}. #{character.displayName}"
    end
character_selection
end

def goodbye
    puts ""
    puts "Already!? Okay...well, I hope you learned some interesting facts about our DbD characters. Goodbye!"
    puts ""
    exit
end

def invalid 
    puts ""
    puts "Uh oh... the entity is displeased. Please type 'yes' to continue or type 'exit' to leave the program!"
    puts ""
    menu
end


def character_selection
    puts "__________________________________________________________________________"
    puts "We have some fascinating characters! Select a character for more details."
    puts ""
    selection = user_input
    if selection == 'exit'
        goodbye
    end

    begin
        character = Character.find_character(selection)
        character_details(character)
        #check the code, if there is an error to rescue 

    rescue
        puts ""
        puts "Please, enter the name exactly as shown in the list."
        puts ""
        character_selection
    end
end


def character_details(character)


    backstoryString = character.backStory
    biographyString = character.biography
    backstoryString.gsub! '<br>', ''
    biographyString.gsub! '<BR>', ''
    biographyString.gsub! '<B>', ''
    biographyString.gsub! '</B>', ''
    biographyString.gsub! '<br>', ''
    biographyString.gsub! '<b>', ''
    biographyString.gsub! '</b>', ''


    puts ""
    puts "Display name: #{character.displayName}"
    puts ""
    puts "~"
    puts ""
    puts "Backstory: #{backstoryString}"
    puts ""
    puts "~"
    puts ""
    puts "Biography: #{biographyString}"
    puts ""
    puts "~"
    puts ""
    puts "I hope you enjoyed learning about this character! Type 'yes' to search another character or 'exit' to quit the program. Stay deadly! "
    menu
end



def menu
    selection = user_input
    puts ""
    if selection == 'yes'
        characters_list
        menu

    elsif selection == 'exit'
        goodbye
    else 
        invalid

 
    end
end
end
