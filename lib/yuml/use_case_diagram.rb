module YUML
  # Create a new Use Case Diagram
  def self.useCaseDiagram( *options, &block )
    UseCaseDiagram.new( *options, &block )
  end
  
  # Create a new Use Case Diagram
  class UseCaseDiagram
    def initialize( *options, &block )
      @options = {
        :diagram => "usecase"
      }
      options.each do |op|
        if op.class == Hash
          @options = @options.merge( op )
        else
          @options[op] = true
        end
      end
      
      @actors = {}
      @useCases = {}
      @notes = {}
      @links = []
      
      instance_eval(&block)
    end
    
    # Create a new actor in a Use Case Diagram
    def actor(x)
      @actors[x] ||= Actor.new( self, x )
    end
    
    # Create a new use case in a Use Case Diagram
    def useCase(x)
      @useCases[x] ||= UseCase.new( self, x )
    end
    
    # Create a new note in a Use Case Diagram
    def note(x)
      @notes[x] ||= Note.new( self, x )
    end
    
    def link(one, two, type) #:nodoc:
      @links << [one, type, two]
    end
    
    # Generate the yUML file 
    def to_s
      output = ""
      
      @links.each do |l|
        output << l[0].to_s << l[1].to_s << l[2].to_s << "\n"
      end
      
      output
    end
    
    # Generate the diagram as a PNG file
    def to_png( file = nil )
      YUML.to_png( @options, self.to_s.split(/\n/).join( ', ' ), file )
    end

    # Generate the diagram as a JPEG file
    def to_jpg( file = nil )
      YUML.to_jpg( @options, self.to_s.split(/\n/).join( ', ' ), file )
    end
    
    # Generate the diagram as a PDF file
    def to_pdf( file = nil )
      YUML.to_pdf( @options, self.to_s.split(/\n/).join( ', ' ), file )
    end
    
    # Return the yUML URL
    def to_url( type = nil )
      YUML.to_url( @options, self.to_s.split(/\n/).join( ', ' ), type )
    end
  end
end