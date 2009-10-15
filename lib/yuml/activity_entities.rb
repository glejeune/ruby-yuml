module YUML
  class ActivityEntity
    def initialize( uc, name ) #:nodoc:
      @uc = uc
      @name = name
      @link_label = ""
    end
    
    # Create a Flow with label
    #
    #   _("Activity One") -"label"> _("Activity Two")
    def -(lib="")
      @link_label = lib
      return self
    end
    
    # Create a Flow
    #
    #   _("Activity One") > _("Activity Two")
    def >(other)
      @uc.link( self, other, "#{@link_label}->" )
      @link_label = ""
    end
  end
  
  class Activity < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      "(#{@name.to_s})"
    end
  end
  
  class Parallel < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      "|#{@name.to_s}|"
    end
    
    def [](x) #:nodoc
      @uc.parallel(x)
    end
  end
  
  class Decision < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      "<#{@name.to_s}>"
    end
  end  
end