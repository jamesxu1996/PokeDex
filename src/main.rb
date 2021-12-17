require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "paint"
require "ascii-image"
require "colorize"
require "tty-prompt"
require_relative "./classes/PokeClass.rb"
require_relative "./methods.rb"


#Generates the Pokedex app logo
self.logo

#Initiates tty-prompt
prompt = TTY::Prompt.new

#Obtain and save user_name, re-asks user for input if blank
begin
    puts ("\n") * 3
    user_name = prompt.ask("Hello Pokemon Trainer! What is your name?")
    raise StandardError if user_name.nil? || user_name == ""
rescue
    puts "Please enter a name."
    retry
else
    user_name = string_capitalize(user_name)
end

#Saves menu choices in a variable as a hash of key value pairs
#Select from prompted choices, allows cycling of menu once selection reaches bottom of options and oves user to specific interface as per selection

while true
    choices = {"Use Pokedex": 1, "Download Your Team": 2, "Exit": 3}
    puts ("\n") * 2
    choice = prompt.select("Welcome to the Pokedex App Trainer #{user_name}! What would you like to do?", choices, cycle: true)
    case choice
    when 1
        puts ("\n") * 2
        choices = {"Search Specific Pokemon": 1, "Browse Pokemon Database": 2, "Go Back": 3}
        choice = prompt.select("Accessing Pokedex database ... What would you like to do?", choices, cycle: true)
        puts ("\n") * 2
        case choice
            when 1
                begin 
                    choice = prompt.ask("Which Pokemon would you like to search?")
                    choice = choice.downcase
                    search_result = Pokedex.new(choice)
                    search_result.paint(choice)
                    search_result.get_pokemon_general_info(choice)
                    search_result.get_pokemon_species_info(choice)
                    search_result.get_pokemon_stats(choice)
                    search_result.get_pokemon_desc_info(choice)
                    search_result.get_pokemon_habitat_info(choice)
                rescue => e
                    puts "Not a valid search/Missing data from PokeApi".colorize(:red)
                end
            when 2
                begin
                puts ("\n") * 2
                all_pokemon_names = self.get_all_pokemon_names
                choice = prompt.select("Please select a pokemon to view more OR start typing a pokemon name to filter ...", all_pokemon_names, filter: true)
                choice = choice.downcase
                search_result = Pokedex.new(choice)
                search_result.paint(choice)
                search_result.get_pokemon_general_info(choice)
                search_result.get_pokemon_species_info(choice)
                search_result.get_pokemon_stats(choice)
                search_result.get_pokemon_desc_info(choice)
                search_result.get_pokemon_habitat_info(choice)
                #External PokeApi has some missing habitat values set as NIL, crashes app if not rescued
                rescue => e
                    puts "Habitat => N/A".colorize(:red)
                end
                puts ("\n") * 2
            when 3
        end
    when 2
        puts ("\n") * 2
        puts "in progress"
        #parse json file of pokemon team to pull data for whole team
    when 3
        puts ("\n") * 2
        puts "Goodbye Trainer #{user_name}!"
        puts ("\n") * 2
        exit
    end
end
