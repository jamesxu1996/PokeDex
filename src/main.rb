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

#Generates the Pokedex app logo
self.logo

#Begins asking user for input
prompt = TTY::Prompt.new
choices = {"Use Pokedex": 1, "Upload Your Team": 2, "Exit": 3}
prompt.select("Welcome to the Pokedex App. What would you like to do?", choices)



# charmander = Pokedex.new("charmander")
# charmander.getPokemonGeneralInfo("charmander")
# charmander.getPokemonSpeciesInfo("charmander")
