$:.unshift( "../lib" )
require 'yuml'

x = YUML::activityDiagram( :scruffy, :scale => 100 ) {
  _start_ > decision(:d1)
  decision(:d1, "logged in") > activity("Show Dashboard") 
  activity("Show Dashboard") > parallel(:a)
  parallel(:a) > _end_
  decision(:d1, "not logged in") > activity("Show Login") 
  activity("Show Login") > parallel(:a)
}

puts "To String :"
puts x.to_s

puts "URL :"
puts x.to_url( )

puts "Image saved as activity-diagram.png"
x.to_png( "activity-diagram.png" )