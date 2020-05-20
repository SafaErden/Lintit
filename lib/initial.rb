require 'colorize'

String.colors                       # return array of all possible colors names
String.modes                        # return array of all possible modes
String.color_samples                # displays color samples in all combinations
String.disable_colorization         # check if colorization is disabled
String.disable_colorization = false # enable colorization
String.disable_colorization false   # enable colorization
String.disable_colorization = true  # disable colorization
String.disable_colorization true    # disable colorization

puts "This is blue".colorize(:blue)
puts "This is light blue".colorize(:light_blue)
puts "This is also blue".colorize(:color => :blue)
puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
puts "This is blue text on red".blue.on_red
puts "This is red on blue".colorize(:red).on_blue
puts "This is red on blue and underline".colorize(:red).on_blue.underline
puts "This is blue text on red".blue.on_red.blink
puts "This is uncolorized".blue.on_red.uncolorize
require 'colorized_string'

ColorizedString.colors                       # return array of all possible colors names
ColorizedString.modes                        # return array of all possible modes
ColorizedString.color_samples                # displays color samples in all combinations
ColorizedString.disable_colorization         # check if colorization is disabled
ColorizedString.disable_colorization = false # enable colorization
ColorizedString.disable_colorization false   # enable colorization
ColorizedString.disable_colorization = true  # disable colorization
ColorizedString.disable_colorization true    # disable colorization

puts ColorizedString["This is blue"].colorize(:blue)
puts ColorizedString["This is light blue"].colorize(:light_blue)
puts ColorizedString["This is also blue"].colorize(:color => :blue)
puts ColorizedString["This is light blue with red background"].colorize(:color => :light_blue, :background => :red)
puts ColorizedString["This is light blue with red background"].colorize(:light_blue ).colorize( :background => :red)
puts ColorizedString["This is blue text on red"].blue.on_red
puts ColorizedString["This is red on blue"].colorize(:red).on_blue
puts ColorizedString["This is red on blue and underline"].colorize(:red).on_blue.underline
puts ColorizedString["This is blue text on red"].blue.on_red.blink
puts ColorizedString["This is uncolorized"].blue.on_red.uncolorize

puts ColorizedString.new("This is blue").blue
puts ColorizedString.new("This is light blue").colorize(:light_blue)