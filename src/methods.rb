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

#method to obtain all unique pokemon names
def get_all_pokemon_names
    res = PokeApi.get(pokemon: {limit: 2000,offset: 0})
    all_names = []

    #remove suffixes from pokeapi name calls to prevent null api call, calls refer to the same data point as non-suffix pokemon names
    res.results.each do |item|
        all_names << item.name.to_s.capitalize.gsub("-mega", "").gsub( "-blade", "").gsub("-shield", "").gsub("-gmax", "").gsub("-totem", "").gsub("-galar", "").gsub("-blue-striped", "").gsub("-red-striped", "").gsub("-ice-rider", "").gsub("-shadow-rider", "").gsub("-rainy", "").gsub("-snowy", "").gsub("-sunny", "").gsub("-mega-x", "").gsub("-mega-y", "").gsub("-attack", "").gsub("-defense", "").gsub("-normal", "").gsub("-speed", "").gsub("-alola", "").gsub("-ice", "").gsub("-noice", "").gsub("-eternamax", "").gsub("-standard", "").gsub("-zen", "").gsub("-eternal", "").gsub("-altered", "").gsub("-origin", "").gsub("-average", "").gsub("-large", "").gsub("-small", "").gsub("-super", "").gsub("-ash", "").gsub("-battle-bond", "").gsub("-primal", "").gsub("-unbound", "").gsub("-female", "").gsub("-male", "").gsub("-ordinary", "").gsub("-resolute", "").gsub("-black", "").gsub("-white", "").gsub("-incarnate", "").gsub("-therian", "").gsub("-dusk", "").gsub("-midday", "").gsub("-midnight", "").gsub("-original", "").gsub("-aria", "").gsub("-pirouette", "").gsub("-busted", "").gsub("-disguised", "").gsub("-totem-busted", "").gsub("-totem-disguised", "").gsub("-blue", "").gsub("-blue-meteor", "").gsub("-green", "").gsub("-green-meteor", "").gsub("-indigo", "").gsub("-indigo-meteor", "").gsub("-orange", "").gsub("-orange-meteor", "").gsub("-red", "").gsub("-red-meteor", "").gsub("-violet", "").gsub("-violet-meteor", "").gsub("-yellow", "").gsub("-yellow-meteor", "").gsub("-totem", "").gsub("-dawn", "").gsub("-ultra", "").gsub("-f", "").gsub("-m", "").gsub("-baile", "").gsub("-pau", "").gsub("-pom-pom", "").gsub("-sensu", "").gsub("-alola-cap", "").gsub("-belle", "").gsub("-cosplay", "").gsub("-hoenn-cap", "").gsub("-kalos-cap", "").gsub("-libre", "").gsub("-original-cap", "").gsub("-partner-cap", "").gsub("-phd", "").gsub("-pop-star", "").gsub("-rock-star", "").gsub("-sinnoh-cap", "").gsub("-unova-cap", "").gsub("-own-tempo", "").gsub("-fan", "").gsub("-frost", "").gsub("-heat", "").gsub("-mow", "").gsub("-wash", "").gsub("-land", "").gsub("-sky", "").gsub("-amped", "").gsub("-low-key", "").gsub("type-null", "").gsub("-rapid-strike", "").gsub("-single-strike", "").gsub("-school", "").gsub("-solo", "").gsub("-plant", "").gsub("-sandy", "").gsub("-trash", "").gsub("-crowned", "").gsub("-hero", "").gsub("-10", "").gsub("-50", "").gsub("-complete", "").gsub("-x", "").gsub("-y", "").gsub("-cap", "")
    end

    #return only unique pokemon names from api call
    all_names = all_names.uniq
    return all_names.sort
end

# def ascii_image
#     puts ("\n") * 2
#     # res = PokeApi.get(pokemon: pokemon_name)
#     # res = res.sprites.front_default
#     # uri = URI.parse(res)
#     # res = Net::HTTP.get_response(uri)

#     uri = URI.parse("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/898.png")
#     response = Net::HTTP.get_response(uri)
#     image = Magick::ImageList.new
#     image.from_blob uri.read
#     image = image.scale(120/ image.columns.to_f)
#     image = image.scale(image.columns, image.rows / 2)
#     cur_row = 0
#     image.each_pixel do |pixel, col, row|
#     color = pixel.to_color(Magick::AllCompliance, false, 8)
#     if cur_row != row
#         puts
#         cur_row = row
#     end
#     print Paint[' ', '', color]
#     end
#     puts
#     puts ("\n") * 2
# end