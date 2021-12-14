require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "ascii-image"
require "colorize"
require "tty-prompt"
require_relative "./classes/PokeClass.rb"
require_relative "./methods.rb"



# charmander = Pokedex.new("charmander")
# charmander.getPokemonGeneralInfo("charmander")
# charmander.getPokemonSpeciesInfo("charmander")

#Generates the Pokedex app logo
self.logo

#Initiates tty-prompt
prompt = TTY::Prompt.new

#Obtain and save user_name
user_name = prompt.ask("Hello Pokemon Trainer! What is your name?")
user_name = user_name.capitalize 

#Saves menu choices in a variable as a hash of key value pairs
#Select from prompted choices, allows cycling of menu once selection reaches bottom of options and oves user to specific interface as per selection
#
while true
    choices = {"Use Pokedex": 1, "Upload Your Team": 2, "Exit": 3}
    choice = prompt.select("Welcome to the Pokedex App Trainer #{user_name}! What would you like to do?", choices, cycle: true)
    case choice
    when 1
        choices = {"Search Specific Pokemon": 1, "Browse Pokemon Database": 2, "Go Back": 3}
        choice = prompt.select("Accessing Pokedex database ... What would you like to do?", choices, cycle: true)
        case choice
            when 1 
                choice = prompt.ask("Which Pokemon would you like to search?")
                choice = choice.downcase
                search_result = Pokedex.new(choice)
                search_result.getPokemonGeneralInfo(choice)
                search_result.getPokemonSpeciesInfo(choice)
                # search_again = prompt.yes?("Would you like to perform another search?")
                #     search_again == 1
                #     if search_again == 1
                #         prompt.ask("Which Pokemon would you like to search?")
                    # end
            when 2
                
            when 3
        end
    when 2
        puts "in progress"
        #parse json file of pokemon team to pull data for whole team
    when 3
        puts "Goodbye Trainer #{user_name}!"
        exit
    end
end
