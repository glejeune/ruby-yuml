require 'yuml/use_case'
require 'yuml/activity'
require 'yuml/class'

require 'net/http'

module YUML
  def self.options_string( options ) #:nodoc:
    str = ""
    sep = ""
    options.each do |k, v|
      if v.class == TrueClass
        str << sep << k.to_s
      else
        str << sep << k.to_s << ":" << v.to_s
      end
      sep = ";"
    end
    str << "/" if str.size > 0
  end
  
  def self.output( options, data, type, file ) #:nodoc:
    opts = options.clone
    diagram = opts.delete(:diagram)
    uri = "/diagram/#{self.options_string(opts)}#{diagram}/#{data}#{type}"
    # puts "*** #{uri}"
    
    writer = STDOUT
    writer = open(file, "wb") unless file.nil?
    res = Net::HTTP.start("yuml.me", 80) {|http|
      http.get(URI.escape(uri))
    }
    writer.write(res.body)
    writer.close
  end
  
  def self.to_png( options, data, file ) #:nodoc:
    self.output( options, data, "", file)
  end
  
  def self.to_pdf( options, data, file ) #:nodoc:
    self.output( options, data, ".pdf", file)
  end

  def self.to_jpg( options, data, file ) #:nodoc:
    self.output( options, data, ".jpg", file)
  end
  
  def self.to_url( options, data, type ) #:nodoc:
    opts = options.clone
    diagram = opts.delete(:diagram)
    if type.nil?
      type = ""
    else
      type = ".#{type}" if type[0].chr != "."
    end
    "http://yuml.me/diagram/#{self.options_string(opts)}#{diagram}/#{data}#{type}"
  end

  # Remove/substitute special characters

  def self.trim!(*args) #:nodoc:
    args.each { |text| text.replace trim(text) }
  end

  # TODO: replace with UTF-8 similar chars
  def self.trim(text) #:nodoc:
    text.gsub(/[,\[\]^]/, '').strip unless text.nil?
  end

end