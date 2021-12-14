require "rubygems"
require "net/http"
require "uri"
require "json"
require "poke-api-v2"
require "rmagick"
require "ascii-image"
require "colorize"
require_relative "./classes/PokeClass.rb"


# getPokemonGeneralInfo('ho-oh')
# getPokemonSpeciesInfo('ho-oh')

charmander = Pokedex.new("charmander")
charmander.getPokemonGeneralInfo("charmander")
charmander.getPokemonSpeciesInfo("charmander")
charmander.get_name
