require 'digest/md5'

module YUML
  class Diagram

    def link(one, two, type) #:nodoc:
      @links << [one, type, two]
    end

    # Add `thing` to links
    def link_s thing #:nodoc:
      @links << thing
    end
    
    # Generate the yUML file 
    def to_s
      output = ""
      
      @links.each do |l|
        output << l.to_s << "\n" and next unless l.is_a? Array
        output << l[0].to_s << l[1].to_s << l[2].to_s << "\n"
      end
      
      output
    end

    def to_line
      self.to_s.strip.gsub("\n", ',')
    end
    
    # Generate the diagram as a PNG file
    def to_png( file = nil )
      YUML.to_png( @options, self.to_line, file )
    end

    # Generate the diagram as a JPEG file
    def to_jpg( file = nil )
      YUML.to_jpg( @options, self.to_line, file )
    end
    
    # Generate the diagram as a PDF file
    def to_pdf( file = nil )
      YUML.to_pdf( @options, self.to_line, file )
    end
    
    # Return the yUML URL
    def to_url( type = nil )
      YUML.to_url( @options, self.to_line, type )
    end

    def md5
      Digest::MD5.hexdigest(self.to_line)
    end
    
  end
end