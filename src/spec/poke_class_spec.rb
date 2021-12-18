require "poke-api-v2"
require "uri"
require "json"
require_relative "../classes/poke_class.rb"

describe Pokedex do
    before (:each) do
        choice = "charmander"
        @pokemon = Pokedex.new(choice)
    end

    #tests that end output is hash
    it "should pull and return habitat data from API as a hash" do
        choice = "charmander"
        expect(@pokemon.get_pokemon_habitat_info(choice)).to be_an_instance_of(Hash)
    end

    #tests that end output is hash
    it "should pull and return stats data from API as a hash" do
        choice = "charmander"
        expect(@pokemon.get_pokemon_stats(choice)).to be_an_instance_of(Hash)
    end

    #tests that end output is hash
    it "should pull and return description data from API as a hash" do
        choice = "charmander"
        expect(@pokemon.get_pokemon_desc_info(choice)).to be_an_instance_of(Hash)
    end

    #tests that end output is hash
    it "should pull and return general data from API as a hash" do
        choice = "charmander"
        expect(@pokemon.get_pokemon_general_info(choice)).to be_an_instance_of(Hash)
    end

    #tests that all 6 stat types are displayed
    it "should return a number of 6 types of stats when displaying stat data" do
        choice = "charmander"
        stats_num = @pokemon.get_pokemon_stats(choice)
        stats_num_count = stats_num.count
        expect(stats_num_count).to eq(6)
    end

    #tests pokemon_type types is presented in array form
    it "should return pokemon types in an array" do
        choice = "charmander"
        info = @pokemon.get_pokemon_general_info(choice)
        expect(info[:types]).to be_an_instance_of(Array)
    end

    #tests pokemon evolution chain is presented in array form
    it "should return pokemon evolution chain in an array" do
        choice = "charmander"
        info = @pokemon.get_pokemon_species_info(choice)
        expect(info[:evolution_chain]).to be_an_instance_of(Array)
    end
end


