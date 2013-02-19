module YUML
  class UseCaseEntity
    def initialize( uc, name ) #:nodoc:
      @uc = uc
      @name = name
    end

    def self.trim(text) #:nodoc:
      # text.gsub!('-', '‐') # yUML '-' bug
      text.gsub(/[,()\[\]^><-]/, '').strip unless text.nil?
    end

    def trim(text) #:nodoc:
      YUML::UseCaseEntity.trim(text)
    end
    
    # Create a link 
    #
    #   _["Actor"] - _("Use Case")
    def -(other)
      @uc.link( self, other, "-" )
    end
    
    # Create an inheritance 
    #
    #   _["Admin"] ^ _["User"]
    def ^(other)
      @uc.link( self, other, "^" )
    end
    
    # Create an <<Extend>>
    #
    #   _("Use Case") < _("Other Use Case")
    def <(other)
      @uc.link( self, other, "<" )
    end
    
    # Create an <<Include>>
    #
    #   _("Use Case") > _("Other Use Case")
    def >(other)
      @uc.link( self, other, ">" )
    end
  end
  
  class Actor < UseCaseEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      "[#{text}]"
    end
    
    def [](x) #:nodoc:
      @uc.actor(x)
    end
  end
  
  class UseCase < UseCaseEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      "(#{text})"
    end
  end
  
  class Note < UseCaseEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      "(note: #{text})"
    end
  end
end