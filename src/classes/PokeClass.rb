require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "ascii-image"
require "colorize"




class Pokedex
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def getPokemonGeneralInfo(pokemonName) 
        res = PokeApi.get(pokemon: pokemonName)
        pokemonType = []

        res.types.each do |item| 
            pokemonType << item.type.name
        end

        pokemonInfo = {
            name: res.name,
            id: res.id,
            types: pokemonType,

        }
        return pokemonInfo.each do |key, value|
            puts key.to_s + " => " + value.to_s
        end
    end

    def getPokemonSpeciesInfo(pokemonName) 
        res = PokeApi.get(pokemon_species: pokemonName)
        # replaced_desc1 = res.flavor_text_entries[0].flavor_text.gsub(/\n/," ")
        # replaced_desc = replaced_desc1.gsub(/\u000c,"")

        pokemonInfo = {
            generation: res.generation.name,
            # description: replaced_desc,
        }
        return pokemonInfo.each do |key, value|
            puts key.to_s + " => " + value.to_s
        end

    end

    # ascii = ASCII_Image.new("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")
    # ascii.self.depth = 8
    # ascii.build(60)    


end



# uri = URI("https://pokeapi.co/api/v2/pokemon/")
# res = Net::HTTP.get_response(uri)
# #puts res.body if res.is_a?(Net::HTTPSuccess)


