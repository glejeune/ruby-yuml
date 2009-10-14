$:.unshift( "../lib" )
require 'yuml'

x = YUML::useCaseDiagram( :scruffy, :scale => 75 ) {
  actor(:Admin) ^ actor(:User)
  actor(:Admin) - note( 'Most privilidged user' )
  actor(:User) - useCase(:Login)
  actor(:User) - useCase(:Logout) 
  useCase(:Login) < useCase(:Reminder) 
  useCase(:Login) > useCase(:Captcha)
}

puts "To String :"
puts x.to_s

puts "URL :"
puts x.to_url( )

puts "Image saved as use-case-diagram.png"
x.to_png( "use-case-diagram.png" )