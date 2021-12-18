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
require_relative "./classes/Poke_class.rb"
require_relative "./methods.rb"

describe Poke_class do
    before :each do
        @