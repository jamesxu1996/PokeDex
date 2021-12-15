require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "ascii-image"
require "colorize"
require "tty-prompt"





class Pokedex
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def get_pokemon_general_info(pokemon_name) 
        res = PokeApi.get(pokemon: pokemon_name)
        pokemon_type = []

        res.types.each do |item| 
            pokemon_type << item.type.name.capitalize
            # pokemonType.colorize 
        end

        pokemon_info = {
            name: res.name,
            id: res.id,
            types: pokemon_type,
        }
        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    def get_pokemon_species_info(pokemon_name)
        res = PokeApi.get(pokemon_species: pokemon_name)
        evo_id = res.evolution_chain.get.id
        evo_res = PokeApi.get(evolution_chain: evo_id)
        evo_chain = []
        begin
            evo_chain << evo_res.chain.species.name
            evo_chain << evo_res.chain.evolves_to.first.species.name
            evo_chain << evo_res.chain.evolves_to.first.evolves_to.first.species.name
        rescue => e
        end
        desc = res.flavor_text_entries[1].flavor_text.gsub(/\n/, " ").gsub(/\u000c/, " ")
        
        pokemon_info = {
            generation: res.generation.name,
            habitat: res.habitat.name,
            shape: res.shape.name,
            colour: res.color.name,
            evolution_chain: evo_chain,
            description: desc,
        }

        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    # def get_all_pokemon_names
    #     res = PokeApi.get("https://pokeapi.co/api/v2/pokemon/?offset=0&limit=2000")
    #     all_names = []

    #     res.results.each do |item|
    #         all_names << item.name.capitalize
    #     end

    #     pokemon_info = {
    #         all_name: all_names,
    #     }

    #     return pokemon_info.each do |key, value|
    #         puts key.to_s.capitalize + " => " + value.to_s.capitalize
    #     end
    # end

end



