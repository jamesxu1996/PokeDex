require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "ascii-image"
require "colorize"
require "tty-prompt"

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

# def ascii
#     ascii = ASCII_Image.new("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")
#     ascii.self.depth = 8
#     ascii.build(60)    
# end

def get_all_pokemon_names
    res = PokeApi.get(pokemon: {limit: 2000,offset: 0 })
    all_names = []

    res.results.each do |item|
        all_names << item.name.capitalize
    end

    pokemon_info = {
        all_name: all_names.sort,
    }

    return pokemon_info.each do |key, value|
        puts key.to_s.capitalize + " => " + value.to_s.capitalize
    end
end