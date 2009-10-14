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
  end
  
  class Decision
    def initialize( uc, name, lab = "" ) #:nodoc:
      @uc = uc
      @name = name
      @label = lab
    end
    
    def >(other)
      @uc.link( self, other, "#{@label}->" )
    end
    
    def to_s #:nodoc:
      "<#{@name.to_s}>"
    end
  end  
end