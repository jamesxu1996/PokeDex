require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "paint"
require "ascii-image"
require "colorize"
require "tty-prompt"

#Pokedex class
class Pokedex
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    #Displays pokemon name, id, types (as array)
    def get_pokemon_general_info(pokemon_name) 
        res = PokeApi.get(pokemon: pokemon_name)
        pokemon_type = []

        res.types.each do |item| 
            pokemon_type << item.type.name.capitalize
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

    #Displays pokemon generation, shape, colour, evolution chain (as array)
    def get_pokemon_species_info(pokemon_name)
        pokemon_name = pokemon_name.split("-")[0]
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
        
        
        pokemon_info = {
            generation: res.generation.name,
            shape: res.shape.name,
            colour: res.color.name,
            evolution_chain: evo_chain,
        }

        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    #Displays pokemon habitat
    def get_pokemon_habitat_info(pokemon_name)
        pokemon_name = pokemon_name.split("-")[0]
        res = PokeApi.get(pokemon_species: pokemon_name)

        pokemon_info = {
            habitat: res.habitat.name,
        }

        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    #Displays pokemon description info
    def get_pokemon_desc_info(pokemon_name)
        pokemon_name = pokemon_name.split("-")[0]
        res = PokeApi.get(pokemon_species: pokemon_name)
        desc = res.flavor_text_entries[1].flavor_text.gsub(/\n/, " ").gsub(/\u000c/, " ")

        pokemon_info = {
            description: desc,
        }

        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    #Displays pokemon stats
    def get_pokemon_stats(pokemon_name)
        res = PokeApi.get(pokemon: pokemon_name)

        pokemon_info = {
            hp: res.stats[0].base_stat,
            atk: res.stats[1].base_stat,
            def: res.stats[2].base_stat,
            spcl_atk: res.stats[3].base_stat,
            spcl_def: res.stats[4].base_stat,
            spd: res.stats[5].base_stat,
        }

        return pokemon_info.each do |key, value|
            puts key.to_s.capitalize + " => " + value.to_s.capitalize
        end
    end

    #displays pokemon as pixel art
    def paint(pokemon_name)
        puts ("\n") * 2
        res = PokeApi.get(pokemon: pokemon_name)
        res = res.sprites.front_default
        uri = URI.parse(res)
        response = Net::HTTP.get_response(uri)
        image = Magick::ImageList.new
        image.from_blob uri.read
        image = image.scale(120/ image.columns.to_f)
        image = image.scale(image.columns, image.rows / 2)
        cur_row = 0
        image.each_pixel do |pixel, col, row|
        color = pixel.to_color(Magick::AllCompliance, false, 8)
        if cur_row != row
            puts
            cur_row = row
        end
        print Paint[' ', '', color]
        end
        puts
        puts ("\n") * 2
    end

end




