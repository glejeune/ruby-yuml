module YUML
  class ActivityEntity
    def initialize( uc, name ) #:nodoc:
      @uc = uc
      @name = name
      @link_label = ""
    end

    def self.trim(text) #:nodoc:
      # text.gsub!('-', '‐') # yUML '-' bug
      text.gsub(/[,()\[\]^><-]/, '').strip unless text.nil?
    end

    def trim(text) #:nodoc:
      YUML::ActivityEntity.trim(text)
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
      text = trim(@link_label)
      @uc.link( self, other, "#{text}->" )
      @link_label = ""
    end
  end
  
  class Activity < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      "(#{text})"
    end
  end
  
  class Parallel < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      (text.length > 2) ? "[#{text}]" : "|#{text}|"
    end
    
    def [](x) #:nodoc
      @uc.parallel(x)
    end
  end
  
  class Decision < ActivityEntity #:nodoc:
    def to_s #:nodoc:
      text = trim(@name.to_s)
      "<#{text}>"
    end
  end  
end