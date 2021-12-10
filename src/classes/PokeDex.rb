require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"

# class PokedexApp
#     attr_reader: 

    # def initialize

    def getPokemonInfo(pokemonName) 
        res = PokeApi.get(pokemon: pokemonName)
        pokemonType = []

        res.types.each do |item| 
            pokemonType << item.type.name
        end

        pokemonInfo = {
            name: res.name,
            types: pokemonType,
            species: res.species.url
        }
        return pokemonInfo
    end

# end

puts getPokemonInfo('pikachu')


uri = URI("https://pokeapi.co/api/v2/pokemon/pikachu")
res = Net::HTTP.get_response(uri)
#puts res.body if res.is_a?(Net::HTTPSuccess)


