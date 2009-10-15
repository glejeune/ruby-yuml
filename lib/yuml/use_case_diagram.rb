require 'yuml/diagram'

module YUML
  # Create a new Use Case Diagram
  def self.useCaseDiagram( *options, &block )
    UseCaseDiagram.new( *options, &block )
  end
  
  class UseCaseDiagram < Diagram
    # Create a new Use Case Diagram
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

      @links = []
      
      # SPECIFIC !!!
      @actors = {}
      @useCases = {}
      @notes = {}
      
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
    
    # Create a new actor or use case in a Use Case Diagram
    #
    #   _("Use Case") == useCase("Use Case")
    #   _["Actor"] == actor("Actor")
    def _(x=nil)
      if x.nil?
        Actor.new(self, nil)
      else
        useCase(x)
      end
    end
  end
end