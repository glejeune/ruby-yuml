module YUML
  class UseCaseEntity #:nodoc:
    def initialize( uc, name ) #:nodoc:
      @uc = uc
      @name = name
    end
    
    def -(other)
      @uc.link( self, other, "-" )
    end
    
    def ^(other)
      @uc.link( self, other, "^" )
    end
    
    def <(other)
      @uc.link( self, other, "<" )
    end
    
    def >(other)
      @uc.link( self, other, ">" )
    end
  end
  
  class Actor < UseCaseEntity
    def to_s #:nodoc:
      "[#{@name.to_s}]"
    end
  end
  
  class UseCase < UseCaseEntity
    def to_s #:nodoc:
      "(#{@name.to_s})"
    end
  end
  
  class Note < UseCaseEntity
    def to_s #:nodoc:
      "(note: #{@name.to_s})"
    end
  end
end