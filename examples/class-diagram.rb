$:.unshift( "../lib" )
require 'yuml'

x = YUML::classDiagram( :scruffy, :scale => 75 ) {
  _["Customer"|"Forename;Surname;Email"|"+new();-Save()"] - _[:User]
  _["Customer"] - note( 'I love this Klass' )
}

puts "To String :"
puts x.to_s

puts "URL :"
puts x.to_url( )

puts "Image saved as class-diagram.png"
#x.to_png( "class-diagram.png" )