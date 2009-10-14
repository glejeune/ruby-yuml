$:.unshift( "../lib" )
require 'yuml'

x = YUML::useCaseDiagram( :scruffy, :scale => 75 ) {
  _[:Admin] ^ _[:User]
  _[:Admin] - note( 'Most privilidged user' )
  _[:User] - _(:Login)
  _[:User] - _(:Logout) 
  _(:Login) < _(:Reminder) 
  _(:Login) > _(:Captcha)
}

puts "To String :"
puts x.to_s

puts "URL :"
puts x.to_url( )

puts "Image saved as use-case-diagram.png"
x.to_png( "use-case-diagram.png" )