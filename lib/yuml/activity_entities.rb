module YUML
  class ActivityEntity #:nodoc:
    def initialize( uc, name ) #:nodoc:
      @uc = uc
      @name = name
    end
    
    def >(other)
      @uc.link( self, other, "->" )
    end
  end
  
  class Activity < ActivityEntity
    def to_s #:nodoc:
      "(#{@name.to_s})"
    end
  end
  
  class Parallel < ActivityEntity
    def to_s #:nodoc:
      "|#{@name.to_s}|"
    end
    
    def [](x)
      @name = x
      return self
    end
  end
  
  class Decision < ActivityEntity
    def to_s #:nodoc:
      "<#{@name.to_s}>"
    end
  end  
end