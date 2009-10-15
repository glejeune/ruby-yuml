require 'yuml/diagram'

module YUML
  # Create a new Class Diagram
  def self.classDiagram( *options, &block )
    ClassDiagram.new( *options, &block )
  end
  
  class ClassDiagram < Diagram
    # Create a new Class Diagram
    def initialize( *options, &block )
      @options = {
        :diagram => "class"
      }
      options.each do |op|
        if op.class == Hash
          @options = @options.merge( op )
        else
          @options[op] = true
        end
      end

      @links = []
      
      # SPECIFIC !!!
      @classes = {}
      @notes = {}
      
      instance_eval(&block)
    end
    
    # Create a new class in a Class Diagram
    def klass(x)
      name = x.to_s.split( /\|/ )[0] 
      @classes[name] ||= Klass.new( self, x )
    end
    
    # Create a new note in a Use Case Diagram
    def note(x)
      @notes[x] ||= KNote.new( self, x )
    end
    
    # Create a new class in a Class Diagram
    #
    #   _["Class"] == klass("Class")
    def _()
      Klass.new(self, nil)
    end    
  end
end