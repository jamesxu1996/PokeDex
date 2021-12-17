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

#method to print applicatin logo colourised
def logo
    puts "
    ██████╗  ██████╗ ██╗  ██╗███████╗██████╗ ███████╗██╗  ██╗
    ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝██╔══██╗██╔════╝╚██╗██╔╝
    ██████╔╝██║   ██║█████╔╝ █████╗  ██║  ██║█████╗   ╚███╔╝ 
    ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║  ██║██╔══╝   ██╔██╗ 
    ██║     ╚██████╔╝██║  ██╗███████╗██████╔╝███████╗██╔╝ ██╗
    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝".colorize(:blue)                                                     

    puts "                       " + "RUBY POKEDEX APP".colorize(:color => :blue, :background => :yellow)
end

#method to obtain all unique pokemon names
def get_all_pokemon_names
    res = PokeApi.get(pokemon: {limit: 2000,offset: 0})
    all_names = []

    res.results.each do |item|
        all_names << item.name.to_s.capitalize
    end

    #return only unique pokemon names from api call
    all_names = all_names.uniq
    return all_names.sort
end

#method to capitalize every word in a string
def string_capitalize(string)
    string.gsub(/\S+/, &:capitalize)
end

#method to write pokemon team user input to file
def write_team
    puts "Please enter"
    user_input = gets.chomp 
    File.write('./saved_teams/', user_input)
end

# def save
#     # save_pokemon_names = prompt.ask("Please enter a Pokemon name")
#     save_pokemon_names.each do |item|
#         pokemon_name_file << save_pokemon_names.capitalize.to_s
#         res = prompt.yes?("Add another Pokemon?")
#         while res == true
#             save_pokemon_names = prompt.ask("Please enter a Pokemon name")
#             pokemon_name_file << save_pokemon_names.capitalize.to_s
#         end
#     end
# end