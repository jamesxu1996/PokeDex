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
