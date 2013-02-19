class String
  def |(x)
    self << "|" << x
  end
end

module YUML
  class KlassEntity
    def initialize( uc, name=nil ) #:nodoc:
      @uc = uc
      @name = name
    end
    
    # Create a link 
    #
    #   _["Class A"] - _["Class B"]
    def -(other)
      @uc.link( self, other, "-" )
    end
  end
  
  class Klass < KlassEntity #:nodoc:
    def to_s #:nodoc:
      text = YUML.trim(@name.to_s)
      "[#{text}]"
    end
    
    def [](name) #:nodoc:
      @uc.klass(name)
    end
  end
  
  class KNote < KlassEntity #:nodoc:
    def to_s #:nodoc:
      text = YUML.trim(@name.to_s)
      "(note: #{text})"
    end
  end
end