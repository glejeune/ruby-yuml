$:.unshift( "../lib" )
require 'yuml'

x = YUML::activityDiagram( :scruffy, :scale => 100 ) {
  _(:start) > _{:d1}
  _{:d1} -"logged in"> _("Show Dashboard") 
  _("Show Dashboard") > _[:a]
  _[:a] > _(:end)
  _{:d1} -"not logged in"> _("Show Login") 
  _("Show Login") > _[:a]
}

puts "To String :"
puts x.to_s

puts "URL :"
puts x.to_url( )

puts "Image saved as activity-diagram.png"
x.to_png( "activity-diagram.png" )