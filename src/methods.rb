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
def self.logo
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

    #remove suffixes from pokeapi name calls to prevent null api call, calls refer to the same data point as non-suffix pokemon names
    res.results.each do |item|
        all_names << item.name.split("-")[0].to_s.capitalize
    end

    #removes Aegislash due to known issue with API not pulling correct data
    all_names.delete("Aegislash")

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

